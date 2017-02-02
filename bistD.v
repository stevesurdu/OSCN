`timescale 10ns/1ns 

// modulul pentru bistabilul D

module D_FF(q,d,clk,reset);
input d,clk,reset;
output q;
reg q;
always@(posedge reset or negedge clk)
 if(reset)
  q=1'b0;
else q=d;
endmodule

//modelul de simulare de tip instantiere

module stimulus;
reg clk,reset,d;
wire q;
D_FF bistD (q,d,clk,reset); //instantiere modul numarator
initial
 clk=1'b0;
always 
#5 clk=~clk;
initial
begin
 $dumpfile("bistD.vcd");
 $dumpvars();
 d=1'b0;
  reset=1'b1;
 #8 reset=1'b0;  
 #7 d=1'b1;
 #12 d=1'b0;
 #13 $finish;
end
initial $monitor($time,"q=%b",q);
endmodule

