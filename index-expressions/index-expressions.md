
Please review the following as a specification for a grammar to manipulate indexes.

# Index Expressions
An index is a permutation of `{0, 1, ..., n−1}` for some non-negative integer `n` (i.e. `n = length(index)`). 
An index of length `n` contains each integer from `0` to `n−1` exactly once.

An identity is an index where every integer is in its place; i.e.: `i = identity[i]` for all valid `i`.
An identity can be written using the letter `e`, 
if necessary with a subscript denoting its length: `e_4 = [0,1,2,3]` when the context is ambiguous.

There are a number of ways to generate an index:

## Literal
An index may be written:
1.    literally as a comma-separated sequence of integers enclosed in square brackets: `[0,1,3,2,6,4,5,7]`.
2.    with inclusive ranges specified by double-dots: `[0,3..7,2,1] = [0,3,4,5,6,7,2,1]`, or `[0,7..3,2,1] = [0,7,6,5,4,3,2,1]`. 

Ranges are inclusive on both bounds, and the bounds must not be equal.
The empty index [] is valid.


## Composition
Two indexes of the same length can be composed to produce another index of the same length.
A composition is written:
    `L * R` such that: (L * R)[i] = L[R[i]]
    `F * L * R` such that: (F * L * R)[i] = F[L[R[i]]]
This is a right-to-left pipeline.


## Powers and Inverses
An index can be composed with itself any number of times using standard exponentiation symbols.
`L^3` means `L * L * L`.
Every index has an inverse denoted `L^-1` such that `L * L^-1 = e_{length(L)}`.
That is: `inv[index[i]] = i` for all `i`.
An index may be the inverse of itself (e.g. every identity).
In particular: `L^0 = e_{length(L)}` or `L^0 = e` since the context implies `length(L)`.

## Twist operator:  The "quotient" or "difference" of two permutations
The twist operator `:` applies to two indexes of the same length and is defined as: `L:R = L * (R^-1)`.

A primitive twist allows both the left and right sides to be simple integers, e.g. `4:10`, 
from which the result can be calculated directly using the "roundTrip" function.
Notionally, having:
    layed out a rectangular grid with `L` lots of `R` (i.e generating 2D co-ordinates from an origin to a terminus)
    wrapped the grid onto a torus with minor axis `R` and major axis `L` 
then there are two geodesic paths from the origin to the terminus. 

The round trip imagines choosing a pair of geodesic paths, one to walk from the origin to the terminus 
and the other used in reverse to return to the origin.
If the same path is chosen for the outward and return trip then there is no action - the identity.
If different paths are chosen then there is an action - the twist of the two paths.

```
// NB: stride and dual must be positive integers
function roundTrip(stride, dual) {
    const V = stride * dual;
    if (V < 1) {
        return [];
    }
    if (V < 2) {
        return [0];
    }
    const index = new Array(V);
    for (let i = 0; i < V - 1; i++) { 
        index[i] = (i * stride) % (V - 1);
    }
    index[V-1] = V-1;
    return index;
}
```

`4:10 = roundTrip(4, 10)`
`10:4 = roundTrip(10, 4)`

Since stride and V−1 are always coprime, multiplication by stride is invertible mod V−1, guaranteeing a bijection. The same holds for dual by symmetry.

Note that for a twist:
If both operands are integer literals, use roundTrip(left, right).
If both operands are indexes of the same length, use L * R^-1.
Otherwise it is an error.



## Slide operator:  An element of the "wreath product" of two permutations
The slide operator `~` applies to any two indexes and is defined using the slide function:

`L ~ R = slide( L, R )`

```
function slide( L, R ) {
    const index = [];
    for ( var i = 0; i < R.length; i++ ) {
        index.push( ...L.map( j => j + R[i] * L.length ) );
    };
    return index;
}
```
A primitive slide allows the left and/or right sides to be simple positive integers, e.g. `4 ~ 10`, 
If either `L`, and/or `R` is an integer, then it should be replaced by an identity index of the given length.


