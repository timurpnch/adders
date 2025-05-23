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
  input [8:0] a;
  wire [8:0] a;
  input [8:0] b;
  wire [8:0] b;
  output cout;
  wire cout;
  output [8:0] s;
  wire [8:0] s;
  AND2x2_ASAP7_75t_L _25_ (
    .A(a[0]),
    .B(b[0]),
    .Y(_00_)
  );
  NOR2xp33_ASAP7_75t_L _26_ (
    .A(a[0]),
    .B(b[0]),
    .Y(_01_)
  );
  NOR2xp33_ASAP7_75t_L _27_ (
    .A(_00_),
    .B(_01_),
    .Y(s[0])
  );
  INVxp33_ASAP7_75t_L _28_ (
    .A(a[2]),
    .Y(_02_)
  );
  INVxp33_ASAP7_75t_L _29_ (
    .A(b[2]),
    .Y(_03_)
  );
  MAJIxp5_ASAP7_75t_L _30_ (
    .A(a[1]),
    .B(b[1]),
    .C(_00_),
    .Y(_04_)
  );
  MAJIxp5_ASAP7_75t_L _31_ (
    .A(_02_),
    .B(_03_),
    .C(_04_),
    .Y(_05_)
  );
  MAJIxp5_ASAP7_75t_L _32_ (
    .A(a[3]),
    .B(b[3]),
    .C(_05_),
    .Y(_06_)
  );
  XOR2xp5_ASAP7_75t_L _33_ (
    .A(a[4]),
    .B(b[4]),
    .Y(_07_)
  );
  XNOR2xp5_ASAP7_75t_L _34_ (
    .A(_06_),
    .B(_07_),
    .Y(s[4])
  );
  INVxp33_ASAP7_75t_L _35_ (
    .A(a[4]),
    .Y(_08_)
  );
  INVxp33_ASAP7_75t_L _36_ (
    .A(b[4]),
    .Y(_09_)
  );
  MAJIxp5_ASAP7_75t_L _37_ (
    .A(_08_),
    .B(_09_),
    .C(_06_),
    .Y(_10_)
  );
  MAJIxp5_ASAP7_75t_L _38_ (
    .A(a[5]),
    .B(b[5]),
    .C(_10_),
    .Y(_11_)
  );
  XOR2xp5_ASAP7_75t_L _39_ (
    .A(a[6]),
    .B(b[6]),
    .Y(_12_)
  );
  XNOR2xp5_ASAP7_75t_L _40_ (
    .A(_11_),
    .B(_12_),
    .Y(s[6])
  );
  INVxp33_ASAP7_75t_L _41_ (
    .A(a[6]),
    .Y(_13_)
  );
  INVxp33_ASAP7_75t_L _42_ (
    .A(b[6]),
    .Y(_14_)
  );
  MAJIxp5_ASAP7_75t_L _43_ (
    .A(_13_),
    .B(_14_),
    .C(_11_),
    .Y(_15_)
  );
  MAJIxp5_ASAP7_75t_L _44_ (
    .A(a[7]),
    .B(b[7]),
    .C(_15_),
    .Y(_16_)
  );
  XOR2xp5_ASAP7_75t_L _45_ (
    .A(a[8]),
    .B(b[8]),
    .Y(_17_)
  );
  XNOR2xp5_ASAP7_75t_L _46_ (
    .A(_16_),
    .B(_17_),
    .Y(s[8])
  );
  XNOR2xp5_ASAP7_75t_L _47_ (
    .A(a[1]),
    .B(b[1]),
    .Y(_18_)
  );
  XNOR2xp5_ASAP7_75t_L _48_ (
    .A(_00_),
    .B(_18_),
    .Y(s[1])
  );
  XOR2xp5_ASAP7_75t_L _49_ (
    .A(a[2]),
    .B(b[2]),
    .Y(_19_)
  );
  XNOR2xp5_ASAP7_75t_L _50_ (
    .A(_04_),
    .B(_19_),
    .Y(s[2])
  );
  XNOR2xp5_ASAP7_75t_L _51_ (
    .A(a[7]),
    .B(b[7]),
    .Y(_20_)
  );
  XNOR2xp5_ASAP7_75t_L _52_ (
    .A(_15_),
    .B(_20_),
    .Y(s[7])
  );
  XNOR2xp5_ASAP7_75t_L _53_ (
    .A(a[5]),
    .B(b[5]),
    .Y(_21_)
  );
  XNOR2xp5_ASAP7_75t_L _54_ (
    .A(_10_),
    .B(_21_),
    .Y(s[5])
  );
  INVxp33_ASAP7_75t_L _55_ (
    .A(a[8]),
    .Y(_22_)
  );
  INVxp33_ASAP7_75t_L _56_ (
    .A(b[8]),
    .Y(_23_)
  );
  MAJIxp5_ASAP7_75t_L _57_ (
    .A(_22_),
    .B(_23_),
    .C(_16_),
    .Y(cout)
  );
  XNOR2xp5_ASAP7_75t_L _58_ (
    .A(a[3]),
    .B(b[3]),
    .Y(_24_)
  );
  XNOR2xp5_ASAP7_75t_L _59_ (
    .A(_05_),
    .B(_24_),
    .Y(s[3])
  );
endmodule
