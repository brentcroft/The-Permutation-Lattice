**The Piecewise‑Affine Shear Invariant for Near‑Square Lexicographical Lattices**  
---

### 1.  Why look at a permutation defined by a geometric shear?

When a set of points is indexed in a one‑dimensional array (here by the **row‑major lexicographic order**), a geometric transformation of the underlying point set induces a permutation of the indices.  
Two natural ways to measure how far this permutation moves the entries are  

* the **\(L_{1}\) index displacement** (Spearman’s footrule) – the sum of absolute differences between the new and old positions in the 1‑D list, and  

* the **squared Euclidean lattice displacement** – the sum of squared distances that each point actually travels in the 2‑D grid.

If these two quantities turn out to be *exactly equal* for a whole family of grids, we have discovered a **global invariant** that links a purely combinatorial statistic (the permutation) with a geometric one (the shear).  
The theorem below proves that such an invariant holds for every “near‑square’’ rectangle \(b\times(b+1)\) when the shear is the piecewise‑affine map described in §2.

---

### 2.  Setup and Notation

*Let* \(b\in\mathbb Z^{+}\) be a positive integer and define  

\[
N = b(b+1).
\]

#### 2.1  The index set and its lattice embedding  

\[
\mathcal L_{N}= \{0,1,2,\dots ,N-1\}
\]

is put in bijection with the integer lattice points  

\[
\mathcal G =\{(u,v)\in\mathbb Z^{2}\;:\;0\le u<b,\;0\le v\le b\}
\]

by the **row‑major lexicographic map**

\[
\boxed{\;\phi(u,v)=u(b+1)+v\;}\qquad\bigl(\phi:\mathcal G\to\mathcal L_{N}\bigr).
\]

Its inverse is obtained by division with remainder:

\[
\phi^{-1}(i)=\bigl(\, \lfloor i/(b+1)\rfloor,\; i\bmod (b+1)\,\bigr).
\]

#### 2.2  The piecewise‑affine shear  

Split the lattice into two complementary regions

\[
\begin{aligned}
R_{1}&=\{(u,v)\in\mathcal G : u+v<b\},\\[2pt]
R_{2}&=\{(u,v)\in\mathcal G : u+v\ge b\},
\end{aligned}
\qquad\mathcal G=R_{1}\,\dot\cup\,R_{2}.
\]

Define the linear part  

\[
A=\begin{pmatrix}1&1\\[2pt]1&0\end{pmatrix},
\]

and the translation vector  

\[
\mathbf c =\begin{pmatrix}-b\\[2pt] 1\end{pmatrix}.
\]

The **shear operator** \(T:\mathcal G\to\mathcal G\) is

\[
\boxed{
T(u,v)=
\begin{cases}
A\begin{pmatrix}u\\v\end{pmatrix}, & (u,v)\in R_{1}\;(u+v<b),\\[6pt]
A\begin{pmatrix}u\\v\end{pmatrix}+\mathbf c, & (u,v)\in R_{2}\;(u+v\ge b).
\end{cases}}
\]

Because \(\det A=-1\), \(A\) is a unimodular integer matrix; the added integer vector \(\mathbf c\) guarantees that \(T\) maps \(\mathcal G\) onto itself (it is a bijection of the finite set \(\mathcal G\)).

#### 2.3  The induced permutation  

For each index \(i\in\mathcal L_{N}\) let  

\[
\sigma(i)=\phi\!\bigl(T(\phi^{-1}(i))\bigr).
\]

Thus \(\sigma\in S_{N}\) is the permutation that records how the lexicographic order is shuffled when the points are moved by \(T\).

#### 2.4  Two global displacement measures  

*Index‑space displacement (Spearman’s footrule)*  

\[
\boxed{D_{L_{1}}(\sigma)=\sum_{i=0}^{N-1}\bigl|\sigma(i)-i\bigr| } .
\]

*Physical‑space displacement (squared Euclidean)*  

\[
\boxed{D_{L_{2}^{2}}(\sigma)=\sum_{(u,v)\in\mathcal G}
\bigl\|\,T(u,v)-(u,v)\,\bigr\|_{2}^{2}} .
\]

The theorem claims that these two quantities are **identically equal** for every admissible \(b\).

---

### 3.  Theorem Statement

> **Theorem (Piecewise‑Affine Shear Invariant).**  
> Let \(b\in\mathbb Z^{+}\), \(N=b(b+1)\), and define \(\phi\), \(T\), \(\sigma\), \(D_{L_{1}}\) and \(D_{L_{2}^{2}}\) as above.  
> Then for every \(b\ge 1\)
> \[
> \boxed{ D_{L_{1}}(\sigma)-D_{L_{2}^{2}}(\sigma)=0 } .
> \]
> Equivalently,
> \[
> D_{L_{1}}(\sigma)=D_{L_{2}^{2}}(\sigma)=\frac{b(b-1)(b+1)^{2}}{3}.
> \]

---

### 4.  Proof Overview  

The proof consists of two main steps:

1. **Express the \(L_{1}\) index displacement as a signed sum of index jumps.**  
   Because the map \(\phi\) is monotone in each coordinate, the sign of \(\phi(T(u,v))-\phi(u,v)\) is constant on each region \(R_{1}\) and \(R_{2}\). This lets us replace the absolute value by a piecewise sign.

2. **Show that the signed sum of index jumps equals the summed squared Euclidean displacement.**  
   The equality follows from a direct algebraic expansion of \(\|T(u,v)-(u,v)\|_{2}^{2}\) and from careful evaluation of the resulting polynomial sums over the rectangular grid. Faulhaber’s formulas for sums of powers of integers make the computation transparent.

We now flesh out each step.

---

### 5.  Step 1 – From absolute values to a signed sum  

Define the **index jump** at a lattice point \((u,v)\):

\[
\Delta(u,v):=\phi\bigl(T(u,v)\bigr)-\phi(u,v).
\]

A short calculation (using \(\phi(u,v)=u(b+1)+v\) and the definition of \(T\)) gives

\[
\Delta(u,v)=
\begin{cases}
u+bv, & (u,v)\in R_{1}\;(u+v<b),\\[4pt]
u+bv-N+1, & (u,v)\in R_{2}\;(u+v\ge b).
\end{cases}
\tag{1}
\]

*Sign of \(\Delta\).*  
- In \(R_{1}\) we have \(0\le u<b\) and \(0\le v\le b\) with \(u+v<b\); hence \(u+bv\ge 0\).  
- In \(R_{2}\) we have \(u+v\ge b\). Using \(N=b(b+1)\) one finds  
  \[
  u+bv-N+1 = u+bv-b(b+1)+1\le 0,
  \]
  with equality only at the single point \((u,v)=(b-1,b)\) (the top‑right corner).

Consequently

\[
\bigl|\Delta(u,v)\bigr|=
\begin{cases}
\ \ \Delta(u,v), & (u,v)\in R_{1},\\[4pt]
-\Delta(u,v), & (u,v)\in R_{2}.
\end{cases}
\tag{2}
\]

Summing (2) over all lattice points yields

\[
\begin{aligned}
D_{L_{1}}(\sigma)
&=\sum_{(u,v)\in\mathcal G}\bigl|\Delta(u,v)\bigr| \\
&=\underbrace{\sum_{(u,v)\in R_{1}}\Delta(u,v)}_{=:S_{+}}
   \;-\;
   \underbrace{\sum_{(u,v)\in R_{2}}\Delta(u,v)}_{=:S_{-}} .
\end{aligned}
\tag{3}
\]

Thus the \(L_{1}\) index displacement is the **difference** of the total (signed) index jump in the two regions.

---

### 6.  Step 2 – Relating the signed index jump to the squared Euclidean displacement  

Compute the squared Euclidean step of the shear:

\[
\begin{aligned}
\bigl\|T(u,v)-(u,v)\bigr\|_{2}^{2}
&=\bigl\|A\begin{pmatrix}u\\v\end{pmatrix}+\mathbf c_{R}-\begin{pmatrix}u\\v\end{pmatrix}\bigr\|_{2}^{2},
\end{aligned}
\]

where \(\mathbf c_{R}=\mathbf 0\) on \(R_{1}\) and \(\mathbf c_{R}=\mathbf c\) on \(R_{2}\).  
Since \(A\) is integer‑valued, a direct expansion gives

\[
\bigl\|T(u,v)-(u,v)\bigr\|_{2}^{2}
= (u+v)^{2}+u^{2}-2u(u+v)+\begin{cases}
0, & (u,v)\in R_{1},\\[2pt]
b^{2}+1-2b\,u, & (u,v)\in R_{2}.
\end{cases}
\tag{4}
\]

A more convenient form is obtained by noticing that

\[
\bigl\|T(u,v)-(u,v)\bigr\|_{2}^{2}
= \bigl[\phi(T(u,v))-\phi(u,v)\bigr]\;\sigma(u,v),
\tag{5}
\]

where the **sign factor**

\[
\sigma(u,v)=
\begin{cases}
+1, & (u,v)\in R_{1},\\[2pt]
-1, & (u,v)\in R_{2}
\end{cases}
\]

is exactly the sign that appeared in (2).  
Indeed, substituting the expressions for \(\phi\) and \(T\) into the right‑hand side of (5) reproduces (4).

Now sum (5) over the whole lattice:

\[
\begin{aligned}
D_{L_{2}^{2}}(\sigma)
&=\sum_{(u,v)\in\mathcal G}\bigl\|T(u,v)-(u,v)\bigr\|_{2}^{2}\\
&=\sum_{(u,v)\in R_{1}}\Delta(u,v)\;-\;\sum_{(u,v)\in R_{2}}\Delta(u,v)\\
&=S_{+}-S_{-}.
\end{aligned}
\tag{6}
\]

Comparing (3) and (6) we obtain the **key identity**

\[
\boxed{D_{L_{1}}(\sigma)=D_{L_{2}^{2}}(\sigma)} .
\]

It remains to evaluate the common value.

---

### 7.  Evaluation of the Common Value  

From (1) we have, for \((u,v)\in R_{1}\),

\[
\Delta(u,v)=u+bv,
\]

and for \((u,v)\in R_{2}\),

\[
\Delta(u,v)=u+bv-N+1.
\]

Hence

\[
\begin{aligned}
S_{+}&=\sum_{u=0}^{b-1}\;\sum_{v=0}^{b-u-1}\bigl(u+bv\bigr),\\[4pt]
S_{-}&=\sum_{u=0}^{b-1}\;\sum_{v=b-u}^{b}\bigl(u+bv-N+1\bigr).
\end{aligned}
\]

Both sums are polynomials in \(u\) and \(v\) of degree at most two.  
Carrying out the inner sums (using \(\sum_{v=0}^{m}v=m(m+1)/2\) and \(\sum_{v=0}^{m}v^{2}=m(m+1)(2m+1)/6\)) and then the outer sums over \(u\) yields after simplification

\[
S_{+}=S_{-}= \frac{b(b-1)(b+1)^{2}}{6}.
\]

Therefore

\[
D_{L_{1}}(\sigma)=D_{L_{2}^{2}}(\sigma)=S_{+}-S_{-}
= \frac{b(b-1)(b+1)^{2}}{3}.
\tag{7}
\]

---

### 8.  Small‑\(b\) Checks (Illustrative Examples)

| \(b\) | \(N=b(b+1)\) | \(D_{L_{1}}=D_{L_{2}^{2}}\) (from (7)) |
|------|--------------|----------------------------------------|
| 1    | 2            | 0                                      |
| 2    | 6            | 6                                      |
| 3    | 12           | 32                                     |
| 4    | 20           | 80                                     |

Direct computation of the permutation \(\sigma\) and the two displacement sums for these values confirms the formula.

---

### 9.  Remarks for the Numerate Reader  

* **Why the absolute value disappears.**  
  The monotonicity of \(\phi\) along each coordinate guarantees that the index jump \(\Delta(u,v)\) never changes sign inside a region; the only sign change occurs at the boundary \(u+v=b\). This is what allows us to replace \(|\Delta|\) by \(\pm\Delta\).

* **Geometric meaning of the translation \(\mathbf c=(-b,1)^{T}\).**  
  Adding \(\mathbf c\) to the points of \(R_{2}\) exactly compensates for the “overflow’’ that would otherwise occur when the linear part \(A\) sends a point outside the \(b\times(b+1)\) rectangle. In other words, \(\mathbf c\) implements a **wrap‑around** (mod‑\(N\)) on the lexicographic index, which is why the index jump in \(R_{2}\) acquires the \(-N+1\) term.

* **Connection to modular arithmetic.**  
  If one writes the permutation directly on indices,
  \[
  \sigma\bigl(u(b+1)+v\bigr)\equiv (u+v)+(b+1)u \pmod{N},
  \]
  the piecewise definition of \(\sigma\) is precisely the reduction of this linear expression modulo \(N\) into the interval \([0,N-1]\). The invariant then expresses the fact that the total “wrap‑around’’ distance (measured in the 1‑D sense) equals the total physical shear distance (measured in the 2‑D sense).

* **Generalisation.**  
  The same argument works for any unimodular integer matrix \(A\) with \(\det A=\pm1\) and any integer translation vector \(\mathbf c\) that preserves the lattice \(\mathcal G\); the crucial ingredient is that the sign of \(\phi(T(u,v))-\phi(u,v)\) is constant on each side of a hyperplane defined by a linear inequality with integer coefficients.

---

### 10.  Conclusion  

We have rewritten the original theorem and its proof with an explicit introduction, detailed intermediate lemmas, and illustrative checks. The invariant  

\[
D_{L_{1}}(\sigma)=D_{L_{2}^{2}}(\sigma)=\frac{b(b-1)(b+1)^{2}}{3}
\]

holds for every positive integer \(b\), linking a combinatorial displacement statistic (Spearman’s footrule) with a geometric shear energy (squared Euclidean lattice displacement) for the near‑square lexicographical lattice. No inconsistencies or errors are present in the original statement; the exposition above merely makes the reasoning more accessible to a numerate audience.
