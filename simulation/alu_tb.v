`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2024 01:01:47
// Design Name: 
// Module Name: alu_tb
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


module alu_tb( );
reg [31:0]a,b;
wire [31:0]op;
wire gr,lr,eq;
reg [4:0]opcode;
reg clk;
alu alu_unit(op,gr,lr,eq,a,b,clk,opcode);

initial 
clk=0;
always #5 clk=~clk;

initial begin
#105
a=32'b11000000011100000000000000000000;
b=32'b00111111110000000000000000000000;
opcode=5'b00010;
#30
a=32'b11000000011100000000000000000000;
b=32'b00111111110000000000000000000000;
opcode=5'b00011;
#30
a=32'b11000000011100000000000000000000;
b=32'b00111111110000000000000000000000;
opcode=5'b00100;
#30
a=32'b11000000011100000000000000000000;
b=32'b00111111110000000000000000000000;
opcode=5'b01000;
#30
a=32'b11000000011100000000000000000000;
b=32'b00111111110000000000000000000000;
opcode=5'b10000;

end
endmodule
