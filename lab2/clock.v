module clock(
    input CLK, reset_n, load, // Đổi thành reset_n cho đồng bộ tích cực thấp
    input [15:0] SW,
    output [6:0] H7, H6, H5, H4, H3, H2,
    output reg error
);

    //================ CLOCK TICK 1Hz =================
    // Dùng module delay tạo xung Tick (chỉ cao 1 chu kỳ 25MHz mỗi giây)
    wire tick_1s;
    reg [24:0] count;
    
    always @(posedge CLK or negedge reset_n) begin
        if (!reset_n) count <= 0;
        else if (count == 25'd24_999_999) count <= 0;
        else count <= count + 1;
    end
    assign tick_1s = (count == 25'd24_999_999);

    //================ REG =================
    reg [3:0] Ho1, Ho0, M1, M0, S1, S0;
    reg state;
    parameter IDLE = 1'b0, LOAD = 1'b1;

    //================ VALID CHECK =================
    wire [3:0] sw_H1 = SW[15:12];
    wire [3:0] sw_H0 = SW[11:8];
    wire [3:0] sw_M1 = SW[7:4];
    wire [3:0] sw_M0 = SW[3:0];

    wire valid_hour = (sw_H1 < 2) || (sw_H1 == 2 && sw_H0 < 4); // 00-23
    wire valid_min  = (sw_M1 < 6); // 00-59

    //================ FSM (Chạy bằng CLK hệ thống) =================
    always @(posedge CLK or negedge reset_n) begin
        if (!reset_n) begin
            {Ho1, Ho0, M1, M0, S1, S0} <= 24'b0;
            state <= IDLE;
            error <= 0;
        end else begin
            case(state)
                IDLE: begin
                    if (load) begin
                        state <= LOAD;
                    end else if (tick_1s) begin // Chỉ tăng thời gian khi có tick_1s
                        if (S0 == 9) begin
                            S0 <= 0;
                            if (S1 == 5) begin
                                S1 <= 0;
                                if (M0 == 9) begin
                                    M0 <= 0;
                                    if (M1 == 5) begin
                                        M1 <= 0;
                                        if (Ho1 == 2 && Ho0 == 3) begin
                                            Ho1 <= 0; Ho0 <= 0;
                                        end else if (Ho0 == 9) begin
                                            Ho0 <= 0; Ho1 <= Ho1 + 1;
                                        end else Ho0 <= Ho0 + 1;
                                    end else M1 <= M1 + 1;
                                end else M0 <= M0 + 1;
                            end else S1 <= S1 + 1;
                        end else S0 <= S0 + 1;
                    end
                end

                LOAD: begin
                    if (valid_hour && valid_min) begin
                        Ho1 <= sw_H1; Ho0 <= sw_H0;
                        M1 <= sw_M1; M0 <= sw_M0;
                        S1 <= 0; S0 <= 0;
                        error <= 0;
                    end else begin
                        error <= 1;
                    end
                    state <= IDLE;
                end
            endcase
        end
    end

    //================ DISPLAY =================
    bcd_to_led7 d7(Ho1, H7);
    bcd_to_led7 d6(Ho0, H6);
    bcd_to_led7 d5(M1, H5);
    bcd_to_led7 d4(M0, H4);
    bcd_to_led7 d3(S1, H3);
    bcd_to_led7 d2(S0, H2);

endmodule