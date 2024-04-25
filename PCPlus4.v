`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/29/2024 02:41:28 PM
// Design Name: 
// Module Name: PCPlus4
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


module PCPlus4(a,b,s);
input [31:0] a,b;
output [31:0] s;

assign s = a + b;

endmodule
