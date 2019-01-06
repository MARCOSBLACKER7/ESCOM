module registro ( 
	clk,
	clr,
	es,
	oper,
	d,
	q
	) ;

input  clk;
input  clr;
input  es;
input [1:0] oper;
input [6:0] d;
inout [6:0] q;
