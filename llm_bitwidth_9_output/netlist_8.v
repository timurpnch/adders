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
  INVxp33_ASAP7_75t_L _25_ (
    .A(b[4]),
    .Y(_00_)
  );
  INVxp33_ASAP7_75t_L _26_ (
    .A(a[4]),
    .Y(_01_)
  );
  INVxp33_ASAP7_75t_L _27_ (
    .A(b[2]),
    .Y(_02_)
  );
  INVxp33_ASAP7_75t_L _28_ (
    .A(a[2]),
    .Y(_03_)
  );
  AND2x2_ASAP7_75t_L _29_ (
    .A(b[0]),
    .B(a[0]),
    .Y(_04_)
  );
  MAJIxp5_ASAP7_75t_L _30_ (
    .A(b[1]),
    .B(a[1]),
    .C(_04_),
    .Y(_05_)
  );
  MAJIxp5_ASAP7_75t_L _31_ (
    .A(_02_),
    .B(_03_),
    .C(_05_),
    .Y(_06_)
  );
  MAJIxp5_ASAP7_75t_L _32_ (
    .A(b[3]),
    .B(a[3]),
    .C(_06_),
    .Y(_07_)
  );
  MAJIxp5_ASAP7_75t_L _33_ (
    .A(_00_),
    .B(_01_),
    .C(_07_),
    .Y(_08_)
  );
  XNOR2xp5_ASAP7_75t_L _34_ (
    .A(b[5]),
    .B(a[5]),
    .Y(_09_)
  );
  XNOR2xp5_ASAP7_75t_L _35_ (
    .A(_08_),
    .B(_09_),
    .Y(s[5])
  );
  NOR2xp33_ASAP7_75t_L _36_ (
    .A(b[0]),
    .B(a[0]),
    .Y(_10_)
  );
  NOR2xp33_ASAP7_75t_L _37_ (
    .A(_04_),
    .B(_10_),
    .Y(s[0])
  );
  MAJIxp5_ASAP7_75t_L _38_ (
    .A(b[5]),
    .B(a[5]),
    .C(_08_),
    .Y(_11_)
  );
  XOR2xp5_ASAP7_75t_L _39_ (
    .A(b[6]),
    .B(a[6]),
    .Y(_12_)
  );
  XNOR2xp5_ASAP7_75t_L _40_ (
    .A(_11_),
    .B(_12_),
    .Y(s[6])
  );
  XNOR2xp5_ASAP7_75t_L _41_ (
    .A(b[1]),
    .B(a[1]),
    .Y(_13_)
  );
  XNOR2xp5_ASAP7_75t_L _42_ (
    .A(_04_),
    .B(_13_),
    .Y(s[1])
  );
  XOR2xp5_ASAP7_75t_L _43_ (
    .A(b[2]),
    .B(a[2]),
    .Y(_14_)
  );
  XNOR2xp5_ASAP7_75t_L _44_ (
    .A(_05_),
    .B(_14_),
    .Y(s[2])
  );
  INVxp33_ASAP7_75t_L _45_ (
    .A(b[6]),
    .Y(_15_)
  );
  INVxp33_ASAP7_75t_L _46_ (
    .A(a[6]),
    .Y(_16_)
  );
  MAJIxp5_ASAP7_75t_L _47_ (
    .A(_15_),
    .B(_16_),
    .C(_11_),
    .Y(_17_)
  );
  MAJIxp5_ASAP7_75t_L _48_ (
    .A(b[7]),
    .B(a[7]),
    .C(_17_),
    .Y(_18_)
  );
  XOR2xp5_ASAP7_75t_L _49_ (
    .A(b[8]),
    .B(a[8]),
    .Y(_19_)
  );
  XNOR2xp5_ASAP7_75t_L _50_ (
    .A(_18_),
    .B(_19_),
    .Y(s[8])
  );
  XNOR2xp5_ASAP7_75t_L _51_ (
    .A(b[7]),
    .B(a[7]),
    .Y(_20_)
  );
  XNOR2xp5_ASAP7_75t_L _52_ (
    .A(_17_),
    .B(_20_),
    .Y(s[7])
  );
  INVxp33_ASAP7_75t_L _53_ (
    .A(b[8]),
    .Y(_21_)
  );
  INVxp33_ASAP7_75t_L _54_ (
    .A(a[8]),
    .Y(_22_)
  );
  MAJIxp5_ASAP7_75t_L _55_ (
    .A(_21_),
    .B(_22_),
    .C(_18_),
    .Y(cout)
  );
  XOR2xp5_ASAP7_75t_L _56_ (
    .A(b[4]),
    .B(a[4]),
    .Y(_23_)
  );
  XNOR2xp5_ASAP7_75t_L _57_ (
    .A(_07_),
    .B(_23_),
    .Y(s[4])
  );
  XNOR2xp5_ASAP7_75t_L _58_ (
    .A(b[3]),
    .B(a[3]),
    .Y(_24_)
  );
  XNOR2xp5_ASAP7_75t_L _59_ (
    .A(_06_),
    .B(_24_),
    .Y(s[3])
  );
endmodule
