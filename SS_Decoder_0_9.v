`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Neha Fathima S, Rajkrishna T R
// 
// Create Date: 22.07.2025 22:32:44
// Design Name: 
// Module Name: SS_Decoder_0_9
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Displays 0 to 9 on the sevent segment display
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SS_Decoder_0_9(
    
    input [3:0]bin,
                     
    output reg[6:0]a_to_g

    );
    
    always@(bin)
        begin // a,b,c,d,e,f,g from 6 to 0  a is MSB and light glows when input is 1    
            case (bin)     
            4'd0: a_to_g = 7'b0000001;            
            4'd1: a_to_g = 7'b1001111;            
            4'd2: a_to_g = 7'b0010010;            
            4'd3: a_to_g = 7'b0000110;            
            4'd4: a_to_g = 7'b1001100;           
            4'd5: a_to_g = 7'b0100100;           
            4'd6: a_to_g = 7'b0100000;           
            4'd7: a_to_g = 7'b0001111;           
            4'd8: a_to_g = 7'b0000000;          
            4'd9: a_to_g = 7'b0000100;           
            default:a_to_g=7'b0000000;               
            endcase      
        end
     
endmodule
