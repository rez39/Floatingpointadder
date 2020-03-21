module testbench();
reg [31:0] a,b;
reg clk;
wire [31:0] out;
fpadd test(a,b,clk,out);
initial 
begin 
a=32'b00000000110000000000000000000000;
b=32'b00000000110000000000000000000000;
clk=1'b0;
end
always #10 clk=!clk;
endmodule
