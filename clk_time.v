`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 07:01:09 PM
// Design Name: 
// Module Name: time
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

module time1(clk1_s,clk);

input clk1_s;
output reg clk = 0;



reg [26:0] counter = 0;



always @ (posedge clk1_s )
begin

    if (counter == 100000000 - 1) 
    begin
    
   clk <= ~ clk ;
    counter <= 0;
    
end

else

counter <= counter + 1;


end


endmodule

/*

module time1(clk1_s, clk);
  input clk1_s; // Input clock on FPGA (period in ns)
  output reg clk = 0; // Output clock after dividing the input clock by divisor
  reg [31:0] counter = 32'd0; // 32-bit counter to count input clock cycles
  parameter INPUT_PERIOD_NS = 10; // Input clock period in ns
  parameter DESIRED_OUTPUT_FREQ_HZ = 1; // Desired output frequency in Hz

  // Calculate the divisor based on input period and desired output frequency
  parameter DIVISOR = $rtoi(1.0 * (INPUT_PERIOD_NS / 1e9) * DESIRED_OUTPUT_FREQ_HZ);

  always @(posedge clk1_s) begin
    counter <= counter + 32'd1;
    if (counter >= (DIVISOR - 1))
      counter <= 32'd0;
    clk <= (counter < DIVISOR / 2) ? 1'b1 : 1'b0; // Output high for half the period
  end
endmodule
*/