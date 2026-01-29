//achived Tperiod is 2480ns so the clock frequency is 403.2Khz
module clk_divider#(parameter CLK_IN = 25000000,
			  CLK_OUT = 400000)(
   input wire clk_in,
   input wire rst,
   output reg clk_out
);
 
  localparam  integer COUNT_VALUE = ((CLK_IN/CLK_OUT)-1); //61(62 states)
  localparam  integer TOGGLE_VALUE = COUNT_VALUE/2; // 30(31 states)
  localparam COUNT_WIDTH = $clog2(COUNT_VALUE);
  reg[COUNT_WIDTH-1:0]count; 

 always@(posedge clk_in,negedge rst) begin
   if(!rst) begin
	clk_out <= 1'b0;
	count <= {COUNT_WIDTH{1'b0}};
   end else begin
        if(count == COUNT_VALUE) begin
	   count <= {COUNT_WIDTH{1'b0}};
	   clk_out <= 1'b0;
        end else count <= count + 1'b1;
	if(count == TOGGLE_VALUE) clk_out <= ~clk_out;
     end 
 end 
endmodule 
