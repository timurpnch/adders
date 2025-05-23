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
  wire _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  wire _28_;
  wire _29_;
  wire _30_;
  wire _31_;
  input [8:0] a;
  wire [8:0] a;
  input [8:0] b;
  wire [8:0] b;
  wire c_0;
  wire c_9;
  output cout;
  wire cout;
  wire g_16;
  wire p_0;
  output [8:0] s;
  wire [8:0] s;
  \$_XOR_  _32_ (
    .A(b[2]),
    .B(a[2]),
    .Y(_00_)
  );
  \$_NAND_  _33_ (
    .A(b[1]),
    .B(a[1]),
    .Y(_01_)
  );
  \$_XOR_  _34_ (
    .A(b[1]),
    .B(a[1]),
    .Y(_02_)
  );
  \$_NAND_  _35_ (
    .A(b[0]),
    .B(a[0]),
    .Y(_03_)
  );
  \$_ANDNOT_  _36_ (
    .A(_02_),
    .B(_03_),
    .Y(_04_)
  );
  \$_ANDNOT_  _37_ (
    .A(_01_),
    .B(_04_),
    .Y(_05_)
  );
  \$_XNOR_  _38_ (
    .A(_05_),
    .B(_00_),
    .Y(s[2])
  );
  \$_XNOR_  _39_ (
    .A(b[5]),
    .B(a[5]),
    .Y(_06_)
  );
  \$_NAND_  _40_ (
    .A(b[4]),
    .B(a[4]),
    .Y(_07_)
  );
  \$_XNOR_  _41_ (
    .A(b[4]),
    .B(a[4]),
    .Y(_08_)
  );
  \$_NAND_  _42_ (
    .A(b[3]),
    .B(a[3]),
    .Y(_09_)
  );
  \$_XOR_  _43_ (
    .A(b[3]),
    .B(a[3]),
    .Y(_10_)
  );
  \$_NAND_  _44_ (
    .A(b[2]),
    .B(a[2]),
    .Y(_11_)
  );
  \$_ANDNOT_  _45_ (
    .A(_00_),
    .B(_05_),
    .Y(_12_)
  );
  \$_ANDNOT_  _46_ (
    .A(_11_),
    .B(_12_),
    .Y(_13_)
  );
  \$_ANDNOT_  _47_ (
    .A(_10_),
    .B(_13_),
    .Y(_14_)
  );
  \$_ANDNOT_  _48_ (
    .A(_09_),
    .B(_14_),
    .Y(_15_)
  );
  \$_NOR_  _49_ (
    .A(_15_),
    .B(_08_),
    .Y(_16_)
  );
  \$_ANDNOT_  _50_ (
    .A(_07_),
    .B(_16_),
    .Y(_17_)
  );
  \$_XOR_  _51_ (
    .A(_17_),
    .B(_06_),
    .Y(s[5])
  );
  \$_XOR_  _52_ (
    .A(b[0]),
    .B(a[0]),
    .Y(p_0)
  );
  \$_AND_  _53_ (
    .A(b[8]),
    .B(a[8]),
    .Y(_18_)
  );
  \$_XNOR_  _54_ (
    .A(b[8]),
    .B(a[8]),
    .Y(_19_)
  );
  \$_NAND_  _55_ (
    .A(b[7]),
    .B(a[7]),
    .Y(_20_)
  );
  \$_XNOR_  _56_ (
    .A(b[7]),
    .B(a[7]),
    .Y(_21_)
  );
  \$_NAND_  _57_ (
    .A(b[6]),
    .B(a[6]),
    .Y(_22_)
  );
  \$_XNOR_  _58_ (
    .A(b[6]),
    .B(a[6]),
    .Y(_23_)
  );
  \$_NAND_  _59_ (
    .A(b[5]),
    .B(a[5]),
    .Y(_24_)
  );
  \$_NOR_  _60_ (
    .A(_17_),
    .B(_06_),
    .Y(_25_)
  );
  \$_ANDNOT_  _61_ (
    .A(_24_),
    .B(_25_),
    .Y(_26_)
  );
  \$_NOR_  _62_ (
    .A(_26_),
    .B(_23_),
    .Y(_27_)
  );
  \$_ANDNOT_  _63_ (
    .A(_22_),
    .B(_27_),
    .Y(_28_)
  );
  \$_NOR_  _64_ (
    .A(_28_),
    .B(_21_),
    .Y(_29_)
  );
  \$_ANDNOT_  _65_ (
    .A(_20_),
    .B(_29_),
    .Y(_30_)
  );
  \$_NOR_  _66_ (
    .A(_30_),
    .B(_19_),
    .Y(_31_)
  );
  \$_OR_  _67_ (
    .A(_31_),
    .B(_18_),
    .Y(cout)
  );
  \$_XNOR_  _68_ (
    .A(_13_),
    .B(_10_),
    .Y(s[3])
  );
  \$_XOR_  _69_ (
    .A(_28_),
    .B(_21_),
    .Y(s[7])
  );
  \$_XNOR_  _70_ (
    .A(_03_),
    .B(_02_),
    .Y(s[1])
  );
  \$_XOR_  _71_ (
    .A(_26_),
    .B(_23_),
    .Y(s[6])
  );
  \$_XOR_  _72_ (
    .A(_15_),
    .B(_08_),
    .Y(s[4])
  );
  \$_XOR_  _73_ (
    .A(_30_),
    .B(_19_),
    .Y(s[8])
  );
  assign c_0 = 1'h0;
  assign c_9 = cout;
  assign g_16 = cout;
  assign s[0] = p_0;
endmodule
