`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2025 21:43:27
// Design Name: 
// Module Name: MUX4to1
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


module MUX4to1(result,dp, A,B,C,D,S0,S1);
    input [6:0] A,B,C,D;
    
    input S0,S1;
    
    output wire dp;
    
    output reg [6:0]result;
    
    assign dp=1'b1;

    
    always@(*)
    
        begin
        
            case({S1,S0})
            
            2'b00:result=A;
            
            2'b01:result=B;
            
            2'b10:result=C;
            
            2'b11:result=D;
            
            default:result=7'bx;
            
            endcase
            
        end

endmodule
