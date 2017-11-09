#include "AST.h"

using namespace AST;

AST::DeclarationNode::DeclarationNode(Types ty, std::string name, IntNode * v)
{
	varType = ty;
	val = v;
}

AST::DeclarationNode::DeclarationNode(Types ty, std::string name, DoubleNode * v)
{
	varType = ty;
	val = v;
}

AST::DeclarationNode::DeclarationNode(Types ty, std::string name, StringNode * v)
{
	varType = ty;
	val = v;
}

ASTNode * AST::DeclarationNode::GetValue()
{
	switch (varType)
	{
	case Types::INT:
		return (IntNode*)val;
	case Types::DOUBLE:
		return (DoubleNode*)val;
	case Types::STRING:
		return (StringNode*)val;
	}
}
