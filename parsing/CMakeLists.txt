if(WIN32)
	add_custom_command(
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lexer.cc
	COMMAND win_flex --wincompat -o  lexer.cc lexer.l
	)


	add_custom_command(
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/parsing/parser.hh ${CMAKE_CURRENT_BINARY_DIR}/parsing/stack.hh ${CMAKE_CURRENT_BINARY_DIR}/parser.cc
	COMMAND win_bison -o parser.cc parser.y
	)
else()
	add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lexer.cc
    COMMAND flex -o  lexer.cc lexer.l
    )
    add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/parsing/parser.hh ${CMAKE_CURRENT_BINARY_DIR}/parsing/stack.hh ${CMAKE_CURRENT_BINARY_DIR}/parser.cc
    COMMAND bison -o parser.cc parser.y
    )
endif()

add_custom_target(generate_lexbison ALL DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/parsing/parser.hh ${CMAKE_CURRENT_BINARY_DIR}/parsing/stack.hh ${CMAKE_CURRENT_BINARY_DIR}/parser.cc)

add_library(NilangParsing
	lexer.cc
	parser.cc
)
add_dependencies(NilangParsing generate_lexbison)
