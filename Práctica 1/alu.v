/*=========================================================================
===========================================================================
    =            Proyecto:      Práctica 1                            =
    =            Archivo:       malu.v                                =
    =            Autor:         Adrián Epifanio R.H                   =
    =            Fecha:         08/11/2018                            =
    =            Asignatura:    Estructuras de computadores           =
    =            Lenguaje:      Verilog                               = 
===========================================================================          
=========================================================================*/


/*===================================================================
=                            MODULE                                 =
===================================================================*/
module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire arit);

	wire [3:0]OP1, OP2, cable_a_secas, mux0, cin0;
	wire OP_A, OP_B, cpl;
	
	assign mux0 = 4'b0000;
	mux2_4 muxA(OP1, mux0, A, OP_A);
	mux2_4 muxB(cable_a_secas, A, B, OP_B);
	compl1 complementador(OP2, cable_a_secas, cpl);

	cal cal0(R[0], cin0[1], OP1[0], OP2[0], arit, cin0[0], ALUOp);
	cal cal1(R[1], cin0[2], OP1[1], OP2[1], arit, cin0[1], ALUOp);
	cal cal2(R[2], cin0[3], OP1[2], OP2[2], arit, cin0[2], ALUOp);
	cal cal3(R[3], carry, OP1[3], OP2[3], arit, cin0[3], ALUOp);

	assign cpl = arit&ALUOp[0] | arit&ALUOp[1];
	assign cin0[0] = arit&ALUOp[0] | arit&ALUOp[1];
	assign zero = (~| R);
	assign sign = (R[3]);
	assign OP_A =  (~arit)&(ALUOp[0])| ~ALUOp[1];
	assign OP_B = ~ALUOp[1] | (arit)&(ALUOp[0]);

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

