`include "adder.v"

module ALUm (A,B,AluControl, Result, Z, N, C, V);

      input [31:0] A,B;
      output [31:0] Result;
      input [2:0] AluControl;
      output Z, N, C, V;
      // wire declaration 
      wire [31:0] a_and_b;
      wire [31:0] a_or_b;
      wire [31:0] b_com;
      wire [31:0] m_out;
      wire [31:0] a_out;
      wire [31:0] m2_out;
      wire cout;
      wire [31:0] slt;
      
      // Logic design
      // And and or operations
      assign a_and_b = A & B;
      assign a_or_b = A | B; 
      

      // ALu design

           assign b_com = ~ B;

           assign m_out = (AluControl[0]) ? B : b_com ;
           
           
      // Adder design
       assign {cout, a_out} = m_out + AluControl[0] +  A ;

      // sign extension       
       assign slt = { 28'h0000000, 3'b000, m2_out[31] } ;

      //Output Mux
       assign m2_out = (AluControl[2:0] == 3'b000) ? a_out :
                       (AluControl[2:0] == 3'b001) ? a_out : 
                       (AluControl[2:0] == 3'b010) ? a_and_b :
                       (AluControl[2:0] == 3'b011) ? a_or_b :
                       (AluControl[2:0] == 3'b011) ? slt : 32'h00000000 ;


        assign Result = m2_out ;

      // Flags assignment
      assign C = ( cout & (~AluControl[1]));
      assign Z = & ( ~ Result);
      assign N = Result[31];
      assign V = ((~AluControl[0]) & (m2_out[31] ^ A[31]) & (~(A[31] ^ B[31] ^ AluControl[2])));
        
      endmodule