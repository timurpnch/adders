import os
from pathlib import Path
import subprocess


adder_tb_content = """
`timescale 1ns / 1ps

module adder_tb;

    // Параметры
    parameter N = 6; // Разрядность сумматора

    // Входные сигналы
    reg [N-1:0] a;
    reg [N-1:0] b;

    // Выходные сигналы
    wire [N-1:0] sum;
    wire cout;

    // Инстанс сумматора
    adder uut (
        .a(a),
        .b(b),
        .s(sum),
        .cout(cout)
    );

    // Генерация тестовых данных
    initial begin
        integer i;
        integer j;
        reg [N:0] expected_sum; // Ожидаемая сумма с учетом переноса

        // Инициализация
        a = 0;
        b = 0;

        $monitor("Time = %t, a = %b, sum = %b, cout = %b", $time, a, b, sum, cout);

        // Генерация входных данных и проверка результата
        for (i = 0; i < 2 ** N; i = i + 1) begin
            for (j = 0; j < 2 ** N; j = j + 1) begin
                a = i;
                b = j;

                #10; // Задержка для стабилизации сигналов

                // Ожидаемая сумма с учетом переноса
                expected_sum = a + b;

                // Проверка результата
                if ({cout, sum} !== expected_sum) begin
                    $display("Error: a = %h, b = %h, sum = %h, cout = %h, expected_sum = %h", a, b, sum, cout, expected_sum);
                    $finish;
                end
            end
        end

        // Если все тесты прошли успешно
        $display("All tests passed successfully!");
        $finish;
    end

endmodule
"""

for n in range(2, 7):
    data_dir = f'bitwidth_{n}_output'

    print(data_dir)

    content = adder_tb_content.replace('parameter N = 6', f'parameter N = {n}')
    with open('adder_tb.v', 'w') as fout:
        fout.write(content)

    cnt = 0
    correct = True
    for el in sorted(Path(data_dir).glob('*.v')):

        if 'inter' in str(el):
            continue

        cmd_1 = f'iverilog -o my_tb -g2012 adder_tb.v {el} asap7/asap7_verilog.v'
        cmd_2 = f"vvp my_tb | grep -q 'All tests passed successfully!' && echo 'correct'"

        try:
            os.system(cmd_1)
            res = subprocess.check_output(cmd_2, shell=True).strip()
            res = str(res)

            if res != "b'correct'":
                print(f'Wrong answer {el}')
                correct = False
        except:
            print(f'Wrong answer {el}')
            print()
            correct = False

        cnt += 1

    if correct:
        print(f'Correct all {cnt} files')
    print()

os.unlink('my_tb')
os.unlink('adder_tb.v')
