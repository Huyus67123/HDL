module segment_7 (
    input  [2:0] in,   // index 0..4
    output [6:0] out
);

assign out = (in == 3'd0) ? 7'b0001001 :  // H
             (in == 3'd1) ? 7'b0000110 :  // E
             (in == 3'd2) ? 7'b1000111:  // L
             (in == 3'd3) ? 7'b1000111 :  // L
             (in == 3'd4) ? 7'b1000000 :  // O
                            7'b1111111;   // blank

endmodule