`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2024 03:52:46 PM
// Design Name: 
// Module Name: Fetch_Cycle
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


module Fetch_Cycle(clk,clear,rst,PCTargetE,PCSrcE,InstrD,PCD,PCPlus4D,EN,StallF);
////Declaring inputs and output of fetch cycle///
input [31:0] PCTargetE;
input PCSrcE,clk,rst,clear;

output [31:0] InstrD,PCD,PCPlus4D;
////Declaring internal wires of fetch cycle///

wire [31:0] PC_F,PCF,PCPlus4F,RD_Instruct_F;
input EN,StallF;
///Making Register 

reg [31:0] RD_Instruct_reg;
reg [31:0] PCF_reg;
reg [31:0] PCPlus4F_reg;

///Instantiation of module///
mux2_1 mux_f(
            .a(PCPlus4F),
            .b(PCTargetE),
            .s(PCSrcE),
            .result(PC_F)
            );
            
PC_mem PC_module(
                .PC_NEXT(PC_F),
                .clk(clk),
                .rst(rst),
                .PC(PCF),
                .en(StallF)
              );
              
PCPlus4 PC_adder(
                .a(PCF),
                .b(32'h00000004),
                .s(PCPlus4F)
);

Instr_mem Instruction_mem(
                          .A(PCF),
                          .rst(rst),
                          .RD(RD_Instruct_F)
 );
 
 ////Fetch Cycle Register Logic ///
 
 always @(posedge clk or negedge rst) 
 begin
    //if (rst==1'b0 | en == 1'b1) begin 
    if ( rst == 1'b0) begin 
    RD_Instruct_reg <=32'h00000000;
    PCF_reg <=32'h00000000;
    PCPlus4F_reg <=32'h00000000;
    end
    
     
   else if (EN)
    begin
         RD_Instruct_reg <=RD_Instruct_reg;
         PCF_reg <=PCF_reg;
         PCPlus4F_reg <=PCPlus4F_reg;
end
else if (clear)
   begin
       RD_Instruct_reg <=32'h00000000;
       PCF_reg <=32'h00000000;
        PCPlus4F_reg <=32'h00000000;
end
else if ( rst == 1'b1)
     begin
     RD_Instruct_reg <=RD_Instruct_F;
     PCF_reg <=PCF;
     PCPlus4F_reg <=PCPlus4F;
       end
end
///Assigning register values to output port///

assign InstrD = (rst == 1'b0) ? 32'h00000000 :  RD_Instruct_reg;
assign PCD  = (rst == 1'b0) ? 32'h00000000 :  PCF_reg;
assign PCPlus4D  = (rst == 1'b0) ? 32'h00000000 :  PCPlus4F_reg;
endmodule





