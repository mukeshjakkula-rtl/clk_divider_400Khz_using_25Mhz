module tb#(parameter CLK_IN = 25000000,
	             CLK_OUT = 400000);

logic clk_in;
logic rst;
logic clk_out;


clk_div dut(.clk_in(clk_in),
	.rst(rst),
	.clk_out(clk_out));


initial begin
    clk_in =1'b0;
    rst = 1'b0;
#30 rst = 1'b1;
end 

always #20 clk_in = ~clk_in;

initial begin
  $dumpfile("clk_wave.vcd");
  $dumpvars(0,tb);
end 

initial #10000 $finish;

endmodule 
