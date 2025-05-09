module adder #(parameter WIDTH = 6) (
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

wire p_6;
wire g_6;
wire p_7;
wire g_7;
wire p_8;
wire g_8;
wire p_9;
wire g_9;
wire p_10;
wire g_10;

assign p_6 = p_0 & p_1;
assign g_6 = g_1 | (p_1 & g_0);
assign p_7 = p_6 & p_2;
assign g_7 = g_2 | (p_2 & g_6);
assign p_8 = p_7 & p_3;
assign g_8 = g_3 | (p_3 & g_7);
assign p_9 = p_8 & p_4;
assign g_9 = g_4 | (p_4 & g_8);
assign p_10 = p_9 & p_5;
assign g_10 = g_5 | (p_5 & g_9);

wire c_0 = 0;
wire c_1 = g_0 | (p_0 & c_0);
wire c_2 = g_6 | (p_6 & c_0);
wire c_3 = g_7 | (p_7 & c_0);
wire c_4 = g_8 | (p_8 & c_0);
wire c_5 = g_9 | (p_9 & c_0);
wire c_6 = g_10 | (p_10 & c_0);

assign s[0] = p_0 ^ c_0;
assign s[1] = p_1 ^ c_1;
assign s[2] = p_2 ^ c_2;
assign s[3] = p_3 ^ c_3;
assign s[4] = p_4 ^ c_4;
assign s[5] = p_5 ^ c_5;
assign cout = c_6;

endmodule