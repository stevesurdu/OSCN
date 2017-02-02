module my_nor(out,a,b);
	output out;
	input a,b;
	wire c;
	
	supply1 pwr;
	supply0 gnd;

	pmos(c,pwr,b);
	pmos(out,c,a);

	nmos(out,gnd,a);
	nmos(out,gnd,b);
endmodule

module my_mux(out,s,i0,i1);
	output out;
	input s,i0,i1;
	wire sbar;
	
	my_nor nt(sbar,s,s);
	cmos(out,i0,sbar,s);
	cmos(out,i1,s,sbar);
	
endmodule

module stimulus;
 	reg s,i0,i1;
	wire out;
	
	my_mux m21(out,s,i0,i1);
	initial
		begin
		   s=1'b0;i0=1'b0;i1=1'b0;
		#5 s=1'b0;i0=1'b0;i1=1'b1;
		#5 s=1'b0;i0=1'b1;i1=1'b0;
		#5 s=1'b0;i0=1'b1;i1=1'b1;
		#5 s=1'b1;i0=1'b0;i1=1'b0;
		#5 s=1'b1;i0=1'b0;i1=1'b1;
		#5 s=1'b1;i0=1'b1;i1=1'b0;
		#5 s=1'b1;i0=1'b1;i1=1'b1;
		end
	initial
		begin
			$display("\t\t  TIMP  OUT   S   I0    I1\n");
			$monitor("%d     %b    %b    %b     %b",$time,out,s,i0,i1);
		end
endmodule









