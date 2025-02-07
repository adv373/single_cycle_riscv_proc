module data_memm(clk, WE, RD, A, WD);
     // io ports declarations
     input clk, WE ;
     input [31:0] A, WD ; 
     output [31:0] RD ;

     reg [31:0] Data_memory[1023:0] ; 

     assign RD = (WE == 1'b0) ? Data_memory[A] : 32'h00000000 ; 

     always @(posedge clk ) 
     begin
        if (WE)
        begin
            Data_memory[A] <= WD ;
        end
     end

    initial begin
        Data_memory[9] = 32'h00000020;
    end
endmodule