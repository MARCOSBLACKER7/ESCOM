module sensor ( 
	clk,
	clr,
	uni,
	dec,
	sensores
	) ;

input  clk;
input  clr;
inout [3:0] uni;
inout [2:0] dec;
input [1:0] sensores;
