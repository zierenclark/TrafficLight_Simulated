// Code your testbench here
// or browse Examples
module BP_FSM_Testbench();

reg clk_tb, rst_tb, b_tb;
wire y_tb, z_tb;

localparam CLK_PERIOD = 20;

  BP_FSM BP_FSM_tb(clk_tb, rst_tb, b_tb, y_tb, z_tb);

// Generate clock
/* always begin

clk_tb = 0;
#(CLK_PERIOD / 2);
clk_tb = 1;
#(CLK_PERIOD / 2);
end*/
   task toggle_clk;
    begin
      clk_tb = ~clk_tb; #CLK_PERIOD;
      
    end
  endtask
initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    

   clk_tb = 0;
    
    for (int i = 0; i < 10; i++) begin
        #CLK_PERIOD toggle_clk;
    end
    
  end
  

initial begin

rst_tb = 1;
b_tb = 0;
#CLK_PERIOD rst_tb = 0;

#CLK_PERIOD b_tb = 1;
  
#CLK_PERIOD b_tb = 0;
  
#CLK_PERIOD b_tb = 1;
  
end

endmodule
