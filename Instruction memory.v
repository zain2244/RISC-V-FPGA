`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2023 02:09:47 PM
// Design Name: 
// Module Name: Instr_mem
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


module Instr_mem(A,rst,RD);

input [31:0] A;
input rst;
output [31:0] RD;

///Now creating memory which has reg data type consist of 1024 register ///
///Each register has 32 bit size///
reg [31:0] mem [1023:0];

//if we dosn't define datatype of any output/input port, it's bydefault declared as wire//
///assign RD = (rst == 1'b0) ? 32'h00000000 : mem[A[31:2]];
assign RD = (rst == 1'b0) ? 32'h00000000 : mem[A[31:2]];

initial begin

$readmemh("memfile.mem",mem);

//mem[0] = 32'hFFC4A303;
//mem[0] = 32'h0064A423;
//mem[1] = 32'hFFA2C01B;
///mem[0] = 32'h0062E233;
///Address will update at each clock cycle ///
///Every instruction executes at each clock cycle///
end

endmodule
