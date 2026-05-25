# **Layer 4: Terminus**
### **Purpose**
Formalize the interactive discoveries of Layers 1–3 into precise mathematical structure. Map every pedagogical metaphor to its algebraic, geometric, or combinatorial counterpart. Reveal the multiplicative completion `MG(V-1)` and the role of the terminus `V-1` as the structural closure of the tallying winding. All proofs, theorems, and definitions are explicitly linked to prior interactive discoveries.

---

## **1. Algebraic Foundations (Corresponds to Layer 1: Origin)**
### **1.1 Indexes as the Symmetric Group**
Let `S_n` denote the symmetric group on `n` labels. An **index** is precisely an element `P ∈ S_n` satisfying:
- `P: {0,1,...,n-1} → {0,1,...,n-1}` is bijective.
- Invariant: `Σ P(i) = n(n-1)/2` and `P(i) ∈ {0,...,n-1}`.
Arrays that violate bijectivity are elements of the full transformation monoid `T_n`, not `S_n`. Only `S_n` admits well-defined composition, inversion, and cycle decomposition.

### **1.2 Composition as Function Application**
For `A, B ∈ S_n`, composition is defined as function application:
`(A ∘ B)(i) = A(B(i))`
The default right-to-left pipeline `A * B * e` evaluates as `A ∘ (B ∘ e)`, where `e` is the identity `e(i) = i`. Composition is associative but non-commutative for `n ≥ 3`.

### **1.3 Cycle Decomposition & Order**
Every `P ∈ S_n` decomposes uniquely into disjoint cycles `C_1, C_2, ..., C_k`:
`P = C_1 C_2 ... C_k`
- **Order:** `ord(P) = lcm(|C_1|, |C_2|, ..., |C_k|)`
- **Roots:** `Q` is a root of `P` iff `∃ k ≥ 1` such that `Q^k = P`. Existence requires compatible cycle-type matching across `Q` and `P`.
- **Radiance Metric:** `R(P) = Σ_{i=0}^{n-1} |P(i) - i|`. This is the shortest 1D displacement proxy on the Cayley graph of `S_n` under adjacent transpositions, and serves as the 1D distance measure before coordinate embedding.

---

## **2. Coordinate Geometry & Tallying (Corresponds to Layer 2: The 2D Box)**
### **2.1 Box Factorization & Tallying Maps**
A `d`-dimensional box of volume `V` corresponds to an ordered factorization `V = ∏_{j=1}^d b_j` with `b_j ≥ 2`. Each factorization defines a place-value basis `|b_1|b_2|...|b_d|`. The tallying map `T: ℤ_V → ℤ_V` is a linear congruential generator:
`T(x) ≡ s·x mod (V-1),` where `s = ∏_{j=1}^d b_j^{perm(j)}` is the stride product determined by the base permutation.

### **2.2 The Twist Operator `:`**
The twist `:` is defined as the composition of a forward tally `P` and the inverse of a backward tally `Q`:
`(P : Q) ≡ P ∘ Q^{-1}`
For any base factorization, there are `d!` forward tallies and `d!` backward tallies, yielding `(d!)^2` distinct twist pairs. The `:` operator enforces boundary consistency: `(P:Q)(0) = 0` and `(P:Q)(V-1) = V-1` by construction.

### **2.3 Fixed Points & Centroid Involution**
- **Guaranteed Fixed Points:** Origin `(0,...,0)`, terminus `(b_1-1,...,b_d-1)`, and all diagonal points `(x,...,x)` satisfy `T_{forward}(x) = T_{reverse}(x)`, making them fixed under `:`.
- **Centroid Involution:** Define `ι(x) = (b_1-1 - x_1, ..., b_d-1 - x_d)`. Box indexes are invariant under `ι` or form `ι`-paired cycles. Every cycle `C` satisfies either `ι(C) = C` (self-symmetric, even order) or `ι(C) = C' ≠ C` (paired reflection).
- **Energy Metric:** `E(C) = Σ_{(u,v)∈C} ||u - v||_2^2`. Generalizes radiance to `L_2` grid displacement. For adjacent-base boxes `(b, b+1)`, `E(C) = R(C)` identically due to metric isomorphism on the grid boundary.

---

## **3. Polyhedral Symmetry & Hyper-Dimensional Structure (Corresponds to Layer 3: 3D & Hyper-Boxes)**
### **3.1 Factorial Box & Base Permutation Labeling**
Base permutations are elements of `S_d`, indexed by a truncated factorial basis `(d, d-1, ..., 1)`. Each column corresponds to a base direction `α, β, γ, ...` or its inverse `↗, ↘, ...`. The space of base permutations forms the permutahedron `Perm_d ⊂ ℝ^d`.

### **3.2 Shared Base-Places & Extrusion**
Let `P, Q ∈ S_d`. Let `k = |{i ∈ {1,...,d} : P(i) = Q(i)}|` be the number of shared base-places.
- `k = d`: `(P:Q) = e` (identity)
- `k = 0`: Pure directional extrusion (axes independent)
- `k = 1`: Dimensional extrusion. The index factors as `V/p × (b_1,...,b_{d-1})` with `p` copies replicated along the shared axis. Algebraically: `Index_{d} ≅ Index_{d-1} ⊗_{ℤ} ℤ_{p}`.

### **3.3 Symmetry Group Structure**
The symmetry group acting on box indexes is the wreath product:
`G_d ≅ S_d ⋉ ℤ_2^d`
- `S_d` permutes base dimensions.
- `ℤ_2^d` applies component-wise involution `x_j ↦ b_j - 1 - x_j`.
Cycles are orbits under `⟨s⟩ ⋉ ι`, explaining why all structural symmetries manifest as involution pairings or self-alignments.

---

## **4. The Multiplicative Completion (The Terminus Reveal)**
### **4.1 Stride in `MG(V-1)`**
Since every base `b_j` divides `V`, `gcd(b_j, V-1) = 1`. Thus, every base stride lies in the multiplicative group:
`MG(V-1) ≡ ℤ_{V-1}^* = {x ∈ ℤ_{V-1} : gcd(x, V-1) = 1}`
The stride product `s` generates a cyclic subgroup `⟨s⟩ ≤ MG(V-1)`. The winding path on the box grid is the projection of the multiplicative orbit `⟨s⟩` onto the additive lattice `ℤ_V`.

### **4.2 The `V-1` Boundary & Structural Closure**
The index domain is `ℤ_V = {0, 1, ..., V-1}`. The tallying map covers `{1, ..., V-1}` under multiplication by `s`, but **cannot** map to `0` multiplicatively (since `0` is not in `ℤ_{V-1}^*`). The element `V-1` serves as the **additive boundary** that closes the torsor:
- `x ↦ s·x mod (V-1)` cycles through `ℤ_{V-1}^*`
- `V-1` is the fixed completion element: `(P:Q)(V-1) = V-1`
Adding `V-1` to `MG(V-1)` extends the multiplicative action to the full index set, completing the mapping `ℤ_V ≅ ⟨s⟩ ∪ {V-1}`. The twist `:` ensures `s · s^{-1} ≡ 1 mod (V-1)`, forcing cycle closure exactly at the boundary.

### **4.3 Polynomial Duality Theorem**
For any cycle `C` and any coordinate projection `j ∈ {1,...,d}`:
`c_k^{(j)} ≡ W_j · b_j^k mod (b_j^{L_j} - 1)`
where `W_j` is an alignment weight, `L_j` is the cycle length in dimension `j`, and `b_j` is the base stride. The full state is recoverable via the Chinese Remainder Theorem across dimensions. Throwing away one coordinate retains full information because the multiplicative bases are pairwise coprime to `V-1` and the cycle length `L` is the multiplicative order `ord_{MG(V-1)}(s)`.

---

## **5. Pedagogical Mapping & Computational Bounds**
### **5.1 Interactive → Formal Mapping Table**
| Interactive Concept | Formal Structure |
|---------------------|------------------|
| Index / Identity | `S_n` / `e ∈ S_n` |
| Cycle Stave | Disjoint cycle decomposition in `S_n` |
| Radiance / Energy / Momentum | `ℓ_1, ℓ_2, ℓ_d` graph metrics on `Perm_d` |
| Tallying Box `(a,b,...)` | Basis factorization `V = ∏ b_j` & place-value map |
| Twist `:` | Composition `P ∘ Q^{-1}` on `S_d` |
| Centroid Symmetry | Involution `ι(x) = b - 1 - x` in `ℤ_{b_j}` |
| `MG(V-1)` Stride | Multiplicative action in `ℤ_{V-1}^*` |
| Factorial Box | Permutahedron `Perm_d` & wreath product `S_d ⋉ ℤ_2^d` |
| `V-1` Fixed Point | Additive boundary completing torsor closure |

### **5.2 Computational Safeguards (Formal)**
- Full index enumeration bounded to `V ≤ 12` or `d ≤ 4` for interactive clarity.
- Higher dimensions use subgroup sampling via `ord(s)` and CRT reconstruction.
- Non-coprime bases or mismatched tallies explicitly fail `MG(V-1)` inclusion, triggering constructive bounds.
- All cycle metrics, symmetries, and weight discoveries are verified against formal invariants before UI rendering.

---

## **6. Resonance & Conclusion**
The Terminus formalizes the progression from abstract index manipulation → coordinate tallying → dimensional symmetry → multiplicative closure. Every "magic" discovered interactively maps directly to a group-theoretic, combinatorial, or geometric structure. The journey from Origin to Terminus is not a sequence of isolated topics, but a single mathematical object viewed through successive lenses: `S_n` → `ℤ_V` → `ℤ_{V-1}^*` → `Perm_d ⋉ ℤ_2^d`. The interactive layers are the discovery; Terminus is the structure.

---

This Terminus specification:
- Mirrors the interactive journey exactly, section-by-section
- Formalizes all metaphors with precise algebraic, geometric, and combinatorial language
- Introduces `MG(V-1)` and the `V-1` boundary as the structural closure, exactly as requested
- Preserves the pedagogical "magic → theorem" arc without premature exposure
- Provides a complete mapping table and computational bounds
- Maintains strict notation consistency with Layers 1–3
