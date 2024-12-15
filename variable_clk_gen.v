//clock generation with variable duty cycle
module variable_clk_gen(output reg clk);
parameter clk_period=10;
parameter duty_cycle=70;
parameter Tclk_Hi=(clk_period*duty_cycle/100);
parameter Tclk_L0=(clk_period-Tclk_Hi);

initial
clk=0;
always 
begin
#Tclk_L0;
clk=1'b1;
#Tclk_Hi;
clk=1'b0;
end
endmodule
