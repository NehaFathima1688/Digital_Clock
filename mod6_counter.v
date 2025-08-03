`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Neha Fathima S, Rajkrishna T R
// 
// Create Date: 22.07.2025 21:16:58
// Design Name: 
// Module Name: mod6_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: A modulo 6 counter that counts from 0 to 5 in synchronism with a clock signal                
//              Set time mode holds the count and if select(slt) is activated during set time mode it counts in synchronism with a faster clock   
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mod6_counter(count,clkmain,set_time,carry,clear);

    input clkmain;    // Main clock working with carry from mod10 counter
    input set_time;   // for time setting
    input clear;      // for clearing count
    output reg [2:0]count; // count 3 bit 
    output reg carry;      // carry for subsequent digit

    always@(posedge clkmain  or posedge clear)
        begin
 
            if(clear==1'b1)     // clear is active
                begin 
                    count<=3'd0;
                    carry<=1'b0;
                end
            else if(set_time>1'b0) // time setting mode
                begin
                    if(count>=3'd5)   // counting for setting time
                        begin
                            count<=3'd0;
                            carry<=1'b0;  // Only one block either seconds or minutes or hour is                       
                                         // set at a time so no need for carry propagation to next block
                        end
                    else 
                        begin
                            count<=count+1'b1;  //counting for setting time
                            carry<=1'b0;
                        end
                end   
            else if (count>=3'd5)          // Maximum count condition
                begin
                    count<=3'd0;
                    carry<=1'b1;            // carry generation
                end
            else   // Normal carry generation 
                begin
                    count<=count+1'b1;
                    carry<=1'b0;
                end
        end

endmodule
