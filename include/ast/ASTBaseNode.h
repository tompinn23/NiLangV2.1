#ifndef  AST_BASE_NODE_H
#define AST_BASE_NODE_H

class Visitor;

namespace AST {
	class ASTNode {
	public:
		virtual ASTNode accept(Visitor &vistor);

	};
}

#endif // ! AST_BASE_NODE_H
