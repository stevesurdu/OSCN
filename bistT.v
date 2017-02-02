`timescale 10ns/1ns 


//modulul pentru bistabilul T

module T_FF(q,clk,reset);
output q;
input clk,reset;
D_FF dff(q,d,clk,reset);
nor n1(d,q);
endmodule

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
reg clk,reset;
wire q;
T_FF bisT(q,clk,reset); //instantiere modul numarator
initial
 clk=1'b0;
always 
#5 clk=~clk;
initial
begin
 $dumpfile("bisT.vcd");
 $dumpvars();
  reset=1'b1;
 #7 reset=1'b0;
 #33 $finish;
end
initial $monitor($time,"q=%b",q);
endmodule

