

module func (f,A,B,C,D);
 input A,B,C,D;
 output f;
 wire nA,nB,nC,nD;
 wire P1,P2,P4,P5,P7,P8,P9,P10,P15;
 not(nA,A);
 not(nB,B);
 not(nC,C);
 not(nD,D);
 and(P1,nA,nB,nC,D);
 and(P2,nA,nB,C,nD);
 and(P4,nA,B,nC,nD);
 and(P5,nA,B,nC,D);
 and(P7,nA,B,C,D);
 and(P8,A,nB,nC,nD);
 and(P9,A,nB,nC,D);
 and(P10,A,nB,C,nD);
 and(P15,A,B,C,D);
 or(f,P1,P2,P4,P5,P7,P8,P9,P10,P15);
endmodule

module simulare;
reg A,B,C,D;
wire f;

func funct(f,A,B,C,D);

initial
 begin
     A=1'b0;B=1'b0;C=1'b0;D=1'b0;
   #5A=1'b0;B=1'b0;C=1'b0;D=1'b1;
   #5A=1'b0;B=1'b0;C=1'b1;D=1'b0;
   #5A=1'b0;B=1'b0;C=1'b1;D=1'b1;
   #5A=1'b0;B=1'b1;C=1'b0;D=1'b0;
   #5A=1'b0;B=1'b1;C=1'b0;D=1'b1;
   #5A=1'b0;B=1'b1;C=1'b1;D=1'b0;
   #5A=1'b0;B=1'b1;C=1'b1;D=1'b1;
   #5A=1'b1;B=1'b0;C=1'b0;D=1'b0;
   #5A=1'b1;B=1'b0;C=1'b0;D=1'b1;
   #5A=1'b1;B=1'b0;C=1'b1;D=1'b0;
   #5A=1'b1;B=1'b0;C=1'b1;D=1'b1;
   #5A=1'b1;B=1'b1;C=1'b0;D=1'b0;
   #5A=1'b1;B=1'b1;C=1'b0;D=1'b1;
   #5A=1'b1;B=1'b1;C=1'b1;D=1'b0;
   #5A=1'b1;B=1'b1;C=1'b1;D=1'b1;
   #5 $finish;
 end
initial
  $monitor ("%b %b %b %b ->->f=%b  ",A,B,C,D,f);

endmodule

