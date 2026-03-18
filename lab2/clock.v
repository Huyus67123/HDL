module clock(
    input CLK, reset, load,
    input [15:0] SW,
    output [6:0] HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,
    output reg error
);

    //================ CLOCK 1Hz =================
    wire clk_1s;
    delay_1s d1(CLK, clk_1s);

    //================ REG =================
    reg [3:0] H0,H1,M0,M1,S0,S1;

    //================ FSM =================
    reg state;
    parameter IDLE = 1'b0,
              LOAD = 1'b1;

    //================ DECODE SW =================
    wire [3:0] sw_H1 = SW[15:12];
    wire [3:0] sw_H0 = SW[11:8];
    wire [3:0] sw_M1 = SW[7:4];
    wire [3:0] sw_M0 = SW[3:0];

    //================ VALID CHECK =================
    wire valid_hour = (sw_H1 < 3) && (sw_H0 < 10) &&
                      !(sw_H1 == 2 && sw_H0 > 3);

    wire valid_min  = (sw_M1 < 6) && (sw_M0 < 10);

    //================ FSM =================
    always @(posedge clk_1s or negedge reset) begin
        if (!reset) begin
            H0<=0; H1<=0;
            M0<=0; M1<=0;
            S0<=0; S1<=0;
            state <= IDLE;
            error <= 0;
        end else begin
            case(state)

            //========= CHẠY =========
            IDLE: begin
                if (load)
                    state <= LOAD;
                else begin
                    // tăng giây
                    if (S0 == 9) begin
                        S0 <= 0;
                        if (S1 == 5) begin
                            S1 <= 0;

                            // tăng phút
                            if (M0 == 9) begin
                                M0 <= 0;
                                if (M1 == 5) begin
                                    M1 <= 0;

                                    // tăng giờ
                                    if (H1 == 2 && H0 == 3) begin
                                        H1 <= 0;
                                        H0 <= 0;
                                    end else if (H0 == 9) begin
                                        H0 <= 0;
                                        H1 <= H1 + 1;
                                    end else begin
                                        H0 <= H0 + 1;
                                    end

                                end else M1 <= M1 + 1;

                            end else M0 <= M0 + 1;

                        end else S1 <= S1 + 1;

                    end else S0 <= S0 + 1;
                end
            end

            //========= LOAD =========
            LOAD: begin
                if (valid_hour && valid_min) begin
                    H1 <= sw_H1;
                    H0 <= sw_H0;
                    M1 <= sw_M1;
                    M0 <= sw_M0;
                    S0 <= 0;
                    S1 <= 0;
                    error <= 0;
                end else begin
                    error <= 1; // báo lỗi
                end
                state <= IDLE;
            end

            endcase
        end
    end

    //================ DISPLAY =================
    bcd_to_led7 d7(H1,HEX7);
    bcd_to_led7 d6(H0,HEX6);
    bcd_to_led7 d5(M1,HEX5);
    bcd_to_led7 d4(M0,HEX4);
    bcd_to_led7 d3(S1,HEX3);
    bcd_to_led7 d2(S0,HEX2);

endmodule