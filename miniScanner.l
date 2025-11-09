%{
#include <stdio.h>
int line_num = 1;
%}

%option noyywrap

%%

"agar"        { printf("Line %d: KEYWORD -> agar\n", line_num); }
"warna"       { printf("Line %d: KEYWORD -> warna\n", line_num); }
"jabtak"      { printf("Line %d: KEYWORD -> jabtak\n", line_num); }
"dohrana"     { printf("Line %d: KEYWORD -> dohrana\n", line_num); }
"likho"       { printf("Line %d: KEYWORD -> likho\n", line_num); }
"pao"         { printf("Line %d: KEYWORD -> pao\n", line_num); }
"kaam"        { printf("Line %d: KEYWORD -> kaam\n", line_num); }
"wapas"       { printf("Line %d: KEYWORD -> wapas\n", line_num); }
"jab"         { printf("Line %d: KEYWORD -> jab\n", line_num); }
"hal"         { printf("Line %d: KEYWORD -> hal\n", line_num); }
"rukjao"      { printf("Line %d: KEYWORD -> rukjao\n", line_num); }
"jari"        { printf("Line %d: KEYWORD -> jari\n", line_num); }
"agarbhi"     { printf("Line %d: KEYWORD -> agarbhi\n", line_num); }
"shuru"       { printf("Line %d: KEYWORD -> shuru\n", line_num); }
"khatam"      { printf("Line %d: KEYWORD -> khatam\n", line_num); }

"Adad"        { printf("Line %d: DATATYPE -> Adad\n", line_num); }
"ChhotaAdad"  { printf("Line %d: DATATYPE -> ChhotaAdad\n", line_num); }
"BaraAdad"    { printf("Line %d: DATATYPE -> BaraAdad\n", line_num); }
"Harf"        { printf("Line %d: DATATYPE -> Harf\n", line_num); }
"Jumla"       { printf("Line %d: DATATYPE -> Jumla\n", line_num); }
"Haqeeqat"    { printf("Line %d: DATATYPE -> Haqeeqat\n", line_num); }
"Khali"       { printf("Line %d: DATATYPE -> Khali\n", line_num); }

"==="         { printf("Line %d: OPERATOR -> ===\n", line_num); }
"="           { printf("Line %d: OPERATOR -> =\n", line_num); }
"+"           { printf("Line %d: OPERATOR -> +\n", line_num); }
"-"           { printf("Line %d: OPERATOR -> -\n", line_num); }
"*"           { printf("Line %d: OPERATOR -> *\n", line_num); }
"/"           { printf("Line %d: OPERATOR -> /\n", line_num); }
"&&"          { printf("Line %d: OPERATOR -> &&\n", line_num); }

";"           { printf("Line %d: PUNCTUATION -> ;\n", line_num); }
"{"           { printf("Line %d: PUNCTUATION -> {\n", line_num); }
"}"           { printf("Line %d: PUNCTUATION -> }\n", line_num); }
"("           { printf("Line %d: PUNCTUATION -> (\n", line_num); }
")"           { printf("Line %d: PUNCTUATION -> )\n", line_num); }

[0-9]+([.][0-9]+)?([eE][+-]?[0-9]+)? { printf("Line %d: NUMBER -> %s\n", line_num, yytext); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("Line %d: IDENTIFIER -> %s\n", line_num, yytext); }
\'([^\\\n]|(\\.))\'    { printf("Line %d: CHAR_LITERAL → %s\n", line_num, yytext); }
\"([^\\\n]|(\\.))*\"    { printf("Line %d: STRING_LITERAL → %s\n", line_num, yytext); }
"["     { printf("Line %d: PUNCTUATION → [\n", line_num); }
"]"     { printf("Line %d: PUNCTUATION → ]\n", line_num); }
"<="    { printf("Line %d: OPERATOR → <=\n", line_num); }
">="    { printf("Line %d: OPERATOR → >=\n", line_num); }
"<"     { printf("Line %d: OPERATOR → <\n", line_num); }
">"     { printf("Line %d: OPERATOR → >\n", line_num); }
"=="    { printf("Line %d: OPERATOR → ==\n", line_num); }
"!="    { printf("Line %d: OPERATOR → !=\n", line_num); }
","     { printf("Line %d: PUNCTUATION → ,\n", line_num); }

\n { line_num++; }

[ \t]+ { /* ignore whitespace */ }

. { printf("Line %d: ERROR -> %s\n", line_num, yytext); }

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}

