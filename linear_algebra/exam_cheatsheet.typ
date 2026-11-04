#import "../template.typ": *

#show: conf.with(
  header: "Linear Algebra Cheatsheet",
  author: "Leo",
  column_count: 2,
  font_size: 8.6pt,
)

= Linear equations
*REF*: Row echelon form of a matrix. A matrix is in REF if:
+ any rows that consists of only zeros are at the bottom of the matrix
+ leading entry (first nonzero element of a row from the left) is further to the right for each successive row in the matrix.
*RREF*: Reduced row echelon form of a matrix. RREF is unique. Requirements:
+ it is in REF
+ each leading entry is a 1
+ each column that contains a leading 1 has all other entries 0.

- *No solutions when*
  - REF has a row [0 0 ... 0 | b] where $b != 0$
  - $rank(A) < rank([A | bold(b)])$
- *Unique solution when*
  - Row echelon form has $n$ non-zero rows
  - $rank(A) = rank([A | bold(b)]) = n$
- *Infinitely many solutions when*
  - Row echelon form has $r < n$ non-zero rows
  - $rank(A) = rank([A | bold(b)]) = r < n$
- If $[A|bold(b)]$ is consistent, then the general solution of $[A|bold(b)]$ has the form $bold(x) = bold(p) + bold(h)$ where $bold(p)$ is one particular solution of $[A|bold(b)]$, and $bold(h)$ is the general solution of $[A|0]$ involving the parameter(s).

= Matrices and Determinants
- *Matrix multiplication*: $(A B)_(i j) = sum_(k=1)^n A_(i k) B_(k j)$
- *Trace*: $Tr(A) = sum_(i = 1)^n A_(i i)$
  - $A, B$ (square, same order) implies $Tr(A B) = Tr(B A)$
- *Rank*: The number of leading entries in REF or RREF. $rank(A) = rank(A^T)$
- *Transpose*: $(A^T)_(i j) = A_(j i)$
  - $(A^T)^T = A$
  - $(A + B)^T = A^T + B^T$
  - $(k A)^T = k A^T$
  - $(A B)^T = B^T A^T$
- *Matrix inverse*: $A^(-1) A = A A^(-1) = I_n$ where $I_n$ is the identity matrix
  - To check if $B$ is the inverse of $A$, check if $A B = I_n$ (one way is sufficient)
  - To find inverse of $A$, augment $[A|I_n]$ and row reduce to $[I_n|A^(-1)]$
  - $(A^(-1))^(-1) = A$
  - $(A B)^(-1) = B^(-1) A^(-1)$
  - $(A^k)^(-1) = (A^(-1))^k$ for $k >= 1$
  - $(A^T)^(-1) = (A^(-1))^T$
- *Elementary matrix*: obtained from the identity matrix by performing a single elementary row operation
  - If $A ~ I_n$ by a sequence of elementary row operations with corresponding elementary matrices $E_1, ..., E_k$, then
    - $E_k E_(k-1) ... E_1 A = I_n$.
    - Or, $A=E_1^(-1) E_2^(-1) ... E_k^(-1)$
- *Determinants*:
  - Adding a multiple of one row to another row does not change the determinant
  - Multiplying a row by a scalar $k$ multiplies the determinant by $k$
  - Interchanging two rows multiplies the determinant by $-1$
- *Calculating determinants*:
  - If $A = mat(delim: "[", a, b; c, d)$, then $det(A)= a d - b c$.
  - Define (i,j)-cofactor $C_(i j)$ as $C_(i j) = (-1)^(i + j) det(A(i,j))$ where $A(i,j)$ is the $(n-1) times (n-1)$ matrix obtained by deleting the $i$-th row and $j$-th column of $A$.
  - Cofactor expansion along the $i$-th row: $det(A) = sum_(k=1)^n A_(i k) C_(i k)$
  - Cofactor expansion along the $j$-th column: $det(A) = sum_(k=1)^n A_(k j) C_(k j)$
  - If $A$ is triangular, then $det(A) = product_(i=1)^n A_(i i)$
- *Properties of determinants*:
  - $det(A^T) = det(A)$
  - $det(A B) = det(A) det(B)$
  - $det(A^(-1)) = 1/det(A)$
  - $det(k A) = k^n det(A)$ for $k in RR$

= Euclidean Vector Spaces
- *Distance*: $d(bold(a), bold(b)) = ||bold(a) - bold(b)||$
- *Euclidean dot product*:
  - $bold(u) dot bold(v) = ||bold(u)|| ||bold(v)|| cos(theta)$
  - $bold(u) dot bold(v) = sum_(i=1)^n u_i v_i$
  - Given $bold(u) = (u_1, ..., u_n)$ and $bold(v) = (v_1, ..., v_n)$, then $bold(u) dot bold(v) = bold(u)^T bold(v)$
- *Important properties of dot product*:
  - $bold(u) dot (bold(v) + bold(w)) = bold(u) dot bold(v) + bold(u) dot bold(w)$
  - $(k bold(u)) dot bold(v) = k (bold(u) dot bold(v))$
  - $bold(u) dot bold(u) = ||bold(u)||^2$
- *Vector projection* of $bold(u)$ onto $bold(v)$: $proj_(bold(v)) bold(u) = (bold(u) dot bold(v))/(||bold(v)||^2) bold(v)$
- *Cross product*: $bold(u) times bold(v) = ||bold(u)||||bold(v)||sin(theta) hat(bold(n))$
  - $bold(u) times bold(v) = -(bold(v) times bold(u))$
  - $bold(u) times (bold(v) + bold(w)) = bold(u) times bold(v) + bold(u) times bold(w)$
  - $k (bold(u) times bold(v)) = (k bold(u)) times bold(v) = bold(u) times (k bold(v))$
  - $bold(u) times bold(u) = bold(0)$
  - $||bold(u) times bold(v)||$ is the area of the parallelogram formed by $bold(u)$ and $bold(v)$
  - $|bold(u) dot (bold(v) times bold(w))|$ is the volume of the parallelepiped formed by $bold(u)$, $bold(v)$, $bold(w)$
  - $bold(u) dot (bold(v) times bold(w)) = bold(v) dot (bold(w) times bold(u)) = bold(w) dot (bold(u) times bold(v))$

// == Application: correlation
// Given a matrix $X$ with two columns (one for each variable).
// 1. Subtract average score $bar(X)$ from each column to get $X - bar(X)$ with columns $bold(x)_1, bold(x)_2$
// 2. Correlation is the dot product $hat(bold(x)_1) dot hat(bold(x)_2) = (bold(x)_1 dot bold(x)_2)/(||bold(x)_1|| ||bold(x)_2||)$

= Vector spaces
- *Vector space*: A set $V$ of vectors with vector addition and scalar multiplication defined, satisfying the following axioms:
  1. Closure under addition: $bold(u), bold(v) in V$ implies $bold(u) + bold(v) in V$
  + Associativity: $(bold(u) + bold(v)) + bold(w) = bold(u) + (bold(v) + bold(w))$
  + Commutativity: $bold(u) + bold(v) = bold(v) + bold(u)$
  + Existence of zero vector: There exists a vector $bold(0) in V$ such that $bold(u) + bold(0) = bold(u)$ for all $bold(u) in V$
  + Existence of additive inverse: For each $bold(u) in V$, there exists a vector $-bold(u) in V$ such that $bold(u) + (-bold(u)) = bold(0)$
  + Closure under scalar multiplication: $alpha in FF$ and $bold(u) in V$ implies $alpha bold(u) in V$
  + Associativity of scalar multiplication: $alpha (beta bold(u)) = (alpha beta) bold(u)$
  + Existence of multiplicative identity: $1 bold(u) = bold(u)$
  + Distributivity of scalar multiplication with respect to vector addition: $alpha (bold(u) + bold(v)) = alpha bold(u) + alpha bold(v)$
  + Distributivity of scalar multiplication with respect to scalar addition: $(alpha + beta) bold(u) = alpha bold(u) + beta bold(u)$
- *Field*: A set $F$ of scalars with addition, subtraction, multiplication, and division by a nonzero scalar defined, satisfying the field axioms (closure, associativity, commutativity, distributivity, identities, and inverses)
  - Define $FF_2 = \{0, 1\}$ with mod 2 arithmetic. $a thin (mod 2) = a+2k thin (mod 2)$
- *Subspaces*: A subset $W$ of a vector space $V$ is a subspace if it is itself a vector space under the same operations as $V$.
  - All subspaces of $RR^3$ include: $\{ bold(0) \}$, $RR^3$, all lines through the origin, and all planes through the origin.
- *Subspace theorem*: Let $W subset.eq V$. Then $W$ is a subspace of $V$ iff for all $bold(u), bold(v) in W$ and all $alpha in FF$
  + $bold(0) in W$ (inherits zero vector)
  + $bold(u) + bold(v) in W$ (closure under addition)
  + $alpha bold(u) in W$ (closure under scalar multiplication)
- *Linear combination of vectors*: $sum_(i=1)^k alpha_i bold(v)_i$
- *Span*: The set of all linear combinations of the vectors $bold(v)_1, ..., bold(v)_k$, denoted $span\{bold(v)_1, ..., bold(v)_k\}$
  - The span is a subspace of $V$.
  - Span always contains the zero vector $bold(0)$
  - *Finding span*: If $A = [bold(v)_1 dots bold(v)_k]$, then $bold(v)_1,...,bold(v)_k$ span $FF^n$ $<=>$ $[A | bold(w)]$ is consistent for all $bold(w) in FF^n$ $<=>$ $rank(A) = n$.
- *Linear dependence and independence*:
  - *Linearly dependent*: A set of vectors $\{bold(v)_1, ..., bold(v)_k\}$ is linearly dependent if there exist scalars $alpha_1, ..., alpha_k$, not all zero, such that $sum_(i=1)^k alpha_i bold(v)_i = bold(0)$.
  - *Linearly independent*: not linearly dependent. Only solution is trivial case $alpha_1 = ... = alpha_k = 0$.
  - *Checking linear independence*: If $A = [bold(v)_1 dots bold(v)_k]$, then $\{bold(v)_1, ..., bold(v)_k\}$ is linearly independent $<=>$ $[A | bold(0)]$ has a unique solution $<=>$ $rank(A) = k$.
    - In the case $k = n$, $\{bold(v)_1, ..., bold(v)_k\}$ is linearly independent $<=>$ $det(A) != 0$.
- *Basis*: A set of vectors $\{bold(v)_1, ..., bold(v)_k\}$ is a basis for a vector space $V$ if it is linearly independent and spans $V$.
  - *Finding a basis*:
    + Column method: The pivot columns of a matrix $A$ form a basis for the column space of $A$.
    + Row method: The non-zero rows of a matrix $A$ in RREF form a basis for the row space of $A$.
- *Dimension*: The number of vectors in a basis for a vector space $V$
- *Coordinates relative to a basis*:
  - For $bold(v) in V$ with ordered basis $cal(B) = \{bold(v)_1, ..., bold(v)_n\}$. Then $bold(v) = alpha_1 bold(v)_1 + ... + alpha_n bold(v)_n$, where the scalars are uniquely determined. Then $[bold(v)]_cal(B) = mat(delim: "[", alpha_1; dots.v; alpha_n)$ is the coordinate vector of $bold(v)$ relative to the basis $cal(B)$.
  - There is one-to-one correspondence between $bold(v)$ and $[bold(v)]_cal(B)$.
  - $[bold(u) + bold(v)]_cal(B) = [bold(u)]_cal(B) + [bold(v)]_cal(B)$
  - $[alpha bold(v)]_cal(B) = alpha [bold(v)]_cal(B)$
- *Solution space/nullspace* of $A in cal(M)_(m,n)(FF)$: The set $S = \{ bold(x) in FF^n | A bold(x) = bold(0) \}$. It is a subspace of $FF^n$.
- *Nullity*: The dimension of the solution space/nullspace of $A$.
- *Column space*: span of the columns of $A$. It is a subspace of $FF^m$.
- *Row space*: span of the rows of $A$. It is a subspace of $FF^n$.
  - $rank(A) = dim("row space of A") = dim("column space of A")$
- If $A = [bold(v)_1 ... bold(v)_k]$ and $B = [bold(u)_1 ... bold(u)_k]$, where $A ~ B$, then the columns of $A$ and $B$ share the same linear relations: $alpha_1 bold(v)_1 + ... + alpha_k bold(v)_k = bold(0) <=> alpha_1 bold(u)_1 + ... + alpha_k bold(u)_k = bold(0)$.
  - Justification for column method: Row operations do not change the linear relations among the columns of a matrix. Therefore, the pivot columns of $A$ are linearly independent and span the column space of $A$ - thus forming a basis for the column space of $A$.
= Linear transformations

- *Linear transformation* from $U$ to $V$: A function $T: U -> V$ such that for all $bold(u), bold(v) in U$ and all scalars $alpha in FF$
  + $T(bold(u) + bold(v)) = T(bold(u)) + T(bold(v))$ (preserves vector addition)
  + $T(alpha bold(u)) = alpha T(bold(u))$ (preserves scalar multiplication)
  - *Anticlockwise rotation* in $RR^2$ by angle $theta$: $display(T(bold(v)) = mat(delim: "[", cos(theta), -sin(theta); sin(theta), cos(theta)) bold(v))$
  - *Clockwise rotation* in $RR^2$ by angle $theta$: $display(T(bold(v)) = mat(delim: "[", cos(theta), sin(theta); -sin(theta), cos(theta)) bold(v))$
  - *Reflection* about the line $y = m x$: $display(T(bold(v)) = mat(delim: "[", (1 - m^2)/(1 + m^2), (2 m)/(1 + m^2); (2 m)/(1 + m^2), (m^2 - 1)/(1 + m^2)) bold(v))$
  - *Shear* parallel to the $x$-axis by $k$ units: $display(T(bold(v)) = mat(delim: "[", 1, k; 0, 1) bold(v))$
  - *Shear* parallel to the $y$-axis by $k$ units: $display(T(bold(v)) = mat(delim: "[", 1, 0; k, 1) bold(v))$
- *Matrix representations of general linear transformations*:
  - $[T(bold(u))]_cal(C) = [T]_(cal(C), cal(B)) [bold(u)]_cal(B)$
  - $[T]_(cal(C), cal(B)) = [ [T(bold(b)_1)]_cal(C) quad ... quad [T(bold(b)_n)]_cal(C) ]$
  - Applying $[T]$, then $[R]$: new matrix is $[R][T]$.
  - Number of rows is the dimension of the codomain, and number of columns is the dimension of the domain.
- *Kernel/nullspace*: The set $ker(T) = \{bold(u) in U | T(bold(u)) = bold(0)\}$. It is a subspace of $U$.
- *Image/range*: The set $im(T) = \{T(bold(u)) | bold(u) in U\}$. It is a subspace of $V$.
- *Rank* of linear transformation: The dimension of the image/range of $T$.
- *Nullity* of linear transformation: The dimension of the kernel/nullspace of $T$.
- *Rank-nullity theorem (for transformations)*: $rank(T) + nullity(T) = dim(U)$
- *Injective*: $T$ is injective iff $ker(T) = \{bold(0)\}$ (only the zero vector maps to the zero vector)
- *Surjective*: $T$ is surjective iff $im(T) = V$ (the image of $T$ is the entire codomain)
- *Inverse of a linear transformation (isomorphism)*:
  1. $T$ is invertible iff $T$ is both injective and surjective
  2. If $T$ is invertible, then $T^(-1) : V -> U$ is a linear transformation such that $T^(-1)(T(bold(u))) = bold(u)$ for all $bold(u) in U$ and $T(T^(-1)(bold(v))) = bold(v)$ for all $bold(v) in V$.
  3. $[T^(-1)]_(cal(B),cal(C)) = [T]_(cal(C),cal(B))^(-1)$
- *Transition matrix*: the matrix of the identity transformation relative to the bases $cal(B)$ and $cal(C)$. A unique matrix $P_(cal(C), cal(B))$ such that $[bold(v)]_cal(C) = P_(cal(C), cal(B)) [bold(v)]_cal(B)$ for all $bold(v) in V$: $P_(cal(C), cal(B)) = [ [bold(b)_1]_cal(C) quad ... quad [bold(b)_n]_cal(C) ]$
- *Change of basis*: $[T]_(cal(B), cal(B)) = P_(cal(B), cal(C)) [T]_(cal(C), cal(C)) P_(cal(C), cal(B))$
- *Eigenvalue*: A scalar $lambda$ such that there exists a non-zero vector $bold(v)$ satisfying $T(bold(v)) = lambda bold(v)$.
  - To find eigenvalues, solve $det(A-lambda I) = 0$.
  - Trace is the sum of eigenvalues, and determinant is the product of eigenvalues.
  - Given $(lambda_i, bold(v)_i)$ pairs, the transformation scales vectors in the direction of $bold(v)_i$ by a factor of $lambda_i$ (reverse direction if $lambda_i$ is negative).
- *Diagonalisation*: $A=P D P^(-1)$ where $P=[bold(v)_1 ... bold(v)_n]$ and $D=diag(lambda_1, ..., lambda_n)$
  - A square matrix is diagonalisable iff it has $n$ linearly independent eigenvectors in $FF^n$.
  - In other words, the algebraic multiplicity of each eigenvalue equals its geometric multiplicity.
- *Powers of a matrix*: $A^k = P D^k P^(-1)$ where $D^k = diag(lambda_1^k, ..., lambda_n^k)$

= Inner product spaces
- *Real inner product*: A function $ip(., .): V times V -> RR$ satisfying:
  1. $ip(bold(u), bold(v)) = ip(bold(v), bold(u))$ (symmetry)
  2. $ip(bold(u) + bold(v), bold(w)) = ip(bold(u), bold(w)) + ip(bold(v), bold(w))$ (linearity of vector addition)
  3. $ip(alpha bold(u), bold(v)) = alpha ip(bold(u), bold(v))$ (linearity of scalar multiplication)
  4. $ip(bold(u), bold(u)) >= 0$ and $ip(bold(u), bold(u)) = 0$ $=>$ $bold(u) = bold(0)$ (positivity)
// - *Hermitian inner product*: A function $ip(.,.): V times V -> CC$ satisfying:
//   1. $ip(bold(u), bold(v)) = overline(ip(bold(v), bold(u)))$ (Hermitian symmetry)
//   2. $ip(bold(u) + bold(v), bold(w)) = ip(bold(u), bold(w)) + ip(bold(v), bold(w))$ (linearity of vector addition)
//   3. $ip(alpha bold(u), bold(v)) = alpha ip(bold(u), bold(v))$ (linearity of scalar multiplication)
//   4. $ip(bold(u), bold(u)) in RR$ with $ip(bold(u), bold(u)) >= 0$, and $ip(bold(u), bold(u)) = 0$ $=>$ $bold(u) = bold(0)$ (positivity)
- *Norm/length*: $||bold(u)|| = sqrt(ip(bold(u), bold(u)))$
- *Cauchy-Schwarz inequality*: $|ip(bold(u), bold(v))| <= ||bold(u)|| ||bold(v)||$
// - *Hermitian dot product*: $ip(bold(u), bold(v)) = sum_(i=1)^n u_i overline(v_i)$. Matrix form: $ip(bold(u), bold(v)) = bold(v)^* bold(u)$ where $bold(v)^* = overline(bold(v))^T$ with $bold(u), bold(v)$ being column vectors.
- *Angle for real inner product space*: $cos(theta) = ip(bold(u), bold(v))/(||bold(u)|| ||bold(v)||)$
// - *Angle for complex inner product space*: $cos(theta) = Re(ip(bold(u), bold(v)))/(||bold(u)|| ||bold(v)||)$
- *Orthogonal vectors*: $ip(bold(u), bold(v)) = 0$
- *Orthogonal set*: A set of vectors $\{bold(v)_1, ..., bold(v)_k\}$ is orthogonal if $ip(bold(v)_i, bold(v)_j) = 0$ for all $i != j$.
- *Orthonormal set*: A set of vectors $\{bold(v)_1, ..., bold(v)_k\}$ is orthonormal if it is orthogonal and $||bold(v)_i|| = 1$ for all $i$.
- *Orthonormal basis*: An orthonormal set that is also a basis for the vector space.
  - Every vector $bold(x) in V$ can be written as $bold(x) = ip(bold(x), bold(v)_1) bold(v)_1 + ... + ip(bold(x), bold(v)_n) bold(v)_n$ where $\{bold(v)_1, ..., bold(v)_n\}$ is an orthonormal basis for $V$.
- *Orthogonal projection* of $bold(v)$ onto $bold(u)$: $proj_(bold(u)) bold(v) = ip(bold(v), bold(u))/ip(bold(u), bold(u)) bold(u)$
  - $bold(v) - proj_(bold(u)) bold(v)$ is orthogonal to $bold(u)$ and is the shortest vector from $bold(v)$ to the line spanned by $bold(u)$.
- *Orthogonal projection* of $bold(v)$ onto a subspace $W$ with orthonormal basis $\{bold(u)_1, ..., bold(u)_k\}$ for $W$ and $bold(v) in V$: $proj_W bold(v) = sum_(i=1)^k ip(bold(v), bold(u)_i) bold(u)_i = ip(bold(v), bold(u)_1) bold(u)_1 + ... + ip(bold(v), bold(u)_k) bold(u)_k$
  - $proj_W bold(v) in W$
  - If $bold(w) in W$, then $proj_W bold(w) = bold(w)$
  - $bold(v) - proj_W bold(v)$ is orthogonal to $W$ and is the shortest vector from $bold(v)$ to the subspace $W$.
  - $proj_W bold(v)$ is the unique vector in $W$ that is closest to $bold(v)$: $||bold(v) - bold(w)|| > ||bold(v) - proj_W bold(v)||$ for all $bold(w) in W$ and $bold(w) != proj_W bold(v)$
- *Gram-Schmidt procedure*: converts a basis $\{bold(v)_1, ..., bold(v)_n\}$ of an inner product space V into an orthonormal basis $\{bold(u)_1, ..., bold(u)_n\}$ of V.
  - $bold(u)_1 = 1/(||bold(v)_1||) bold(v)_1$
  - $bold(w)_2 = bold(v)_2 - ip(bold(v)_2, bold(u)_1) bold(u)_1$
  - $bold(u)_2 = 1/(||bold(w)_2||) bold(w)_2$
  - $bold(w)_3 = bold(v)_3 - ip(bold(v)_3, bold(u)_1) bold(u)_1 - ip(bold(v)_3, bold(u)_2) bold(u)_2$
  - $bold(u)_3 = 1/(||bold(w)_3||) bold(w)_3$
  ...
  - $bold(w)_k = bold(v)_k - sum_(i=1)^(k-1) ip(bold(v)_k, bold(u)_i) bold(u)_i$
  - $bold(u)_k = 1/(||bold(w)_k||) bold(w)_k$
// - *QR decomposition*: consider $k <= n$ linearly independent vectors in $RR^n$, $\{bold(v)_1, ..., bold(v)_k\}$. Let $\{bold(u)_1, ..., bold(u)_k\}$ be the orthonormal basis obtained from the Gram-Schmidt procedure. Then, let the $n times k$ matrices $A,Q$ be defined as $A = [bold(v)_1 ... bold(v)_k]$ and $Q = [bold(u)_1 ... bold(u)_k]$. Define the $k times k$ upper triangular matrix
// $
//   R = mat(
//     delim: "[",
//     ip(bold(v)_1, bold(u)_1), ip(bold(v)_2, bold(u)_1), ..., ip(bold(v)_k, bold(u)_1);
//     0, ip(bold(v)_2, bold(u)_2), ..., ip(bold(v)_k, bold(u)_2);
//     dots.v, , ..., dots.v;
//     0, 0, ..., ip(bold(v)_k, bold(u)_k)
//   )
// $
// then $A = Q R$ is the QR decomposition of $A$.
- *Least squares curve fitting*. The least squares solution for the line $y = a+b x$ of best fit for the points $(x_1, y_1), ..., (x_n, y_n)$ is determined by $A^T A bold(u) = A^T bold(y)$, or $bold(u) = (A^T A)^(-1) A^T bold(y)$, where $A = mat(delim: "[", 1, x_1; 1, x_2; dots.v; 1, x_n)$ and $bold(y) = mat(delim: "[", y_1; y_2; dots.v; y_n)$, and $bold(u) = mat(delim: "[", a; b)$.
- *Orthogonal matrix*: a real $n times n$ matrix such that $Q^(-1) = Q^T$. To show, use $Q^T Q = I_n$.
  - Columns of $Q$ form an orthonormal basis for $RR^n$ using Euclidean dot product.
  - $Q bold(u) dot Q bold(v) = bold(u) dot bold(v)$. Preserves length and angle between vectors.
  - $det(Q) = pm 1$. When $det(Q) = 1$, $Q$ is a rotation matrix. When $det(Q) = -1$, $Q$ is a reflection and rotation matrix.
- *Symmetric matrix*: a real $n times n$ matrix such that $A^T = A$.
- *Diagonalisation of symmetric matrices*. Let $A$ be a real $n times n$ symmetric matrix. Then using the Euclidean dot product on $RR^n$:
  + all eigenvalues $lambda_i$ of $A$ are real
  + eigenvectors corresponding to distinct eigenvalues are orthogonal
  + there is an orthonormal basis $\{ bold(v)_1, ..., bold(v)_n \}$ consisting of eigenvectors of $A$
  + A is diagonalisable with $A = Q D Q^(-1) = Q D Q^T$ where $D = diag(lambda_1, ..., lambda_n)$ and $Q$ is the orthogonal matrix $[bold(v)_1 ... bold(v)_n]$
  + Spectral theorem: expressing real symmetric matrices in terms of their eigenvalues and eigenvectors. $A = lambda_1 bold(v)_1 bold(v)_1^T + ... + lambda_n bold(v)_n bold(v)_n^T$ where $\{bold(v)_1, ..., bold(v)_n\}$ is an orthonormal basis of eigenvectors of $A$.
