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

assign : ID '=' expr ';'        # assignExpr
           ;

print : '::' expr ';'           # printExpr
          ;

ifLoop    : expr '?' stmts ';' # ifExpr
            ;

ifElseLoop : expr '?' stmts ':' stmts ';' # ifElseExpr
            ;

repeat : '@' expr ':' stmts ';' #repeatExpr
            ;

expr: '~' expr                  # absExpr
    | '-' expr                  # unaryExpr
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
    | '(' expr ')'              # parensExpr
    | NUM                       # numExpr
    | ID                        # idExpr
    ;

MUL : '*' ;
DIV : '/' ;
ADD : '+' ;
SUB : '-' ;

COMMENT : '//' .*? '\n' -> skip;
NUM : '0'? [mew]+;
ID : ('m' | 'w' | '_')+;
WS : [ \t\r\n]+ -> skip;
