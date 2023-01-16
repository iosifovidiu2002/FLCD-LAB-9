# How to use ___flex___ with ___yacc___
## Step 1
```
yacc -d parser.y
```
## Step 2
```
lex lex.l
```
## Step 3
```
cc lex.yy.c y.tab.c -o bas.exe
```
## Step 4
```
./bas.exe my_program.mini
```

