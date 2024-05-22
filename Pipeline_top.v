`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 04:12:58 PM
// Design Name: 
// Module Name: Pipeline_top
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


module Pipeline_top(clk1_s,rst,display,display_1);

input clk1_s,rst;
output [6:0] display;
output [6:0] display_1;
/// output[7:0] OLED_Display;
/// interim wires////
wire PCSrcE,RegWriteW,RegWriteE,MemWriteE,BranchE,ALUSrcE,RegWriteM,MemWriteM,
StallF,StallD,FlushE,JumpE,FlushD,branch_predict,pcsrc_predict,clk;



wire [31:0] PCTargetE,InstrD,PCD,PCPlus4D,ResultW,RD1E,RD2E,
PCE,ImmExtE,PCPlus4E,ALUResultM,WriteDataM,PCPlus4M,ReadDataW,PCPlus4W,ALUResultW;

wire [4:0] RdW,RdE,RdM,Rs1E,Rs2E,Rs2D,Rs1D;

wire [1:0] ResultSrcE,ResultSrcM,ResultSrcW,ForwardAE,ForwardBE;

wire [2:0] ALUControlE;

Fetch_Cycle Fetch_top(
                    .clk(clk),
                    .rst(rst),
                    .PCTargetE(PCTargetE),
                    .PCSrcE(PCSrcE),
                   .Pcsrc_predict(pcsrc_predict),
                    .InstrD(InstrD),
                    .PCD(PCD),
                    .PCPlus4D(PCPlus4D),    
                    .EN(StallD),
                    .StallF(StallF),
                   .clear(FlushD)
                    );
                    
Decode_cycle Decode_top(
                        .clk(clk),
                        .rst(rst),
                        .RdW(RdW),
                        .RegWriteW(RegWriteW),
                        .RdE(RdE),
                        .InstrD(InstrD),
                        .ResultW(ResultW),
                        .PCD(PCD),
                        .PCPlus4D(PCPlus4D),
                        .RD1E(RD1E),
                        .RD2E(RD2E),
                        .PCE(PCE),
                        .ImmExtE(ImmExtE),
                        .PCPlus4E(PCPlus4E),
                        .RegWriteE(RegWriteE),
                        .ResultWSrcE(ResultSrcE),
                        .MemWriteE(MemWriteE),
                        .BranchE(BranchE),
                        .ALUControlE(ALUControlE),
                        .ALUSrcE(ALUSrcE),
                        .Rs1E(Rs1E),
                        .Rs2E(Rs2E),
                        .Rs1D(Rs1D),
                        .Rs2D(Rs2D),
                        .clr(FlushE),
                        .JumpE(JumpE),
                        .pcsrc(pcsrc_predict),
                        .branch_taken(branch_predict)
                        );

Execute_Cycle Execute_top(
                            .clk(clk),
                            .rst(rst),
                            .RegWriteE(RegWriteE),
                            .ResultSrcE(ResultSrcE),
                            .MemWriteE(MemWriteE),
                            .BranchE(BranchE),
                            .ALUControlE(ALUControlE),
                            .ALUSrcE(ALUSrcE),
                            .RD1E(RD1E),
                            .RD2E(RD2E),
                            .PCE(PCE),
                            .RdE(RdE),
                            .ImmExtE(ImmExtE),
                            .PCPlus4E(PCPlus4E),
                            .RegWriteM(RegWriteM),
                            .ResultSrcM(ResultSrcM),
                            .MemWriteM(MemWriteM),
                            .ALUResultM(ALUResultM),
                            .WriteDataM(WriteDataM),
                            .RdM(RdM),
                            .PCSrcE(PCSrcE),
                            .PCPlus4M(PCPlus4M),
                            .PCTargetE(PCTargetE),
                            .Rs1E(Rs1E),
                            .Rs2E(Rs2E),
                            .ResultW(ResultW),
                            .ForwardBE(ForwardBE),
                            .ForwardAE(ForwardAE),
                            .JumpE(JumpE)
                            );

Memory_cycle Memory_top(
                            .rst(rst),
                            .clk(clk),
                            .RegWriteM(RegWriteM),
                            .ResultSrcM(ResultSrcM),
                            .MemWriteM(MemWriteM),
                            .ALUResultM(ALUResultM),
                            .WriteDataM(WriteDataM),
                            .RdM(RdM),
                            .PCPlus4M(PCPlus4M),
                            .RegWriteW(RegWriteW),
                            .ResultSrcW(ResultSrcW),
                            .ReadDataW(ReadDataW),
                            .RdW(RdW),
                            .PCPlus4W(PCPlus4W),
                            .ALUResultW(ALUResultW)
                            );

Writeback_cycle Writeback_top(
                            .clk(clk),
                            .rst(rst),
                            .ResultSrcW(ResultSrcW),
                            .ReadDataW(ReadDataW),
                            .ALUResultW(ALUResultW),
                            .PCPlus4W(PCPlus4W),
                            .ResultW(ResultW)
                            );
                            
Hazard_unit Hazard_top(
                          .rst(rst),
                           .Rs1E(Rs1E),
                           .Rs2E(Rs2E),
                           .RdM(RdM),
                            .RegWriteM(RegWriteM),
                            .RdW(RdW),
                            .RegWriteW(RegWriteW),
                            .ForwardAE(ForwardAE),
                            .ForwardBE(ForwardBE),
                             .StallF(StallF),
                             .StallD(StallD),
                             .FlushE(FlushE),
                             .ResultSrcE(ResultSrcE),
                             .RdE(RdE),
                             .Rs1D(Rs1D),
                             .Rs2D(Rs2D),
                             .PCSrcE(pcsrc_predict),
                             .FlushD(FlushD)
                            );
                            
Display_top display_pipeline(
                            .clk(clk),
                            .rst(rst),
                            .ResultW(ResultW),
                            .display(display),
                          .display_1(display_1)
                            );
                           

 time1    pipeline_time(
                        .clk1_s(clk1_s),
                        .clk(clk)
                        );

                            
endmodule
