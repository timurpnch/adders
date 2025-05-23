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
  input [5:0] a;
  wire [5:0] a;
  input [5:0] b;
  wire [5:0] b;
  wire c_0;
  wire c_6;
  output cout;
  wire cout;
  wire g_10;
  wire p_0;
  output [5:0] s;
  wire [5:0] s;
  \$_XOR_  _20_ (
    .A(b[2]),
    .B(a[2]),
    .Y(_00_)
  );
  \$_NAND_  _21_ (
    .A(b[1]),
    .B(a[1]),
    .Y(_01_)
  );
  \$_XOR_  _22_ (
    .A(b[1]),
    .B(a[1]),
    .Y(_02_)
  );
  \$_NAND_  _23_ (
    .A(b[0]),
    .B(a[0]),
    .Y(_03_)
  );
  \$_ANDNOT_  _24_ (
    .A(_02_),
    .B(_03_),
    .Y(_04_)
  );
  \$_ANDNOT_  _25_ (
    .A(_01_),
    .B(_04_),
    .Y(_05_)
  );
  \$_XNOR_  _26_ (
    .A(_05_),
    .B(_00_),
    .Y(s[2])
  );
  \$_AND_  _27_ (
    .A(b[5]),
    .B(a[5]),
    .Y(_06_)
  );
  \$_XNOR_  _28_ (
    .A(b[5]),
    .B(a[5]),
    .Y(_07_)
  );
  \$_NAND_  _29_ (
    .A(b[4]),
    .B(a[4]),
    .Y(_08_)
  );
  \$_XNOR_  _30_ (
    .A(b[4]),
    .B(a[4]),
    .Y(_09_)
  );
  \$_NAND_  _31_ (
    .A(b[3]),
    .B(a[3]),
    .Y(_10_)
  );
  \$_XOR_  _32_ (
    .A(b[3]),
    .B(a[3]),
    .Y(_11_)
  );
  \$_NAND_  _33_ (
    .A(b[2]),
    .B(a[2]),
    .Y(_12_)
  );
  \$_ANDNOT_  _34_ (
    .A(_00_),
    .B(_05_),
    .Y(_13_)
  );
  \$_ANDNOT_  _35_ (
    .A(_12_),
    .B(_13_),
    .Y(_14_)
  );
  \$_ANDNOT_  _36_ (
    .A(_11_),
    .B(_14_),
    .Y(_15_)
  );
  \$_ANDNOT_  _37_ (
    .A(_10_),
    .B(_15_),
    .Y(_16_)
  );
  \$_NOR_  _38_ (
    .A(_16_),
    .B(_09_),
    .Y(_17_)
  );
  \$_ANDNOT_  _39_ (
    .A(_08_),
    .B(_17_),
    .Y(_18_)
  );
  \$_NOR_  _40_ (
    .A(_18_),
    .B(_07_),
    .Y(_19_)
  );
  \$_OR_  _41_ (
    .A(_19_),
    .B(_06_),
    .Y(cout)
  );
  \$_XOR_  _42_ (
    .A(_18_),
    .B(_07_),
    .Y(s[5])
  );
  \$_XOR_  _43_ (
    .A(_16_),
    .B(_09_),
    .Y(s[4])
  );
  \$_XOR_  _44_ (
    .A(b[0]),
    .B(a[0]),
    .Y(p_0)
  );
  \$_XNOR_  _45_ (
    .A(_14_),
    .B(_11_),
    .Y(s[3])
  );
  \$_XNOR_  _46_ (
    .A(_03_),
    .B(_02_),
    .Y(s[1])
  );
  assign c_0 = 1'h0;
  assign c_6 = cout;
  assign g_10 = cout;
  assign s[0] = p_0;
endmodule
