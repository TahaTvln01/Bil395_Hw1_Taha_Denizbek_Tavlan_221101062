Calculator: Lex & Yacc Implementation

Overview

This project implements a simple arithmetic expression parser and evaluator using Lex (Flex) and Yacc (Bison). The program takes user input in the form of mathematical expressions, parses them using Yacc, and evaluates the result accordingly. The parser supports basic arithmetic operations, including addition, subtraction, multiplication, and division, while also handling expressions with parentheses.

Design Decisions

1. Lexical Analysis (Lex)

The scanner (lexer) identifies tokens such as numbers, operators (+, -, *, /), and parentheses.

Whitespace characters (\t, \n) are ignored.

Unknown characters produce an error message.

2. Syntax Analysis & Evaluation (Yacc)

Precedence and associativity rules are defined to ensure proper order of operations.

Expressions are evaluated recursively by reducing them based on arithmetic rules.

Division by zero is handled explicitly, printing an error instead of crashing.

Parentheses allow overriding normal precedence rules.

3. Handling User Input

The program supports multi-line input, allowing users to evaluate expressions one by one.

Empty lines are ignored, avoiding unnecessary syntax errors.

The final result is printed after parsing each valid expression.

Implementation Steps

Defined tokens and regular expressions in calculator.l.

Defined grammar rules for expressions in calculator.y.

Implemented precedence rules for proper evaluation order.

Handled edge cases, such as empty input and division by zero.

Compiled and tested the program with various test cases.

How to Run

1. Compile the program:

yacc -d calculator.y
lex calculator.l
gcc lex.yy.c y.tab.c -o calculator -lm

2. Run the calculator:

./calculator

3. Enter arithmetic expressions:

Enter an arithmetic expression (Ctrl+C to exit):
> 5 + 8
Result: 13
> (3 * (4 + 5) / 3) - 2
Result: 7
> 10 / 0
Error: Division by zero error

Test Cases

Simple Expressions

3 + 5  →  Result: 8
10 * 4 →  Result: 40

Expressions with Parentheses

(1 + 2) * 4 →  Result: 12
(5 - 3) * (2 + 6) →  Result: 16

Complex Expressions

(3 + 5) * (2 - 1) / 4 →  Result: 2
7 * (2 + 3) - (4 / 2) →  Result: 33

Division by Zero Handling

10 / 0 →  Error: Division by zero error
(5 + 5) / (3 - 3) →  Error: Division by zero error

Notes

The program runs in an interactive loop.

Press Ctrl+C to exit.

Errors (such as invalid syntax) are reported to the user.

This project demonstrates the power of Lex & Yacc in building language parsers. 

