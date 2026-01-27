// clk generation of 400Khz using input clk 25Mhz 
//                       ___
// 25Mhz period = 40ns  |.|.|  400Khz period = 2.5micro-s
//                      |---|  
//                      ^^^^^  
// 25Mhz/400Khz = 62.5 is the counter mod value
// the output has to toggle at 31.25 to get 50% duty cycle 
// its impossible to get 50% duty cycle for 400Khz frequency
// we get ~1 cycle error.

module clk_div#(parameter CLK_IN = 25000000,
			  CLK_OUT = 400000)(
   input wire clk_in,
   input wire rst,
   output reg clk_out
);
 
  localparam  integer COUNT_VALUE = CLK_IN/CLK_OUT;
  localparam  integer TOGGLE_VALUE = COUNT_VALUE/2;
  localparam COUNT_WIDTH = ($clog2(TOGGLE_VALUE) + 1);
  reg[COUNT_WIDTH-1:0]count;  // one extra bit to count till 32 
  reg error_bit; //one error bit to minimize the jitter

 always@(posedge clk_in,negedge rst) begin
   if(!rst) begin
	clk_out <= 1'b0;
	count <= {COUNT_WIDTH{1'b0}};
	error_bit <= 1'b0;
   end else begin
	if(count == TOGGLE_VALUE + error_bit) begin
	   clk_out <= ~clk_out;
	   error_bit <= ~error_bit;
	   count <= {COUNT_WIDTH{1'b0}};
	end else 
	   count <= count + 1'b1;
   end 
 end 
endmodule 
