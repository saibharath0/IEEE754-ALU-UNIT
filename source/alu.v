`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2024 00:43:56
// Design Name: 
// Module Name: alu
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
// //always @(operation) begin
//    if(operation[1]) op = op1;
//    else if(operation[2]) begin gr=x;
//                            lr=y;
//                            eq=z;
////                            op=0;
//                      end
//    else if(operation[3]) op = op2;
//    else if(operation[4]) op = op3;
                       
//end
//endmodule
//////////////////////////////////////////////////////////////////////////////////


module alu(output  [31:0]op,
                    output  gr,lr,eq,
                    input [31:0]a,
                    input [31:0]b,
                    input clk,
                    input [4:0]opcode
                    );
wire x,y,z;
wire [4:0]operation;
wire [31:0]op1,op2,op3;
control_unit cu(operation,clk,opcode);
add_sub sub_add(op1,a,b,operation[0],operation[1]);
comparator compare(x,y,z,a,b,operation[2]);
div division(op2,a,b,operation[3]);
m2 multiplication(op3,a,b,operation[4]);
 
assign op = (opcode[1])?op1:(opcode[3]?op2:(opcode[4]?op3:0));
assign {gr,lr,eq} = opcode[2]?{x,y,z}:{1'b0,1'b0,1'b0};
endmodule
