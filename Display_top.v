`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2024 07:46:35 PM
// Design Name: 
// Module Name: Display_top
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


module hex_7_Segment(clk,rst,ResultW,display);

input clk,rst;

input [31:0] ResultW;

output reg [6:0] display;

always @ (posedge clk or negedge rst ) 

 if (rst ) begin
        case(ResultW)
       
              0: display <= 7'b1111110;
              1: display <= 7'b0110000;
              2: display <= 7'b1101101;
              3: display <= 7'b1111001;
              4: display <= 7'b0110011;
              5: display <= 7'b1011011;
              6: display <= 7'b1011111;
              7: display <= 7'b1110000;
              8: display <= 7'b1111111;
              9: display <= 7'b1110011;
              'hA: display <= 7'b1110111;
              'hb: display <= 7'b0011111;
              'hC: display <= 7'b1001110;
              'hD: display <= 7'b0111101;
              'hE: display <= 7'b1001111;
              'hF: display <= 7'b1000111;
              default: display = 7'b0000001;
        
            endcase
         end
         
 else  begin
                case(ResultW)
               
                      0: display <= 7'b1100111;
                      1: display <= 7'b1111111;
                      2: display <= 7'b1111111;
                      3: display <= 7'b1111111;
                      4: display <= 7'b1111111;
                      5: display <= 7'b1111111;
                      6: display <= 7'b1111111;
                      7: display <= 7'b1111111;
                      8: display <= 7'b1111111;
                      9: display <= 7'b1111111;
                      'hA: display <= 7'b1111111;
                      'hb: display <= 7'b1111111;
                      'hC: display <= 7'b1111111;
                      'hD: display <= 7'b1111111;
                      'hE: display <= 7'b1111111;
                      'hF: display <= 7'b1111111;
                      default: display = 7'b110111;
                
               
                    endcase
                 end
       
endmodule
