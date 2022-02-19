//decoder(active low outputs) module

module decoder (
  input [3:0] a,
  output reg [15:0] z
);
  
  always @(a)
    begin 
      z=16’hffff;
      z[a]=0;
    end
  
endmodule 
          
