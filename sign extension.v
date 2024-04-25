`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2024 02:50:53 PM
// Design Name: 
// Module Name: sign_ext
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


module sign_ext(In,ImmExt,ImmSrc);

input [31:0] In;
input  [1:0] ImmSrc;
output [31:0] ImmExt;

////We perform here cancatenation if MSB of input is 1 then we'll assign 1 bit binary to///
//// First 20 bits of output otherwise else////

assign ImmExt = (ImmSrc == 2'b01 ) ? {{20{In[31]}}, In[31:25], In[11:7]} :
                (ImmSrc == 2'b10 ) ? {{20{In[31]}}, In[7], In[30:25], In[11:8], 1'b0} :
                (ImmSrc == 2'b11 ) ? {{12{In[31]}}, In[19:12], In[20], In[30:21], 1'b0}:
                {{20{In[31]}}, In[31:20]} ;
                                        
endmodule
