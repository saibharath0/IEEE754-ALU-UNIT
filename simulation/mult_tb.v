`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2024 00:17:27
// Design Name: 
// Module Name: mult_tb
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


module mult_tb();
wire  [31:0]op;
reg [31:0]a;
reg [31:0]b;
reg clk;
m2 fsm(op,a,b,clk );
initial 
clk=0;
always #5 clk=~clk;
initial begin
a=32'b00111111110000000000000000000000;
b=32'b00111111111001100110011001100110; 
#20
a=32'b11000000010000000000000000000000;
b=32'b01000001010100000000000000000000;
#20
a=32'b00000000000000000000000000000000;
b=32'b00111111110000000000000000000000;
end
endmodule
