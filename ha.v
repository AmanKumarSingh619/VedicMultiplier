`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2024 15:04:53
// Design Name: 
// Module Name: ha
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ha(sum, carry, a, b);
    input a; // First input
    input b; // Second input
    output sum; // Sum output
    output carry; // Carry output

assign sum = a ^ b; // XOR operation for sum
assign carry = a & b; // AND operation for carry

endmodule
