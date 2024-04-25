`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2023 02:51:32 PM
// Design Name: 
// Module Name: PC
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


module PC_mem(PC_NEXT,clk,rst,PC,en);
input [31:0] PC_NEXT;
input clk,rst,en;
output reg [31:0] PC;

always @ (posedge clk or negedge rst)

if(rst == 1'b0)
begin
    PC <= 32'h00000000; 
end

else if (en)
begin
 PC <= PC;
 end
 
 else if(rst == 1'b1)
 begin
  PC <= PC_NEXT;
 end



endmodule
