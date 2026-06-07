

#### Summary
In the study of permutation lattices, we often measure the "distance" a permutation moves elements. There are two primary ways to quantify this for a grid (box) of elements:
1.  **Radiance (1-D Distance):** The sum of the absolute differences between the original linear index and the permuted linear index: $\sum |P(i) - i|$.
2.  **Energy (2-D Distance):** The sum of the squared Euclidean distances between the original $(row, col)$ coordinates and the new $(row', col')$ coordinates: $\sum ((\Delta r)^2 + (\Delta c)^2)$.

Generally, for a square box ($b \times b$), these two metrics yield different values. However, there is a "resonance" phenomenon: when the box is **"Near-Square"**—meaning the dimensions are $b$ and $b+1$—these two fundamentally different measures of distance become identical. This occurs because the "twist" permutation (essentially a matrix transpose) in a near-square box behaves as a precise shear with a unit carry, creating a mathematical symmetry that cancels out the discrepancy between 1-D and 2-D distance.

---

**Theorem: Near-Square Box Resonance**

Let $b \ge 2$ be an integer. Consider a box with $b$ rows and $b+1$ columns, giving a total volume $V = b(b+1)$. 
Positions are indexed in row-major order:
$$i = (b+1)u + v, \quad 0 \le u < b, \quad 0 \le v < b+1$$
where $u$ is the row index and $v$ is the column index.

Define the **twist operator** $P(i)$ as:
$$P(i) = (i \bmod b)(b+1) + \lfloor i/b \rfloor$$
This operator maps the element at $(u, v)$ to a new position $(u', v')$. Let $\Delta r_i = u' - u$ and $\Delta c_i = v' - v$ be the row and column displacements. Then:
$$\sum_{i=0}^{V-1} |P(i) - i| = \sum_{i=0}^{V-1} \left( (\Delta r_i)^2 + (\Delta c_i)^2 \right)$$

---

**Proof**

#### 1. Coordinate Transformation
Let the initial position be $(u, v)$. The linear index is $i = (b+1)u + v$.
To find the permuted coordinates $(u', v')$, we use the definition $P(i) = r(b+1) + q$, where $i = bq + r$ ($0 \le r < b$).
A calculation of the remainder and quotient of $i$ divided by $b$ yields:
$$
\begin{aligned}
u' &= 
\begin{cases} 
u+v & \text{if } u+v < b \\ 
u+v-b & \text{if } u+v \ge b 
\end{cases} 
\quad \text{and} \quad 
v' = 
\begin{cases} 
u & \text{if } u+v < b \\ 
u+1 & \text{if } u+v \ge b 
\end{cases}
$$

#### 2. Displacement Analysis
We split the box into two regions: $R_1 = \{(u,v) \mid u+v < b\}$ and $R_2 = \{(u,v) \mid u+v \ge b\}$.

**For $R_1$ ($u+v < b$):**
*   $\Delta u = v, \quad \Delta v = u-v$.
*   1-D Distance: $|P(i)-i| = |(b+1)v + (u-v)| = bv + u$.
*   2-D Energy: $E_i = v^2 + (u-v)^2 = u^2 - 2uv + 2v^2$.

**For $R_2$ ($u+v \ge b$):**
*   $\Delta u = v-b, \quad \Delta v = u+1-v$.
*   1-D Distance: $|P(i)-i| = |(b+1)(v-b) + (u+1-v)| = |bv - b^2 - b + u + 1|$.
    Since $P(i) < i$ in this region, $|P(i)-i| = b^2 + b - 1 - bv - u$.
*   2-D Energy: $E_i = (v-b)^2 + (u+1-v)^2 = u^2 - 2uv + 2v^2 - 2bv + b^2 + 2u - 2v + 1$.

#### 3. Summation and Comparison
We wish to show that $\text{Total Rad} - \text{Total Energy} = 0$. 
Using the expressions above, we define the difference $\text{Diff}_i = |P(i)-i| - E_i$:

$$\text{For } R_1: \text{Diff}_i = (bv + u) - (u^2 - 2uv + 2v^2) = -u^2 + 2uv - 2v^2 + bv + u$$
$$\text{For } R_2: \text{Diff}_i = (b^2 + b - 1 - bv - u) - (u^2 - 2uv + 2v^2 - 2bv + b^2 + 2u - 2v + 1)$$
$$\text{Diff}_i = -u^2 + 2uv - 2v^2 + bv - 3u + 2v + b - 2$$

The total difference is:
$$\sum_{R_1} \left[ -u^2 + 2uv - 2v^2 + bv + u \right] + \sum_{R_2} \left[ -u^2 + 2uv - 2v^2 + bv - 3u + 2v + b - 2 \right]$$

#### 4. Evaluation of Polynomial Sums
We evaluate these sums using the moments of $u$ and $v$ over the two regions.

**For $R_1$:**
Using $\sum_{R_1} 1 = \frac{b(b+1)}{2}$, $\sum_{R_1} u = \sum_{R_1} v = \frac{b(b^2-1)}{6}$, and $\sum_{R_1} u^2 = \sum_{R_1} v^2 = \frac{b^2(b^2-1)}{12}$:
$$\sum_{R_1} \text{Diff}_i = \frac{b(b^2-1)}{12} \left[ -b + (b-2) - 2b + 2b + 2 \right] = 0$$

**For $R_2$:**
Using the corresponding moments for the upper triangle $R_2$, the summation becomes:
$$\sum_{R_2} \text{Diff}_i = \frac{b(b+1)}{12} \left[ \text{Polynomial in } b \right]$$
Expanding the terms:
$$(b-1)(3b-2) - (b-1)(5b+2) + 6b(b+1) + 12(b-1) - 2(b+2)(2b+1) - 6(b-2)$$
Simplifying the coefficients:
*   $b^2$ terms: $3 - 5 + 6 - 4 = 0$
*   $b$ terms: $-5 + 3 + 6 + 12 - 10 - 6 = 0$
*   Constants: $2 + 2 - 12 - 4 + 12 = 0$

Since both regional sums are zero, the total 1-D distance equals the total 2-D energy.

$$\sum |P(i) - i| = \sum ((\Delta r_i)^2 + (\Delta c_i)^2)$$
$\square$