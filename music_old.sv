`timescale 1ns / 1ps

module music(clk, Switch, speaker,LED);
input clk;
input [5:0] Switch;
output speaker;
output [5:0] LED;

reg [21:0] clkdivider;
reg speaker_enable;
reg [5:0] LED;
always @(Switch)
begin
	case(Switch)
  	6'b111110: clkdivider = 12000000/440/2; // A
  	6'b111101: clkdivider = 12000000/466/2; // A#/Bb
  	6'b111011: clkdivider = 12000000/493/2; // B
  	6'b110111: clkdivider = 12000000/523/2; // C
  	6'b101111: clkdivider = 12000000/554/2; // C#/Db
  	6'b011111: clkdivider = 12000000/587/2; // D
  	default  : clkdivider = 0;
  // 6: clkdivider = 362-1; // D#/Eb
  // 7: clkdivider = 342-1; // E
  // 8: clkdivider = 323-1; // F
  // 9: clkdivider = 304-1; // F#/Gb
  // 10: clkdivider = 287-1; // G
  // 11: clkdivider = 271-1; // G#/Ab
  // 12: clkdivider = 0; // should never happen
  // 13: clkdivider = 0; // should never happen
  // 14: clkdivider = 0; // should never happen
  // 15: clkdivider = 0; // should never happen
	endcase
	case(Switch)
  	6'b111110: speaker_enable = 1;
  	6'b111101: speaker_enable = 1;
  	6'b111011: speaker_enable = 1;
  	6'b110111: speaker_enable = 1;
  	6'b101111: speaker_enable = 1;
  	6'b011111: speaker_enable = 1;
  	default  : speaker_enable = 0;
	endcase
	case(Switch)
  	6'b111110: LED = 6'b000001;
  	6'b111101: LED = 6'b000010;
  	6'b111011: LED = 6'b000100;
  	6'b110111: LED = 6'b001000;
  	6'b101111: LED = 6'b010000;
  	6'b011111: LED = 6'b100000;
  	default  : LED = 0;
	endcase
end


reg [23:0] counter_note;
always @(posedge clk ) begin 
	if (speaker_enable == 0) counter_note <= 0;
	else if(counter_note==0) counter_note <= clkdivider; 
	else counter_note <= counter_note-1;
end
// reg [7:0] counter_octave;
// always @(posedge clk)
// if(counter_note==0)
// begin
//  if(counter_octave==0)
//   counter_octave <= (octave==0?255:octave==1?127:octave==2?63:octave==3?31:octave==4?15:7);
//  else
//   counter_octave <= counter_octave-1;
// end

reg speaker;
always @(posedge clk ) begin 
	if (speaker_enable == 0) speaker <= 0;
	else if(counter_note==0 ) speaker <= ~speaker;
end
endmodule


