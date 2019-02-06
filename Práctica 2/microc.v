/*=========================================================================
===========================================================================
    =            Proyecto:      Práctica 2                            =
    =            Archivo:       micro.v                               =
    =            Autores:       Miguel Ordoñez Morales                =
    =                           Adrián Epifanio R.H                   =
    =            Fecha:         26/11/2018                            =
    =            Asignatura:    Estructuras de computadores           =
    =            Lenguaje:      Verilog                               = 
===========================================================================          
=========================================================================*/


/*===================================================================
=                            MODULE                                 =
===================================================================*/
module microc(input wire clk, reset, s_inc, s_inm, we3, wez, input wire [2:0] op, output wire z, output wire [5:0] opcode);

wire zalu;
wire [7:0]rd1, rd2, wd3, alu_mux, inm; 
wire [3:0]ra1, ra2, wa3;
wire [9:0]dir, mux_pc, dir_salto, sum_mux;
wire [15:0]mem;


//asignaciones del cable de instrucciones
assign ra1 = mem[11:08];
assign ra2 = mem[07:04];
assign wa3 = mem[03:00];
assign dir_salto = mem[09:00];
assign inm = mem[11:04];
assign opcode = mem[15:10];

//Microcontrolador sin memoria de datos de un solo ciclo

//Instanciar e interconectar pc(registro), memprog, regfile, alu, sum, biestable Z y mux's
registro	#(10)registro0(clk, reset, mux_pc, dir);
memprog		memprog0(clk, dir, mem);
regfile		regfile0(clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);
alu			alu0(rd1, rd2, op, alu_mux, zalu);
sum			sum0(10'b1, dir, sum_mux);
ffd			ffd0(clk, reset, zalu, wez, z);
mux2		#(10)mux20(dir_salto, sum_mux, s_inc, mux_pc);
mux2		mux21(alu_mux, inm, s_inm, wd3);

endmodule


/*===================================================================*/
/*=========================  End of module  =========================*/
/**
 *
 *
 *   Autores:  Miguel Ordoñez Morales
 *             Adrián Epifanio R.H
 *   Fecha:    26/11/2018
 *
 *
**/