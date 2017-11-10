cd parsing
win_flex --wincompat lexer.l 
win_bison -d -o parser.cc grammar.y 
pause