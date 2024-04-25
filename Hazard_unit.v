`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2024 01:33:38 AM
// Design Name: 
// Module Name: Hazard_unit
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


module Hazard_unit(rst,Rs1E,Rs2E,RdM,RegWriteM,RdW,RegWriteW,ForwardAE,ForwardBE
,StallF,StallD,FlushE,Rs1D,Rs2D,RdE,ResultSrcE,PCSrcE,FlushD);

input  rst,RegWriteW,RegWriteM,PCSrcE;
input [1:0] ResultSrcE;
input [4:0] Rs1E,Rs2E,RdM,RdW,RdE,Rs1D,Rs2D;

output [1:0] ForwardAE,ForwardBE;

output StallF,StallD,FlushE,FlushD;

wire lwStall;

assign ForwardAE = (rst == 1'b0) ? 2'b00 :
                    ((Rs1E == RdM) & (RegWriteM == 1'b1) & (RdM != 5'h00)) ? 2'b10 :
                    ((Rs1E == RdW) & (RegWriteW == 1'b1) & (RdW != 5'h00)) ? 2'b01 : 2'b00;

assign ForwardBE = (rst == 1'b0) ? 2'b00 :
                    ((Rs2E == RdM) & (RegWriteM == 1'b1) & (Rs2E != 5'h00)) ? 2'b10 :
                    ((Rs2E == RdW) & (RegWriteW == 1'b1) & (Rs2E != 5'h00)) ? 2'b01 : 2'b00;
                    

                    
assign lwStall = (rst == 1'b0) ? 1'b0 : ResultSrcE[0] & ((Rs1D == RdE) | (Rs2D == RdE));
assign  StallF = (rst == 1'b0)  ? 1'b0 : lwStall; 
assign  StallD = (rst == 1'b0)  ? 1'b0 : lwStall; 
//assign  FlushE = (rst == 1'b0)  ? 1'b0 : lwStall; 
assign FlushD = PCSrcE;
assign FlushE = lwStall | PCSrcE;




endmodule
