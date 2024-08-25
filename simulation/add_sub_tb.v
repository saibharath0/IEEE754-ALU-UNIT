`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2024 10:30:56
// Design Name: 
// Module Name: add_sub_tb
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


module add_sub_tb();

reg [31:0]A,B;
wire [31:0]O;
reg A_S;
reg clk;

add_sub DUT(O,A,B,A_S,clk  );

initial clk = 0;
always #5 clk = ~clk; 


initial begin
// exp1 = 8'd131;exp2 = 8'd129;s1 = 0;s2 = 0;add_sub = 0;
// montissa1 = 23'b11010000000000000000000;
// montissa2 = 23'b11000000000000000000000;
A = 32'b00111111110010100011110101110001;
B = 32'b11000001010011001100110011001101;
A_S = 1;
#15
//exp1 = 8'd131;exp2 = 8'd129;s1 = 0;s2 = 0;add_sub = 1;
// montissa1 = 23'b11010000000000000000000;
// montissa2 = 23'b11000000000000000000000;
A = 32'b11000001011111001100110011001101;
B = 32'b11000001010011001100110011001101;
A_S = 1;
#15
B = 32'b11000001011111001100110011001101;
A = 32'b11000001010011001100110011001101;
A_S = 1;
end

endmodule
