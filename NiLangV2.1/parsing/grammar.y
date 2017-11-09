%{
#include <iostream>
#include "tokens.h"
using namespace std;


void yyerror(const char *s);
%}

%require "2.3"

/* add debug output code to generated parser. disable this for release
 * versions. */
%debug

/* start symbol is named "start" */
%start start

/* write out a header file containing the token defines */
%defines

/* use newer C++ skeleton file */
%skeleton "lalr1.cc"


%union {
	long num;
	bool bol;
	double dub;
	char* str;
	AST::Type* type;
	class ASTNode* node;
}

%token DEF


%token <num> INT
%token <dub> DOUBLE
%token <str> IDENTIFIER
%token <str> STRING
%type <type> ty
%type <node> item_dec
%type <node> expr

%%

start
: item
;

item
: item_dec
;

item_dec
: ty IDENTIFIER '=' expr {$$ = ExpressionNode()}
;

ty
: %empty

expr: 
%empty
%%