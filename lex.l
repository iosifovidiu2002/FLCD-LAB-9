%{
#include <string.h>
#include <stdlib.h>
#include "y.tab.h" // tokens are defined
int line_count = 0; yylType yylval;
%}

%option noyywrap
%x CMNT

DELIM ([ \t:])
WHITESPACES ({DELIM}+)
POSI_DECI ([1-9])
DECI (0|{POSI_DECI})
DECIMAL (0|{POSI_DECI}{DECI}*)
LOWER ([a-z])
UPPER ([A-Z])
LETTER ({LOWER}|{UPPER}|_)
IDENTIFIER ({LETTER}({LETTER}|{DECI})*)
%%

"/*" {BEGIN CMNT;} 
<CMNT>. {;}
<CMNT>\n {++line_count;}
<CMNT>"*/" {BEGIN INITIAL;}
\n {
++line_count;
return (int)'\n';
}

"\'"."\'" {
            yylval.string=(char *)malloc((yyleng+1)*(sizeof(char)));
            strncpy(yylval.string, yytext+1, yyleng-2);
            yylval.string[yyleng-2]='\0';
            return CHAR;
            }

{WHITESPACES} { ; }
func {return FUNC;}
main {return MAIN;}
zilch {return ZILCH;}
read {return READ;}
write {return WRITE;}
var {return VAR;}
final {return FINAL;}
assume {return ASSUME;}
otherwise {return OTHERWISE; }
repeat { return REPEAT; }
parse { return PARSE; }
int { return INT; }
bool { return BOOL; }
char { return CHAR; }

"<=" { 
    yylval.string=(char *)malloc((yyleng+1)*(sizeof(char)));
    strncpy(yylval.string, yytext, yyleng + 1);
    return TWO_BIN_OP;
    }

">=" { 
    yylval.string=(char *)malloc((yyleng+1)*(sizeof(char)));
    strncpy(yylval.string, yytext, yyleng + 1);
    return TWO_BIN_OP;
    }

"==" { 
    yylval.string=(char *)malloc((yyleng+1)*(sizeof(char)));
    strncpy(yylval.string, yytext, yyleng + 1);
    return TWO_BIN_OP;
    }

"!=" { 
    yylval.string=(char *)malloc((yyleng+1)*(sizeof(char)));
    strncpy(yylval.string, yytext, yyleng + 1);
    return TWO_BIN_OP;
    }

\( { return (int)'('; }
\) { return (int)')'; }
\[ { return (int)'['; }
\] { return (int)']'; }
\{ { return (int)'{'; }
\} { return (int)'}'; }
; { return (int)';'; }
, { return (int)','; }
= { return (int)'='; }
"<" { return (int)'<'; }
\> { return (int)'>'; }

"%" {
    yylval.integer = (int)'%';
    return BIN_OP;
    }

"+" {
    yylval.integer = (int)'+';
    return BIN_OP;
    }

"-" {
    yylval.integer = (int)'-';
    return BIN_OP;
    }

"*" {
    yylval.integer = (int)'*';
    return BIN_OP;
    }

"/" {
    yylval.integer = (int)'/';
    return BIN_OP;
    }

and { return AND; }

or { return OR; }

true { return TRUE; }

false { return FALSE;}

{IDENTIFIER} {
    yylval.string=(char *)malloc((yyleng+1)*(sizeof(char)));
    strncpy(yylval.string, yytext, yyleng + 1);
    return ID;
    }

{DECIMAL} {
    yylval.integer = atoi(yytext);
    return NUM;
    }

%%