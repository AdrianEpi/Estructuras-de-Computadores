/*=========================================================================
===========================================================================
    =            Proyecto:      Práctica 2                            =
    =            Archivo:       microc_tb.v                           =
    =            Autores:       Miguel Ordoñez Morales                =
    =                           Adrián Epifanio R.H                   =
    =            Fecha:         26/11/2018                            =
    =            Asignatura:    Estructuras de computadores           =
    =            Lenguaje:      Verilog                               = 
===========================================================================          
=========================================================================*/


/*===================================================================
=                            Test bench                             =
===================================================================*/
`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulación y la precision de la unidad

module microc_tb;  //(input wire clk, reset, s_inc, s_inm, we3, input wire [2:0] op, output wire z, output wire [5:0] opcode)
reg t_clk;
reg t_reset;
reg t_s_inc;
reg t_s_inm;
reg t_we3;
reg t_wez;
reg [2:0]t_op;
wire t_z;
wire [5:0]t_opcode;
   
   microc micro_tb(t_clk, t_reset, t_s_inc, t_s_inm, t_we3, t_wez, t_op, t_z, t_opcode);
   
initial
  begin
  
    $dumpfile("intel.vcd");
    $dumpvars;

    t_reset = 1;
    #(5);
    t_reset = 0;
    #(255);
    
    $finish;
  end 
 
  always
    begin 
      t_clk = 1;
      #(10);
      t_clk = 0;
      #(10);
    end
    
    

//instancia del modulo a testear
always @(*)
begin
  #10;
  casex (t_opcode)
    6'b0100xx:      //carga inm
        begin
            t_s_inc=1'b1;
            t_s_inm=1'b1;
            t_we3=1'b1;
            t_wez=1'b0;
            t_op=3'b000;  
        end

    6'b0110xx:  //resta
        begin
            t_s_inc=1'b1;
            t_s_inm=1'b0;
            t_we3=1'b1;
            t_wez=1'b1;
            t_op=3'b011;  

        end

    6'b000011:  //salto
        begin
            t_s_inm=1'b0;
            t_we3=1'b0;
            t_wez=1'b0;
            t_op=3'b000;
            
            if(t_z != 1'b0)
               t_s_inc=1'b1;
            else
               t_s_inc=1'b0;

        end

    6'b0101xx: //suma
        begin
            t_s_inc=1'b1;
            t_s_inm=1'b0;
            t_we3=1'b1;
            t_wez=1'b1;
            t_op=3'b010;  

        end

    6'b000001:  //j
        begin
            t_s_inc=1'b0;
            t_s_inm=1'b0;
            t_we3=1'b0;
            t_wez=1'b0;
            t_op=3'b000;  

        end

  endcase
  
end

endmodule

/*===================================================================*/
/*=========================  End of Test bench ======================*/
/**
 *
 *
 *   Autores:  Miguel Ordoñez Morales
 *             Adrián Epifanio R.H
 *   Fecha:    26/11/2018
 *
 *
**/


  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  