`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2024 00:27:56
// Design Name: 
// Module Name: control_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments
// 
//////////////////////////////////////////////////////////////////////////////////


module control_unit(output [4:0]operation,
                    input clk,
                    input [4:0]opcode
                    );
assign operation[0] = opcode[0];
assign operation[1] = opcode[1]&clk;
assign operation[2] = opcode[2]&clk;
assign operation[3] = opcode[3]&clk;
assign operation[4] = opcode[4]&clk;


endmodule
