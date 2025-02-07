module Extendm(Instr, ImmExt);

// io ports defining
input [31:0] Instr ; 
output [31:0] ImmExt ;


assign ImmExt = { ((Instr[31]) ? 20'hfffff : 20'h00000) , Instr[31:20]} ;

endmodule