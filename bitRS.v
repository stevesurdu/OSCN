module bistRS(q,nq,ns,nr);
output q,nq;
input ns,nr;
nand n1(q,ns,nq);
nand n2(nq,nr,q);
endmodule
module top;
wire Q,nQ;
reg nS,nR;
bistRS bist(Q,nQ,nS,nR);
initial
begin
nS=0;nR=0;
#5 nR=1;
#5 nR=0;
#5 nS=1;
end
endmodule