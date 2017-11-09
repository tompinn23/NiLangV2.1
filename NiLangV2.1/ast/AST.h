#ifndef AST_H
#define AST_H
#include <string> 
#include <cstdarg>

#include "ASTBaseNode.h"
#include "ASTTypes.h"
#include "../Visitor.h"


namespace AST
{

enum Types 
{
	INT,
	DOUBLE,
	BOOL,
	STRING,
};

class DeclarationNode : public ASTNode {
public:
	DeclarationNode(Types ty, std::string name, IntNode* v);
	DeclarationNode(Types ty, std::string name, DoubleNode* v);
	DeclarationNode(Types ty, std::string name, StringNode* v);
	ASTNode* GetValue();

private:
	Types varType;
	ASTNode* val;
};

};

#endif // !AST_H
