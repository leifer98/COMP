1 INT int
1 ID main
1 LPAREN (
1 RPAREN )
2 LBRACE {
3 BYTE byte
3 ID x
3 ASSIGN =
3 NUM_B 0b
3 SC ;
4 BYTE byte
4 ID x
4 ASSIGN =
4 NUM_B 18b
4 SC ;
5 BOOL bool
5 ID y
5 ASSIGN =
5 TRUE true
5 SC ;
6 ID y
6 ASSIGN =
6 FALSE false
6 SC ;
7 ID y
7 ASSIGN =
7 TRUE true
7 AND and
7 FALSE false
7 SC ;
8 ID y
8 ASSIGN =
8 TRUE true
8 OR or
8 FALSE false
8 SC ;
9 ID y
9 ASSIGN =
9 NOT not
9 TRUE true
9 SC ;
10 WHILE while
10 LPAREN (
10 ID y
10 RPAREN )
10 LBRACE {
10 IF if
10 LPAREN (
10 ID y
10 RPAREN )
10 LBRACE {
10 BREAK break
10 SC ;
10 RBRACE }
10 ELSE else
10 LBRACE {
10 CONTINUE continue
10 SC ;
10 RBRACE }
10 RBRACE }
11 BOOL bool
11 ID z
11 ASSIGN =
11 ID x
11 RELOP ==
11 ID y
11 SC ;
12 ID z
12 ASSIGN =
12 ID x
12 RELOP !=
12 ID y
12 SC ;
13 ID z
13 ASSIGN =
13 ID x
13 RELOP <
13 ID y
13 SC ;
14 ID z
14 ASSIGN =
14 ID x
14 RELOP >
14 ID y
14 SC ;
15 ID z
15 ASSIGN =
15 ID x
15 RELOP <=
15 ID y
15 SC ;
16 ID z
16 ASSIGN =
16 ID x
16 RELOP >=
16 ID y
16 SC ;
17 INT int
17 ID w
17 ASSIGN =
17 ID x
17 BINOP +
17 ID x
17 SC ;
18 ID w
18 ASSIGN =
18 ID x
18 BINOP -
18 ID x
18 SC ;
19 ID w
19 ASSIGN =
19 ID x
19 BINOP *
19 ID x
19 SC ;
20 ID w
20 ASSIGN =
20 ID x
20 BINOP /
20 ID x
20 SC ;
21 COMMENT //
22 COMMENT //
23 INT int
23 NUM 12
23 ID AB
23 ASSIGN =
23 NUM 0
23 SC ;
25 INT int
25 NUM 42
25 ASSIGN =
25 NUM 1
25 SC ;
26 COMMENT //
27 INT int
27 ID OO7
27 ASSIGN =
27 NUM 3
27 SC ;
28 INT int
28 ID max
28 ASSIGN =
28 NUM 4
28 SC ;
29 ID printf
29 LPAREN (
ERROR: Undefined escape sequence \\
