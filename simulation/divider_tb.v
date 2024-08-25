`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 17:28:16
// Design Name: 
// Module Name: divider_tb
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


module divider_tb();
reg [31:0]N,D;
wire [31:0]O;
reg clk;
div DUTd(O,N,D,clk );
initial clk = 1;
always #5 clk = ~clk;

initial begin

N=32'b11000000011100000000000000000000;
D=32'b00111111110000000000000000000000;
#10
N=32'b01000001000101011001100110011010;
D=32'b00111111100110011001100110011010;
#10
N=32'b01000000100100000000000000000000;
D=32'b00111111010000000000000000000000;
#10
N=32'b01000010010010000000000000000000;
D=32'b11000001110010000000000000000000;
#10
N=32'b01000010110010000000000000000000;
D=32'b01000001110010000000000000000000;
 #10 $finish;
end
endmodule

