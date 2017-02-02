module FSM_vmachine(news,coin,clk,reset);
	input [1:0] coin;
	input clk;
	input reset;
	output news;
	
	wire news;

	wire[1:0] NEXT_STATE;
	reg[1:0] PRES_STATE;
	
	parameter s0=2'b00;
	parameter s5=2'b01;
	parameter s10=2'b10;
	parameter s15=2'b11;

	function[2:0] fsm;
		input[1:0] fsm_coin;
		input[1:0] fsm_PRES_STATE;
		reg fsm_news;
		reg[1:0] fsm_NEXT_STATE;
	begin
		case(fsm_PRES_STATE)
 	   	   s0:
 			begin
				if(fsm_coin==2'b10)
				  begin
					fsm_news=1'b0;
					fsm_NEXT_STATE=s10;
				  end
				else if(fsm_coin==2'b01)
				  begin
					fsm_news=1'b0;
					fsm_NEXT_STATE=s5;
				  end
				else 
				  begin
					fsm_news=1'b0;
					fsm_NEXT_STATE=s0;
				  end
			end



		  s5:
 			begin
				if(fsm_coin==2'b10)
				  begin
					fsm_news=1'b0;
					fsm_NEXT_STATE=s15;
				  end
				else if(fsm_coin==2'b01)
				  begin
					fsm_news=1'b0;
					fsm_NEXT_STATE=s10;
				  end
				else 
				  begin
					fsm_news=1'b0;
					fsm_NEXT_STATE=s5;
				  end
			end



		  s10:
 			begin
				if(fsm_coin==2'b10)
				  begin
					fsm_news=1'b0;
					fsm_NEXT_STATE=s15;
				  end
				else if(fsm_coin==2'b01)
				  begin
					fsm_news=1'b0;
					fsm_NEXT_STATE=s15;
				  end
				else 
				  begin
					fsm_news=1'b0;
					fsm_NEXT_STATE=s10;
				  end
			end


		  s15:
 			begin
				fsm_news=1'b1;
				fsm_NEXT_STATE=s0;
			end
				
 		   endcase
			fsm={fsm_news,fsm_NEXT_STATE};
		end
	endfunction
  assign{news,NEXT_STATE}=fsm(coin,PRES_STATE);
  always@(posedge clk)
  begin
	if(reset==1'b1)
		PRES_STATE=s0;
	else
		PRES_STATE=NEXT_STATE;
  end
endmodule

module stimulus;
	reg clk;
	reg[1:0] coin;
	reg reset;
	wire news;
	FSM_vmachine FSM(news,coin,clk,reset);
	initial
	 begin
	 	$display("\t\t\n\t\t TIMP RESET  NEWS \n");
		$monitor("%d    %d     %d",$time,reset,news);
	 end
	initial
 	 begin
		clk=1'b0;
		coin=2'b00;
		reset=1'b1;
		#50 reset=1'b0;
 		
		#80 coin=2'b01;
		#40 coin=2'b00;
		#80 coin=2'b01;
		#40 coin=2'b00;
		#80 coin=2'b01;    
		#40 coin=2'b00;
		#180 coin=2'b01;
		#40 coin=2'b00;
		#80 coin=2'b10; 
                #40 coin=2'b00;
		#180 coin=2'b10;
		#40 coin=2'b00;
		#80 coin=2'b10;
		#40 coin=2'b00;
		#180 coin=2'b10;
		#40 coin=2'b00;
		#80 coin=2'b01;
		#40 coin=2'b00;
		#80 $finish;
	end
	always
		begin
			#20 clk=~clk;
		end
endmodule
		
				
