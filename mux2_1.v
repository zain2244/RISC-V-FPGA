`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/29/2024 03:27:56 PM
// Design Name: 
// Module Name: mux2_1
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


module mux2_1(a,b,s,result);
input [31:0]a,b;
input s;
output [31:0] result;

assign result = s ? b : a ;

endmodule
