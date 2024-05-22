`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2024 08:58:28 PM
// Design Name: 
// Module Name: Decode_cycle
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


module Decode_cycle(clk,clr,rst,RdW,RegWriteW,RdE,InstrD,ResultW,PCD,PCPlus4D,branch_taken,
RD1E,RD2E,PCE,ImmExtE,PCPlus4E,RegWriteE,ResultWSrcE,MemWriteE,BranchE,ALUControlE,ALUSrcE,Rs1E,Rs2E,Rs1D,Rs2D,JumpE,pcsrc);

input [31:0] InstrD,PCD,PCPlus4D,ResultW;
input [4:0] RdW;
input clk,rst,RegWriteW,clr,branch_taken;
output [31:0] RD1E,RD2E,PCE,ImmExtE,PCPlus4E;
output [4:0] RdE,Rs1E,Rs2E,Rs1D,Rs2D;
output RegWriteE,MemWriteE,BranchE,ALUSrcE,JumpE,pcsrc;
output [1:0] ResultWSrcE;
output [2:0] ALUControlE;

wire [31:0] RD1_dec,RD2_dec,ImmExtD;
wire RegWriteD,MemWriteD,BranchD,ALUSrcD,JumpD;
wire [1:0] ImmSrcD_ext,ResultWSrcD;
wire [2:0] ALUControlD;
 

reg RegWriteD_reg,MemWriteD_reg,BranchD_reg,ALUSrcD_reg,JumpD_reg,branch_taken_D;
///reg JumpD_reg;
reg [1:0] ResultWSrcD_reg;
reg [2:0] ALUControlD_reg;
reg [31:0] RD1_dec_reg;
reg [31:0] RD2_dec_reg;
reg [31:0] PCD_reg;
reg [31:0] ImmExtD_reg;
reg [31:0] PCPlus4D_reg;
reg [4:0] RdD_reg;
reg [4:0] Rs1D_reg,Rs2D_reg;


Reg_mem Reg_decode_file(
                        .A1(InstrD[19:15]),
                        .A2(InstrD[24:20]),
                        .A3(RdW),
                        .WD3(ResultW),
                        .clk(clk),
                        .rst(rst),
                        .WE3(RegWriteW),
                        .RD1(RD1_dec),
                        .RD2(RD2_dec)
                        );
                        
sign_ext sign_decode_ext(
                         .In(InstrD),
                         .ImmExt(ImmExtD),
                         .ImmSrc(ImmSrcD_ext)
                            );
                            
Control_unit_top Control_unit_decode_top(
                                         .Op(InstrD[6:0]),
                                         .func3(InstrD[14:12]), 
                                         .func7(InstrD[31:25]),
                                         .ResultSrc(ResultWSrcD),
                                         .MemWrite(MemWriteD),
                                         .Branch(BranchD) ,
                                         .AluSrc(ALUSrcD),
                                         .ImmSrc(ImmSrcD_ext),
                                         .RegWrite(RegWriteD),
                                         .ALUControl(ALUControlD),
                                         .jump(JumpD),
                                         .branch_taken(branch_taken)
                                         );

 always @( posedge clk or negedge rst )
 begin
    if (rst == 1'b0) begin
    
    RD1_dec_reg <= 32'h00000000;
    RD2_dec_reg <= 32'h00000000;
    PCD_reg <= 32'h00000000;
    ImmExtD_reg <= 32'h00000000;
    PCPlus4D_reg <= 32'h00000000;
    RdD_reg <= 5'h00;
    RegWriteD_reg <= 1'b0;
    MemWriteD_reg <= 1'b0;
   JumpD_reg <= 1'b0;
    BranchD_reg <= 1'b0;
    ALUSrcD_reg <= 1'b0;
    ResultWSrcD_reg <= 2'b00;
    ALUControlD_reg <= 3'b000;
   Rs1D_reg <= 5'h00;
  Rs2D_reg <= 5'h00;
  branch_taken_D <= 1'b0;
    end
        
      else if (clr) begin
        RD1_dec_reg <= 32'h00000000;
          RD2_dec_reg <= 32'h00000000;
          PCD_reg <= 32'h00000000;
          ImmExtD_reg <= 32'h00000000;
          PCPlus4D_reg <= 32'h00000000;
          RdD_reg <= 5'h00;
          RegWriteD_reg <= 1'b0;
          MemWriteD_reg <= 1'b0;
        JumpD_reg <= 1'b0;
          BranchD_reg <= 1'b0;
          ALUSrcD_reg <= 1'b0;
          ResultWSrcD_reg <= 2'b00;
          ALUControlD_reg <= 3'b000;
         Rs1D_reg <= 5'h00;
        Rs2D_reg <= 5'h00;
            

        end
        else if ( rst == 1'b1)
             begin
            
                RD1_dec_reg <= RD1_dec;
                RD2_dec_reg <= RD2_dec;
                PCD_reg <= PCD;
                ImmExtD_reg <=  ImmExtD;
                PCPlus4D_reg <= PCPlus4D;
                RdD_reg <= InstrD[11:7];
                RegWriteD_reg <= RegWriteD;
                MemWriteD_reg <= MemWriteD;
                JumpD_reg <= JumpD;
                BranchD_reg <= BranchD;
                ALUSrcD_reg <= ALUSrcD;
                ResultWSrcD_reg <= ResultWSrcD;
                ALUControlD_reg <= ALUControlD;
               Rs1D_reg <= InstrD[19:15];
              Rs2D_reg <= InstrD[24:20];
              

                end
end

assign RD1E = (rst == 1'b0 ) ? 32'h00000000 : RD1_dec_reg;
assign RD2E = (rst == 1'b0 ) ? 32'h00000000 : RD2_dec_reg;
assign PCE = (rst == 1'b0 ) ? 32'h00000000 : PCD_reg;
assign ImmExtE = (rst == 1'b0 ) ? 32'h00000000 : ImmExtD_reg;
assign PCPlus4E = (rst == 1'b0 ) ? 32'h00000000 : PCPlus4D_reg;
assign RdE = (rst == 1'b0 ) ? 5'h00  : RdD_reg;
assign JumpE= (rst == 1'b0 ) ?1'b0 : JumpD_reg;
assign RegWriteE = (rst == 1'b0 ) ? 1'b0 : RegWriteD_reg;
assign ResultWSrcE = (rst == 1'b0 ) ? 2'b00 : ResultWSrcD_reg;
assign MemWriteE = (rst == 1'b0 ) ? 1'b0 : MemWriteD_reg;
assign BranchE = (rst == 1'b0 ) ? 1'b0 : BranchD_reg;
assign ALUControlE = (rst == 1'b0 ) ? 3'b000 : ALUControlD_reg;
assign ALUSrcE = (rst == 1'b0 ) ? 1'b0 : ALUSrcD_reg;
assign Rs1E = (rst == 1'b0 ) ? 5'h00 : Rs1D_reg;
assign Rs2E = (rst == 1'b0 ) ? 5'h00 : Rs2D_reg;
assign Rs1D = (rst == 1'b0 ) ? 5'h00 : InstrD[19:15];
assign Rs2D = (rst == 1'b0 ) ? 5'h00 : InstrD[24:20];
assign pcsrc =  (branch_taken & ( BranchD | JumpD ));

endmodule 
