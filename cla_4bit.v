`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2024 15:05:33
// Design Name: 
// Module Name: cla_4bit
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

module cla_4bit(A, B, Cin, S, Cout);
  input [3:0]A, B; 
  input Cin;
  output [3:0] S;
  output Cout;
  
  wire P0, P1, P2, P3;
  wire [3:0] Ci;
  
  // P Stage
  assign P0 = A[0] ^ B[0];
  assign P1 = A[1] ^ B[1];
  assign P2 = A[2] ^ B[2];
  assign P3 = A[3] ^ B[3];
        
  // Carry Portion
  assign Ci[0] = Cin;
  assign Ci[1] = (A[0] & B[0]) | ((A[0]^B[0]) & Ci[0]);
  assign Ci[2] = (A[1] & B[1]) | ((A[1]^B[1]) & ((A[0] & B[0]) | ((A[0]^B[0]) & Ci[0])));
  assign Ci[3] = (A[2] & B[2]) | ((A[2]^B[2]) & ((A[1] & B[1]) | ((A[1]^B[1]) & ((A[0] & B[0]) | ((A[0]^B[0]) & Ci[0])))));
  assign Cout  = (A[3] & B[3]) | ((A[3]^B[3]) & ((A[2] & B[2]) | ((A[2]^B[2]) & ((A[1] & B[1]) | ((A[1]^B[1]) & ((A[0] & B[0]) | ((A[0]^B[0]) & Ci[0])))))));

  //Sum Portion
  assign S[0] = P0 ^ Cin;
  assign S[1] = P1 ^ Ci[1];
  assign S[2] = P2 ^ Ci[2];
  assign S[3] = P3 ^ Ci[3];
  
endmodule