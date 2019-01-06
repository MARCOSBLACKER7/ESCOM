module convertidor ( 
	clk,
	clr,
	e0,
	e1,
	display,
	an
	) ;

input  clk;
input  clr;
input [3:0] e0;
input [2:0] e1;
inout [6:0] display;
inout [2:0] an;
