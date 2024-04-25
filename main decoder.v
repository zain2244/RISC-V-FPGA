`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2023 05:19:52 PM
// Design Name: 
// Module Name: main_decoder
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


module main_decoder(Op  ,ResultSrc ,MemWrite ,AluSrc,Branch ,ImmSrc ,RegWrite, ALUOp,jump);
 ////input///
 input [6:0] Op;
 
 output  MemWrite,AluSrc,RegWrite,Branch,jump;
 output   [1:0] ALUOp ;
 output   [1:0] ImmSrc ;
 output  [1:0] ResultSrc;
 
 
wire res_or1,res_or2;
 /// interim wire
 
 //// Using difffernet instructions op code to enable different control signal and components of processors///
 assign RegWrite = (Op==7'b0000011 | Op==7'b0110011| Op == 7'b0010011) ? 1'b1 : 1'b0;
 //assign RegWrite = (Op==7'b0000011 ) ? 1'b1 : 1'b0;
 //assign RegWrite = ((Op==7'b0000011) | res_or1) ? 1'b1 : 1'b0;
 
// assign res_or1 = (Op==7'b0110011) |  (Op==7'b0010011) ? 1'b1 : 1'b0;
 assign AluSrc = (res_or1 | Op==7'b0010011| Op==7'b0100011 ) ? 1'b1 : 1'b0; 
 assign res_or1 = ( Op==7'b0000011  ) ? 1'b1 : 1'b0; 
 //assign AluSrc = ((Op==7'b0010011) |  res_or2) ? 1'b1 : 1'b0;
 
 assign MemWrite = (Op==7'b0100011) ? 1'b1 : 1'b0;
 
 assign Branch = (Op==7'b1100011) ? 1'b1 : 1'b0;
 
  assign jump = (Op==7'b1101111) ? 1'b1 : 1'b0;
 
 assign ALUOp = (Op==7'b0110011 | Op==7'b0010011 ) ? 2'b10 :
                (Op==7'b1100011) ? 2'b01 : 2'b00;
               
 ///In case of R-type instruction, ImmSrc enable or disable does;nt matter , so we use it by default 00 instead of xx///
 assign ImmSrc = (Op==7'b0100011) ? 2'b01 : 
                 (Op==7'b1100011) ? 2'b10 : 2'b00;
                 
 assign ResultSrc = (Op==7'b0000011) ? 2'b01 :
                    (Op==7'b1101111) ? 2'b10 :
                     2'b00; 
                     
                     

 
endmodule
