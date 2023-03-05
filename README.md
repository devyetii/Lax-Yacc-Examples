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