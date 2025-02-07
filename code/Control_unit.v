`include "main_decoder.v"
`include "ALUDecoder.v"

module Control_Unitm( Zero, op, func3, func7, ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, AluControl );

 input Zero, func7 ;
 input [6:0] op ;
 input [2:0] func3 ;

 output ResultSrc, MemWrite, ALUSrc, RegWrite ;
 output [1:0] ImmSrc ; 
 output [2:0] AluControl ;

 wire [1:0] ALUOp;


    // instantaization of module
        main_decoderm main_decoder(
            .op(op), 
            .zero(Zero), 
            .PCSrc(), 
            .ResultSrc(ResultSrc), 
            .MemWrite(MemWrite), 
            .ALUSrc(ALUSrc), 
            .ImmSrc(ImmSrc), 
            .RegWrite(RegWrite), 
            .ALUOp(ALUOp)
            );
    // instantization of module alucontrol
        alu_decoderm alu_decoder(  
            .ALUOp(ALUOp), 
            .op5(op[5]),
            .func3(func3), 
            .func7(func7), 
            .ALUControl(AluControl)
            );

endmodule