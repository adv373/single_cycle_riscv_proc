module alu_decoderm(  ALUOp, op5,func3, func7, ALUControl);
     
     // port declarations
     input op5, func7; 
     input [2:0] func3;
     input [1:0] ALUOp; 
     output [2:0] ALUControl; 
    

    // interim wire 
    wire[1:0] wir; 

    assign wir  = {op5, func7} ; 

    // output assignment
    assign ALUControl = (ALUOp == 2'b00) ? 3'b000 : 
                        (ALUOp == 2'b01) ? 3'b001 :
                        ((ALUOp == 2'b01) & (func3 == 3'b010) ) ? 3'b101 : 
                        ((ALUOp == 2'b01) & (func3 == 3'b110) ) ? 3'b011 :
                        ((ALUOp == 2'b01) & (func3 == 3'b111) ) ? 3'b010 :
                        ((ALUOp == 2'b01) & (func3 == 3'b000) & (wir != 2'b11)) ? 3'b000 :
                        ((ALUOp == 2'b01) & (func3 == 3'b000) & (wir == 2'b11)) ? 3'b000 : 3'b000 ; 



endmodule