module PCm(clk, rst, PC_next, Pc);

input [31:0] PC_next;
input clk, rst ; 
output reg [31:0] Pc ; 

always  @( posedge clk ) 
begin
    if (rst == 1'b0) 
        begin
           Pc <= 32'h00000000;
        end
     else begin
        Pc <= PC_next ;   
    end

    
end

endmodule