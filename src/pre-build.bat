cd parsing
win_flex --wincompat lexer.ll 
win_bison -d grammar.y -o grammar.tab.cc
pause