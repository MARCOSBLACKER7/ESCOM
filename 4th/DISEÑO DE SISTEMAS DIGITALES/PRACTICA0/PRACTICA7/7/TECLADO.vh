module teclado ( 
	clk,
	clr,
	fila,
	columna,
	d
	) ;

input  clk;
input  clr;
input [3:0] fila;
inout [2:0] columna;
inout [6:0] d;
