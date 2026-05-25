# **Tutorial Specification: "The Permutation Lattice"**

1.  **Permutations ($S_n$):** The entire tutorial is fundamentally about permutations—the arrangement, composition, and decomposition of indices. $S_n$ (the symmetric group) is the core mathematical object being explored.
2.  **Lattice:** A lattice, in mathematics, is a partially ordered set where every pair of elements has a unique meet (greatest lower bound) and a unique join (least upper bound).
    *   The structure of indexes and compositions naturally forms an ordered set.
    *   The relationships between indices (parent/child relationships via rooting, or shared subsets via the box structure) suggest a complex partial order.
    *   The concept of $S_n$ itself can be viewed within the lattice of subgroups, reinforcing the terminology.

A pedantic critique might argue that $S_n$ is technically a group, not exclusively a lattice. However, in educational and applied mathematics contexts, the terminology of "lattice" is often used broadly to describe any system with deep, hierarchical, and overlapping structural dependencies—which perfectly describes the relationship between 1D indexes, 2D box indexes, and $d$-dimensional hyper-boxes. 
The name thus works as a powerful pedagogical metaphor.

The "Permutation Lattice" suggests that the entire space of possible indexes (from $S_n$ to the factorially constrained $S_d$) is not a linear progression of topics, but a multi-dimensional, interconnected structure. The tutorial is designed to reveal this lattice by peeling back layers of constraints:

. Layer 1: Constraining the space to 1D (linear permutations $S_n$).
. Layer 2: Constraining the space via tiling (Box Indexes $\rightarrow$ factoring $V$).
. Layer 3: Generalizing the tiling structure to higher dimensions (Hyper-Boxes $\rightarrow$ factoring $V$ into $d$ parts).
. Layer 4: Revealing the algebraic rules (the lattice structure) that govern all these physical and geometric constraints simultaneously.
It suggests that the underlying relationships—such as duality, fixed points, cycle symmetry, and multiplicative inverse—are invariant regardless of the number of dimensions ($d$). The lattice implies that the insights gained in 1D (radiance) are not merely repeated in 2D (energy) but are part of a single, coherent, geometric principle (the generalization of metric distance/invariance).


## **Overview**
A progressive, interactive exploration of permutation structure, resonance, coordinate geometry, duality, and symmetry. 
The tutorial prioritizes number-flow intuition, visual pattern discovery, and hands-on manipulation 
before revealing formal group-theoretic structure. 

Navigation is gated by puzzle completion. 


The final layer, **Terminus**, serves as the final reveal with detailed notes on the mathematics that formally mirrors the interactive journey.
We'll finally relate box indexes to members of the multiplicative group modulo v-1, where v is the box volume, and we'll write MG(v-1) to refer to the group.
We'll see that adding the terminus "v-1" to MG(v-1) as a fixed point completes the mapping.
But this must be hidden from the student until Terminus, although this knowledge is useful in preparing the earlier layers.
The resonance of the progression of Terminus with the progression of the whole tutorial is intentional.
The key themes of duality and resonance are discovered in the detail of the subject matter.
The tutorial itself can be seen as dual with its subject matter, 
and should attempt to "be" resonant with the subject matter, if only for reason of aesthetics and symmetry, 
but never where that would obscure a simple explanation.
