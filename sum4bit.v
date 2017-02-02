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

module sum4bit(s,c_out,a,b,c_in);
 input[3:0] a,b;
 input c_in;
 output[3:0] s;
 output c_out;
 wire c1,c2,c3;
 sum1bit s0(s[0],c1,a[0],b[0],c_in);
 sum1bit s1(s[1],c2,a[1],b[1],c1); 
 sum1bit s2(s[2],c3,a[2],b[2],c2);
 sum1bit s3(s[3],c_out,a[3],b[3],c3);
endmodule


module simulare;
 reg[3:0] a,b;
 reg ci;
 wire [3:0] s;
 sum4bit suma(s,co,a,b,ci);
  initial
   begin
       a=4'd2; b=4'd3; ci=4'd1;
    #5 a=4'd9; b=4'd4; ci=4'd0;
    #5 a=4'd10; b=4'd11; ci=4'd1;
    #5 $finish;

  end

 initial
  $monitor("%d + %d + %d = S= %d  c0=%d",a,b,ci,s,co);
endmodule

    

	 
