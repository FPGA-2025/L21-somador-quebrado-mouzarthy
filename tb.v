`timescale 1ns/1ps

module tb();

reg [3:0] num1;
reg [3:0] num2;
wire [3:0] out;
wire cout;

add u0 (
    .num1 (num1),
    .num2 (num2),
    .out  (out),
    .cout (cout)
);

integer i, j;
reg [4:0] expected;

initial 
begin

    for (i = 0; i < 16; i = i + 1) 
    begin
        for (j = 0; j < 16; j = j + 1) 
        begin
            num1 = i;
            num2 = j;
            expected = i + j;
            #1;
            if({cout, out} !== expected) 
            begin
                $display("ERRO: %d + %d = %d, -> %b (cout=%b, out=%b)", i, j, expected, {cout, out}, cout, out);
            end 
            else 
            begin
                $display("OK: %d + %d = %b", i, j, {cout, out});
            end
        end
    end

    $finish;
end


endmodule
