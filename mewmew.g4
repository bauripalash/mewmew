grammar mewmew;

prog: stmts
    ;

stmts: command+
    ;

command: assign
       | print
       | ifLoop
       | ifElseLoop
       | repeat
       ;

assign:   ID '=' expr ';'        # assignExpr
        | ID '=' expr { notifyErrorListeners("Missing ';' at Assignment statement"); } # assignExprNoSemi
        ;

print:    '::' expr ';'           # printExpr
        | '::' expr               { notifyErrorListeners("Missing ';' at Meow Say statement"); } # printExprNoSemi
        ;

ifLoop:   expr '?' stmts ';' # ifExpr
        | expr '?' stmts { notifyErrorListeners("Missing ';' at If statement"); } # ifExprNoSemi
        ;

ifElseLoop:   expr '?' stmts ':' stmts ';' # ifElseExpr
            | expr '?' stmts ':' stmts {notifyErrorListeners("Missing ';' at If else statement");} # ifElseExprNoSemi
            ;

repeat:   '@' expr ':' stmts ';' #repeatExpr
        | '@' expr ':' stmts { notifyErrorListeners("Missing ';' at Meow Loop statement"); } #repeatExprNoSemi
        ;

expr: '~' expr                  # absExpr
    | '-' expr                  # unaryExpr
    | SCRATCH '(' expr ')'      # scratchExpr
    | expr '**' expr            # PowExpr
    | expr op=('*' | '/') expr  # MulDivExpr
    | expr op=('+' | '-') expr  # AddSubExpr
    | expr '%' expr             # modExpr
    | expr '<' expr             # ltExpr
    | expr '>' expr             # gtExpr
    | expr '<=' expr            # leExpr
    | expr '>=' expr            # geExpr
    | expr '==' expr            # eqExpr
    | expr '!=' expr            # neExpr
    | expr '&' expr             # andExpr
    | expr '|' expr             # orExpr
    | '(' expr ')'              # parensExpr
    | MEWNUMBER                 # numExpr
    | ID                        # idExpr
    ;

MUL : '*' ;

DIV : '/' ;

ADD : '+' ;

SUB : '-' ;

SCRATCH : [#]+ ;



COMMENT : '//' .*? '\n' -> skip;

MEWNUMBER : ([m][e][w])+ ('.' ([m][e][w])+)? ;

ID : ([m][w_]*)+;

WS : [ \t\r\n]+ -> skip;
