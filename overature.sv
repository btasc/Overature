interface ram_if
#(
  parameter type T = logic [15:0],
  parameter int Depth = 256
); 
  localparam int AddrWidth = $clog2(Depth);

  logic clk, we;
  logic [AddrWidth - 1 : 0] addr;
  T wdata, rdata;

  modport ram(input clk, we, wdata, addr, output rdata);
  modport reader(input rdata);
endinterface

module ram
#(
  parameter int Depth = 256,
  parameter type T = logic [15:0]
) (
  ram_if.ram bus
);
  T mem[Depth];

  always_ff @(posedge bus.clk) begin
    if(bus.we) mem[bus.addr] <= bus.wdata;
    bus.rdata <= mem[bus.addr];
  end
endmodule

module tb;
  logic [15:0] n = 16'h11;

  initial begin
    $display("test");
  end
endmodule
