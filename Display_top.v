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


module hex_7_Segment(clk,rst,ResultW,display,display_1);

input clk,rst;

input [31:0] ResultW;

output reg [6:0] display;
output reg [6:0] display_1;


always @ (posedge clk or negedge rst ) 

 if (rst ) begin
        case(ResultW[3:0])
       
              0: display <= 7'b0111111;
              1: display <= 7'b0000110;
              2: display <= 7'b1011011;
              3: display <= 7'b1001111;
              4: display <= 7'b1100110;
              5: display <= 7'b1101101;
              6: display <= 7'b1111101;
              7: display <= 7'b0000111;
              8: display <= 7'b1111111;
              9: display <= 7'b1110011;
              'ha: display <= 7'b1011111;
              'hb: display <= 7'b1111100;
              'hc: display <= 7'b0111001;
              'hd: display <= 7'b1011110;
              'he: display <= 7'b1111001;
              'hf: display <= 7'b1110001;
              default:display = 7'b1110001;
            endcase
         end
         
 else  begin
                case(ResultW[3:0])
               
                      0: display <= 7'b1111111;
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
                       default:display = 7'b1111111;
                        
                    endcase
                     
                 end
    ///  always @(*) ssdcat = 1;
     
always @ (posedge clk or negedge rst ) 
       
        if (rst ) begin
               case(ResultW[7:4])
              
                     0: display_1 <= 7'b0111111;
                             1: display_1 <= 7'b0000110;
                             2: display_1 <= 7'b1011011;
                             3: display_1 <= 7'b1001111;
                             4: display_1 <= 7'b1100110;
                             5: display_1 <= 7'b1101101;
                             6: display_1 <= 7'b1111101;
                             7: display_1 <= 7'b0000111;
                             8: display_1 <= 7'b1111111;
                             9: display_1 <= 7'b1110011;
                             'ha: display_1 <= 7'b1011111;
                             'hb: display_1 <= 7'b1111100;
                             'hc: display_1 <= 7'b0111001;
                             'hd: display_1 <= 7'b1011110;
                             'he: display_1 <= 7'b1111001;
                             'hf: display_1 <= 7'b1110001;
                             default:display_1 = 7'b1110001;
                      /// ssdcat = 1'b1;
                        ///  ssdcat = 1'b1;
          
                      
                          
                   endcase
                end
                
        else  begin
                      case(ResultW[7:4])
                      
                             0: display_1 <= 7'b1111111;
                             1: display_1 <= 7'b1111111;
                             2: display_1 <= 7'b1111111;
                             3: display_1 <= 7'b1111111;
                             4: display_1 <= 7'b1111111;
                             5: display_1 <= 7'b1111111;
                             6: display_1 <= 7'b1111111;
                             7: display_1 <= 7'b1111111;
                             8: display_1 <= 7'b1111111;
                             9: display_1 <= 7'b1111111;
                             'hA: display_1 <= 7'b1111111;
                             'hb: display_1 <= 7'b1111111;
                             'hC: display_1 <= 7'b1111111;
                             'hD: display_1 <= 7'b1111111;
                             'hE: display_1 <= 7'b1111111;
                             'hF: display_1 <= 7'b1111111;
                             default:display_1 = 7'b1101001;
                               
                      
                           endcase
                            
                        end
                       
endmodule
