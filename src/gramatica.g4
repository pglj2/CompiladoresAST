grammar gramatica;

goal : mainClass ( classDeclaration )* EOF;

mainClass : 'class' Identifier '{' 'public' 'static' 'void' 'main' '(' 'String' '[' ']' 
		Identifier ')' '{' Statement '}' '}';
	
classDeclaration :  'class' Identifier ('extends' Identifier)? '{' (varDeclaration)*
	( methodDeclaration )* '}' ;

varDeclaration : type Identifier ';' ;

methodDeclaration : 'public' type Identifier '(' (type Identifier (',' type Identifier)*)? ')'
	'{' (varDeclaration)* (statement)* 'return' expression ';' '}' ;
	
Type : 'int' '[' ']'
	    | 'boolean'
	    | 'int'
	    | Identifier ;
	

statement : '{' (statement)* '}'
	        | 'if' '(' expression ')' statement 'else' statement
	        | 'while' '(' expression ')' statement
	        | 'System.out.println' '(' expression ')'';'
	        | Identifier '=' expression ';'
	        | Identifier '[' expression ']' '=' expression ';'
	        ;

expression : 
          | expression ( '&&' | '<' | '+' | '-' | '*' ) expression
          | expression '[' expression ']'
          | expression '.' 'length'
          | expression '.' Identifier '(' ( expression ( ',' expression )* )? ')'
          | INTEGER_LITERAL
          | 'true'
          | 'false'
          | Identifier
          | 'this'
          | 'new' 'int' '[' expression ']'
          | 'new' Identifier '(' ')'
          | '!' expression
          | '(' expression ')' 
          ;

Identifier : [a-zA-Z]+;
INTEGER_LITERAL : [0-9]+;
ESPACOS: [' \r\n\t']+ ->skip;


