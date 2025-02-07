module main_decoderm(op,zero, PCSrc, ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, ALUOp);

   //input output declartion

   input zero;
   input [6:0] op;
   output RegWrite, MemWrite, ResultSrc, ALUSrc, PCSrc;
   output [1:0] ImmSrc, ALUOp; 

   //wires
   wire Branch ;


   assign RegWrite = ((op == 7'b0000011) | (op == 7'b0110011)) ? 1'b1 : 1'b0 ; 

   assign ImmSrc   = (op == 7'b0000011) ? 2'b00 : 
                     (op == 7'b0100011) ? 2'b01 :
                     (op == 7'b0110011) ? 2'b00 :
                     (op == 7'b1100011) ? 2'b10 : 2'b00 ; 

    assign ALUSrc  = ((op == 7'b0000011) | (op == 7'b0100011)) ? 1'b1 : 1'b0 ;

    assign MemWrite  = (op == 7'b0100011) ? 1'b1 : 1'b0 ; 

    assign ResultSrc = (op == 7'b0000011) ? 1'b1 : 
                       ((op == 7'b0100011) | (op == 7'b1100011)) ? 1'bx : 1'b0 ; 
    
    assign Branch = (op == 7'b1100011) ? 1'b1 : 1'b0 ;

    assign ALUOp   = (op == 7'b0110011) ? 2'b10 :
                     (op == 7'b0000011) ? 2'b01 : 2'b00 ; 
    
    assign PCSrc = zero & Branch ; 

endmodule