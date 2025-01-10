`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2024 15:09:50
// Design Name: 
// Module Name: vedic8X8
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

module vedic8X8(m, a, b);
    input [7:0] a;
    input [7:0] b;
    output [15:0] m;
    
wire [7:0]q1, q2, q3, q4, q5, q6, q7;
wire [2:0]c;
wire [7:0]d;
wire [7:0]e;
wire [3:0]s = 4'b0;
wire y = 3'b0;
wire n = 1'b0;

// 4X4 stage
vedic4X4 v1(q1[7:0], a[3:0], b[3:0]);
vedic4X4 v2(q2[7:0], a[3:0], b[7:4]);
vedic4X4 v3(q3[7:0], a[7:4], b[3:0]);
vedic4X4 v4(q4[7:0], a[7:4], b[7:4]);

// First output assignment
assign m[3:0] = q1[3:0];

// Concatination 1
assign d[7:0] = {s[3:0], q1[7:4]};

// First adder stage
cla_8bit c1(q3[7:0], q2[7:0], n, q5[7:0], c[0]);
cla_8bit c2(q5[7:0], d[7:0], n, q6[7:0], c[1]);

// Concatination 2
assign e[7:0] = {y, c[0], q6[7:4]};

// Second adder stage
cla_8bit c3(q4[7:0], e[7:0], n, q7[7:0], c[2]);

// Final output assignment
assign m[7:4] = q6[3:0];
assign m[15:8] = q7[7:0];

endmodule