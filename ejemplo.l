%option noyywrap
%{   
%}
delim [ \t\n]
ws {delim}+
letra [A-Za-z]
digito [0-9]
id ({letra}|_)({letra}|{digito}|_)*
numero {digito}+(\.{digito}+)?(E[+−]?{digito}+)?
select [Ss][Ee][Ll][Ee][Cc][Tt]
from [Ff][Rr][Oo][Mm]
where [Ww][Hh][Ee][Rr][Ee]
%%

{ws} {}
{select} { printf("PC: %s\n",yytext);}
{from} { printf("PC: %s\n",yytext);}
{where} { printf("PC: %s\n",yytext);}
"," { printf("SIGNO: ,\n");}
"<" { printf("OPREL: <\n");}
">" { printf("OPREL: >\n");}
"<=" { printf("OPREL: <=\n");}
">=" { printf("OPREL: >=\n");}
"<>" { printf("OPREL: <>\n");}
"=" { printf("OPREL: =\n");}
{id} { 
    printf("ID: %s\n", yytext);
}
{numero} { 
    printf("Numero: %s\n", yytext);
}
. { printf("Token desconocido: %s\n", yytext); }

%%
int main()
{
    yyin = fopen("texto.txt", "r");
    yylex();
    fclose(yyin);
    return 0;
}