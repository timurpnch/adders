module adder #(parameter WIDTH = 8) (
    input  [WIDTH-1:0] a,
    input  [WIDTH-1:0] b,
    output [WIDTH-1:0] s,
    output cout
);

wire p_0 = a[0] ^ b[0];
wire g_0 = a[0] & b[0];
wire p_1 = a[1] ^ b[1];
wire g_1 = a[1] & b[1];
wire p_2 = a[2] ^ b[2];
wire g_2 = a[2] & b[2];
wire p_3 = a[3] ^ b[3];
wire g_3 = a[3] & b[3];
wire p_4 = a[4] ^ b[4];
wire g_4 = a[4] & b[4];
wire p_5 = a[5] ^ b[5];
wire g_5 = a[5] & b[5];
wire p_6 = a[6] ^ b[6];
wire g_6 = a[6] & b[6];
wire p_7 = a[7] ^ b[7];
wire g_7 = a[7] & b[7];

wire p_8;
wire g_8;
wire p_9;
wire g_9;
wire p_10;
wire g_10;
wire p_11;
wire g_11;
wire p_12;
wire g_12;
wire p_13;
wire g_13;
wire p_14;
wire g_14;

assign p_8 = p_0 & p_1;
assign g_8 = g_1 | (p_1 & g_0);
assign p_9 = p_8 & p_2;
assign g_9 = g_2 | (p_2 & g_8);
assign p_10 = p_9 & p_3;
assign g_10 = g_3 | (p_3 & g_9);
assign p_11 = p_10 & p_4;
assign g_11 = g_4 | (p_4 & g_10);
assign p_12 = p_11 & p_5;
assign g_12 = g_5 | (p_5 & g_11);
assign p_13 = p_12 & p_6;
assign g_13 = g_6 | (p_6 & g_12);
assign p_14 = p_13 & p_7;
assign g_14 = g_7 | (p_7 & g_13);

wire c_0 = 0;
wire c_1 = g_0 | (p_0 & c_0);
wire c_2 = g_8 | (p_8 & c_0);
wire c_3 = g_9 | (p_9 & c_0);
wire c_4 = g_10 | (p_10 & c_0);
wire c_5 = g_11 | (p_11 & c_0);
wire c_6 = g_12 | (p_12 & c_0);
wire c_7 = g_13 | (p_13 & c_0);
wire c_8 = g_14 | (p_14 & c_0);

assign s[0] = p_0 ^ c_0;
assign s[1] = p_1 ^ c_1;
assign s[2] = p_2 ^ c_2;
assign s[3] = p_3 ^ c_3;
assign s[4] = p_4 ^ c_4;
assign s[5] = p_5 ^ c_5;
assign s[6] = p_6 ^ c_6;
assign s[7] = p_7 ^ c_7;
assign cout = c_8;

endmodule