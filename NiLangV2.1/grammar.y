%{
#include <cstdio>
#include <iostream>
#include "tokens.h"
using namespace std;

extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;

void yyerror(const char *s);
%}

%union {
	long num;
	double dub;
	char* str;
}

%token DEF


%token <num> INT
%token <dub> DOUBLE
%token <str> IDENTIFIER
%token <str> STRING

%%

start:
