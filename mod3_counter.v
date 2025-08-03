`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Neha Fathima S, Rajkrishna T R
// 
// Create Date: 22.07.2025 21:22:05
// Design Name: 
// Module Name: mod3_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: A modulo 3 counter that counts from 0 to 2 in synchronism with a clock signal                
//              Set time mode holds the count and if select(slt) is activated during set time mode it counts in synchronism with a faster clock 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mod3_counter(count,clkmain,set_time,clear);

    input clkmain;    // Main clock working with carry from mod10 counter
    input set_time;   // for time setting
    input clear;      // for clearing count

    output reg [1:0]count; // count 2 bit 

    always@(posedge clkmain  or posedge clear)
        begin
            if(clear==1'b1)     // clear is active     
                begin       
                    count<=2'd0;             
                end           
            else if(set_time>1'b0) // time setting mode      
                begin           
                    if(count>=2'd2)   // counting for setting time          
                        begin           
                            count<=2'd0;
                        end            
                    else             
                        begin                    
                            count<=count+1'b1;  //counting for setting time
                        end            
                end           
            else if (count>=2'd2)          // Maximum count condition           
                begin                     
                    count<=2'd0;
                end        
            else  // Normal carry generation             
                begin               
                    count<=count+1'b1;                
                end
        end
  
endmodule


