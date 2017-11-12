#ifndef VISITOR_H
#define VISITOR_H
#include "../ast/ASTBaseNode.h"
using namespace AST;
class Parser;
class Visitor {
public:
	Visitor(Parser &parser);
	ASTNode Visit(ASTNode *node);
};
#endif // !VISITOR_H
