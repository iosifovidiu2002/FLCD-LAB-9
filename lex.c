#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

int main(){
    int s;
    while((s=yylex()))
        printf("%d\n",s);
    return 0;
}