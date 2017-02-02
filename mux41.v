module mux41(y,s0,s1,in);
output y;
input s0,s1;
input  [3:0] in;
wire p1,p2,p3,p4;
not(ns0,s0);
not(ns1,s1);
and(p1,ns0,ns1,in[0]);
and(p2,ns0,s1,in[1]);
and(p3,s0,ns1,in[2]);
and(p4,s0,s1,in[3]);
or(y,p1,p2,p3,p4);
endmodule;

module mux41_2(y,s0,s1,in);
output y;
input s0,s1;
input  [3:0] in;
assign y=((~s0)&(~s1)&in[0])|(~s0)&s1&in[1])|(s0&(~s1)&in[2])|(s0&s1&in[0]);
endmodule


module sim_mux;
reg[3:0] in;
reg s0,s1;
wire y;
mux41 m(y,s0,s1,in);
initial 
   begin
      in=4'b1011;
      s0=1'b0;
      s1=1'b0;
  #10 s1=1'b1;
  #10 s0=1'b1;
      s1=1'b0;
  #10 s0=1'b1;
   end
 initial
  begin 
   $monitor ($time ," %b%b-%b->%b",s0,s1,in,y);
   #40 $finish;
  end 
endmodule
      
