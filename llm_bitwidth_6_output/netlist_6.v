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
  input [5:0] a;
  wire [5:0] a;
  input [5:0] b;
  wire [5:0] b;
  output cout;
  wire cout;
  output [5:0] s;
  wire [5:0] s;
  INVxp33_ASAP7_75t_L _15_ (
    .A(a[3]),
    .Y(_00_)
  );
  INVxp33_ASAP7_75t_L _16_ (
    .A(b[3]),
    .Y(_01_)
  );
  AND2x2_ASAP7_75t_L _17_ (
    .A(a[0]),
    .B(b[0]),
    .Y(_02_)
  );
  MAJx2_ASAP7_75t_L _18_ (
    .A(a[1]),
    .B(b[1]),
    .C(_02_),
    .Y(_03_)
  );
  MAJIxp5_ASAP7_75t_L _19_ (
    .A(a[2]),
    .B(b[2]),
    .C(_03_),
    .Y(_04_)
  );
  MAJIxp5_ASAP7_75t_L _20_ (
    .A(_00_),
    .B(_01_),
    .C(_04_),
    .Y(_05_)
  );
  MAJIxp5_ASAP7_75t_L _21_ (
    .A(a[4]),
    .B(b[4]),
    .C(_05_),
    .Y(_06_)
  );
  XOR2xp5_ASAP7_75t_L _22_ (
    .A(a[5]),
    .B(b[5]),
    .Y(_07_)
  );
  XNOR2xp5_ASAP7_75t_L _23_ (
    .A(_06_),
    .B(_07_),
    .Y(s[5])
  );
  XNOR2xp5_ASAP7_75t_L _24_ (
    .A(a[1]),
    .B(b[1]),
    .Y(_08_)
  );
  XNOR2xp5_ASAP7_75t_L _25_ (
    .A(_02_),
    .B(_08_),
    .Y(s[1])
  );
  INVxp33_ASAP7_75t_L _26_ (
    .A(a[5]),
    .Y(_09_)
  );
  INVxp33_ASAP7_75t_L _27_ (
    .A(b[5]),
    .Y(_10_)
  );
  MAJIxp5_ASAP7_75t_L _28_ (
    .A(_09_),
    .B(_10_),
    .C(_06_),
    .Y(cout)
  );
  XOR2xp5_ASAP7_75t_L _29_ (
    .A(a[3]),
    .B(b[3]),
    .Y(_11_)
  );
  XNOR2xp5_ASAP7_75t_L _30_ (
    .A(_04_),
    .B(_11_),
    .Y(s[3])
  );
  XNOR2xp5_ASAP7_75t_L _31_ (
    .A(a[4]),
    .B(b[4]),
    .Y(_12_)
  );
  XNOR2xp5_ASAP7_75t_L _32_ (
    .A(_05_),
    .B(_12_),
    .Y(s[4])
  );
  XNOR2xp5_ASAP7_75t_L _33_ (
    .A(a[2]),
    .B(b[2]),
    .Y(_13_)
  );
  XNOR2xp5_ASAP7_75t_L _34_ (
    .A(_03_),
    .B(_13_),
    .Y(s[2])
  );
  NOR2xp33_ASAP7_75t_L _35_ (
    .A(a[0]),
    .B(b[0]),
    .Y(_14_)
  );
  NOR2xp33_ASAP7_75t_L _36_ (
    .A(_02_),
    .B(_14_),
    .Y(s[0])
  );
endmodule
