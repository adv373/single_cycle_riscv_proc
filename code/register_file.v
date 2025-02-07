module Register_filem(clk, rst, WE3, A1, A2, A3 , WD3, RD1, RD2 );
    
    // io ports 
     input clk, rst, WE3 ;
     input [4:0] A1, A2, A3 ;
     input [31:0] WD3 ;

     output [31:0] RD1, RD2 ; 

    // creating memory
    
    reg[31:0] Registers[31:0];

    initial begin
        Registers[9] = 32'h00000020;
    end
    // read functionality

    assign RD1 =  Registers[A1];
    
    assign RD2 =  (rst == 1'b1) ? 32'h00000000 : Registers[A2];
    
    always @(posedge clk ) begin
        if (WE3)
        begin
            Registers[A3] <= WD3;
        end        
    end
    
endmodule