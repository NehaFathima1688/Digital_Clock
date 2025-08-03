`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Neha Fathima S, Rajkrishna T R
// 
// Create Date: 22.07.2025 21:52:25
// Design Name: 
// Module Name: Mod_24_cnt_logic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Used to create necessary signals to count from 0 to 23 and reset properly 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mod_24_cnt_logic(
    
    input [3:0] count_4,
    
    input [1:0] count_2,
    
    output [3:0] count_H_unit,
    
    output [1:0] count_H_ten,
    
    output reg RST_24

    );
    
    assign count_H_unit=count_4;
    
    assign count_H_ten=count_2;
    
    always@(*)        
        begin           
            if(count_4==4'd4 && count_2==2'd2)               
                begin                  
                    RST_24=1'b1;               
                end               
            else                
                begin                
                    RST_24=1'b0;                    
                end                        
        end   

endmodule
