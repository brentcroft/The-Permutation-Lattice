# 🌐 Layer 1: Origin - The 1D Displacement Field

**Goal:** To establish the foundational vocabulary (Array vs. Index), anchor all manipulation to the identity, and guide the student to master composition, cycle decomposition, and generative power relationships in a purely 1D space. This prepares the student for the conceptual leap to coordinates by establishing the abstract notion of displacement.

## ✏️ I. Vocabulary & Conceptual Anchors

### 1. Array vs. Index (The Distinction)
*   **Array (The Raw Object):** Any sequence of non-negative integers. It is a raw numerical object that may be messy, containing duplicates, gaps, or values outside the expected range.
    *   *Analogy (Computational):* A memory dump or an unvalidated data stream.
    *   *Analogy (Physical):* A random collection of mismatched numbered items.
*   **Index (The Valid Object):** A specialized `array` that satisfies two strict rules:
    1.  Every label (0 to $n-1$) appears exactly once.
    2.  All labels are strictly contained within the bounds of the array length $n$.
    Indices are the domain of valid permutations ($S_n$). They are the only objects that can be meaningfully composed, decomposed, or mapped to real-world systems.

### 2. The Identity (The Anchor Point)
The **identity** $e = [0, 1, 2, ..., n-1]$ is the canonical index where every label rests in its assigned "home" position. It serves as the **Doorway to Reality**:
*   It is the structural baseline from which all transformations originate.
*   When we assign real-world items to the identity, we establish the initial, natural order.
*   A permutation becomes a **rearrangement instruction** relative to this identity. We calculate the combined shuffles abstractly, and only then is the final displacement issued.

*Motivating Examples (Multi-Perspective Analogies):*
| Context | Index ($e$) | Permutation ($P$) | Interpretation |
| :--- | :--- | :--- | :--- |
| **Physical** | Factory rack labels (0 to $n-1$). | Shift instructions (e.g., "Slot 2 moves to 5"). | Calculate net shift, then execute the physical cable move. |
| **Computational** | Memory addresses 0 to $n-1$. | Data pointer mapping $i \to P[i]$. | Write the instruction set; the net effect is the final memory state. |
| **Social/Abstract** | Seating chart for $n$ guests. | Seating changes (circular shifts). | The abstract composition tells us where everyone ends up, irrespective of the path. |

## 🔄 II. Composition & Displacement (The Action)

### 1. Defining Composition ($A * B$)
Composition is the mathematical representation of sequential action. If $A$ and $B$ are indices, $A * B$ means applying the movement $B$ first, and then applying $A$ to the resulting state.
The evaluation rule is: $Output[i] = B[A[i]]$.
*   **Flow Mechanism:** We use a **Right-to-Left Pipeline** convention: $A * B * e$ evaluates as $A \circ (B \circ e)$. The rightmost operand ($e$) is always the initial point (the physical state at rest). Each leftward operand is the next displacement instruction.

### 2. Cycle Decomposition (The Structure)
Any index $P \in S_n$ can be broken down into independent, non-overlapping cycles. These cycles represent the *independent gears* of the displacement.
*   **Fixed Points:** Labels $i$ where $P[i] = i$. These are self-contained mini-identities (the mechanism doesn't move them).
*   **Cycle Stave Visualization:** A dedicated parallel-track diagram where labels are spheres. Arcs connect consecutive positions. The upward/downward orientation of the arc (based on $P[i]$ vs $i$) provides a visual measure of "displacement effort."

### 3. Power Chains & Roots (The History)
*   **Order:** Repeated composition $P, P^2, P^3, ...$ traces a power chain until it returns to $e$. The length of this chain is the **order** of $P$.
*   **Generative Roots:** If $Q^k = P$, then $Q$ is a root of $P$. The identity $e$ acts as the terminal point of all chains, making every index a 'rearranged power' of the baseline state.

## 📐 III. Layered Transition & Metrics

### 1. From 1D to 2D (The Setup)
When we transition from the linear index $P \in S_n$ to the box index $T$, we are not just arranging $n$ items; we are counting a highly structured, constrained subset of $S_n$. This constraint is **tallying**.
*   **Growth Contrast:** The sheer number of possible arrays ($n^n$) or general permutations ($n!$) shrinks dramatically when constrained by geometry (e.g., $n=10$ has $10! \approx 3.6$ million possibilities, but the box indices are far sparser).
*   **Distance Measures:** We establish the initial metric: **Radiance** ($R(P) = \Sigma|P(i) - i|$). This is the sum of all absolute jumps across the cycle stave—the minimal, rectilinear displacement effort.

## 🚀 Interactive Elements (The Student Experience)

*   `[PLACEHOLDER: Index Validator]` Input arrays. Toggle Point/Displacement view. Validates structure and guides conversion to $S_n$.
*   `[PLACEHOLDER: Composition Calculator]` Allows chain expressions (e.g., `[2,1,0] * [1,0,2]`). Toggles RTL/LTR evaluation. Shows step-by-step number flow.
*   `[PLACEHOLDER: Cycle Stave]` Generates the visual structure. Animates gear-like rotation and labels fixed points/cycle order.
*   `[PLACEHOLDER: Power Chain Explorer]` Traces $P, P^2, P^3...$ to $e$. Highlights order and root relationships.
*   `[PLACEHOLDER: Roots Graph]` Visualizes generative ancestry (A $\to$ A², etc.).

## 🧩 Puzzle Gate
1. **Index Validation:** (Reinforce $S_n$ rules).
2. **Stave Matching:** (Identify cycles, order, fixed points).
3. **Pipeline Tracing:** (Verify $A*B*C = (A*B)*C$).
4. **Root & Order Exploration:** (Map generative ancestry within $S_3$).

## 🔗 Notation & Scope Boundaries
*   **Scope:** Strictly 1D indexing $[i]$.
*   **Metaphor:** All interactions reinforce the `abstract index → real-world mapping → composition → issued instruction` pipeline.
*   **Deferred:** Coordinate folding, stride, or basis swapping is withheld.

