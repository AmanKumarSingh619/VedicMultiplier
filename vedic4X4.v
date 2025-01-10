`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2024 15:09:09
// Design Name: 
// Module Name: vedic4X4
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

module vedic4X4(m, a, b);
    input [3:0] a;
    input [3:0] b;
    output [7:0] m;

wire [3:0]q1, q2, q3, q4, q5, q6, q7;
wire [2:0]c;
wire [3:0]d;
wire [3:0]e;
wire [1:0]s = 2'b0;
wire y = 1'b0;
wire n = 1'b0;

// 2X2 stage
vedic2X2 v1(q1[3:0], a[1:0], b[1:0]);
vedic2X2 v2(q2[3:0], a[1:0], b[3:2]);
vedic2X2 v3(q3[3:0], a[3:2], b[1:0]);
vedic2X2 v4(q4[3:0], a[3:2], b[3:2]);

// First output assignment
assign m[1:0] = q1[1:0];

// Concatination 1
assign d[3:0] = {s[1:0], q1[3:2]};

// First adder stage
cla_4bit c1(q3[3:0], q2[3:0], n, q5[3:0], c[0]);
cla_4bit c2(q5[3:0], d[3:0], n, q6[3:0], c[1]);

// Concatination 2
assign e[3:0] = {y, c[0], q6[3:2]};

// Second adder stage
cla_4bit c3(q4[3:0], e[3:0], n, q7[3:0], c[2]);

// Final output assignment
assign m[3:2] = q6[1:0];
assign m[7:4] = q7[3:0];

endmodule