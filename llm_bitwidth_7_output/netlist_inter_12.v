/* Generated by Yosys 0.33 (git sha1 2584903a060) */

module adder(a, b, s, cout);
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
  input [6:0] a;
  wire [6:0] a;
  input [6:0] b;
  wire [6:0] b;
  wire c_0;
  wire c_7;
  output cout;
  wire cout;
  wire g_12;
  wire p_0;
  output [6:0] s;
  wire [6:0] s;
  \$_XOR_  _24_ (
    .A(b[0]),
    .B(a[0]),
    .Y(p_0)
  );
  \$_XNOR_  _25_ (
    .A(b[5]),
    .B(a[5]),
    .Y(_00_)
  );
  \$_NAND_  _26_ (
    .A(b[4]),
    .B(a[4]),
    .Y(_01_)
  );
  \$_XNOR_  _27_ (
    .A(b[4]),
    .B(a[4]),
    .Y(_02_)
  );
  \$_NAND_  _28_ (
    .A(b[3]),
    .B(a[3]),
    .Y(_03_)
  );
  \$_XOR_  _29_ (
    .A(b[3]),
    .B(a[3]),
    .Y(_04_)
  );
  \$_NAND_  _30_ (
    .A(b[2]),
    .B(a[2]),
    .Y(_05_)
  );
  \$_XOR_  _31_ (
    .A(b[2]),
    .B(a[2]),
    .Y(_06_)
  );
  \$_NAND_  _32_ (
    .A(b[1]),
    .B(a[1]),
    .Y(_07_)
  );
  \$_XOR_  _33_ (
    .A(b[1]),
    .B(a[1]),
    .Y(_08_)
  );
  \$_NAND_  _34_ (
    .A(b[0]),
    .B(a[0]),
    .Y(_09_)
  );
  \$_ANDNOT_  _35_ (
    .A(_08_),
    .B(_09_),
    .Y(_10_)
  );
  \$_ANDNOT_  _36_ (
    .A(_07_),
    .B(_10_),
    .Y(_11_)
  );
  \$_ANDNOT_  _37_ (
    .A(_06_),
    .B(_11_),
    .Y(_12_)
  );
  \$_ANDNOT_  _38_ (
    .A(_05_),
    .B(_12_),
    .Y(_13_)
  );
  \$_ANDNOT_  _39_ (
    .A(_04_),
    .B(_13_),
    .Y(_14_)
  );
  \$_ANDNOT_  _40_ (
    .A(_03_),
    .B(_14_),
    .Y(_15_)
  );
  \$_NOR_  _41_ (
    .A(_15_),
    .B(_02_),
    .Y(_16_)
  );
  \$_ANDNOT_  _42_ (
    .A(_01_),
    .B(_16_),
    .Y(_17_)
  );
  \$_XOR_  _43_ (
    .A(_17_),
    .B(_00_),
    .Y(s[5])
  );
  \$_XNOR_  _44_ (
    .A(_11_),
    .B(_06_),
    .Y(s[2])
  );
  \$_AND_  _45_ (
    .A(b[6]),
    .B(a[6]),
    .Y(_18_)
  );
  \$_XNOR_  _46_ (
    .A(b[6]),
    .B(a[6]),
    .Y(_19_)
  );
  \$_NAND_  _47_ (
    .A(b[5]),
    .B(a[5]),
    .Y(_20_)
  );
  \$_NOR_  _48_ (
    .A(_17_),
    .B(_00_),
    .Y(_21_)
  );
  \$_ANDNOT_  _49_ (
    .A(_20_),
    .B(_21_),
    .Y(_22_)
  );
  \$_NOR_  _50_ (
    .A(_22_),
    .B(_19_),
    .Y(_23_)
  );
  \$_OR_  _51_ (
    .A(_23_),
    .B(_18_),
    .Y(cout)
  );
  \$_XNOR_  _52_ (
    .A(_09_),
    .B(_08_),
    .Y(s[1])
  );
  \$_XOR_  _53_ (
    .A(_22_),
    .B(_19_),
    .Y(s[6])
  );
  \$_XNOR_  _54_ (
    .A(_13_),
    .B(_04_),
    .Y(s[3])
  );
  \$_XOR_  _55_ (
    .A(_15_),
    .B(_02_),
    .Y(s[4])
  );
  assign c_0 = 1'h0;
  assign c_7 = cout;
  assign g_12 = cout;
  assign s[0] = p_0;
endmodule
