#import "../template.typ": apply-settings
#show: apply-settings

#align(center)[#title[Tensor decompositions]]

= LU Decomposition

If a square matrix $A in RR^(n times n)$ can be  written as
$ A = L U $ 

where $L$ is a lower triangular matrix with unit diagonal elements _(to enforce uniqueness)_ and $U$ is an upper triangular matrix. This is called the _LU decomposition_ of matrix $A$.


#text(fill: purple)[== Why is it useful?]

Consider the system of linear equations $A x = b$. Let's say we are trying to solve for $x$ as $A^(-1)b$. Suppose that we precomputed $A^(-1)$, then time taken to solve equation is $cal(O)(n^3)$.

However, if we have the LU decomposition of $A$, then we can solve the equation in two steps:
1. Solve $L y = b$ for $y$ using forward substitution. Takes $cal(O)(n^2)$ time.
2. Solve $U x = y$ for $x$ using backward substitution. Takes $cal(O)(n^2)$ time.

Overall time taken is $cal(O)(n^2)$ which is much better than $cal(O)(n^3)$.

#text(fill: purple)[== Existence]

+ If we allow permutation of rows of $A$, then _every_ square matrix has an LU decomposition. $P A = L U$, where $P$ is a permutation matrix.
	- If $A$ is singular then $U$ will have zeroes on its diagonal.
	- Otherwise, no zeroes.
+ A square matrix $A$ has an LU decomposition without row exchanges iff all of its leading principal minors are non-zero.
	- Note that, _Positive Definite_ matrices have leading principal minors non-zero (in fact positive), hence they always have an LU decomposition.
	
= Eigen Decomposition

If a square matrix $A in CC^(n times n)$ can be written as
$ A = Q Lambda Q^(-1) $

where $Q$ is a matrix whose columns are eigenvectors of $A$ and $Lambda$ is a diagonal matrix whose diagonal elements are eigenvalues of $A$. This is called the _eigen decomposition_ of matrix $A$.

#text(fill: purple)[== Why is it useful?]

Let's say you want to compute $A^k$. If you have _Eigen decomposition_, then it is simply $Q Lambda^k Q^(-1)$, which is very easy to calculate!


#text(fill: purple)[== Existence]

1. If a square matrix $A$ has $n$ linearly independent eigenvectors, then it has an eigen decomposition.

2. All _Normal matrices_ admit _Eigen decomposition_. Moreover, for such matrices $Q$ is Orthonormal.


= Singular Value Decomposition

SVD of a $m times n$ complex matrix $A$ is factorization of form
$ A = U Sigma V^convolve $

where $U in CC^(m times m)$, $V in CC^(n times n)$ are complex _unitary matrices_ and $Sigma in CC^(m times n)$ is a diagonal rectangular matrix. It can alternatively be stated as

$ A = sum_(i=1)^r sigma_i u_i v_i^convolve $

where $r$ is the rank of matrix $A$. This second interpretation gives nice intuition about what SVD is trying to say. It says that given a linear transformation of rank $r$, there is a set of $r$ orthonormal vectors in _domain_ ($v_i$'s) which map to orthonormal vectors in _range_ ($u_i$'s)!

#text(fill: purple)[== Why is it useful?]

It has many applications. One of the prominent ones is _Best low rank approximation_. Let's say you have matrix $A = U Sigma V^convolve$ with rank $r$ (WLOG $sigma_1 >= sigma_2 ... >= sigma_r$), then for any matrix $B$ of rank $k$, the following holds

$ bar.double A - A_k bar.double <= bar.double A - B bar.double "where" A_k = sum_(i = 1)^k sigma_i u_i v_i^convolve $

#text(fill: purple)[== Existence]

SVD exists for all matrices!! That's why it such a powerful result!

#line()

#align(center)[= Appendix]

#text(fill: purple)[== Minors]

/ Minor: Let $A in RR^(n times n)$, then minor of element $a_(i j)$ is the determinant of matrix obtained by deleting $i^("th")$ row and $j^("th")$ column of $A$. We can extend this definition to deleting some rows and columns as well. 

/ Principal minor: If we remove rows and columns of same indices, we call it _principal minor_.

/ Leading principal minor: If we remove last $n-k$ rows and columns, we will get $k times k$ submatrix, whose determinant we call as _leading principal minor_.

#text(fill: purple)[== Matrices]

/ Normal Matrix: A matrix $A in CC^(n times n)$ is said to be _normal_ iff $A A^convolve = A^convolve A$, where $convolve$ is the _Hermitian_ operator. 

	- One very useful property of _Normal matrices_ is that they are unitarily diagonalizable i.e if $P in CC^(n times n)$ is the matrix containing eigenvectors of $A$ as columns and $Q in CC^(n times n)$, is the matrix containing eigenvalues of $A$ on it's diagonal then $A = P Q P^convolve$.	This property is an iff condition. _Unitarily diagonalizable_ $arrow.double.l.r.long$ _Normal matrix_
	
	- Symmetric and Orthonormal matrices are just special cases of _Normal matrices_

/ Symmetric Matrix: A matrix $A in CC^(n times n)$ is _symmetric_ iff $A = A^convolve$. It has following following useful properties:
	- _All of it's eigenvalues are real_.
		$ A x = lambda x arrow.double x^convolve A x = (A x)^convolve x arrow.double x^convolve lambda x = overline(lambda) x^convolve x arrow.double lambda = overline(lambda) $

	- _It has real eigenbasis_. It is unitarily diagonalizable because it is a normal matrix 
		$ A (x + i y) = lambda (x + i y) arrow.double A x = lambda x $	

	- _Eigenvectors corresponding to distinct eigenvalues are orthogonal_. Let $lambda_1, lambda_2$ be eigenvalues of $A$ with $v_1, v_2$ as their corresponding eigenvectors.
	$ v_1^convolve (A v_2) = (A^convolve v_1)^convolve v_2 arrow.double lambda_1 v_1^convolve v_2 = lambda_2 v_1^convolve v_2 $

/ Positive Definite Matrix: We say a symmetric matrix $A in RR^(n times n)$ is _positive definite_ iff :
	- All of it's eigenvalues are positive. (_Eigenvalue definition_)
	- $x^T A x > 0 quad forall x != 0$ (_Quadratic form definition_)
	- All leading principal minors of $A$ are positive. (_Sylvester's criterion_)
	- $A = L L^T$ with $L$ being a lower triangular matrix with positive diagonal elements. (_Cholesky decomposition_)
	- $x^T A x$ is a strictly convex function. (_Convexity definition_)