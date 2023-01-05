# How to generate a lexical scanner using ___flex___
## Step 1
```
flex lex.l
```
## Step 2
```
cc -Wall -c lex.yy.c
```
## Step 3
```
cc -Wall lex.c lex.yy.o
```
## Step 4
```
./a.out < input > out
```

