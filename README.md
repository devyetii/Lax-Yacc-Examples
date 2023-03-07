# Lex and Yacc examples
Here are some simple examples for lex/yacc programs. 

### Pre-requisites
- C compiler (run `which cc` to check)
- Flex and Bison (GNU versions of Lex and Yacc)
```
sudo apt-get update
sudo apt-get install flex bison
```

1. To compile lex (.l) file alone
    - Generate the analyzer first by running
    ```
    lex example.l
    ```
    - Generate the compiler executable from the lexer
    ```
    cc lex.yy.c -o example -ll
    ```
    - Run the compiler
    ```
    ./example
    ... waits for your input ....
    ```
1. Full flow (.l + .y files)
    - Generate token definition files using `yacc` (generates `y.tab.c` and `y.tab.h`)
    ```
    yacc -d example.y
    ```
    - Generate lexer (generates `lex.yy.c`)
    ```
    lex example.l
    ```
    - Link and compile full compiler executable
    ```
    cc lex.yy.c y.tab.c -o example
    ```

### Examples overview
1. `start_stop` : Basic Lexer-only file. Accepts `start` and `stop` commands
2. `files` : Accepts syntax of `input.conf` similar to nginx's configuration file (mentioned in primer/HOWTO down in the references). It's purpose is that to show you how to read/write into a file
3. `variables` : Full flow (lexer + parser). Two state variables in the parser which you can change by commands like `set <state_name> <state_val>` and read by `read <state_name>`. Simple lexeme rules and grammer but meant to show you how we can keep state inside the parse. You'll use similar stuff for the symbol table in the project.
4. `calculator` : Full flow, accepts only (+/-). Shows you how we control the values stack ($$) in the parser.

** Stuff not covered in these examples ** : `%union` that allowes for multiple data types for `yylval` and using c++. You can find those in the examples repo in the references. 

## REFERENCES
- [lex and yacc primer/HOWTO](https://tldp.org/HOWTO/Lex-YACC-HOWTO-3.html)
- [konieshadow/lex-yacc-examples](https://github.com/konieshadow/lex-yacc-examples) > Has some other useful examples
- [https://www.geeksforgeeks.org/bottom-up-or-shift-reduce-parsers-set-2/](https://www.geeksforgeeks.org/bottom-up-or-shift-reduce-parsers-set-2/)
- [https://www.geeksforgeeks.org/lex-program-to-take-input-from-file-and-remove-multiple-spaces-lines-and-tabs/](https://www.geeksforgeeks.org/lex-program-to-take-input-from-file-and-remove-multiple-spaces-lines-and-tabs/)
- [https://www.geeksforgeeks.org/yacc-program-to-implement-a-calculator-and-recognize-a-valid-arithmetic-expression/](https://www.geeksforgeeks.org/yacc-program-to-implement-a-calculator-and-recognize-a-valid-arithmetic-expression/)