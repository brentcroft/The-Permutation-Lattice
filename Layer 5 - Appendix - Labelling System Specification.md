# The Labelling System Specification
## Global Reference for "The Permutation Lattice" Tutorial

### 1. Core Philosophy: The Numeric Label Shortcut
**Principle:** Numbers are used as labels in array positions as a convenient computational shortcut.
**Mechanism:**
1.  **Semantic Phase:** Real-world elements → Unique string labels → Mapped to Identity positions `[0, 1, ..., n-1]`.
2.  **Syntactic Shortcut:** Once mapped, the **position index** becomes the label.
    *   **Lookup Elimination:** No string hashing during manipulation.
    *   **O(1) Access:** Permutations become direct array indexing.
    *   **Algebraic Closure:** Operations remain within integers `0..n-1`.
**Implication:** All abstract symbols (`α`, `β`, `🠅`, `🠇`) resolve to integer permutations acting on this identity space. The Labelling System is a human-readable compression of these integer operations.

---

### 2. The Two Languages
The system operates in two parallel languages. Translation between them is context-dependent.

#### 2.1 Concrete Expressions (Geometric Construction)
*   **Domain:** Dimensional factors of the box volume (e.g., `2, 4, 5`).
*   **Syntax:** `(A:B)`, `|`, `*`.
*   **Context:** Requires a **Box Declaration** (ordered list of factors) to resolve ambiguity.
*   **Semantic:** Describes *how* the box index is constructed from physical dimensions.
*   **Operators:**
    *   `(A:B)`: 2D twist on dimensions A and B.
    *   `|`: Slide/Extrusion operator (lifts 2D to 3D+).
    *   `*`: Composition pipeline.

#### 2.2 Abstract Expressions (Factorial Coordinates)
*   **Domain:** Factorial box coordinates (`|d|...|1|`) and Directional Arrows.
*   **Syntax:** `Greek + Arrow` (e.g., `α🠅`) combined with `:`.
*   **Context:** Context-independent. `α` is always Axis 1, `β` Axis 2.
*   **Semantic:** Describes the *algebraic structure* of the permutation.
*   **Operators:**
    *   `:`: Twist Operator ($A \circ B^{-1}$).
    *   `*`: Composition pipeline.
    *   `e`: Identity (elided in base labels, retained in pipelines).

---

### 3. Syntax & Semantics

#### 3.1 Conditional Subscripts (Concrete Only)
*   **Rule:** Subscripts appear *only* to disambiguate repeated values in the Box Declaration.
*   **Unique Base:** `2` (No subscript).
*   **Repeated Bases:** `2_0, 2_1` (Subscripts required for all instances of `2`).
*   **Constraint:** Never see `2_0` unless `2_1` exists.
*   **Example:**
    *   Box `(2, 4, 5)`: `((4:2)|5)` (Valid).
    *   Box `(2, 2, 5)`: `((2_0:2_1)|5)` (Valid). `((2:2)|5)` (Invalid/Ambiguous).

#### 3.2 Directional Arrows (Abstract Only)
*   **Rule:** Order in Concrete `(A:B)` determines Arrows in Abstract.
*   **Mapping:** First dimension → `🠅`, Second dimension → `🠇`.
*   **Inverse:** Swapping order swaps arrows (`A🠅:B🠇` ↔ `B🠅:A🠇`).
*   **Elision:** `e` is elided in base labels (`α🠅`) but retained in pipelines (`P * e`).

#### 3.3 The Operators
| Operator | Concrete | Abstract | Formal Definition |
| :--- | :--- | :--- | :--- |
| **Twist** | `:` (in parens) | `:` | $A \circ B^{-1}$ (Forward ∘ Backward⁻¹) |
| **Slide** | `|` | (Implicit) | Wreath Product Conjugation (Extrusion) |
| **Compose** | `*` | `*` | Group Multiplication (Pipeline) |
| **Identity** | `e` (implicit) | `e` | Identity Element of $S_V$ |

---

### 4. Mapping & Translation (Rosetta Logic)
**Box Declaration:** Ordered list of factors `F = [f_0, f_1, ..., f_d]`.
**Abstract Mapping:** Factor at index `i` maps to Greek letter `i` (`0→α`, `1→β`, `2→γ`...).

**Translation Algorithm:**
1.  **Concrete → Abstract:**
    *   Identify factor instance in Concrete (e.g., `2_1`).
    *   Find its index in Box Declaration (e.g., 2nd factor → index 1).
    *   Assign Greek letter (e.g., `β`).
    *   Apply Arrow Rule (1st in pair → `🠅`, 2nd → `🠇`).
2.  **Abstract → Concrete:**
    *   Identify Greek letter (e.g., `β`).
    *   Find corresponding factor in Box Declaration (e.g., 2nd factor → `2`).
    *   Apply Subscript Rule (if `2` repeats, add subscript based on instance tracking).

**Example:**
*   **Box:** `(2, 2, 5)` → `F = [2, 2, 5]`.
*   **Mapping:** `2_0→α`, `2_1→β`, `5→γ`.
*   **Concrete:** `((2_0:2_1)|5)`.
*   **Abstract:** `α🠅:β🠇` (extruded `γ`).

---

### 5. Algebraic Laws (Reduction Rules)
These rules operate on the **Abstract Layer**. Concrete expressions must be translated to Abstract before reduction.

#### 5.1 Identity Annihilation (Telescoping)
*   **Rule:** $X:Y * Y:Z = X:Z$
*   **Derivation:** $(X \circ Y^{-1}) \circ (Y \circ Z^{-1}) = X \circ (Y^{-1} \circ Y) \circ Z^{-1} = X \circ Z^{-1}$.
*   **Example:** `α🠅:β🠇 * β🠇:γ🠇 = α🠅:γ🠇`.

#### 5.2 Dual Inversion
*   **Rule:** $(A🠅:B🠇)^{-1} = B🠅:A🠇$.
*   **Meaning:** Inverting a twist swaps operands and arrows.
*   **Concrete Equivalent:** Swapping order in `(A:B)` creates the inverse index.

#### 5.3 Cycle Closure (Triple Product)
*   **Rule:** The product of three distinct extrusion orientations of the same base pair set yields a fixed point or identity element.
*   **Form:** $P_{xy} * P_{yz} * P_{zx} \approx e$.
*   **Meaning:** Traversing all three dimensional perspectives returns to the origin (Torsor Structure).

#### 5.4 Paired Rotations (Conjugate Commutation)
*   **Rule:** Under specific symmetry conditions (Multiplicative Group Modulo V-1), sub-expressions can be rotated if they represent cycle closures.
*   **Form:** `β🠅:α🠇 * γ🠅:β🠅` can reassociate to `α🠅:β🠇 * β🠇:γ🠇` (Telescoping form).
*   **Condition:** Requires compatible stride products (coprime bases).

---

### 6. Hyper-box Generalization (4D+)
**Principle:** Any box index in $d$-dimensions can be constructed by iteratively extruding 2D sub-boxes.

#### 6.1 Iterative Extrusion
*   **2D:** `(A:B)`
*   **3D:** `((A:B)|C)`
*   **4D:** `(((A:B)|C)|D)`
*   **Abstract:** `α🠅:β🠇` (implicitly identity on `γ`, `δ`...).

#### 6.2 Universal Construction
*   **Generators:** The set of all "elementary extruded twists" `((A_i:A_j)|Rest)` for all pairs $i,j$ generates the group of Box Indexes.
*   **Completeness:** Any box index can be represented as a product of these generators.
*   **Symbolic:** A 4D index is a composition of twists on different planes: `(α🠅:β🠇) * (γ🠅:δ🠇)`.
*   **Concrete:** `(((2_0:2_1)|2_2)|5_3) * (((2_2:5_3)|2_0)|2_1)`.

#### 6.3 Factorial Basis Scaling
*   **Dimensions:** $d$ dimensions → Factorial Box `|d|d-1|...|1|`.
*   **Labels:** `α, β, γ, δ, ε...` (Greek alphabet extended).
*   **Symmetry:** Wreath Product $S_d \ltimes \mathbb{Z}_2^d$ scales naturally.
*   **Subscripts:** Conditional subscript rule applies recursively for any repeated factors in $d$-dimensions.

---

### 7. Tutorial Integration Notes
*   **Layer 1:** Numeric Shortcut, Identity, 1D Composition.
*   **Layer 2:** Concrete `(A:B)`, Twist `:`, 2D Geometry.
*   **Layer 3a:** **Concrete vs. Abstract Duality**, Subscripts, Rosetta Translation.
*   **Layer 3b:** Hyper-boxes, Reduction Rules, Algebraic Closure.
*   **Layer 4 (Terminus):** Formal Group Theory ($S_n$, $MG(V-1)$, Wreath Product).
*   **Pedagogy:** Introduce Concrete first (intuitive), then Abstract (powerful), then Reduction (magic).
