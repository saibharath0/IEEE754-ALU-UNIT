`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 17:35:07
// Design Name: 
// Module Name: div
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


module div( output reg [31:0] O,
    input [31:0] N,
    input [31:0] D,
    input clk
    );
    
reg [23:0]mon_n,mon_d;

reg [26:0]d2;//2^26 we have
reg [26:0]onez = 27'd67108864; //2^-26 extra
reg [26:0]sub[8:1];
reg [2:0]factor;
always @(posedge clk)
begin
    O[31]=N[31]^D[31];
    mon_n = {1'b1,N[22:0]};
    mon_d = {1'b1,D[22:0]};
            
    sub[1][26:0]=onez-1*mon_d;
    sub[2][26:0]=onez-2*mon_d;
    sub[3][26:0]=onez-3*mon_d;
    sub[4][26:0]=onez-4*mon_d;
    sub[5][26:0]=onez-5*mon_d;
    sub[6][26:0]=onez-6*mon_d;
    sub[7][26:0]=onez-7*mon_d;
    sub[8][26:0]=onez-8*mon_d;
    
    if(sub[1][26]==1) factor = 0;
    else if(sub[2][26]==1) factor = 1;
    else if(sub[3][26]==1) factor = 2;
    else if(sub[4][26]==1) factor = 3;
    else if(sub[5][26]==1) factor = 4;
    else if(sub[6][26]==1) factor = 5;
    else if(sub[7][26]==1) factor = 6;
    else if(sub[8][26]==1) factor = 7;

    d2=factor*mon_d;
    
    if(d2[26]) 
    begin
        O[22:0]=d2[25:3]; 
        O[30:23] = N[30:23]-D[30:23]+127;
    end
    else if(d2[25]) 
    begin 
        O[22:0]=d2[24:2]; 
        O[30:23] = N[30:23]-D[30:23]+127-1;
    end
    else if(d2[24])
    begin 
        O[22:0]=d2[23:1]; 
        O[30:23] = N[30:23]-D[30:23]+127-2;
    end
    else 
    begin 
        O[22:0]=d2[22:0];
        O[30:23] = N[30:23]-D[30:23]+127-3;
    end
end

endmodule
