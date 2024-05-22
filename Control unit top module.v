`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2024 05:42:27 PM
// Design Name: 
// Module Name: Control_unit_top
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

module Control_unit_top(Op,func3,func7,ResultSrc ,MemWrite,Branch ,AluSrc ,ImmSrc ,RegWrite,ALUControl,jump,branch_taken);

input [6:0] Op;
input [2:0] func3;
//output [1:0] ALUOp;
input [6:0] func7;
output [2:0] ALUControl;
output MemWrite,AluSrc,RegWrite,Branch,jump;
output [1:0] ImmSrc;
output [1:0] ResultSrc;
output branch_taken;

wire [1:0] ALUOp;

////Instantiation of ALU Decpoder and Main Decoder//


main_decoder main_Decoder(
                        .Op(Op),
                        .ResultSrc(ResultSrc),
                        .MemWrite(MemWrite),
                        .AluSrc(AluSrc),
                        .ImmSrc(ImmSrc),
                        .RegWrite(RegWrite), 
                        .ALUOp(ALUOp),
                        .Branch(Branch),
                       .jump(jump)
                        );
alu_decoder ALU_decoder(
                        .ALUOp(ALUOp),
                        .op(Op),
                        .func3(func3),
                        .func7(func7),
                        .ALUControl(ALUControl)
                                   );
 Branch_predictor branch_controler(
                                    .op(Op),
                                    .branch_taken(branch_taken)
                                    
                                    );    
                                                

endmodule
