`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Neha Fathima S, Rajkrishna T R
// 
// Create Date: 22.07.2025 21:12:06
// Design Name: 
// Module Name: mod10_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: A modulo 10 counter that counts from 0 to 9 in synchronism with a clock signal                
//              Set time mode holds the count and if select(slt) is activated during set time mode it counts in synchronism with a faster clock 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mod10_counter(count,carry,clear,clkmain,slt,set_time);

    input clkmain;    // Main clock T = 1s
    input slt;     // for selectively accessing this counter
    input set_time;   // for time setting
    input clear;      // for clearing count
    output reg [3:0]count; // count 4 bit 
    output reg carry;      // carry for subsequent digit

    always@(posedge clkmain  or posedge clear) 
        begin
            if(clear==1'b1)     // clear is active      
                begin       
                    count<=4'd0;        
                    carry<=1'b0;     
                end        
            else if (set_time == 1'b1 && slt == 1'b0)      
                begin
                // Hold mode              
                    count <= count;               
                    carry <= 1'b0;             
                end            
            else if(slt>1'b0 && set_time>1'b0) // time setting mode      
                begin // counting for setting time          
                    if(count>=4'd9)             
                        begin            
                            count<=4'd0;                
                            carry<=1'b1;               
                        end            
                    else             
                        begin                    
                            count<=count+1'b1;  
                            carry<=1'b0;                  
                        end           
                end           
            else if (count>=4'd9) // carry generation            
                begin                     
                    count<=4'd0;                
                    carry<=1'b1;        
                end        
            else  // Normal carry generation             
                begin                
                    count<=count+1'b1;                
                    carry<=1'b0;                               
                end
     end

endmodule
