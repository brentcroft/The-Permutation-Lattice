# Rules of the Game

## Definitions
An index on `n` items is an array of `n` integers where 
every integer is greater than or equal to `0`, and less than `n`, and occurs exactly once.
- Therefore an index is an implementation of a permutation on `n` items.

An identity is an index where the integer at each position `i` is equal to `i`.
The identity on `n` items is written: `e_n`, or just `e` if the context is clear.


## Composition of Indexes
Only indexes of the same size (i.e. length) can be composed.

The composition of `A` and `B` (each of size `n`), written `A ∘ B`, is the index `C` of size `n` defined by:

`C[i] = A[B[i]]` for all `i ∈ {0, 1, …, n−1}`

To compute the value at position `i` in `A ∘ B`, first find where `B` sends position `i`, then find where `A` sends that value.

The composition of two indexes `L ∘ R` is defined by the following function:
``` javascript
function compose( L, R ) {
    const index = [];
    for ( var i = 0; i < R.length; i++ ) {
        index[i] = L[R[i]];
    }
    return index;
}
```

### Exponentiation
An index can be composed with itself any number of times.

Self-composition is denoted using exponential notation:
```
A ∘ A^-2 = A^-1
A ∘ A^-1 = e
A^0 = e 
A^1 = A
A^2 = A ∘ A 
A^3 = A ∘ A ∘ A
```
and possibly non-existent roots can be denoted using fractional exponents:
```
`R = A^1/2` implies `(R ∘ R) = A` 
`R = A^1/3` implies `(R ∘ R ∘ R) = A`
```


### Properties of Composition
```
+-----------------+------------------------------------------------------------------------------+
| Closure:        | `A ∘ B` is also a valid index on `n` items (a permutation of `{0, …, n-1}`). |
| Associativity:  | `(A ∘ B) ∘ C = A ∘ (B ∘ C)`.                                                  |
| Identity:       | If `I` is any identity index `(I[i] = i)`, then `I ∘ A = A` and `A ∘ I = A`  |
| Inverses:       | For `P[i] = j` then `P⁻¹[j] = i`                                             |
+-----------------+------------------------------------------------------------------------------+
```
Inverses “undo” indexes, and guarantee every index can be undone in exactly one way.


### Example
Let `n = 4` with `A = [2,0,3,1]` and `B = [1,3,0,2]`.

Then `C = A ∘ B` is computed as:
``` javascript
C[0] = A[B[0]] = A[1] = 0
C[1] = A[B[1]] = A[3] = 1
C[2] = A[B[2]] = A[0] = 2
C[3] = A[B[3]] = A[2] = 3
```
So: `A ∘ B = [0,1,2,3]` which happens to be the identity index in this example.

`A` and `B` are inverse to each other: `A = B⁻¹` and `B = A⁻¹`.


## Twist
Twist is a specialised form of composition that produces the "quotient" or "difference" of two indexes.

Only indexes of the same size (i.e. length) can be twisted.

The twist of `A` and `B`, written `A : B` using the twist operator `:`, is defined by: `A : B = A ∘ (B^-1)`



## Products
The product lets us build a larger, structured index from two smaller ones by using one index to order whole blocks and the other to order elements within each block, so the two component indexes remain independent.

The product of `A_m` and `B_n`, written `A_m ~ B_n`, is the index `C` of size `m * n`.

Notionally, this product comprises `m` copies of `B_n`, with values scaled by `n`, distributed across `A_m`.

The product of two indexes `L` and `R` is defined by the following function:
``` javascript
function product( L, R ) {
    const index = [];
    for ( var i = 0; i < L.length; i++ ) {
        index.push( ...R.map( j => j + L[i] * R.length ) );
    }
    return index;
}
```

In a product expression, a literal integer: e.g.: `4`, stands for the identity index e_4, for example:
```
4 ~ 5 = e_4 ~ e_5
4 ~ [0, 2, 1] = [0, 1, 2, 3] ~ [0, 2, 1] 
```

### Co-ordinates
The set of pairs of choices of position from each of the two contributing indexes provides a 2-D co-ordinate (point) for each position in the result index, comprising a grid.

Each 2‑D co‑ordinate is a pair `(l, r)` where:
- `l` is a position in `L → 0 ≤ l < m`.
- `r` is a position in `R → 0 ≤ r < n`.

Since the `product()` function builds the result by looping outer over `L` positions and inner over `R` positions,
the result is laid out as `m` consecutive blocks of size `n`.

That gives the simple row‑major mapping: 
``` javascript
position = l * n + r
```
and in the opposite direction:
``` javascript
l = Math.floor(position / n)
r = position % n
```
Because the high part `L[l]` is in `0..m-1` and the low part is `R[r]`, the actual value stored at co‑ordinate `(l, r)` is: 
``` javascript
value = R[r] + L[l] * n
```

## Box Indexes
Consider the difference between the two products: `e_m ~ e_n` and `e_n ~ e_m`.

The two products `e_m ~ e_n` and `e_n ~ e_m` both evaluate to the identity index on `m * n` items, but their geometric interpretations differ:
``` md
+-------------+-------------------+------------------------+
| Product     | Block layout      | Grid shape             |
+-------------+-------------------+------------------------+
| `e_m ~ e_n` | `m` blocks of `n` | `n` columns × `m` rows |
| `e_n ~ e_m` | `n` blocks of `m` | `m` columns × `n` rows |
+-------------+-------------------+------------------------+
```

Both grids hold the same `m * n` points, just oriented differently. 
Transposing one grid across its main diagonal — the line from the origin `(0,0)` to the terminus `(m−1, n−1)` — obtains the other: 
- the `n`-wide, `m`-tall grid transposes into the `m`-wide, `n`-tall grid.


### The discrete twisted torus
The grid can be mapped onto a discrete `m × n` twisted torus by a sequence of coilings as follows:
- the grid is coiled into a cylinder along the torus minor dimension - `n`, 
  with the joined edges askew by one place, so that the origin and terminus remain unattached.
- the cylinder is coiled into another cylinder along the torus major dimension - `m`,
  with the origin and the terminus located at the same place on the torus.

If we consider the terminus as co-located with the origin on a `m * n` discrete twisted torus then
a 'minor' index implements a geodesic on the minor axis and a 'major' index implements a geodesic on the major axis.

The origin and terminus sit at opposite corners of the grid, 
but on the discrete twisted torus they are in the same place.

### Two principal geodesics
On the discrete `m × n` twisted torus there are two natural straight-line traversals from the origin to the terminus:
``` markdown
+-------------------------------------+-----------+--------------------------------------------------------------------+
| Axis                                | Dimension | Movement                                                           |
+-------------------------------------+-----------+--------------------------------------------------------------------+
| Minor axis (within-block direction) | n         | positions on the minor-axis geodesic in order (0, 1, 2, …, mn−1).  |
| Major axis (block direction)        | m         | positions on the major-axis geodesic in order (0, m, 2m, …, mn−1). |
+-------------------------------------+-----------+--------------------------------------------------------------------+
```
Two different indexes correspond to these two traversals: geodesics on the twisted torus:
``` markdown
+-----------+---------------------+--------+
| Index     | Output for: `2 x 3` | Symbol |
+-----------+---------------------+--------+
| 'minor'   | [0, 1, 2, 3, 4, 5]  |    ↑   |
| 'major'   | [0, 2, 4, 1, 3, 5]  |    ↓   |
+-----------+---------------------+--------+
```
The 'minor' index (↑) is simply the identity on `m * n` items:
``` javascript
function upArrow( m, n ) {
    return [...Array( m * n ).keys()];
}
```

Given that `m` is coprime to `m * n ‑ 1`,
the 'major' index (↓) may be calculated by the following function:
``` javascript
function downArrow( m, n ) {
    const terminus = n * m - 1;
    if (terminus < 0) {
        return [];
    } else if (terminus == 0) {
        return [0];
    }    
    const nextId = ( x ) => ( x + m ) % terminus; 
    const index = [];
    var id = 0;
    var di = 0;
    id = nextId( index[di++] = id );
    while ( id != 0 ) {        
        id = nextId( index[di++] = id );
    }
    index.push(terminus);
    return index;
}
```
Note that in general: `↓` is not equal to `↓⁻¹`, whereas `↑` is always equal to `↑⁻¹` since it's an identity. 

### Round trip indexes
A round trip from the origin to the terminus and back can be performed in 4 ways 
since there are:
- two choices of traversal from the origin out to the terminus.
- two choices of an inverse traversal from the terminus back to the origin.

Each pair of choices: a traversal and an inverse traversal, provides a round trip index.

A round trip index is obtained by the composition of the pair.

In 2-dimensions there are 4 such pairs.
```
+-----+------+-------------+-------+--------+---------------------+
| Out | Back | Composition | Twist | Result | Description         |
+-----+------+-------------+-------+--------+---------------------+
| ↑   | ↑⁻¹  | ↑ ∘ ↑⁻¹     | ↑:↑   | e      | Identity            |
| ↓   | ↓⁻¹  | ↓ ∘ ↓⁻¹     | ↓:↓   | e      | Identity            |
| ↑   | ↓⁻¹  | ↑ ∘ ↓⁻¹     | ↑:↓   | ↓⁻¹    | Spin-clockwise      |
| ↓   | ↑⁻¹  | ↓ ∘ ↑⁻¹     | ↓:↑   | ↓      | Spin-anti-clockwise |
+-----+------+-------------+-------+--------+---------------------+
```

A spin-clockwise round trip index can be generated directly using the following function:
``` javascript
function spinClockwise(m, n) {
    const terminus = n * m - 1;
    if (terminus < 0) {
        return [];
    } else if (terminus == 0) {
        return [0];
    }
    const index = new Array(terminus + 1);
    for (let i = 0; i < terminus; i++) { 
        index[i] = (i * n) % terminus;
    }
    index[terminus] = terminus;
    return index;
}
```

### Round trip literal expressions
The twist operator can be used with literal positive integers, 
e.g.: `4` and `5`, to generate round trip indexes.

For example, the notation `4:5` means the twist of the minor and major indexes on a `4 × 5` grid:
```
4:5 = minor(4,5) : major(4,5) 
4:5 = spinClockwise( 4, 5 )
5:4 = spinClockwise( 5, 4 )
```
Note that in the expression `4:5` the integers are grid dimensions, not identity indexes.

Now we can test assertions comparing indexes that are the result of expressions, such as:
```
2:20 == ((2:5)~4) : (5~(4:2))
4:10 == (2:20)^2
8:5  == (2:20)^3
```
