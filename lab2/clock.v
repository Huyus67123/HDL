module clock(
    input CLK, reset, load,
    input [3:0] H0,H1,M0,M1,S0,S1,
    output [6:0] led0,led1,led2,led3,led4,led5
);

    wire clk_1s;
    delay_1s d1 (CLK, clk_1s);

    // thanh ghi thời gian
    reg [3:0] qH0,qH1,qM0,qM1,qS0,qS1;

    // FSM state
    reg state;
    parameter RUN = 1'b0,
              LOAD = 1'b1;

    // ================= FSM =================
    always @(posedge clk_1s or negedge reset) begin
        if (!reset) begin
            qH0 <= 0; qH1 <= 0;
            qM0 <= 0; qM1 <= 0;
            qS0 <= 0; qS1 <= 0;
            state <= RUN;
        end else begin
            case(state)

            RUN: begin
                if (load)
                    state <= LOAD;
                else begin
                    // ===== tăng giây =====
                    if (qS0 == 9) begin
                        qS0 <= 0;

                        if (qS1 == 5) begin
                            qS1 <= 0;

                            // ===== tăng phút =====
                            if (qM0 == 9) begin
                                qM0 <= 0;

                                if (qM1 == 5) begin
                                    qM1 <= 0;

                                    // ===== tăng giờ =====
                                    if (qH0 == 9) begin
                                        qH0 <= 0;

                                        if (qH1 == 2 && qH0 == 3) begin
                                            qH1 <= 0;
                                            qH0 <= 0;
                                        end else begin
                                            qH1 <= qH1 + 1;
                                        end

                                    end else begin
                                        qH0 <= qH0 + 1;
                                    end

                                end else qM1 <= qM1 + 1;

                            end else qM0 <= qM0 + 1;

                        end else qS1 <= qS1 + 1;

                    end else qS0 <= qS0 + 1;
                end
            end

            LOAD: begin
                qH0 <= H0; qH1 <= H1;
                qM0 <= M0; qM1 <= M1;
                qS0 <= S0; qS1 <= S1;
                state <= RUN;
            end

            endcase
        end
    end

    // ================= LED =================
    bcd_to_led7 b0(qH0,led0);
    bcd_to_led7 b1(qH1,led1);
    bcd_to_led7 b2(qM0,led2);
    bcd_to_led7 b3(qM1,led3);
    bcd_to_led7 b4(qS0,led4);
    bcd_to_led7 b5(qS1,led5);

endmodule