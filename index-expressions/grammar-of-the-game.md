

# Lexer Tokens
```
+------------------+------------------------+--------------------------------------------+
| Token            |  Pattern               |  Notes                                     |
+------------------+------------------------+--------------------------------------------+
| NUMBER           |  [0-9]+                |  Non-negative integers                     |
| IDENT            |  [a-zA-Z][a-zA-Z0-9]*  |  No underscores (reserved for size-labels) |
| COMPOSE          |  o / ∘                 |  Keyword priority 5 — o is reserved        |
| INVERSE          |  ^-1 / ⁻¹              |  Postfix operator                          |
| TWIST            |  :                     |                                            |
| TILDE            |  ~                     |  Product operator                          |
| USCORE           |  _                     |  Size-label separator                      |
| LBRACK / RBRACK  |  [ / ]                 |                                            |
| LPAREN / RPAREN  |  ( / )                 |  Highest precedence grouping               |
| COMMA            |  ,                     |                                            |
| DOTDOT           |  ..                    |  Inclusive range separator                 |
| EQ               |  =                     |  Assignment                                |
| NL               |  \n                    |  Line separator; blank lines ignored       |
| WS               |  [ \t\r]+              |  Skipped by lexer filter                   |
+------------------+------------------------+--------------------------------------------+
```

# Precedence (tightest → loosest)
```
+--------------+--------------------------+----------------+
| Level        |  Operator                |  Associativity |
+--------------+--------------------------+----------------+
| 1 (highest)  |  (...) parentheses       |  —             |
| 2            |  A[i] access (postfix)   |  —             |
| 3            |  ^-1 inverse (postfix)   |  —             |
| 4            |  : twist (binary)        |  left          |
| 5            |  o composition (binary)  |  left          |
| 6 (loosest)  |  ~ product (binary)      |  left          |
+--------------+--------------------------+----------------+
```

# AST Node Types
```
+-----------------+-------------------------+----------------+
| Node Type       |  Fields                 |  Example       |
+-----------------+-------------------------+----------------+
| Assignment      |  name, expr             |  A = [2,0,3,1] |
| IndexLiteral    |  entries[]              |  [0,3..7,2,1]  |
| IntegerLiteral  |  value                  |  42            |
| Range           |  start, end             |  3..7          |
| Composition     |  left, right            |  A o B         |
| Twist           |  left, right            |  A : B         |
| Product         |  left, right            |  A ~ B         |
| Inverse         |  operand                |  P^-1          |
| Access          |  target, index          |  A[B[0]]       |
| Identity        |  size (nullable)        |  e or e_4      |
| Variable        |  name, size (nullable)  |  A or A_4      |
+-----------------+-------------------------+----------------+
```

# Statement Forms
- Assignment: IDENT EQ expr → Assignment node
- Bare expression: expr → returns AST directly
- Lines: newline-separated; blank lines ignored; no multi-line statements

# Special Rules
- e (IDENT value "e") → Identity node with size: null (inferred at eval time)
- e_4 (IDENT e, USCORE, NUMBER 4) → Identity node with size: 4
- A_4 (IDENT A, USCORE, NUMBER 4) → Variable node with size: 4
- Access bracket contents: NUMBER | IDENT | access only (no arbitrary expressions)
- o is reserved (cannot be used as a variable name)
