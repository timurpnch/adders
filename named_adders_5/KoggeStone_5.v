module adder (
    input [4:0] a,
    input [4:0] b,
    output [4:0] sum,
    output cout
);

    // Объявление промежуточных переменных
    wire var0, var1, var2, var3, var4, var5, var6, var7, var8, var9;
    wire var10, var11, var12, var13, var14, var15, var16, var17, var18, var19;
    wire var20, var21, var22, var23, var24, var25, var26, var27, var28, var29;
    wire var30, var31, var32, var33;

    wire in0, in1, in2, in3, in4, in5, in6, in7, in8, in9;
    wire out0, out1, out2, out3, out4, out5;

    assign in0 = a[4];
    assign in1 = a[3];
    assign in2 = a[2];
    assign in3 = a[1];
    assign in4 = a[0];
    assign in5 = b[4];
    assign in6 = b[3];
    assign in7 = b[2];
    assign in8 = b[1];
    assign in9 = b[0];

    // Логические операции
    assign var0 = in9 & in4;
    assign var1 = in8 & in3;
    assign var2 = in7 & in2;
    assign var3 = in6 & in1;
    assign var4 = in5 & in0;
    assign var5 = in9 ^ in4;
    assign var6 = in8 ^ in3;
    assign var7 = in7 ^ in2;
    assign var8 = in6 ^ in1;
    assign var9 = in5 ^ in0;
    assign var10 = var9 & var3;
    assign var11 = var4 | var10;
    assign var12 = var9 & var8;
    assign var13 = var8 & var2;
    assign var14 = var3 | var13;
    assign var15 = var8 & var7;
    assign var16 = var7 & var1;
    assign var17 = var2 | var16;
    assign var18 = var7 & var6;
    assign var19 = var6 & var0;
    assign var20 = var1 | var19;
    assign var21 = var12 & var17;
    assign var22 = var11 | var21;
    assign var23 = var12 & var18;
    assign var24 = var15 & var20;
    assign var25 = var14 | var24;
    assign var26 = var18 & var0;
    assign var27 = var17 | var26;
    assign var28 = var23 & var0;
    assign var29 = var22 | var28;
    assign var30 = var6 ^ var0;
    assign var31 = var7 ^ var20;
    assign var32 = var8 ^ var27;
    assign var33 = var9 ^ var25;

    // Назначение выходов
    assign out0 = var29;
    assign out1 = var33;
    assign out2 = var32;
    assign out3 = var31;
    assign out4 = var30;
    assign out5 = var5;

    assign sum = {out1, out2, out3, out4, out5};
    assign cout = out0;

endmodule
