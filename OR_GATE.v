`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Sree Vishnu Vardhan, Neha Fathima S, Rajkrishna TR
// 
// Create Date: 22.07.2025 21:38:03
// Design Name: 
// Module Name: OR_GATE
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 2 input OR gate
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module OR_GATE(a,b,Y);
        
        input a,b;
        output Y;

        assign Y=a|b;
        
endmodule
