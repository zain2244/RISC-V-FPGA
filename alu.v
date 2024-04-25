`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2023 03:08:22 PM
// Design Name: 
// Module Name: ALU_8
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


module ALU_8(A,B,ALUControls,result,Zero,N,C,V,stl);

///32-bit input for ALU////
input [31:0] A,B;
///3-bit opcode to perform 8 different functions in 8-bit  ALU////
input [2:0] ALUControls;
output Zero;
///declaring outputs///
output [31:0] result,  N, C, V, stl;

/// declaring wires////
wire [31:0] a_and_b;
wire [31:0] a_or_b;
wire [31:0] not_b;
wire [31:0] mux_1;
wire [31:0] sum;
wire [31:0] mux_2;
wire [31:0] cout;
/////////Logic Design/////////

////And operation
assign a_and_b = A & B;

///Or operations
assign a_or_b = A | B;

///not operation
assign not_b = ~B;

/// 2*1 mux using ternery operator controlling with opcode//
assign mux_1= (ALUControls[0] == 1'b0) ? B : not_b; 

///  It will peroform addition when ALUControls give 0 and subtraction when it give 1//
/// for subtraction, will use 2's complement by adding 1 in sum and automaticaly , it gives, (A-B)///
/// we'll perform cancatenation here///
///A and B add to give 2-bit sum, if there is 3rd bit of carry , it will assign to cout///
assign {cout,sum}= A + mux_1 + ALUControls[0];

///use 4*1 mux to get result
assign mux_2= (ALUControls[2:0] == 3'b000) ? sum :
              (ALUControls[2:0] == 3'b001) ? sum :
              (ALUControls[2:0] == 3'b010) ? a_and_b :
              (ALUControls[2:0] == 3'b011) ? a_or_b : 
              (ALUControls[2:0] == 3'b101) ? stl : 32'h00000000;


              
//// assign result for mux_2
assign result=mux_2;

///there are 4 flgs in alu for different purpose///
///Zero flag is use to check either result is zero ot not,///
//// it will show value 1 which means it result is zero///
assign Zero = ~(result);


///Negative falg checks wheither result is negative or not ///
///It will check by couting MSB (last bit) if it is 1, this means result is negative///
////In a Signed Number, the MSB (the sign bit) is 0 for a Positive number.///
/// In a Signed Number, the MSB (the sign bit) is 1 for a Negative number.
assign N = result[31];

///cout means carry of A+B(sum) will and with inverse of ALUControls///
assign C = cout & (~ALUControls[1]);

///Overflow flag is set if a result is too large a positive number or
/// too small a negative number (excluding sign-bit) to fit in a register, cleared otherwise.
assign V = (~ALUControls[1]) & (A[31] ^ sum[31]) & (~(A[31] ^ B[31] ^ ALUControls[0]));

///In zero extension, we just take 1 MSB of sum and add 31 bit zero to make it 32 bit///
assign stl = {31'b0000000000000000000000000000000 , sum[31]};

endmodule
