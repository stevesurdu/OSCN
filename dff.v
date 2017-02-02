

module my_not(out,in);
	output out;
	input in;

	
	supply1 pwr;
	supply0 gnd;

	nmos(out,gnd,in);
	pmos(out,pwr,in);
endmodule


module dff(q,qbar,d,clk);
	output q,qbar;
	input d,clk;
	wire e;
	wire nclk;
	
	my_not nt(nclk,clk);
	cmos(e,d,clk,nclk);
	cmos(e,q,nclk,clk);
	
	my_not nt1(qbar,e);
	my_not nt2(q,qbar);
endmodule


module stimulus;
 	reg d,clk;
	wire q,qbar;
	
	dff d1(q,qbar,d,clk);
	initial
		begin
		  clk=1'b0;d=1'b0;
		#10 d=1'b1;
		#10 d=1'b0;
		#10 $finish;
		end
        always
		#2 clk=~clk;
	initial
		begin
	 		$display("\t\tTIMP Q D CLK\n");
			$monitor("%d %d %d %d",$time,q,d,clk);
		end
endmodule









