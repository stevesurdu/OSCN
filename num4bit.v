'timescale 10ns/1ns
// modulul fiind pentru namaratorul pe 4 biti

 module num4bit(q,clk,reset);
 output[3:0] q;
 input clk,reset;
T_FF tff0(q[0],clk,reset);
T_FF tff1(q[1],q[0],reset);
T_FF tff2(q[2],q[1],reset);
T_FF tff3(q[3],q[2],reset);
endmodule

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
wire[3:0] q;
num4bit num(q,clk,reset); //instantiere modul numarator
initial
 clk=1'b0;
always 
#5clk=~clk;

begin
 $ dumpfile("num4bit.vcd");
 $ dumpvars();
 'reset=1'b0;
 #15 reset=1'bo;
 #180 reset=1'b1;
 #10 reset=1'b0;
 #20$ finish;
end
initial $monitor( $time,"q=%b",q);
endmodule

