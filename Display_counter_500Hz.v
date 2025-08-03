`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Neha Fathima S, Rajkrishna T R
// 
// Create Date: 22.07.2025 21:31:22
// Design Name: 
// Module Name: Display_counter_500Hz
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Generates the clock that drives the circuiy that switches between multiple seven segment displays
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Display_counter_500Hz(clk500,clkM,clr);

    input clkM,clr;    
    output reg clk500;
    
    parameter M=10_000_000; //M must be even for the calculation to be correct
    
    parameter N= (M/1000)-1; //N = (clkM_frequency / (2 × desired_frequency)) - 1; Here desired frequency = 500Hz, so shd toggle 1000 times
    
    parameter w = $clog2(N+1); 
    
    //if counter has width w it can represent 2^w states or binary numbers
    
    //2^w >= N+1; => w>= log2(N+1)
    
    reg [w-1:0] counter; // total width=w, ie 0 to w-1
    
    //Counter counts from 0 to N
    
    //clk2 toggles every time the counter reaches N
    
    //The output clk1 has a period of 1 second (0.5s high, 0.5s low), so the frequency is 1 Hz
    
    // ClockM goes through M cycles in 1s. Time taken to count from 0 to M/2 -1 = 0.5s
    
    always @(posedge clkM or posedge clr)     
        begin       
            if (clr==1'b1)            
                begin               
                    counter <= 0;                   
                    clk500 <= 0;                   
                end                
            else if (counter == N)            
                begin               
                    counter <= 0;                    
                    clk500 <= ~clk500;                   
                end                
            else             
                begin                
                    counter <= counter + 1;                    
                end               
        end

endmodule
