`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:48:15 05/07/2021
// Design Name:   music
// Module Name:   D:/Pliki/FPGA/MusicBox/TB.v
// Project Name:  MusicBox
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: music
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB;

	// Inputs
	reg clk;
	reg [3:0] btn;

	// Outputs
	wire speaker;
	wire [3:0] LED;

	// Instantiate the Unit Under Test (UUT)
	music_new uut (
		.CLK100MHZ(clk), 
		.btn(btn), 
		.speaker(speaker),
		.LED(LED)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		btn = 4'b0000;

		// Wait 100 ns for global reset to finish
		#100;
        

	end
    always 
		begin
    		clk = 1'b1; 
    		#10; // high for 20 * timescale = 20 ns

    		clk = 1'b0;
    		#10; // low for 20 * timescale = 20 ns
	end
		// Add stimulus here
	always begin
		btn[1]=1'b1;
		#100000000;
		btn[1]=1'b0;
		#100000000;
	end

endmodule

