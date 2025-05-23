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
  input [7:0] a;
  wire [7:0] a;
  input [7:0] b;
  wire [7:0] b;
  output cout;
  wire cout;
  output [7:0] s;
  wire [7:0] s;
  NAND2xp33_ASAP7_75t_L _18_ (
    .A(b[0]),
    .B(a[0]),
    .Y(_00_)
  );
  XOR2xp5_ASAP7_75t_L _19_ (
    .A(b[1]),
    .B(a[1]),
    .Y(_01_)
  );
  XNOR2xp5_ASAP7_75t_L _20_ (
    .A(_00_),
    .B(_01_),
    .Y(s[1])
  );
  INVxp33_ASAP7_75t_L _21_ (
    .A(b[1]),
    .Y(_02_)
  );
  INVxp33_ASAP7_75t_L _22_ (
    .A(a[1]),
    .Y(_03_)
  );
  MAJIxp5_ASAP7_75t_L _23_ (
    .A(_02_),
    .B(_03_),
    .C(_00_),
    .Y(_04_)
  );
  MAJx2_ASAP7_75t_L _24_ (
    .A(b[2]),
    .B(a[2]),
    .C(_04_),
    .Y(_05_)
  );
  MAJx2_ASAP7_75t_L _25_ (
    .A(b[3]),
    .B(a[3]),
    .C(_05_),
    .Y(_06_)
  );
  MAJx2_ASAP7_75t_L _26_ (
    .A(b[4]),
    .B(a[4]),
    .C(_06_),
    .Y(_07_)
  );
  XNOR2xp5_ASAP7_75t_L _27_ (
    .A(b[5]),
    .B(a[5]),
    .Y(_08_)
  );
  XNOR2xp5_ASAP7_75t_L _28_ (
    .A(_07_),
    .B(_08_),
    .Y(s[5])
  );
  MAJx2_ASAP7_75t_L _29_ (
    .A(b[5]),
    .B(a[5]),
    .C(_07_),
    .Y(_09_)
  );
  MAJIxp5_ASAP7_75t_L _30_ (
    .A(b[6]),
    .B(a[6]),
    .C(_09_),
    .Y(_10_)
  );
  XOR2xp5_ASAP7_75t_L _31_ (
    .A(b[7]),
    .B(a[7]),
    .Y(_11_)
  );
  XNOR2xp5_ASAP7_75t_L _32_ (
    .A(_10_),
    .B(_11_),
    .Y(s[7])
  );
  INVxp33_ASAP7_75t_L _33_ (
    .A(b[7]),
    .Y(_12_)
  );
  INVxp33_ASAP7_75t_L _34_ (
    .A(a[7]),
    .Y(_13_)
  );
  MAJIxp5_ASAP7_75t_L _35_ (
    .A(_12_),
    .B(_13_),
    .C(_10_),
    .Y(cout)
  );
  XNOR2xp5_ASAP7_75t_L _36_ (
    .A(b[6]),
    .B(a[6]),
    .Y(_14_)
  );
  XNOR2xp5_ASAP7_75t_L _37_ (
    .A(_09_),
    .B(_14_),
    .Y(s[6])
  );
  XOR2xp5_ASAP7_75t_L _38_ (
    .A(b[0]),
    .B(a[0]),
    .Y(s[0])
  );
  XNOR2xp5_ASAP7_75t_L _39_ (
    .A(b[2]),
    .B(a[2]),
    .Y(_15_)
  );
  XNOR2xp5_ASAP7_75t_L _40_ (
    .A(_15_),
    .B(_04_),
    .Y(s[2])
  );
  XNOR2xp5_ASAP7_75t_L _41_ (
    .A(b[3]),
    .B(a[3]),
    .Y(_16_)
  );
  XNOR2xp5_ASAP7_75t_L _42_ (
    .A(_16_),
    .B(_05_),
    .Y(s[3])
  );
  XNOR2xp5_ASAP7_75t_L _43_ (
    .A(b[4]),
    .B(a[4]),
    .Y(_17_)
  );
  XNOR2xp5_ASAP7_75t_L _44_ (
    .A(_06_),
    .B(_17_),
    .Y(s[4])
  );
endmodule
