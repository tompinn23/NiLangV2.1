%{
#include <iostream>
#include <fstream>
#include "tokens.h"
using namespace std;;
%}

%option yylineno
%option stack
%option noyywrap
%option outfile="lexer.cc"

nums [0-9]+
ident [a-zA-Z][a-zA-Z0-9]+
string  \"[^\n"]+\"


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

true { yylval.bol = true;
	return BOOL;
}

false { yylval.bol = false;
	return BOOL;
}


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
	yylval.num = atoi(yytext);
	return INT;
}

[0-9]+\.[0-9]* {
	yylval.dub = atof(yytext);
	return DOUBLE;
}

{ident} {
	yylval.str = strdup(yytext);
	return IDENTIFIER;
}

{string} {
	yylval.str = strdup(yytext);
	return STRING;
}





<<EOF>> { return 0; }

%%

