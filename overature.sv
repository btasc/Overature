interface ram_if
#(
  parameter type T = logic [15:0]
);
  logic clk, we;
  T wdata, rdata;

  modport tx (
    
  );
endinterface

module ram
#(
  parameter int Depth = 256,
  parameter type T = logic [15:0]
) (
  
);

endmodule

module tb;
  logic [15:0] n = 16'h11;

  initial begin
    $display("test");
  end
endmodule
