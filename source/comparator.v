`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2024 21:58:00
// Design Name: 
// Module Name: comparator
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


module comparator(
    output reg gr,
    output reg lr,
    output reg eq,
    input [31:0] A,
    input [31:0] B,
    input clk
    );
    
reg [31:0]sub;
always@(posedge clk) 
begin
    eq=0;
    gr=0;
    lr=0;
    if(A[31]^B[31]) 
    begin
        gr = ~A[31];
        lr = A[31];
    end
    else 
    begin
        sub = A[30:0]-B[30:0];
        eq=~(|sub);
        if(sub[31]&(~eq)) 
        begin
            gr=A[31];
            lr=~A[31];
        end
        else if(~sub[31]&(~eq))
        begin
            gr=~A[31];
            lr=A[31];
        end
    end    
end
endmodule
