`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Neha Fathima S, Rajkrishna T R
// 
// Create Date: 22.07.2025 21:29:56
// Design Name: 
// Module Name: Anode_sel_1to2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Used to select anode for multiple seven segment displays and rapidly switch between them
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Anode is active low
// 
//////////////////////////////////////////////////////////////////////////////////


module Anode_sel_1to2(
    input S,
    
    output reg A,B
    
   );
    
    always@(*)    
        begin       
            case(S)//ACtivates one of the anodes at a time based on the signal S            
            1'b0: {A,B} = {1'b0,1'b1};            
            1'b1: {A,B} = {1'b1,1'b0};           
            default: {A,B} = 2'b11;           
            endcase           
        end
endmodule
