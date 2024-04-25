`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2024 03:11:01 PM
// Design Name: 
// Module Name: Execute_Cycle
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


module Execute_Cycle(clk,rst,RegWriteE,JumpE,ResultSrcE,MemWriteE,BranchE,ALUControlE,ALUSrcE,RD1E,ForwardBE,
RD2E,PCE,RdE,ImmExtE,PCPlus4E,RegWriteM,ResultSrcM,MemWriteM,ALUResultM,WriteDataM,RdM,PCPlus4M,ForwardAE,
PCTargetE,ResultW,Rs1E,Rs2E,PCSrcE);


input clk,rst,RegWriteE,MemWriteE,BranchE,ALUSrcE,JumpE;
input[2:0] ALUControlE;
input [1:0] ResultSrcE,ForwardAE,ForwardBE;
input [31:0] RD1E,RD2E,PCE,ImmExtE,PCPlus4E,ResultW;
input [4:0] RdE;
input [4:0] Rs1E,Rs2E;

output RegWriteM,MemWriteM;
output [1:0] ResultSrcM;
output [31:0] ALUResultM,WriteDataM,PCPlus4M,PCTargetE;
output [4:0] RdM;

wire [31:0] SrcBE,ALU_result,SrcAE,SrcBE2;
wire ZeroE;
output PCSrcE;

reg RegWriteE_reg,MemWriteE_reg;
reg [1:0] ResultSrcE_reg;
reg [31:0] ALU_result_reg,WriteDataE_reg,PCPlus4E_reg;
reg [4:0] RdE_reg;

ALU_8 ALU_Execute(
                  .A(SrcAE),
                  .B(SrcBE),
                  .ALUControls(ALUControlE),
                  .result(ALU_result),
                  .Zero(ZeroE),
                  .N(),
                  .C(),
                  .V(),
                  .stl()
                  
               );
               
mux2_1 mux_Execute(
                    .a(SrcBE2),
                    .b(ImmExtE),
                    .s(ALUSrcE),
                    .result(SrcBE)
                );               

mux4_1 mux3_1(
               .a(RD1E),
               .b(ResultW),
               .c(ALUResultM),
               .d(),
               .s(ForwardAE),
               .result(SrcAE)
                );

mux4_1 mux3_2(
                .a(RD2E),
                .b(ResultW),
                .c(ALUResultM),
                .d(),
                .s(ForwardBE),
                .result(SrcBE2)
                );

PCPlus4 Execute_adder(
                        .a(PCE),
                        .b(ImmExtE),
                        .s(PCTargetE)
                        );


always @(posedge clk or negedge rst )
begin
    if (rst == 1'b0)
        begin
        
        RegWriteE_reg <= 1'b0;
        MemWriteE_reg <= 1'b0;
        ResultSrcE_reg <= 2'b00;
        ALU_result_reg <=32'h00000000;
        WriteDataE_reg <=32'h00000000;
        RdE_reg <=5'h00;
        PCPlus4E_reg <=32'h00000000;
        
        end
        
        else begin
        
        RegWriteE_reg <= RegWriteE;
        MemWriteE_reg <=  MemWriteE;
        ResultSrcE_reg <= ResultSrcE;
        ALU_result_reg <=ALU_result;
        WriteDataE_reg <= SrcBE2;
        RdE_reg <= RdE;
        PCPlus4E_reg <= PCPlus4E;
        
        end
end

assign RegWriteM = ( rst == 1'b0 ) ? 1'b0 : RegWriteE_reg;
assign MemWriteM = ( rst == 1'b0 ) ? 1'b0 : MemWriteE_reg;
assign ResultSrcM = ( rst == 1'b0 ) ? 2'b00 : ResultSrcE_reg;
assign ALUResultM = ( rst == 1'b0 ) ? 32'h00000000 : ALU_result_reg;
assign WriteDataM = ( rst == 1'b0 ) ? 32'h00000000 : WriteDataE_reg;
assign RdM = ( rst == 1'b0 ) ? 5'h00 : RdE_reg;
assign PCPlus4M = ( rst == 1'b0 ) ? 32'h00000000 : PCPlus4E_reg;
assign PCSrcE =  (JumpE | (ZeroE & BranchE)); 
endmodule
