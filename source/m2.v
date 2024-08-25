`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2024 00:22:51
// Design Name: 
// Module Name: m2
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


module m2(output reg [31:0]op,
           input [31:0]a,b,
           input clk
           );
            
    reg [47:0]result;
    reg [23:0]montissa_dum1;
    reg [23:0]montissa_dum2;
    
    
    always @(posedge clk) begin
    montissa_dum1 = {1'b1,a[22:0]};
    montissa_dum2 = {1'b1,b[22:0]};
    
      if((a==0)|(b==0)) begin
           op = 32'd0;
           end
      else begin
           op[31] = a[31]^b[31];
           result = montissa_dum1*montissa_dum2;
           op[22:0] = (result[47]==1)?result[46:24]:result[45:23];
           op[30:23] = (result[47]==1) ? a[30:23]+b[30:23]-127+1 : a[30:23]+b[30:23]-127;
          end
     end
endmodule
