# Layer 3a: Concrete and Symbolic Expressions
## Navigating Internal Worlds

### Goal
Reveal the duality between **Concrete Construction** (geometric, context-dependent) and **Symbolic Algebra** (abstract, context-independent). Learners will master the "Rosetta Translation" between these languages, enabling them to choose the right tool for the task: Concrete for building, Symbolic for solving.

---

### Core Concepts

#### 1. The Box Declaration Context
*   **Definition:** Every box operation exists within a **Box Declaration** (e.g., `V = 2 × 2 × 5`).
*   **Role:** This declaration is the "dictionary" that translates Concrete values to Symbolic axes.
*   **Constraint:** Concrete expressions are invalid without a declared context. Symbolic expressions are universal.
*   **Interactive:** Learners select a Box Declaration from a menu. Concrete inputs validate against this declaration.

#### 2. Conditional Subscripts (The Disambiguation Rule)
*   **Problem:** In `(2, 2, 5)`, which `2` is which?
*   **Solution:** Subscripts `_0, _1` appear *only* when values repeat.
*   **Rule:**
    *   Unique Value: `5` (No subscript).
    *   Repeated Value: `2_0, 2_1` (Subscripts required).
    *   Consistency: If one `2` has a subscript, all `2`s must.
*   **Visual Cue:** Subscripts glow when hovered, showing the mapping to Abstract axes (`2_0 → α`, `2_1 → β`).

#### 3. The Rosetta Translation
*   **Mechanism:** A bidirectional translator between Concrete and Symbolic.
*   **Concrete → Symbolic:**
    1.  Parse factors (e.g., `2_1`).
    2.  Lookup index in Declaration (e.g., 2nd factor).
    3.  Assign Greek (e.g., `β`).
    4.  Assign Arrow (1st in pair `🠅`, 2nd `🠇`).
*   **Symbolic → Concrete:**
    1.  Parse Greek (e.g., `β`).
    2.  Lookup factor in Declaration (e.g., 2nd factor → `2`).
    3.  Apply Subscript (if `2` repeats, assign instance based on usage history).
*   **Interactive:** A "Rosetta Toggle" switches the view of the same expression between Concrete and Symbolic forms instantly.

#### 4. The Slide Operator (`|`)
*   **Concrete View:** `((A:B)|C)` means "Build a plane with A and B, then stack layers of C".
*   **Symbolic View:** Implicit in the Greek assignment. `α🠅:β🠇` assumes extrusion along remaining axes (`γ`, `δ`...).
*   **Handedness:**
    *   Right Slide `((A:B)|C)`: Standard orientation.
    *   Left Slide `(C|(A:B))`: Conjugated orientation (swaps arrows/Greek positions).
*   **Visual:** Animate the "stacking" of 2D grids into a 3D block. Highlight the "layer" axis.

---

### Interactive Elements

`[PLACEHOLDER: Box Declaration Selector]` Choose volume factorization (e.g., `2×2×5`, `3×4×5`). Updates context for all Concrete inputs.
`[PLACEHOLDER: Concrete Builder]` Drag-and-drop factors into `( : )|` slots. Validates subscripts dynamically. Errors if subscripts missing on repeats.
`[PLACEHOLDER: Rosetta Toggle]` Switch view between `((2_0:2_1)|5)` and `α🠅:β🠇`. Highlights corresponding parts (e.g., `2_0` glows when `α` glows).
`[PLACEHOLDER: Slide Animator]` Visualize `((A:B)|C)` vs `(C|(A:B))`. Show how the "layer" axis changes orientation.
`[PLACEHOLDER: Translation Debugger]` Input a Concrete expression. Step through the translation algorithm (Factor → Index → Greek → Arrow).

---

### Puzzle Gate

1.  **Subscript Detective:** Given Box `(2, 2, 5)`, fix the invalid expression `((2:2)|5)`. Add correct subscripts.
2.  **Rosetta Match:** Match three Concrete expressions to their Symbolic equivalents using a specific Box Declaration.
3.  **Slide Orientation:** Predict the Symbolic form of `(5|(2_0:2_1))` vs `((2_0:2_1)|5)`. Verify arrow swaps.
4.  **Context Switch:** Take a Symbolic expression `α🠅:β🠇`. Translate it to Concrete for Box `(2, 3, 5)` AND Box `(3, 2, 5)`. Observe how the Concrete form changes while Symbolic stays static.
5.  **Ambiguity Challenge:** Given `(2, 2, 2)`, construct three distinct Concrete expressions that map to distinct Symbolic forms (`α🠅:β🠇`, `α🠅:γ🠇`, `β🠅:γ🠇`).

---

### Notation & Scope Boundaries
*   **Strictly 3D Grounding:** Focus on 3D boxes for clarity. 4D mentioned as "Hyper-Box" teaser.
*   **Deferred Algebra:** Reduction rules (Telescoping) are introduced in Layer 3b. Here, focus on *translation* and *construction*.
*   **Subscript Consistency:** Enforce the "Conditional Subscript" rule strictly. No `2_0` without `2_1`.
*   **Metaphor:** Concrete = "Building Instructions". Symbolic = "Universal Blueprint".

---

### Computational Safeguards
*   **Context Validation:** Concrete inputs fail if Box Declaration doesn't match factors.
*   **Subscript Enforcement:** UI prevents typing `2` if `2` is repeated in declaration; forces `2_`.
*   **Translation Verification:** Auto-check Concrete ↔ Symbolic mapping on every interaction.
*   **UI Scaling:** 3D wireframes cap at volume 40 for clear subscript labeling.
