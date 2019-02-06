/*=========================================================================
===========================================================================
    =            Proyecto:      Práctica 1                            =
    =            Archivo:       cal.v                                 =
    =            Autor:         Adrián Epifanio R.H                   =
    =            Fecha:         08/11/2018                            =
    =            Asignatura:    Estructuras de computadores           =
    =            Lenguaje:      Verilog                               = 
===========================================================================          
=========================================================================*/


/*===================================================================
=                            MODULE                                 =
===================================================================*/
module cal(output wire out, c_out, input wire a, b, arit, c_in, input wire [1:0] s);

	wire cablecl, cablefa;

	cl celdalog(cablecl, a, b, s);
	fa fulladder(c_out, cablefa, a, b, c_in);
	mux2_1	mux1(out, cablecl, cablefa, arit);

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

