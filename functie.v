`timescale 10ns/1ns
module func(f,a,b,c,d);
 input a,b,c,d;
 output f;
 wire nA,nB,nC,nD;
 wire p1,p2,p4,p5,p7,p8,p9,p10,p15;
not(nA,a);
not(nB,b);
not(nC,c);
not(nD,d);
and(p1,nA,nB,nC,d);
and(p2,nA,nB,c,nD);
and(p4,nA,b,nC,nD);
and(p5,nA,b,nC,d);
and(p7,nA,b,c,d);
and(p8,a,nB,nC,nD);
and(p9,a,nB,nC,d);
and(p10,a,nB,c,nD);
and(p15,a,b,c,d);
or(f,p1,p2,p4,p5,p7,p8,p9,p10,p15);
endmodule

module simulare;
reg a,b,c,d;
wire f;
func functie (f,a,b,c,d);
initial
 begin
    a=1'd0;b=1'd0;c=1'd0;d=1'd0;
 #5 a=1'd0;b=1'd0;c=1'd0;d=1'd1;
 #5 a=1'd0;b=1'd0;c=1'd1;d=1'd0;
 #5 a=1'd0;b=1'd0;c=1'd1;d=1'd1;
 #5 a=1'd0;b=1'd1;c=1'd0;d=1'd0;
 #5 a=1'd0;b=1'd1;c=1'd0;d=1'd1;
 #5 a=1'd0;b=1'd1;c=1'd1;d=1'd0;
 #5 a=1'd0;b=1'd1;c=1'd1;d=1'd1;
 #5 a=1'd1;b=1'd0;c=1'd0;d=1'd0;
 #5 a=1'd1;b=1'd0;c=1'd0;d=1'd1;
 #5 a=1'd1;b=1'd0;c=1'd1;d=1'd0;
 #5 a=1'd1;b=1'd0;c=1'd1;d=1'd1;
 #5 a=1'd1;b=1'd1;c=1'd0;d=1'd0;
 #5 a=1'd1;b=1'd1;c=1'd0;d=1'd1;
 #5 a=1'd1;b=1'd1;c=1'd1;d=1'd0;
 #5 a=1'd1;b=1'd1;c=1'd1;d=1'd1;
 #5 $finish;
 end

initial
  $monitor("%d %d %d %d   %d" ,a,b,c,d,f);
endmodule