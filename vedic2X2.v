`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2024 15:08:20
// Design Name: 
// Module Name: vedic2X2
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

module vedic2X2(m, a, b);
    input [1:0] a;
    input [1:0] b;
    output [3:0] m;

wire [2:0] s;
wire c;

and a1(m[0], a[0], b[0]);
and a2(s[0], a[0], b[1]);
and a3(s[1], a[1], b[0]);
ha h1(m[1], c, s[0], s[1]);
and a4(s[2], a[1], b[1]);
ha h2(m[2], m[3], c, s[2]);

endmodule