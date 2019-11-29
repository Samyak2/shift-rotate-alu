`timescale 1 ns / 100 ps
`define TESTVECS 32

module tb;
  reg clk, reset;
  reg [1:0] op; reg [15:0] i0;
  wire [15:0] o;
  reg [17:0] test_vecs [0:(`TESTVECS-1)];
  integer i;
  initial begin $dumpfile("tb_alu.vcd"); $dumpvars(0,tb); end
  initial begin reset = 1'b1; #12.5 reset = 1'b0; end
  initial clk = 1'b0; always #5 clk =~ clk;
  initial begin
    test_vecs[0][17:16] = 2'b00; test_vecs[0][15:0] = 16'h0000;
    test_vecs[1][17:16] = 2'b00; test_vecs[1][15:0] = 16'h55aa;
    test_vecs[2][17:16] = 2'b00; test_vecs[2][15:0] = 16'h0001;
    test_vecs[3][17:16] = 2'b00; test_vecs[3][15:0] = 16'h7fff;
    test_vecs[4][17:16] = 2'b01; test_vecs[4][15:0] = 16'h0000;
    test_vecs[5][17:16] = 2'b01; test_vecs[5][15:0] = 16'h55aa;
    test_vecs[6][17:16] = 2'b01; test_vecs[6][15:0] = 16'h0001;
    test_vecs[7][17:16] = 2'b01; test_vecs[7][15:0] = 16'h7fff;
    test_vecs[8][17:16] = 2'b10; test_vecs[8][15:0] = 16'h0000;
    test_vecs[9][17:16] = 2'b10; test_vecs[9][15:0] = 16'h55aa;
    test_vecs[10][17:16] = 2'b10; test_vecs[10][15:0] = 16'h0001;
    test_vecs[11][17:16] = 2'b10; test_vecs[11][15:0] = 16'h7fff;
    test_vecs[12][17:16] = 2'b11; test_vecs[12][15:0] = 16'h0000;
    test_vecs[13][17:16] = 2'b11; test_vecs[13][15:0] = 16'h55aa;
    test_vecs[14][17:16] = 2'b11; test_vecs[14][15:0] = 16'h0001;
    test_vecs[15][17:16] = 2'b11; test_vecs[15][15:0] = 16'h7fff;
    test_vecs[16][17:16] = 2'b00; test_vecs[16][15:0] = 16'b1000000000000001;
    test_vecs[17][17:16] = 2'b01; test_vecs[17][15:0] = 16'b1000000000000001;
    test_vecs[18][17:16] = 2'b10; test_vecs[18][15:0] = 16'b1000000000000001;
    test_vecs[19][17:16] = 2'b11; test_vecs[19][15:0] = 16'b1000000000000001;
    test_vecs[20][17:16] = 2'b00; test_vecs[20][15:0] = 16'b1111111111111111;
    test_vecs[21][17:16] = 2'b01; test_vecs[21][15:0] = 16'b1111111111111111;
    test_vecs[22][17:16] = 2'b10; test_vecs[22][15:0] = 16'b1111111111111111;
    test_vecs[23][17:16] = 2'b11; test_vecs[23][15:0] = 16'b1111111111111111;
    test_vecs[24][17:16] = 2'b00; test_vecs[24][15:0] = 16'b1010101010101010;
    test_vecs[25][17:16] = 2'b01; test_vecs[25][15:0] = 16'b1010101010101010;
    test_vecs[26][17:16] = 2'b10; test_vecs[26][15:0] = 16'b1010101010101010;
    test_vecs[27][17:16] = 2'b11; test_vecs[27][15:0] = 16'b1010101010101010;
    test_vecs[28][17:16] = 2'b00; test_vecs[28][15:0] = 16'b0101010101010101;
    test_vecs[29][17:16] = 2'b01; test_vecs[29][15:0] = 16'b0101010101010101;
    test_vecs[30][17:16] = 2'b10; test_vecs[30][15:0] = 16'b0101010101010101;
    test_vecs[31][17:16] = 2'b11; test_vecs[31][15:0] = 16'b0101010101010101;
  end
  initial {op, i0} = 0;
  m shifter_0 (op, i0, o);
  initial begin
    #6 for(i=0;i<`TESTVECS;i=i+1)
      begin #10 {op, i0}=test_vecs[i]; end
    #100 $finish;
  end
endmodule
