`timescale 10ns/1ns 

module sum1bit(s,c_out,a,b,c_in);
 input a,b,c_in;
 output s,c_out;
 wire s1,s2,c1;
 xor(s1,a,b);
 and(c1,a,b);
 xor(s,s1,c_in);
 and(c2,s1,c_in);
 or(c_out,c2,c1);
endmodule

module simulare;
 reg a,b,ci;
 wire s,co;
 sum1bit sum(s,co,a,b,ci);
  initial
   begin
       a=1'b0; b=1'b0; ci=1'b0;
    #5 a=1'b0; b=1'b0; ci=1'b1;
    #5 a=1'b0; b=1'b1; ci=1'b0;
    #5 a=1'b0; b=1'b1; ci=1'b1;
    #5 a=1'b1; b=1'b0; ci=1'b0;
    #5 a=1'b1; b=1'b0; ci=1'b1;
    #5 a=1'b1; b=1'b1; ci=1'b0;
    #5 a=1'b1; b=1'b1; ci=1'b1;
    #5 $finish;

  end

 initial
  $monitor("%b %b %b -> %b %b",a,b,ci,s,co);
endmodule

    

	 
