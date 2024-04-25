`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2024 05:14:01 PM
// Design Name: 
// Module Name: Writeback_cycle
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


module Writeback_cycle(clk,rst,ResultSrcW,ReadDataW,ALUResultW,
PCPlus4W,ResultW);

input clk,rst;
input [1:0] ResultSrcW;
input [31:0] ReadDataW,ALUResultW,PCPlus4W;

output [31:0] ResultW;

mux4_1 mux_writeback(
                     .a(ALUResultW),
                     .b(ReadDataW),
                     .c(PCPlus4W),
                     .d(),
                     .s(ResultSrcW),
                     .result(ResultW)
                     );

endmodule
