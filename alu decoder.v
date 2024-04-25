`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2023 02:34:06 PM
// Design Name: 
// Module Name: alu decoder
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


module alu_decoder(ALUOp,op,func3,func7,ALUControl);
input [6:0] op;
input [6:0] func7;
input [1:0] ALUOp;
input [2:0] func3;
output [2:0] ALUControl;

wire cancatenation;

assign cancatenation = {op,func7};

assign ALUControl = (ALUOp == 2'b00) ? 3'b000 :
                    (ALUOp == 2'b01) ? 3'b001 :
                    ((ALUOp == 2'b10) & (func3 == 3'b010)) ? 3'b101 :
                    ((ALUOp == 2'b10) & (func3 == 3'b110)) ? 3'b011 :
                    ((ALUOp == 2'b10) & (func3 == 3'b111)) ? 3'b010 :
                    ((ALUOp == 2'b10) & (func3 == 3'b000) & (cancatenation == 2'b11)) ? 3'b001 :
                    /// here we not 11 the cancatenation to enable 00,01,10 //
                    ((ALUOp == 2'b10) & (func3 == 3'b000) & (cancatenation != 2'b11)) ? 3'b000 : 3'b000;

 


endmodule
