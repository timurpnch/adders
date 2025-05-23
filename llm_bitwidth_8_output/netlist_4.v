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
  input [7:0] a;
  wire [7:0] a;
  input [7:0] b;
  wire [7:0] b;
  output cout;
  wire cout;
  output [7:0] s;
  wire [7:0] s;
  MAJx2_ASAP7_75t_L _16_ (
    .A(a[5]),
    .B(b[5]),
    .C(_05_),
    .Y(_06_)
  );
  MAJIxp5_ASAP7_75t_L _17_ (
    .A(a[6]),
    .B(b[6]),
    .C(_06_),
    .Y(_07_)
  );
  XNOR2xp5_ASAP7_75t_L _18_ (
    .A(_00_),
    .B(_07_),
    .Y(s[7])
  );
  XNOR2xp5_ASAP7_75t_L _19_ (
    .A(a[2]),
    .B(b[2]),
    .Y(_08_)
  );
  XNOR2xp5_ASAP7_75t_L _20_ (
    .A(_08_),
    .B(_02_),
    .Y(s[2])
  );
  XOR2xp5_ASAP7_75t_L _21_ (
    .A(a[0]),
    .B(b[0]),
    .Y(s[0])
  );
  XNOR2xp5_ASAP7_75t_L _22_ (
    .A(a[6]),
    .B(b[6]),
    .Y(_09_)
  );
  XNOR2xp5_ASAP7_75t_L _23_ (
    .A(_09_),
    .B(_06_),
    .Y(s[6])
  );
  INVxp33_ASAP7_75t_L _24_ (
    .A(a[7]),
    .Y(_10_)
  );
  INVxp33_ASAP7_75t_L _25_ (
    .A(b[7]),
    .Y(_11_)
  );
  MAJIxp5_ASAP7_75t_L _26_ (
    .A(_10_),
    .B(_11_),
    .C(_07_),
    .Y(cout)
  );
  XNOR2xp5_ASAP7_75t_L _27_ (
    .A(a[4]),
    .B(b[4]),
    .Y(_12_)
  );
  XNOR2xp5_ASAP7_75t_L _28_ (
    .A(_12_),
    .B(_04_),
    .Y(s[4])
  );
  XNOR2xp5_ASAP7_75t_L _29_ (
    .A(a[1]),
    .B(b[1]),
    .Y(_13_)
  );
  XNOR2xp5_ASAP7_75t_L _30_ (
    .A(_13_),
    .B(_01_),
    .Y(s[1])
  );
  XNOR2xp5_ASAP7_75t_L _31_ (
    .A(a[3]),
    .B(b[3]),
    .Y(_14_)
  );
  XNOR2xp5_ASAP7_75t_L _32_ (
    .A(_14_),
    .B(_03_),
    .Y(s[3])
  );
  XNOR2xp5_ASAP7_75t_L _33_ (
    .A(a[5]),
    .B(b[5]),
    .Y(_15_)
  );
  XNOR2xp5_ASAP7_75t_L _34_ (
    .A(_15_),
    .B(_05_),
    .Y(s[5])
  );
  XOR2xp5_ASAP7_75t_L _35_ (
    .A(a[7]),
    .B(b[7]),
    .Y(_00_)
  );
  AND2x2_ASAP7_75t_L _36_ (
    .A(a[0]),
    .B(b[0]),
    .Y(_01_)
  );
  MAJx2_ASAP7_75t_L _37_ (
    .A(a[1]),
    .B(b[1]),
    .C(_01_),
    .Y(_02_)
  );
  MAJx2_ASAP7_75t_L _38_ (
    .A(a[2]),
    .B(b[2]),
    .C(_02_),
    .Y(_03_)
  );
  MAJx2_ASAP7_75t_L _39_ (
    .A(a[3]),
    .B(b[3]),
    .C(_03_),
    .Y(_04_)
  );
  MAJx2_ASAP7_75t_L _40_ (
    .A(a[4]),
    .B(b[4]),
    .C(_04_),
    .Y(_05_)
  );
endmodule
