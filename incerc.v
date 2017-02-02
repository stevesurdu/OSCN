module vsync(clk, vsync_out, blank_out);
		   input clk;
		   output vsync_out;
		   output blank_out;
		   
		   reg [10:0] count = 10'b0000000000;
		   reg vsync  = 0;
		   reg blank  = 0;
		
		   always @(posedge clk)
			 if (count < 666) 
                                                        count <= count  +1;
			 else count <= 0;
		   
		   always @(posedge clk)
			 if (count < 600)
			   blank 		<= 0;
			 else
			   blank 		<= 1;
		      
		   always @(posedge clk)
			 begin
				if (count < 637)
				  vsync 	<= 1;
				else if (count >= 637 && count <643)
				  vsync 	<= 0;
				else if (count >= 643)
				  vsync 	<= 1;
			 end
		
		   assign vsync_out  = vsync;
		   assign blank_out  = blank;
		   
		endmodule   
module top(clk, vsync_out, blank_out);
  output  vsync_out;
wire clk, vblankout;
vsync   vs(clk, vsync_out, vblank);  

initial 
clk=1'b0;
always
#1 clk=~clk;
initial
 begin
$dumpfile("vga.vcd");
$dumpvars();

#8000 $finish;		
	end
	
		endmodule  