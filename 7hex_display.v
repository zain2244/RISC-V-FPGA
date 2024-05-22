`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2024 07:38:24 PM
// Design Name: 
// Module Name: 7hex_display
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


module Display_top(clk,ResultW,rst,display,display_1);

input clk,rst;

input wire [31:0] ResultW;

output [6:0] display;
output [6:0] display_1;


hex_7_Segment display_7_segment(
                                .clk(clk),
                                .rst(rst),
                                .ResultW(ResultW),
                                .display(display),
                                .display_1(display_1)
                               
                                );

endmodule
