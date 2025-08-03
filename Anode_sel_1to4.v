`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Neha Fathima S, Rajkrishna T R
// 
// Create Date: 22.07.2025 21:41:46
// Design Name: 
// Module Name: Anode_sel_1to4
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


module Anode_sel_1to4(
    input S0,S1,
    
    output reg A,B,C,D
    
    );   
    
    always@(*) //ACtivates one of the anodes at a time based on the signals S1 and S0   
        begin
            case({S0,S1})        
            2'b00: {A,B,C,D} = {1'b0,1'b1,1'b1,1'b1};        
            2'b01: {A,B,C,D} = {1'b1,1'b0,1'b1,1'b1};       
            2'b10: {A,B,C,D} = {1'b1,1'b1,1'b0,1'b1};        
            2'b11: {A,B,C,D} = {1'b1,1'b1,1'b1,1'b0};       
            default: {A,B,C,D} = 4'b1111;       
            endcase       
        end

endmodule
