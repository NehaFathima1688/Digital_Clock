`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Neha Fathima S, Rajkrishna T R
// 
// Create Date: 22.07.2025 21:55:22
// Design Name: 
// Module Name: MUX_4_driver
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This module is used to rapidly switch between the outputs of the seven segments  
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX_4_driver(
    
    input [6:0] A,B,C,D,
    
    input S0,S1,
    
    output wire dp,
    
    output reg [6:0]result

    );
    
    always@(*)    
        begin        
            case({S1,S0})           
            2'b00:result=A;            
            2'b01:result=B;            
            2'b10:result=C;           
            2'b11:result=D;            
            default:result=7'b1;            
            endcase            
        end
        
        assign dp=1'b1;//Turn dp off

endmodule
