module func (out,a,b,c);
 output out;
 input a,b,c;
 wire e;
 and #(5) P1(e,a,b);
 or #(4) P2(out,e,c);
endmodule

module stimulus;
 reg A,B,C;
 wire O;
 func f1(O,A,B,C);
 initial 
   begin
     $dumpfile("func.vcd");
     $dumpvars();
     A=1'b0;B=1'b0;C=1'b0;
   #10 A=1'b1;B=1'b1;C=1'b1;
   #10 A=1'b1;B=1'b0;C=1'b0; 
   #20 $finish;
  end
endmodule
 