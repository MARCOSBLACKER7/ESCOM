module flipflops ( 
	s,
	r,
	j,
	k,
	d,
	t,
	clk,
	clr,
	selector,
	display
	) ;

input  s;
input  r;
input  j;
input  k;
input  d;
input  t;
input  clk;
input  clr;
input [1:0] selector;
inout [5:0] display;
