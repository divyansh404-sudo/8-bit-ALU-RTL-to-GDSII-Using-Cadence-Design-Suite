`timescale 1ns / 1ps

module test_alu();
    parameter N = 8;
    reg [N-1:0] A, B;
    reg [2:0] op_code;
    reg clk, en;
    wire [N-1:0] result_out;
    wire flag_carry, flag_zero;
    
    // Instantiate the ALU
    alu uut (
        .A(A),
        .B(B),
        .op_code(op_code),
        .clk(clk),
        .en(en),
        .result_out(result_out),
        .flag_carry(flag_carry),
        .flag_zero(flag_zero)
    );
    
    // Clock generation
    always #5 clk = ~clk;
    
    initial begin
        // Initialize all signals at time 0
        clk = 0;
        en = 0;
        A = 0;
        B = 0;
        op_code = 3'b000;
        
        // Start simulation
        #3 en = 1;
        
        // Test cases
        op_code = 3'b000; A = 250; B = 6;   #10;
        op_code = 3'b001; A = 2;   B = 3;   #10;
        op_code = 3'b010; A = 23;  B = 20;  #10;
        op_code = 3'b011; A = 25;  B = 0;   #10;
        op_code = 3'b101; A = 15;  B = 3;   #10;
        
        $finish;
    end
endmodule

