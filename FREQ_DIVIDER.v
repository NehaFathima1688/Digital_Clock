`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Neha Fathima S, Rajkrishna T R
// 
// Create Date: 22.07.2025 21:27:21
// Design Name: 
// Module Name: FREQ_DIVIDER
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Used to generate two clocks - 1s clock for normal operation and 2s clock for time setting
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FREQ_DIVIDER(clk1,clk2,clkM,clr);
    
    input clkM;
    
    input clr;
    
    output reg clk1,clk2;
    
    parameter M=10_000_000; //M must be even for the calculation to be correct
    
    parameter N= (M/2)-1;
    
    parameter S=(M/4)-1;
    
    parameter W1 = $clog2(N+1); 
    
    parameter W2= $clog2(S+1);
    
    //if counter has width w it can represent 2^w states or binary numbers
    
    //2^w >= N+1; => w>= log2(N+1)
    
    reg [W1-1:0] counter1; // total width=w, ie 0 to w-1
    
    reg [W2-1:0] counter2; 
    
    //Counter counts from 0 to N
    
    //clk2 toggles every time the counter reaches N
    
    //The output clk1 has a period of 1 second (0.5s high, 0.5s low), so the frequency is 1 Hz
    
    // ClockM goes through M cycles in 1s. Time taken to count from 0 to M/2 -1 = 0.5s
    

    always @(posedge clkM or posedge clr)     
        begin        
            if (clr==1'b1)             
                begin                
                    counter1 <= 0;                    
                    clk1 <= 0;
                                        
                    counter2 <= 0;                   
                    clk2 <= 0;                   
                end                 
            else if (counter1 == N)             
                begin               
                    counter1 <= 0;                    
                    clk1 <= ~clk1;                   
                end                 
            else if (counter2 == S)             
                begin                
                    counter2 <= 0;                    
                    clk2 <= ~clk2;                    
                end                
            else             
                begin               
                    counter1 <= counter1 + 1;                    
                    counter2 <= counter2 + 1;                   
                end               
        end

endmodule
