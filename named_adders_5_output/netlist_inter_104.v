/* Generated by Yosys 0.33 (git sha1 2584903a060) */

module adder(a, b, sum, cout);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire _24_;
  input [4:0] a;
  wire [4:0] a;
  input [4:0] b;
  wire [4:0] b;
  output cout;
  wire cout;
  wire in0;
  wire in1;
  wire in2;
  wire in3;
  wire in4;
  wire in5;
  wire in6;
  wire in7;
  wire in8;
  wire in9;
  wire out0;
  wire out1;
  wire out2;
  wire out3;
  wire out4;
  wire out5;
  output [4:0] sum;
  wire [4:0] sum;
  wire var26;
  wire var27;
  wire var28;
  wire var29;
  wire var30;
  wire var5;
  \$_XOR_  _25_ (
    .A(a[3]),
    .B(b[3]),
    .Y(_00_)
  );
  \$_NAND_  _26_ (
    .A(a[2]),
    .B(b[2]),
    .Y(_01_)
  );
  \$_XNOR_  _27_ (
    .A(a[2]),
    .B(b[2]),
    .Y(_02_)
  );
  \$_NAND_  _28_ (
    .A(a[1]),
    .B(b[1]),
    .Y(_03_)
  );
  \$_NOR_  _29_ (
    .A(_03_),
    .B(_02_),
    .Y(_04_)
  );
  \$_ANDNOT_  _30_ (
    .A(_01_),
    .B(_04_),
    .Y(_05_)
  );
  \$_XOR_  _31_ (
    .A(a[1]),
    .B(b[1]),
    .Y(_06_)
  );
  \$_ANDNOT_  _32_ (
    .A(_06_),
    .B(_02_),
    .Y(_07_)
  );
  \$_NAND_  _33_ (
    .A(a[0]),
    .B(b[0]),
    .Y(_08_)
  );
  \$_ANDNOT_  _34_ (
    .A(_07_),
    .B(_08_),
    .Y(_09_)
  );
  \$_ORNOT_  _35_ (
    .A(_09_),
    .B(_05_),
    .Y(_10_)
  );
  \$_XOR_  _36_ (
    .A(_10_),
    .B(_00_),
    .Y(out2)
  );
  \$_AND_  _37_ (
    .A(a[4]),
    .B(b[4]),
    .Y(_11_)
  );
  \$_XNOR_  _38_ (
    .A(a[4]),
    .B(b[4]),
    .Y(_12_)
  );
  \$_NAND_  _39_ (
    .A(a[3]),
    .B(b[3]),
    .Y(_13_)
  );
  \$_NOR_  _40_ (
    .A(_13_),
    .B(_12_),
    .Y(_14_)
  );
  \$_OR_  _41_ (
    .A(_14_),
    .B(_11_),
    .Y(_15_)
  );
  \$_ANDNOT_  _42_ (
    .A(_00_),
    .B(_12_),
    .Y(_16_)
  );
  \$_ANDNOT_  _43_ (
    .A(_00_),
    .B(_01_),
    .Y(_17_)
  );
  \$_ANDNOT_  _44_ (
    .A(_13_),
    .B(_17_),
    .Y(_18_)
  );
  \$_ANDNOT_  _45_ (
    .A(_00_),
    .B(_02_),
    .Y(_19_)
  );
  \$_ANDNOT_  _46_ (
    .A(_06_),
    .B(_08_),
    .Y(_20_)
  );
  \$_ANDNOT_  _47_ (
    .A(_03_),
    .B(_20_),
    .Y(_21_)
  );
  \$_ANDNOT_  _48_ (
    .A(_19_),
    .B(_21_),
    .Y(_22_)
  );
  \$_ANDNOT_  _49_ (
    .A(_18_),
    .B(_22_),
    .Y(_23_)
  );
  \$_ANDNOT_  _50_ (
    .A(_16_),
    .B(_23_),
    .Y(_24_)
  );
  \$_OR_  _51_ (
    .A(_24_),
    .B(_15_),
    .Y(cout)
  );
  \$_XOR_  _52_ (
    .A(_21_),
    .B(_02_),
    .Y(out3)
  );
  \$_XOR_  _53_ (
    .A(a[0]),
    .B(b[0]),
    .Y(out5)
  );
  \$_XNOR_  _54_ (
    .A(_08_),
    .B(_06_),
    .Y(out4)
  );
  \$_XOR_  _55_ (
    .A(_23_),
    .B(_12_),
    .Y(out1)
  );
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
  assign out0 = cout;
  assign sum = { out1, out2, out3, out4, out5 };
  assign var26 = cout;
  assign var27 = out4;
  assign var28 = out3;
  assign var29 = out2;
  assign var30 = out1;
  assign var5 = out5;
endmodule
