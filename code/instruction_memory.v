module instr_memm(A, RD, rst);

// io ports
    input [31:0] A;
    input rst ;
    output [31:0] RD;
    
// memory making
  reg [31:0] Mem [1023:0];

// assigning RD
  assign RD = (rst == 1'b1) ? Mem[A[31:2]] : 32'h00000000 ; 

  initial begin
    Mem[0] = 32'hFFC4A303;
    //Mem[1] = 	32'h00832383;
  end 
  initial begin
        Mem[9] = 32'h00000020;
    end


endmodule