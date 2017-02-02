//modulul pentru implementarea semaforului cu ajutorul unui
//automat Moore
`define TRUE 1'b1
`define FALSE 1'b0
`define R 2'd0
`define Y 2'd1
`define G 2'd2
//definirea starilor SP SS
`define S0 3'd0 //GREEN RED
`define S1 3'd1 //YELLOW RED
`define S2 3'd2 //RED RED
`define S3 3'd3 //RED GREEN
`define S4 3'd4 //RED YELLOW
//definirea intarzierilor
`define Y2RDELAY 3 //Intarziere galben-rosu
`define R2GDELAY 2 //Intarziere rosu-verde
module semaphore(SP,SS,SS_IN,clear,clk);
output[1:0]SP,SS; //iesirile au doi biti pentur a codifica
//cele trei culori
reg[1:0]SP,SS; //iesirile se declara si ca 'reg'
input SS_IN; //intrare pentru detectarea automob.pe SS
input clk,clear;
reg[2:0]state,next_state;//variabile pentru stari
initial //initializare in starea S0
begin
state=`S0;
next_state=`S0;
SP=`G;
SS=`R;
end
always @(posedge clk) //starea se modifica doar la aparitia
state=next_state; //frontului pozitiv de ceas
//stabilirea semnalelor de iesire
always @(state)
case(state)
`S0:begin
SP=`G;
SS=`R;
end
`S1:begin
SP=`Y;
SS=`R;
end
`S2:begin
SP=`R;
SS=`R;
end
`S3:begin
SP=`R;
SS=`G;
end
`S4:begin
SP=`R;
SS=`Y;
end
//implementarea automatului propriu-zis folosind o structura
always @(state or clear or SS_IN)
begin
if(clear)
next_state=`S0;
else
case(state)
`S0:if(SS_IN)
next_state=`S1;
else
next_state=`S0;
`S1:begin //apare o intarziere la tranzitia S1->S2
repeat(`Y2RDELAY) @posedge(clk);
next_state=`S2;
end
`S2:begin //apare o intarziere la tranzitia S2->S3
repeat(`R2GDELAY) @posedge(clk);
next_state=`S3;
end
`S3:if(SS_IN)
next_state=`S3;
else
next_state=`S4;
`S4:begin //apare o intarziere la tranzitia S4->S0
repeat(`Y2RDELAY)@(posedge clk);
next_state=`S0;
end
default:
next_state=`S0;
endcase
end
endmodule