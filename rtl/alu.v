`timescale 1ns / 1ps

module alu #(parameter N = 8)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire [2:0]   op_code,
    input  wire          clk,
    input  wire          en,
    output reg  [N-1:0] result_out,
    output reg           flag_carry,
    output reg           flag_zero
);

    reg [N:0] temp_result; // one extra bit for carry/borrow

    // Operation codes (matching first ALU)
    localparam ADD = 3'b000,
               SUB = 3'b001,
               AND_OP = 3'b010,
               OR_OP  = 3'b011,
               INC = 3'b100,
               DEC = 3'b101,
               NOT_OP = 3'b110;

    always @(posedge clk) begin
        if (en) begin
            flag_carry <= 0;
            temp_result = {1'b0, A}; // initialize with A extended

            case (op_code)
                ADD: begin
                    temp_result = {1'b0, A} + {1'b0, B};
                    result_out  <= temp_result[N-1:0];
                    flag_carry  <= temp_result[N];
                end

                SUB: begin
                    temp_result = {1'b0, A} - {1'b0, B};
                    result_out  <= temp_result[N-1:0];
                    flag_carry  <= temp_result[N]; // acts as borrow flag
                end

                AND_OP: begin
                    result_out  <= A & B;
                    flag_carry  <= 0;
                end

                OR_OP: begin
                    result_out  <= A | B;
                    flag_carry  <= 0;
                end

                INC: begin
                    temp_result = {1'b0, A} + 1'b1;
                    result_out  <= temp_result[N-1:0];
                    flag_carry  <= temp_result[N];
                end

                DEC: begin
                    temp_result = {1'b0, A} - 1'b1;
                    result_out  <= temp_result[N-1:0];
                    flag_carry  <= temp_result[N];
                end

                NOT_OP: begin
                    result_out  <= ~A;
                    flag_carry  <= 0;
                end

                default: begin
                    result_out  <= {N{1'b0}};
                    flag_carry  <= 0;
                end
            endcase

            flag_zero <= (result_out == {N{1'b0}});
        end
    end

endmodule
