`timescale 1ns / 1ps

module music_new
#(parameter N=4)
(CLK100MHZ, btn, speaker,LED);

input CLK100MHZ;
input [N-1:0] btn;
output speaker;
output [N-1:0] LED;


// reg [21:0] clkdivider;
wire counter_note;
wire speaker_enable;
reg [N-1:0] LED;
wire [N-1:0] from_counters;


//12000000/440/2



localparam logic [21:0] clkdivider[0:N-1] = {
113636, 107296, 101419, 95602
};


assign LED = btn;

genvar i;
generate 
	for (i=0; i < N; i = i+1) begin
	 	counter #(.CLK_DIVIDER(clkdivider[i])) counter_inst (.clk(CLK100MHZ), .c_enable(btn[i]), .c_out(from_counters[i]));
	end
endgenerate




assign counter_note = &from_counters;
assign speaker_enable = |btn;

reg speaker;
always @(posedge CLK100MHZ ) begin 
	if (speaker_enable == 0) speaker <= 0;
	else if(counter_note==0 ) speaker <= ~speaker;
end
endmodule


