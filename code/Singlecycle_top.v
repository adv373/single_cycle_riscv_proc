`include "PC.v"
`include "instruction_memory.v"
`include "register_file.v"
`include "extend.v"
`include "ALU.v"
`include "Control_unit.v"
`include "data_memory.v"

module single_cycle_topm(clk, rst );

    // IO ports

    input clk, rst ;

    // wire declarations
      wire [31:0] PC_top ; 
      wire [31:0] RD_top, RD1x ; 
      wire [31:0] ImmExt_w, Aluresult_w, readdata, PCplus4;
      wire [2:0] ALUControl_top ;
      wire Regwrite ;


     //module instantization
        PCm PC(
            .clk(clk), 
            .rst(rst), 
            .PC_next(PCplus4), 
            .Pc(PC_top)
            );
        instr_memm instr_mem(
            .A(PC_top), 
            .RD(RD_top), 
            .rst(rst)
            );
        Register_filem Register_file(
            .clk(clk), 
            .rst(rst),
            .WE3(), 
            .A1(RD_top[19:15]), 
            .A2(), 
            .A3(RD_top[11:7]), 
            .WD3(readdata), 
            .RD1(RD1x), 
            .RD2() 
            );
        Extendm Extend(
            .Instr(RD_top), 
            .ImmExt(ImmExt_w)
            );
        ALUm ALU (
            .A(RD1x),
            .B(ImmExt_w),
            .AluControl(ALUControl_top), 
            .Result(Aluresult_w), 
            .Z(), 
            .N(), 
            .C(), 
            .V());
        Control_Unitm Control_Unit( 
            .Zero(), 
            .op(RD_top[6:0]), 
            .func3(RD_top[14:12]), 
            .func7(), 
            .ResultSrc(), 
            .MemWrite(), 
            .ALUSrc(), 
            .ImmSrc(), 
            .RegWrite(Regwrite), 
            .AluControl(ALUControl_top) 
            );
        data_memm data_mem(
            .clk(clk), 
            .WE(), 
            .RD(readdata), 
            .A(Aluresult_w), 
            .WD()
            );
        adderm adder (
            .a(PC_top),
            .b(32'd4),
            .y(PCplus4));
endmodule