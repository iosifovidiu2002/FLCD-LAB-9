#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
extern yylType yylval;
int main(){
    int s;
    while((s=yylex()))
    switch(s) {
        case '\n': 
            printf("\n");
            break;
        case '(' : 
            printf("<(> ");
            break;
        case ')' : 
            printf("<)> ");
            break;
        case '[' : 
            printf("<(> ");
            break;
        case ']' : 
            printf("<)> ");
            break;
        case '{' : 
            printf("<{> ");
            break;
        case '}' : 
            printf("<}> ");
            break;
        case ';' : 
            printf("<;> ");
            break;
        case ',' : 
            printf("<,> ");
            break;
        case '=' : 
            printf("<=> ");
            break;
        case '<' : 
            printf("<<> ");
            break;
        case BIN_OP :
            printf("<BIN_OP, %c> ", (char) yylval.integer);
            break;
        case TWO_BIN_OP:
            printf("<TWO_BIN_OP, %s> ", yylval.string);
            free (yylval.string);
            break;
        case '>' : 
            printf("<>> ");
            break; 
        case ASSUME : 
            printf("<assume> ");
            break;
        case OTHERWISE : 
            printf("<otherwise> ");
            break;
        case REPEAT : 
            printf("<repeat> ");
            break;
        case PARSE : 
            printf("<parse> ");
            break;
        case INT : 
            printf("<int> ");
            break;
        case ID : 
            printf("<ID, %s> ", yylval.string);
            free (yylval.string);
        break;
        case NUM : 
            printf("<NUM, %d> ",yylval.integer);
            break;
        case CHAR : 
            printf("<CHAR, %s> ", yylval.string);
            break;
        case BOOL : 
            printf("<bool> ");
            break;
        case TRUE : 
            printf("<true> ");
            break;
        case FALSE : 
            printf("<false> ");
            break;
        case FUNC : 
            printf("<func> ");
            break;
        case MAIN : 
            printf("<main> ");
            break;
        case ZILCH : 
            printf("<zilch> ");
            break;
        case READ : 
            printf("<read> ");
            break;
        case WRITE : 
            printf("<write> ");
            break;
        case VAR : 
            printf("<var> ");
            break;
        case FINAL : 
            printf("<final> ");
            break;
        case AND : 
            printf("<and> ");
            break;
        case OR : 
            printf("<or> ");
            break;
        default: ;
    }
    return 0;
}