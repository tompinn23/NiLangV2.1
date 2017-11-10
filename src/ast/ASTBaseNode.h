#ifndef  AST_BASE_NODE_H
#define AST_BASE_NODE_H
#include "../codegen/Visitor.h"
namespace AST {
	class ASTNode {
	public:
		virtual ASTNode accept(Visitor &vistor);

	};
}

#endif // ! AST_BASE_NODE_H
