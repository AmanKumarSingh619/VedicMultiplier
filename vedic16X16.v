`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2024 15:10:45
// Design Name: 
// Module Name: vedic16X16
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

module vedic16X16(m, a, b);
    input [15:0]a;
    input [15:0]b;
    output [31:0]m;
    
wire [15:0]q1, q2, q3, q4, q5, q6, q7;
wire [2:0]c;
wire [15:0]d;
wire [15:0]e;
wire [7:0]s = 8'b0;
wire y = 7'b0;
wire n = 1'b0;

// 8X8 stage
vedic8X8 v1(q1[15:0], a[7:0], b[7:0]);
vedic8X8 v2(q2[15:0], a[7:0], b[15:8]);
vedic8X8 v3(q3[15:0], a[15:8], b[7:0]);
vedic8X8 v4(q4[15:0], a[15:8], b[15:8]);

// First output assignment
assign m[7:0] = q1[7:0];

// Concatination 1
assign d[15:0] = {s[7:0], q1[15:8]};

// First adder stage
cla_16bit c1(q3[15:0], q2[15:0], n, q5[15:0], c[0]);
cla_16bit c2(q5[15:0], d[15:0], n, q6[15:0], c[1]);

// Concatination 2
assign e[15:0] = {y, c[0], q6[15:8]};

// Second adder stage
cla_16bit c3(q4[15:0], e[15:0], n, q7[15:0], c[2]);

// Final output assignment
assign m[15:8] = q6[7:0];
assign m[31:16] = q7[15:0];

endmodule
