%skeleton "lalr1.cc" /* -*- C++ -*- */
%require "3.0"
%defines
%define parser_class_name { Parser }

%define api.token.constructor
%define api.value.type variant
%define parse.assert
%define api.namespace { Ni }
%code requires
{
#include <iostream>
#include <string>
#include "tokens.h"
#include "../ast/AST.h"
using namespace std;


void yyerror(const char *s);

namespace Ni {
	class Lexer;
}

%}

%code top
{
	#include <iostream>
	#include "lexer.h"
	#include "parser.h"

	static Ni::Parser::symbol_type yylex(Ni:Lexer &lexer {
		return lexer.get_next_token();
	}

	using namespace Ni;
}

%lex-param { Ni::Lexer &lexer }

%define parse.trace
%define parse.error verbose
%define api.token.prefix {TOKEN_}

%token DEF
%token EOF 0


%token <long> INT
%token <double> DOUBLE
%token <std::string> IDENTIFIER
%token <std::string> STRING

%type <AST::Types> ty
%type <AST::ASTNode> item_dec
%type <AST::ASTNode> expr

%start program

%%

program
: item
;

item
: item_dec
;

item_dec
: ty IDENTIFIER '=' expr {$$ = AST::DeclarationNode($1, $2);}
;

ty
: %empty

expr: 
%empty
%%

void Ni::Parser::error(const std::string &message)
{
	cout << "Error: " << message << endl;

}
