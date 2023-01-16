%{
#include <string.h>
#include <stdlib.h>
#include "y.tab.h" // tokens are defined
int line_count = 0;
%}

%option noyywrap
%x CMNT

DELIM ([ \t\n])
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

"\'"."\'" {
            return CHARACTER;
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
    return LTE;
    }

">=" { 
    return GTE;
    }

"==" { 
    return EQ;
    }

"!=" { 
    return NEQ;
    }

\( { return OPENBRACKET; }
\) { return CLOSEBRACKET; }
\[ { return OPENEDGEBRACKET; }
\] { return CLOSEEDGEBRACKET; }
\{ { return OPENCURLYBRACKET; }
\} { return CLOSECURLYBRACKET; }
; { return SEMICOLON; }
, { return COMMA; }
= { return ASSIGN; }
"<" { return LT; }
\> { return GT; }
":" { return COLON;}
"%" {
    return MOD;
    }

"+" {
    return ADD;
    }

"-" {
    return SUB;
    }

"*" {
    return MUL;
    }

"/" {
    return DIV;
    }

and { return AND; }

or { return OR; }

true { return TRUE; }

false { return FALSE;}

{IDENTIFIER} {
    return ID;
    }

{DECIMAL} {
    return NUM;
    }

%%