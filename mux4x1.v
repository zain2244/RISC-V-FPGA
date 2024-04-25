`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2024 03:29:17 PM
// Design Name: 
// Module Name: mux4_1
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


module mux4_1(a,b,c,d,s,result);
input [31:0] a,b,c,d;
input [1:0] s;
output [31:0] result;

assign result = (s==2'b00) ? a :
                 (s==2'b01) ? b :
                 (s==2'b10) ? c :d ;

endmodule

 
