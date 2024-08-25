`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2024 22:19:15
// Design Name: 
// Module Name: comp_tb
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


module comp_tb( );
reg [31:0]A,B;
reg clk;
wire gr,lr,eq;

 comparator clmpo(gr,lr,eq,A,B,clk);
initial 
clk = 0;
always #5 clk=~clk;

initial begin
A = 32'b00111111110010100011110101110001;
B = 32'b11000001010011001100110011001101;
#15
A = 32'b11000001011111001100110011001101;
B = 32'b11000001010011001100110011001101;
#15
B = 32'b11000001011111001100110011001101;
A = 32'b11000001010011001100110011001101;
#15
A = 32'b11000001010011001100110011001101;
B = 32'b11000001010011001100110011001101;
#115
$finish;
end

endmodule
