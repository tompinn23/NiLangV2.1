%{
#include <ctype.h>
#include <stdio.h>
#include <iostream>
#include <fstream>
#include "tokens.h"
using namespace std;;
%}

%option yylineno
%option stack
%option noyywrap
%option outfile="lexer.cpp"


nums [0-9]+
ident [a-zA-Z][a-zA-Z0-9]+


%%


[ \n\t\r] { }

def { return DEF; }
return { return RETURN; }
class {return CLASS; }
pub { return PUB; }
this { return THIS; }
if { return IF; }
else { return ELSE; }
elif { return ELIF; }
switch { return SWITCH; }
case { return CASE; }
interface { return INTERFACE; }
override { return OVERRIDE; }
extends { return EXTENDS; }
implements { return IMPLEMENTS; }

type { return TYPE; }

; { return END_STATEMENT; }


-    { return '-'; }
-= { return MINUSEQ; }
\+   { return '+'; }
\+=  { return PLUSEQ; }
\*   { return '*'; }
\*=  { return MULEQ; }
\/   { return '/'; }
\/= { return DIVEQ; }

==    { return EQEQ; }
=     { return '='; }
\!=   { return NE; }
\!    { return '!'; }
\<=   { return LE; }
\<    { return '<'; }
\>=   { return GE; }
\> { return '>'; }
&& {return ANDAND; }
& { return '&'; }
\|\| { return OROR; }
\| { return '|'; }

{nums} {
	yylval.num = atol(yytext);
	return INT;
}

{nums}+\.+{nums}
{
	yylval.dub = atof(yytext);
	return DOUBLE;
}

{ident} {
	yylval.str = strdup(yytext);
	return IDENTIFIER;
	}



<<EOF>> { return 0; }

%%



int main(int, char**) {
	FILE *myfile = fopen("test.ni", "r");
	if(!myfile)
	{
		cerr << "Couldn't open file" << endl;
		perror("test.ni");
		return -1;
	}
	yyin = myfile;
	// lex through the input:
	yylex();
	
}