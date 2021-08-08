`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:51 05/16/2021 
// Design Name: 
// Module Name:    counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module counter
	#(parameter CLK_DIVIDER=100000000/440/2) (
	input clk,
	input c_enable,
	output  c_out
    );

reg [23:0] counter_res;

always @(posedge clk ) begin 
	if (c_enable == 0) counter_res <= CLK_DIVIDER;
	else if(counter_res==0) counter_res <= CLK_DIVIDER; 
	else counter_res <= counter_res-1;
end


assign c_out = |counter_res;
endmodule
