/*=========================================================================
===========================================================================
    =            Proyecto:      Práctica 1                            =
    =            Archivo:       mux4_1.v                              =
    =            Autor:         Adrián Epifanio R.H                   =
    =            Fecha:         08/11/2018                            =
    =            Asignatura:    Estructuras de computadores           =
    =            Lenguaje:      Verilog                               = 
===========================================================================          
=========================================================================*/


/*===================================================================
=                            MODULE                                 =
===================================================================*/
module mux4_1(output reg out, input wire a, b, c, d, input wire [1:0] s);
	
	always @(a,b,c,d,s)
		begin
			case (s)
				2'b00: out = a;
				2'b01: out = b;
				2'b10: out = c;
				2'b11: out = d;
			endcase
		end

endmodule

/*===================================================================*/
/*=========================  End of module  =========================*/
/**
 *
 *
 *   Autor: Adrián Epifanio R.H
 *   Fecha: 08/11/2018
 *
 *
**/

