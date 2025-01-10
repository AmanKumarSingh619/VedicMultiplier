`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2024 15:06:12
// Design Name: 
// Module Name: cla_8bit
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

module cla_8bit(A, B, Cin, S, Cout);
  input [7:0]A, B; 
  input Cin;
  output [7:0] S;
  output Cout;

  wire P0, P1, P2, P3, P4, P5, P6, P7;
  wire [7:0] Ci;
  
  // P Stage
  assign P0 = A[0] ^ B[0];
  assign P1 = A[1] ^ B[1];
  assign P2 = A[2] ^ B[2];
  assign P3 = A[3] ^ B[3];
  assign P4 = A[4] ^ B[4];
  assign P5 = A[5] ^ B[5];
  assign P6 = A[6] ^ B[6];
  assign P7 = A[7] ^ B[7];
  
  // Carry Stage
  assign Ci[0] = Cin;
  assign Ci[1] = (A[0] & B[0]) | ((A[0]^B[0]) & Ci[0]);
  assign Ci[2] = (A[1] & B[1]) | ((A[1]^B[1]) & ((A[0] & B[0]) | ((A[0]^B[0]) & Ci[0])));
  assign Ci[3] = (A[2] & B[2]) | ((A[2]^B[2]) & ((A[1] & B[1]) | ((A[1]^B[1]) & ((A[0] & B[0]) | ((A[0]^B[0]) & Ci[0])))));
  assign Ci[4] = (A[3] & B[3]) | ((A[3]^B[3]) & ((A[2] & B[2]) | ((A[2]^B[2]) & ((A[1] & B[1]) | ((A[1]^B[1]) & ((A[0] & B[0]) | ((A[0]^B[0]) & Ci[0])))))));
  assign Ci[5] = (A[4] & B[4]) | ((A[4]^B[4]) & ((A[3] & B[3]) | ((A[3]^B[3]) & ((A[2] & B[2]) | ((A[2]^B[2]) & ((A[1] & B[1]) | ((A[1]^B[1]) & ((A[0] & B[0]) | ((A[0]^B[0]) & Ci[0])))))))));
  assign Ci[6] = (A[5] & B[5]) | ((A[5]^B[5]) & ((A[4] & B[4]) | ((A[4]^B[4]) & ((A[3] & B[3]) | ((A[3]^B[3]) & ((A[2] & B[2]) | ((A[2]^B[2]) & ((A[1] & B[1]) | ((A[1]^B[1]) & ((A[0] & B[0]) | ((A[0]^B[0]) & Ci[0])))))))))));
  assign Ci[7] = (A[6] & B[6]) | ((A[6]^B[6]) & ((A[5] & B[5]) | ((A[5]^B[5]) & ((A[4] & B[4]) | ((A[4]^B[4]) & ((A[3] & B[3]) | ((A[3]^B[3]) & ((A[2] & B[2]) | ((A[2]^B[2]) & ((A[1] & B[1]) | ((A[1]^B[1]) & ((A[0] & B[0]) | ((A[0]^B[0]) & Ci[0])))))))))))));
  assign Cout  = (A[7] & B[7]) | ((A[7]^B[7]) & ((A[6] & B[6]) | ((A[6]^B[6]) & ((A[5] & B[5]) | ((A[5]^B[5]) & ((A[4] & B[4]) | ((A[4]^B[4]) & ((A[3] & B[3]) | ((A[3]^B[3]) & ((A[2] & B[2]) | ((A[2]^B[2]) & ((A[1] & B[1]) | ((A[1]^B[1]) & ((A[0] & B[0]) | ((A[0]^B[0]) & Ci[0])))))))))))))));

  // Sum Stage
  assign S[0] = P0 ^ Cin;
  assign S[1] = P1 ^ Ci[1];
  assign S[2] = P2 ^ Ci[2];
  assign S[3] = P3 ^ Ci[3];
  assign S[4] = P4 ^ Ci[4]; 
  assign S[5] = P5 ^ Ci[5];
  assign S[6] = P6 ^ Ci[6];
  assign S[7] = P7 ^ Ci[7];
  
endmodule