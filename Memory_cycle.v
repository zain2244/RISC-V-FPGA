`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2024 04:32:12 PM
// Design Name: 
// Module Name: Memory_cycle
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


module Memory_cycle(rst,clk,RegWriteM,ResultSrcM,MemWriteM,ALUResultM,WriteDataM,RdM,PCPlus4M,
RegWriteW,ResultSrcW,ReadDataW,RdW,PCPlus4W,ALUResultW);

input RegWriteM,MemWriteM,rst,clk;
input [1:0] ResultSrcM;
input [31:0] ALUResultM,WriteDataM,PCPlus4M;
input [4:0] RdM;    
    
output RegWriteW;
output [1:0] ResultSrcW;
output [31:0] ReadDataW,PCPlus4W,ALUResultW;
output [4:0] RdW;
    
wire [31:0] ReadDataM_top;

reg RegWriteM_reg;
reg [1:0] ResultSrcM_reg;
reg [31:0] ReadDataM_reg,PCPlus4M_reg;
reg [4:0] RdM_reg;
reg [31:0] ALUResultM_reg;

data_mem data_memory_cycle(
                            .A(ALUResultM),
                            .WD(WriteDataM),
                            .clk(clk),
                            .rst(rst),
                            .WE(MemWriteM),
                            .RD(ReadDataM_top)
                            );
                            
always @(posedge clk or negedge rst)
begin
    if (rst == 1'b0)begin
    
    RegWriteM_reg <= 1'b0;
     ResultSrcM_reg <= 2'b00;
    ReadDataM_reg <= 32'h00000000;
    PCPlus4M_reg <= 32'h00000000;
    RdM_reg <= 5'h00;
    ALUResultM_reg <= 32'h00000000;
    end
    
    else begin
    
    RegWriteM_reg <= RegWriteM;
         ResultSrcM_reg <=  ResultSrcM;
        ReadDataM_reg <= ReadDataM_top;
        PCPlus4M_reg <= PCPlus4M;
        RdM_reg <=  RdM;
        ALUResultM_reg <= ALUResultM;
        
        end
end
    
assign RegWriteW = (rst == 1'b0 ) ? 1'b0 : RegWriteM_reg;
assign ResultSrcW = (rst == 1'b0 ) ? 2'b00 : ResultSrcM_reg;
assign ReadDataW = (rst == 1'b0 ) ? 32'h0000000 : ReadDataM_reg;
assign RdW = (rst == 1'b0 ) ? 5'h00 : RdM_reg;
assign PCPlus4W = (rst == 1'b0 ) ? 32'h0000000 : PCPlus4M_reg;
assign ALUResultW = (rst == 1'b0 ) ? 32'h0000000 : ALUResultM_reg;
 
    
endmodule















