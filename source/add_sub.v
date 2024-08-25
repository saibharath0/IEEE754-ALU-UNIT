`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2024 09:39:16
// Design Name: 
// Module Name: add_sub
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


module add_sub(  output reg [31:0]O,
                 input [31:0]A,B,
                 input A_S,
                 input clk
              );
               
reg [7:0]exp_dif;
reg [7:0]explar;
reg [23:0]montissa_1,montissa_2;
//reg [23:0]montissa1_1,montissa1_2;

reg [24:0]result;
reg [23:0]result1;
reg [4:0]i;
reg [4:0]shift=0;
reg [4:0]count=0;
always@( posedge clk) begin
   if( A[31]^B[31]^A_S== 0) begin
       montissa_1 = {1'b1,A[22:0]};
       montissa_2 = {1'b1,B[22:0]};
       
       if(A[30:23]>B[30:23]) exp_dif=A[30:23]-B[30:23];
       else exp_dif=B[30:23]-A[30:23];

       if(A[30:23]>B[30:23]) montissa_1=montissa_1;
       else montissa_1 = montissa_1>>exp_dif;

       if(B[30:23]>A[30:23]) montissa_2=montissa_2;
       else montissa_2 = montissa_2>>exp_dif;

       result = montissa_1+montissa_2;
       
       if(result[24]==1)  O[22:0]= result[23:1];
       else O[22:0] = result[22:0];

       if(A[30:23]>B[30:23]) explar = A[30:23];
       else explar = B[30:23];

       if(result[24]==1) O[30:23] = explar + 1;
       else O[30:23] = explar;
       
       if((~A[31])&(~B[31])&(~A_S)) O[31] = 0;
       else if((~A[31])&(B[31])&(A_S)) O[31] = 0;
       else if((A[31])&(B[31])&(~A_S)) O[31] = 1;
       else if((A[31])&(~B[31])&(A_S)) O[31] = 1;
       
   end
   
   if(A[31]^B[31]^A_S== 1) begin
       montissa_1 = {1'b1,A[22:0]};
       montissa_2 = {1'b1,B[22:0]};
       
       if(A[30:23]>B[30:23]) O[31] = A[31];
       else O[31] = B[31];
       
       if(A[30:23]>B[30:23]) exp_dif=A[30:23]-B[30:23];
       else exp_dif=B[30:23]-A[30:23];

       if(A[30:23]>B[30:23]) montissa_1=montissa_1;
       else montissa_1 = montissa_1>>exp_dif;

       if(B[30:23]>A[30:23]) montissa_2=montissa_2;
       else montissa_2 = montissa_2>>exp_dif;
       
       
       if((A[30:23]>=B[30:23])&(A[22:0]>=B[22:0]))  result1 = montissa_1 - montissa_2;
       else begin result1 = montissa_2 - montissa_1;
                  O[31] = ~O[31];
            end
       count = 0;
       for(i=23;i>0;i=i-1) 
       begin
        if((result1[i]==1)&&(count==0)) begin
          shift = 23-i;
          count = count + 1;
          end
       end
       
       O[22:0] = result1<<shift;
       
       if(A[30:23]>B[30:23]) O[30:23] = A[30:23] - shift;
       else O[30:23] = B[30:23] - shift;
       
            
   end
end 
endmodule
