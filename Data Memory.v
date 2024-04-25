`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2023 07:09:11 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(A,WD,clk,rst,WE,RD);
input [31:0]A,WD;
input clk,WE,rst;
output  [31:0] RD;

reg [31:0] data_memory [1023:0]; 

 assign RD = (rst == 1'b0 ) ? 32'h00000000  : data_memory[A]; 

always @ (posedge clk)
    begin
        if (WE)
            data_memory[A] <= WD;
 end
 
  initial begin
    data_memory[240] = 32'h00000020;
end


endmodule
