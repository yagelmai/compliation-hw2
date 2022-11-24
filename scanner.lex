%{

/* Declarations section */
#include "tokens.hpp"
#include <stdio.h>
#include "output.hpp"
#include "parser.tab.hpp"
void showToken(char *);
%}

%option yylineno
%option noyywrap
digit   		([0-9])
letter  		([a-zA-Z])
whitespace		([\t\n\r ])
es              (\x5C\x5C|\x5C\x22|\x5C\x6E|\x5C\x72|\x5C\x74|\x5C\x30|\x5C\x78[0-9A-F][0-9A-F])
binop [(\+|\-|\*|\/)]
%%

void                        return VOID;
int                         return INT;
byte                        return BYTE;
b                           return B;
bool                        return BOOL;
and                         return AND;
or                          return OR;
not                         return NOT;
true                        return TRUE;
false                       return FALSE;
return                      return RETURN;
if                          return IF;
else                        return ELSE;
while                       return WHILE;
break                       return BREAK;
continue                    return CONTINUE;
;                           return SC;
\,                          return COMMA;
\(                          return LPAREN;
\)                          return RPAREN;
\{                          return LBRACE;
\}                          return RBRACE;
=                           return ASSIGN;
(<|>|<=|>=)                 return RELATIONAL;
(==|!=)              		return EQUALITY;
(\*|\/)                     return MULTIPLICATIVE;
(\+|-)					    return ADDITIVE;
[a-zA-Z][a-zA-Z0-9]*		return ID;
[1-9][0-9]*|0				return NUM;
\"([^\\\n\r\"]|{es})*\\.([^\\\n\r\"]|{es})*\" 		return STRING;



\/\/[^\r\n]*                return COMMENT;
\"([^\\\n\r\"]|{es})*\"     return STRING;
\"([^\\\n\r\"]|{es})*       printf("Error unclosed string\n");exit(0);
\"([^\\\n\r\"]|{es})*\\.([^\\\n\r\"]|{es})*\"      return STRING;//printundef();exit(0);
{whitespace}				return -1;
.		printf("Error %s\n",yytext);exit(0);

%%
