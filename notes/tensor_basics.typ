#import "../template.typ": apply-settings
#show: apply-settings

#align(center)[#title[Tensor basics]]

== Terminology

/ Fiber: Anagloue of row/column of a matrix. Obtained by fixing all indices but one.

/ Slice: Analogue of a matrix obtained by fixing all indices but two.

#line()

== Definitions

- *Norm*: Let $ cal(X) in RR^(I_1 times .. I_N)$ then it's norm is 
$ sqrt(sum_(i_1) sum_(i_2) ... sum_(i_N) x^2_(i_1,..i_N)) $ 

- *Inner product*: Let $ cal(A), cal(B) in RR^(I_1 times .. I_N)$ then their inner product is defined as 
$ chevron.l cal(A), cal(B) chevron.r = sum_(i_1) sum_(i_2) ... sum_(i_N) cal(A)_(i_1,..i_N) cal(B)_(i_1,..i_N) $

- *Rank one tensor*: A tensor $ cal(X) in RR^(I_1 times .. I_N)$ is said to be of rank one if it can be written as the outer product of $N$ vectors, i.e.,
$ cal(X) = u_1 compose u_2 compose ... compose u_N $
$quad quad$ Here $compose$ represents the outer product operation.

- *Matricization/Unfolding*: _mode-n matricization_ of a tensor $ cal(X) in RR^(I_1 times I_2 ... times I_N)$ is matrix $cal(X)_((n))$ whose columns are mode-$n$ fiber of the tensor. 

#line()

== Different kinds of products

#text(fill: purple, [=== Einstein product])

Given tensors $cal(A) in RR^(I_1 times ... I_N times K_1 times ... K_N)$ and $cal(B) in RR^(K_1 times ... K_N times K_(N+1) times ... K_M)$, then *Einstein product* of $cal(A)$ and $cal(B)$ is denoted by $cal(A) convolve_N cal(B)$ and is defined as 
$ (cal(A) convolve_N cal(B))_(i_1 i_2 ... i_N k_(N+1) ... k_M) = sum_(k_1 ... k_N) cal(A)_(i_1 ... i_N k_1 ... k_N) cal(B)_(k_1 ... k_N k_(N+1) ... K_M) $

#text(fill: purple, [=== n-mode product])

Given tensors $cal(A) in RR^(I_1 times I_2 ... I_N)$ and $B in RR^(r times I_n)$, then *n-mode product* of $cal(A)$ and $B$ is denoted by $cal(A) times_n B$ and is defined as a tensor $cal(C) in RR^(I_1 times ... times I_(n-1) times r times I_(n+1) times ... times I_N)$ with entries

$ cal(C)_(i_1, i_2 ... i_(n-1), j, i_(n + 1) .. i_N) = sum_(i_n = 1)^I_n cal(A)_(i_1 i_2 ... i_N) B_(j i_n) $

We can similarly define product of a tensor with a vector along mode-n as below, the result is a tensor of order $N-1$:

$ (cal(X) overline(times)_n v)_(i_1, i_2 .. i_(n-1), i_(n+1), .. i_N) = sum_(i_n = 1)^(I_n) cal(X)_(i_1...i_N) v_(i_n) $

==== Properties

- $ cal(Y) = cal(X) times_n U arrow.l.r.double.long cal(Y)_((n)) = U cal(X)_((n))$
-  $ cal(X) times_m A times_n B = cal(X) times_n B times_m A$
- $ cal(X) times_n A times_n B = cal(X) times_n (B A)$
- $
	cal(X) overline(times)_m a overline(times)_n b = 
	(cal(X) overline(times)_m a) overline(times)_(n-1) b  = 
	(cal(X) overline(times)_n b) overline(times)_m a 
	quad #text([if])  m < n
$

#text(fill: purple)[=== Kronecker product]

_Kronecker product_ of matrices $A in RR^(m times n)$ and $B in RR^(p times q)$ is denoted by $A times.o B$ of size $m p times n q$ and is defined as the matrix in  given by

$ A times.o B = mat(
	a_(11) B , a_(12) B , ... , a_(1n) B;
	a_(21) B , a_(22) B , ... , a_(2n) B;
	dots.v, dots.v, dots.down, dots.v;
	a_(m 1) B , a_(m 2) B , ... , a_(m n) B;
) $

#text(fill: purple)[=== Hadamard product]

It is elementwise matrix product, denoted by $A dot.o B$ for matrices of same size. 
For matrices $A, B in RR^(m times n)$, the product is
$ mat(
	a_(11) b_(11) , a_(12) b_(12) , ... , a_(1n) b_(1n);
	a_(21) b_(21) , a_(22) b_(22) , ... , a_(2n) b_(2n);
	dots.v, dots.v, dots.down, dots.v;
	a_(m 1) b_(m 1) , a_(m 2) b_(m 2) , ... , a_(m n) b_(m n);
) $

#text(fill: purple)[=== Khatri-Rao product]

It is just column-wise Kronecker product.

#text(fill: purple)[=== Facewise product]

It is defined for only third order tensors whose last dimension is same. Result is just matrix-matrix product of frontal slices.



#text(fill: red)[== Doubts]

+ Why is Einstein product defined only for even order? #text(style: "italic")[Because it is ambiguous in the odd order case.]

+ How is transpose defined for a given product ($times$)? #text(style: "italic")[It is defined such that $(cal(A) times cal(B))^T = cal(B)^T times cal(A)^T$ holds true.]