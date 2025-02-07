`include "Singlecycle_top.v"

module tb_singlecyclem();

reg clk = 1'b1 , rst = 1'b1 ;


    single_cycle_topm single_cycle_top(
        .clk(clk), 
        .rst(rst)
        );

    initial begin
        $dumpfile("singlecycle.vcd");
        $dumpvars(0, tb_singlecyclem);

    end
    
    always 
    begin
        clk = ~clk ;
        #50;
    end

    initial begin
        rst = 1'b0 ; 
        #100;

        rst = 1'b1;
        #300;

        $finish;

    end

endmodule