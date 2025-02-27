The proposed work focuses on designing and implementing a Harvard Architecture-based 32
bit RISC-V processor, using the open instruction set to enhance speed and performance. The 
processor leverages pipelining, comprising five stages—instruction fetch, decode, execute, 
memory access, and write back—and operates within a single cycle to improve CPI (clock 
cycles per instruction). The control unit plays a crucial role in managing the smooth execution 
of each pipeline stage operation. A hazard detection unit is designed to address potential 
pipeline hazards, which utilizes registers to handle pipeline hazards like data dependency and 
prevent stalls. Branch instructions, which can introduce delays and reduce efficiency, are 
addressed through the Static Branch Predictor. The branch predictor reduces CPI by saving one 
clock cycle during branch execution, which enhances the processor's overall performance. All 
components of the processor are designed in Verilog and simulated in Vivado. For hardware 
implementation, this code is synthesized into a gate-level netlist, which optimizes the design 
for FPGA architecture. Implementation follows, where the netlist is mapped to FPGA resources 
and then routed to a specific location on board. This processor design is tested using the Xilinx 
Vivado toolchain to verify its functionality and efficiency. Finally, the bitstream is generated 
and loaded onto the ZedBoard Zynq Evaluation and Development Kit (xc7z020clg484-1) 
FPGA for real-time testing and evaluation. To visually demonstrate the instruction execution 
process, Two 7-segment displays are connected via Pmod headers on the FPGA board. These 
displays offer real-time feedback on the instruction sequence being executed, which allows for 
easy observation and verification of the processor’s operational stages.  
