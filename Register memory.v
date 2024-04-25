`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2023 03:36:13 PM
// Design Name: 
// Module Name: Reg_mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Reg_mem(A1,A2,A3,WD3,clk,rst,WE3,RD1,RD2);
input [19:15] A1;
input [24:20]A2;
input [11:7] A3;
input [31:0] WD3;
input clk,rst,WE3;
output [31:0] RD1,RD2;

///create register memory which has reg data type consist of 32 registers///
///Each registers have 32 bit memory address///

reg [31:0] Register_memory [31:0] ;
///When reset is active low, it will read 0 at output//
assign RD1 = (!rst) ? 32'h00000000 : Register_memory[A1];

assign RD2 = (!rst) ? 32'h00000000 : Register_memory[A2];

always @ (posedge clk )
    begin
      if(WE3)////When write enable is high, data write at (A3) address of register //
        begin
            Register_memory[A3] <= WD3;
        end
      else
        begin
            Register_memory[A3] <= 32'h00000000;
        end
    end
    
   initial begin
    Register_memory[9] = 32'h000000f4;
    Register_memory[4] = 32'h0000001c;
      ///Register_memory[5] = 32'h0000002f; 
             ///   Register_memory[4] = 32'h00002004;
                Register_memory[6] = 32'h0000000A;
                Register_memory[5] = 32'h00000006; 
                
           //     Register_memory[7] = 32'h00000023;
      end
      
      
       
endmodule
