module ffl ( 
	j,
	k,
	t,
	d,
	s,
	r,
	clk,
	clr,
	sel,
	display
	) ;

input  j;
input  k;
input  t;
input  d;
input  s;
input  r;
input  clk;
input  clr;
input [1:0] sel;
inout [5:0] display;
