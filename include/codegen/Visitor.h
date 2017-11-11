#ifndef VISITOR_H
#define VISITOR_H
#include "../ast/ASTBaseNode.h"
using namespace AST;
class Visitor {
public:
	Visitor();
	ASTNode Visit(ASTNode *node);
};
#endif // !VISITOR_H
