//final module 
`include "decoder.sv"

module final(
  input [3:0] A,
  output [15:0] Z,
  output E);
  
  decoder dec1 (.a(A), .z(Z));
  
  assign E = ~(Z[0] & Z[5] & Z[10] & Z[15]);
  
endmodule


    