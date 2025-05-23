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
  input [4:0] a;
  wire [4:0] a;
  input [4:0] b;
  wire [4:0] b;
  output cout;
  wire cout;
  output [4:0] sum;
  wire [4:0] sum;
  XOR2xp5_ASAP7_75t_L _13_ (
    .A(b[0]),
    .B(a[0]),
    .Y(sum[0])
  );
  XOR2xp5_ASAP7_75t_L _14_ (
    .A(b[2]),
    .B(a[2]),
    .Y(_00_)
  );
  AND2x2_ASAP7_75t_L _15_ (
    .A(b[0]),
    .B(a[0]),
    .Y(_01_)
  );
  MAJIxp5_ASAP7_75t_L _16_ (
    .A(b[1]),
    .B(a[1]),
    .C(_01_),
    .Y(_02_)
  );
  XNOR2xp5_ASAP7_75t_L _17_ (
    .A(_00_),
    .B(_02_),
    .Y(sum[2])
  );
  XOR2xp5_ASAP7_75t_L _18_ (
    .A(b[3]),
    .B(a[3]),
    .Y(_03_)
  );
  INVxp33_ASAP7_75t_L _19_ (
    .A(_02_),
    .Y(_04_)
  );
  MAJIxp5_ASAP7_75t_L _20_ (
    .A(b[2]),
    .B(a[2]),
    .C(_04_),
    .Y(_05_)
  );
  XNOR2xp5_ASAP7_75t_L _21_ (
    .A(_03_),
    .B(_05_),
    .Y(sum[3])
  );
  XNOR2xp5_ASAP7_75t_L _22_ (
    .A(b[1]),
    .B(a[1]),
    .Y(_06_)
  );
  XNOR2xp5_ASAP7_75t_L _23_ (
    .A(_06_),
    .B(_01_),
    .Y(sum[1])
  );
  XNOR2xp5_ASAP7_75t_L _24_ (
    .A(b[4]),
    .B(a[4]),
    .Y(_07_)
  );
  AND2x2_ASAP7_75t_L _25_ (
    .A(b[3]),
    .B(a[3]),
    .Y(_08_)
  );
  AND3x1_ASAP7_75t_L _26_ (
    .A(b[2]),
    .B(a[2]),
    .C(_03_),
    .Y(_09_)
  );
  NAND2xp33_ASAP7_75t_L _27_ (
    .A(_00_),
    .B(_03_),
    .Y(_10_)
  );
  NOR2xp33_ASAP7_75t_L _28_ (
    .A(_02_),
    .B(_10_),
    .Y(_11_)
  );
  OR3x1_ASAP7_75t_L _29_ (
    .A(_08_),
    .B(_09_),
    .C(_11_),
    .Y(_12_)
  );
  XNOR2xp5_ASAP7_75t_L _30_ (
    .A(_07_),
    .B(_12_),
    .Y(sum[4])
  );
  MAJx2_ASAP7_75t_L _31_ (
    .A(b[4]),
    .B(a[4]),
    .C(_12_),
    .Y(cout)
  );
endmodule
