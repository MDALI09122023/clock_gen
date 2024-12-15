// clock generation
module clock_gen(output reg clock);
initial
clock=1'b0;

always #5 clock=~clock;
initial
#1000  $finish;
endmodule