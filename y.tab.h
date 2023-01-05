#ifndef _Y_TAB_H
#define _Y_TAB_H
#define ASSUME 300
#define OTHERWISE 301
#define REPEAT 302
#define PARSE 303
#define INT 304
#define ID 306
#define NUM 307
#define CHAR 308
#define BOOL 309
#define BIN_OP 310
#define TWO_BIN_OP 322
#define AND 311
#define OR 312
#define ZILCH 313
#define READ 314
#define WRITE 315
#define VAR 316
#define FINAL 317
#define TRUE 318
#define FALSE 319
#define FUNC 320
#define MAIN 321

int yylex(void);
typedef union {
char *string;
int integer;
} yylType;

#endif