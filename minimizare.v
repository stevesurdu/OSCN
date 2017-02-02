
module func (f,A,B,C,D);
 input A,B,C,D;
 output f;
 wire nA,nB,nC,nD;
 wire P1,P2,P4,P5,P6,P7;
 not(nA,A);
 not(nB,B);
 not(nC,C);
 not(nD,D);
 and(P1,nA,nB,C,D);
 and(P2,nA,B,C,D);
 and(P3,A,nB,nC,nD);
 and(P4,A,nB,nC,D);
 and(P5,A,B,nC,D);
 and(P6,A,B,C,D);
 and(P7,A,B,nC,nD);

 or(f,P1,P2,P3,P4,P5,P6,P7);
endmodule



module func1(f1,A,B,C,D);
 input A,B,C,D;
 output f1;
 wire nA,nB,nC,nD;
 wire P1,P2,p3;
 not(nA,A);
 not(nB,B);
 not(nC,C);
 not(nD,D);
 and(P1,A,nC);
 and(P2,nA,C,D);
 and(P3,A,B,D);

 or(f1,P1,P2,P3);
endmodule

module func2(f2,A,B,C,D);
 input A,B,C,D;
 output f2;
 wire nA,nB,nC,nD;
 wire P1,P2,p3;
 not(nA,A);
 not(nB,B);
 not(nC,C);
 not(nD,D);
 and(P1,A,nC);
 and(P2,nA,C,D);
 and(P3,B,C,D);

 or(f2,P1,P2,P3);
endmodule





module simulare;
reg A,B,C,D;
wire f,f1,f2;

func funct(f,A,B,C,D);
func1 funct1(f1,A,B,C,D);
func1 funct2(f2,A,B,C,D);

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
  $monitor ("%b %b %b %b ->->f=%b f1=%b f2=%b  ",A,B,C,D,f,f1,f2);

endmodule
