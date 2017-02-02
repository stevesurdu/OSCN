
module func (f,A,B,C);
 input A,B,C,D;
 output f;
 wire nA,nB,nC;
 wire P1,P2,P4,P5;
 not(nA,A);
 not(nB,B);
 not(nC,C);
 
 and(P1,nA,nB,nC);
 and(P2,nA,nB,C);
 and(P3,nA,B,nC);
 and(P4,A,nB,nC);
 and(P5,A,nB,C);


 or(f,P1,P2,P3,P4,P5);
endmodule



module func1(f1,A,B,C);
 input A,B,C;
 output f1;
 wire nA,nB,nC;
 wire P1,P2;
 not(nA,A);
 not(nB,B);
 not(nC,C);
 
 and(P1,A,B);
 and(P2,B,c);


 or(f1,P1,P2);
endmodule






module simulare;
reg A,B,C;
wire f,f1;

func funct(f,A,B,C);
func1 funct1(f1,A,B,C);


initial
 begin
     A=1'b0;B=1'b0;C=1'b0;
   #5A=1'b0;B=1'b0;C=1'b1;
   #5A=1'b0;B=1'b1;C=1'b0;
   #5A=1'b0;B=1'b1;C=1'b1;
   #5A=1'b1;B=1'b0;C=1'b0;
   #5A=1'b1;B=1'b0;C=1'b1;
   #5A=1'b1;B=1'b1;C=1'b0;
   #5A=1'b1;B=1'b1;C=1'b1;
   
   #5 $finish;
 end
initial
  $monitor ("%b %b %b ->->f=%b f1=%b   ",A,B,C,f,f1);

endmodule
