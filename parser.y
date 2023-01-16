%{
    #include<stdio.h>
    #include<stdlib.h>

    #define YYDEBUG 1
%}

%token FUNC;
%token MAIN;
%token ZILCH;
%token READ;
%token WRITE;
%token VAR;
%token FINAL;
%token ASSUME;
%token OTHERWISE;
%token REPEAT;
%token PARSE;
%token ID;
%token CHARACTER;
%token INT;
%token BOOL;
%token CHAR;
%token NUM;
%token LTE;
%token GTE;
%token EQ;
%token NEQ;
%token OPENBRACKET;
%token CLOSEBRACKET;
%token OPENEDGEBRACKET;
%token CLOSEEDGEBRACKET;
%token OPENCURLYBRACKET;
%token CLOSECURLYBRACKET;
%token SEMICOLON;
%token COMMA;
%token COLON;
%token ASSIGN;
%token LT;
%token GT;
%token MOD;
%token ADD;
%token SUB;
%token MUL;
%token DIV;
%token AND;
%token OR;
%token TRUE;
%token FALSE;

%start Program

%%
Program : FUNC MAIN OPENBRACKET CLOSEBRACKET COLON ZILCH OPENCURLYBRACKET Statement_List CLOSECURLYBRACKET {printf("func main () : zilch { Statement_List }\n");};
Statement_List : Statement {printf("Statement_List -> Statement\n");} | Statement Statement_List {printf("Statement_List -> Statement \\n Statement_List");};
Statement : Simple_Statement {printf("Statement -> Simple_Statement\n");} | Structure_Statement {printf("Statement -> Structure_Statement\n");};
Simple_Statement : Var_Assign_Declaration {printf("Simple_Statement -> Var_Assign_Declaration\n");}
                | Final_Assing_Declaration {printf("Simple_Statement -> Final_Assign\n");} 
                | Declaration {printf("Simple_Statement -> Declatation\n");} 
                | Assign {printf("Assign\n");} 
                | IO_Statement {printf("IO_Statement\n");};
Structure_Statement : Parse_Statement {printf("Parse_Statement\n");} 
                | Assume_Statement {printf("Assume_Statement\n");} 
                | Repeat_Statement {printf("Repeat_Statement\n");};
Assume_Statement : ASSUME OPENBRACKET Bool_Expression CLOSEBRACKET OPENCURLYBRACKET Statement_List CLOSECURLYBRACKET {printf("assume ( Bool_Expression ) { Statement_List }\n");} 
                | ASSUME OPENBRACKET Bool_Expression CLOSEBRACKET OPENCURLYBRACKET Statement_List CLOSECURLYBRACKET OTHERWISE OPENCURLYBRACKET Statement_List CLOSECURLYBRACKET {printf("assume ( Bool_Expression ) { Statement_List } otherwise { Statement_List }\n");}; 
Repeat_Statement : REPEAT OPENBRACKET Bool_Expression CLOSEBRACKET OPENCURLYBRACKET Statement_List CLOSECURLYBRACKET {printf("repeat_statement -> repeat ( bool_expression ) { statement_list }");};
Parse_Statement : PARSE OPENBRACKET Var_Assign_Declaration COLON Bool_Expression COLON Int_Expression CLOSEBRACKET OPENCURLYBRACKET Statement_List CLOSECURLYBRACKET {printf("parse_statement -> parse ( var_assign_declaration : bool_expression : int_expression ) { statement_list }\n");};
Expression : Int_Expression {printf("Expression -> Int_Expression\n");} 
                | Bool_Expression {printf("Expression -> Bool_Expression\n");};
Constant : CHARACTER {printf("Constant -> Character\n");} 
                | NUM {printf("Constant -> Number");};
Bool_Expression : OPENBRACKET Bool_Expression AND Bool_Expression CLOSEBRACKET {printf("Bool_Expression -> Bool_Expression and Bool_Expression\n");}
                | OPENBRACKET Bool_Expression OR Bool_Expression CLOSEBRACKET {printf("Bool_Expression -> Bool_Expression or Bool_Expression\n");}
                | OPENBRACKET Bool_Expression EQ Bool_Expression CLOSEBRACKET {printf("Bool_Expression -> Bool_Expression == Bool_Expression\n");}
                | OPENBRACKET Bool_Expression NEQ Bool_Expression CLOSEBRACKET {printf("Bool_Expression -> Bool_Expression != Bool_Expression\n");}
                | Int_Expression LT Int_Expression {printf("Bool_Expression -> Int_Expression < Int_Expression\n");}
                | Int_Expression GT Int_Expression {printf("Bool_Expression -> Int_Expression > Int_Expression\n");}
                | Int_Expression EQ Int_Expression {printf("Bool_Expression -> Int_Expression == Int_Expression\n");}
                | Int_Expression NEQ Int_Expression {printf("Bool_Expression -> Int_Expression != Int_Expression\n");}
                | Int_Expression LTE Int_Expression {printf("Bool_Expression -> Int_Expression <= Int_Expression\n");}
                | Int_Expression GTE Int_Expression {printf("Bool_Expression -> Int_Expression >= Int_Expression\n");};
Int_Expression : ID {printf("Int_Expression -> ID\n");}
                | Constant {printf("Constant\n");}
                | ID OPENEDGEBRACKET ID CLOSEEDGEBRACKET {printf("Int_Expression -> ID[ID]\n");}
                | ID OPENEDGEBRACKET Constant CLOSEEDGEBRACKET {printf("Int_Expression -> ID[Constant]\n");}
                | OPENBRACKET Int_Expression ADD Int_Expression CLOSEBRACKET {printf("Int_Expression -> Int_Expression + Int_Expression\n");}
                | OPENBRACKET Int_Expression SUB Int_Expression CLOSEBRACKET {printf("Int_Expression -> Int_Expression - Int_Expression\n");}
                | OPENBRACKET Int_Expression DIV Int_Expression CLOSEBRACKET {printf("Int_Expression -> Int_Expression / Int_Expression\n");}
                | OPENBRACKET Int_Expression MUL Int_Expression CLOSEBRACKET {printf("Int_Expression -> Int_Expression * Int_Expression\n");}
                | OPENBRACKET Int_Expression MOD Int_Expression CLOSEBRACKET {printf("Int_Expression -> Int_Expression mod Int_Expression\n");};
Declaration : Var_Declaration {printf("Declaration -> Var_Declaration\n");} | Final_Declaration {printf("Declaration -> Final_Declaration\n");};
Var_Declaration : VAR ID COLON Type {printf("Declaration -> var ID : type\n");};
Final_Declaration : FINAL ID COLON Type {printf("Declaration -> var ID : type\n");};
Final_Assing_Declaration : Final_Declaration ASSIGN Expression {printf("Final_Assing_Declaration -> final id : Type = Expression\n");};
Var_Assign_Declaration : Var_Declaration ASSIGN Expression {printf("Var_Assign_Declaration -> Declaration = Expression\n");};
Assign : ID ASSIGN Expression {printf("ID = Expression\n");} | ID OPENEDGEBRACKET ID CLOSEEDGEBRACKET ASSIGN Expression {printf("ID = Expression\n");};
Type : Atom_Type {printf("Atom_Type\n");} | Array_Type {printf("Array_Type\n");};
Atom_Type : INT {printf("int\n");}| BOOL {printf("bool\n");} | CHAR {printf("char\n");};
Array_Type : Atom_Type OPENEDGEBRACKET Constant CLOSEEDGEBRACKET {printf("Atom_Type [ Constant ] \n");} | Atom_Type OPENEDGEBRACKET ID CLOSEEDGEBRACKET {printf("Atom_Type [ ID ]\n");};
IO_Statement : READ OPENBRACKET ID CLOSEBRACKET {printf("read(ID)\n");} 
                | WRITE OPENBRACKET ID CLOSEBRACKET {printf("write(id)\n");} 
                | READ OPENBRACKET Constant CLOSEBRACKET {printf("read(ID)\n");} 
                | WRITE OPENBRACKET Constant CLOSEBRACKET {printf("write(id)\n");};
%%

yyerror(char *s)
{	
	printf("%s\n",s);
}

extern FILE *yyin;

main(int argc, char **argv)
{
	if(argc>1) yyin =  fopen(argv[1],"r");
	if(!yyparse()) fprintf(stderr, "\tOK\n");
} 