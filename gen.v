//modulul principal pentru generatorul PWM
module PWMgen(PWM,nPWM,Dpwm,clk,reset);
 input [3:0]Dpwm;
 input clk,reset;
 output PWM,nPWM;
 reg PWM;
 reg[3:0] count;

 assign nPWM=~PWM; //iesirea complementara
 //blocul principal sincronizat cu semnalul 'clk'
 always @(posedge clk)
 begin
if(reset) //la reset PWM si count iau valoarea 0
 begin
PWM=1'b0;
count=4'd0;
 end
else
begin
 count=count+1; //numaratorul se incrementeaza la fiecare
 if(count==15) //front al semnalului 'clk'
count=0; //numaratorul se reseteaza la valoarea 15
 if(count<Dpwm)
PWM=1'b1; //semnalul PWM este 1 cat timp numaratorul
 else //are valoare inferioara prescrierii pe intrarea
PWM=1'b0; //Dpwm
end
 end
endmodule
//modulul de simulare pentru generatorul PWM
module simulare;
 reg clk,reset;
 reg[3:0] Dpwm;
 wire PWM,nPWM;

 PWMgen pgen(PWM,nPWM,Dpwm,clk,reset);

 initial
begin
 clk=1'b0;
 reset=1'b1;
 Dpwm=4'd1;
end

 always
#2 clk=~clk;
 initial
begin
 $dumpfile("pwmgen.vcd");
 $dumpvars();
 #5 reset=1'b0;
 #200 Dpwm=4'd7;
 #1000 Dpwm=4'd15;
end
 initial
#2000 $finish;
endmodule