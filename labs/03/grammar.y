%{
#include <stdio.h>
void yyerror(char *);
int yylex(void);
%}

%token ARTICLE NOUN VERB PREP

%%

sentence: noun_phrase verb_phrase { printf("PASS\n"); }
        | error { printf("FAIL\n"); }

noun_phrase: cmplx_noun
           | cmplx_noun prep_phrase

verb_phrase: cmplx_verb
            | cmplx_verb prep_phrase

prep_phrase: PREP cmplx_noun

cmplx_noun: ARTICLE NOUN

cmplx_verb: VERB
          | VERB noun_phrase

%%

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}

