`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Neha Fathima S, Rajkrishna T R
// 
// Create Date: 22.07.2025 21:45:39
// Design Name: 
// Module Name: Counter_1_bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 1 bit counter with active high clock and reset inputs
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Counter_1_bit(
    input clk1,
    
    input clr,
    
    output reg count
    
);
    
    always @(posedge clk1 or posedge clr)     
        begin        
            if (clr==1'b1)             
                begin                
                    count <= 1'b0;                   
                end                
            else if (count==1'b1)             
                begin                
                    count <= 1'b0;                                   
                end                 
            else             
                begin                
                    count <= count + 1;                    
                end               
        end

endmodule
