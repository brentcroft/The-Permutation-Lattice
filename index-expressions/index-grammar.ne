# =================================================================
# index-grammar.ne
# Grammar for Index/Permutation Expression Language
# =================================================================
#
# Parses lines of assignments and expressions involving indexes:
#   - Index literals:  [0,3..7,2,1]
#   - Composition:     A o B   (or A ∘ B)
#   - Twist:           A : B
#   - Product:         A ~ B
#   - Inverse:         P^-1    (or P⁻¹)
#   - Identity:        e  or  e_4
#   - Access:          A[B[0]]
#   - Variables:       A, myIndex, A_4
#   - Assignment:      name = expression
#
# Precedence (loosest → tightest):
#   ~  <  o  <  :  <  ^-1  <  A[i]  <  (parens)
#
# All binary operators are left-associative.
# Newlines separate statements; blank lines are ignored.
# Whitespace within a line is insignificant.
# =================================================================

@{%
const moo = require('moo');

# ---- Lexer ----
const baseLexer = moo.compile({
  WS:      { match: /[ \t\r]+/, lineBreaks: false },
  NL:      { match: /\n/, lineBreaks: true },
  NUMBER:  /[0-9]+/,
  IDENT:   /[a-zA-Z][a-zA-Z0-9]*/,
  COMPOSE: { match: ['o', '\u2218'], priority: 5 },   # 'o' is reserved keyword
  INVERSE: { match: ['^-1', '\u207B\u00B9'] },
  TWIST:   ':',
  TILDE:   '~',
  USCORE:  '_',
  LBRACK:  '[',
  RBRACK:  ']',
  LPAREN:  '(',
  RPAREN:  ')',
  COMMA:   ',',
  DOTDOT:  '..',
  EQ:      '=',
});

# Filter out whitespace tokens — they never reach the parser
const lexer = {
  next: () => {
    let tok;
    do { tok = baseLexer.next(); } while (tok && tok.type === 'WS');
    return tok;
  },
  reset: (chunk, info) => { baseLexer.reset(chunk, info); return lexer; },
  save: () => baseLexer.save(),
  formatError: (tok) => baseLexer.formatError(tok),
  has: (t) => baseLexer.has(t),
};

# ---- AST Helpers ----
function node(type, props) { return { type, ...props }; }
function toInt(token) { return parseInt(token.value, 10); }
%}

@lexer lexer

# ==================== PROGRAM STRUCTURE ====================

# A program is a list of lines; each line is a statement or blank.
# Returns an array of AST nodes (blank lines filtered out).

program -> lines

lines -> line
       | lines %NL line {% ([prev, _, curr]) => prev.concat(curr) %}

# A line is either a statement (wrapped in a 1-element array)
# or blank/empty (epsilon → empty array, filtered by concat).
line -> statement {% (d) => [d[0]] %}
      | null      {% () => [] %}

statement -> assignment | expr

# ---- Assignment ----
# Target is always a plain identifier (no size-label on LHS).
assignment -> %IDENT %EQ expr {%
  ([name, _, expr]) => node('Assignment', { name: name.value, expr })
%}

# ==================== EXPRESSIONS ====================
# Precedence implemented as layered nonterminals:
#   product_expr  (loosest)   ~
#   composition_expr          o
#   twist_expr                :
#   inverse_expr              ^-1
#   postfix                   A[i]
#   atom                      (tightest)  literals, references, parens

expr -> product_expr

# ---- Product (loosest binary operator) ----
product_expr -> composition_expr
              | product_expr %TILDE composition_expr {%
                  ([left, _, right]) => node('Product', { left, right })
                %}

# ---- Composition ----
composition_expr -> twist_expr
                  | composition_expr %COMPOSE twist_expr {%
                      ([left, _, right]) => node('Composition', { left, right })
                    %}

# ---- Twist ----
twist_expr -> inverse_expr
            | twist_expr %TWIST inverse_expr {%
                ([left, _, right]) => node('Twist', { left, right })
              %}

# ---- Inverse (postfix) ----
inverse_expr -> postfix
              | postfix %INVERSE {%
                  ([base, _]) => node('Inverse', { operand: base })
                %}

# ---- Postfix: access or atom ----
# Access binds tighter than inverse; only on identifiers.
postfix -> access | atom

# ---- Access: identifier [ bracket_content ] ----
access -> %IDENT %LBRACK bracket_content %RBRACK {%
  ([name, _, content, _2]) => node('Access', { target: name.value, index: content })
%}

# Bracket contents are restricted — no arbitrary expressions.
# Only: integer literal | identifier | nested access
bracket_content -> %NUMBER {% (d) => node('IntegerLiteral', { value: toInt(d[0]) }) %}
                  | %IDENT  {% (d) => node('Variable', { name: d[0].value }) %}
                  | access

# ==================== ATOMS ====================

atom -> index_literal | reference | paren_expr

# Parenthesised expression — highest precedence
paren_expr -> %LPAREN expr %RPAREN {% ([_, expr, _2]) => expr %}

# ---- Reference: identifier with optional size-label ----
#   A      → Variable { name: "A", size: null }
#   A_4    → Variable { name: "A", size: 4 }
#   e      → Identity { size: null }      (size inferred at eval time)
#   e_4    → Identity { size: 4 }
reference -> %IDENT %USCORE %NUMBER {%
    ([name, _, size]) => {
      if (name.value === 'e')
        return node('Identity', { size: toInt(size) });
      return node('Variable', { name: name.value, size: toInt(size) });
    }
  %}
  | %IDENT {%
    ([name]) => {
      if (name.value === 'e')
        return node('Identity', { size: null });
      return node('Variable', { name: name.value, size: null });
    }
  %}

# ==================== INDEX LITERALS ====================
# [0,1,3,2,6,4,5,7]          — comma-separated integers
# [0,3..7,2,1]               — inclusive ascending range
# [0,7..3,2,1]               — inclusive descending range
# []                         — empty index

index_literal -> %LBRACK entries %RBRACK {%
  ([_, entries, _2]) => node('IndexLiteral', { entries })
%}

entries -> null              {% () => [] %}
          | entry             {% (d) => [d[0]] %}
          | entries %COMMA entry {% ([prev, _, curr]) => prev.concat([curr]) %}

entry -> range | %NUMBER {% (d) => node('IntegerLiteral', { value: toInt(d[0]) }) %}

range -> %NUMBER %DOTDOT %NUMBER {%
  ([start, _, end]) => node('Range', { start: toInt(start), end: toInt(end) })
%}
