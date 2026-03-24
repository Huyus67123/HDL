module delay_1s(
    input CLK,
    input reset,
    output reg n
);
    reg [25:0] Q; // cần 26 bit cho 50 triệu

    always @(posedge CLK or negedge reset) begin
        if(!reset) begin
            Q <= 0;
            n <= 0;
        end 
        else begin
            if (Q == 26'd49999999) begin
                Q <= 0;
                n <= 1;   // xung 1 chu kỳ
            end 
            else begin
                Q <= Q + 1;
                n <= 0;
            end
        end
    end
endmodule