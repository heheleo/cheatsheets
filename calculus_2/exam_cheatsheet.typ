// Removed content compared to Midsemester cheatsheet:
// - Integration Techniques
//   - Integration by Parts
//   - Rearranged identiies
//   - Partial fractions
// - Derivatives
// - Limits

#import "../template.typ": *

#show: conf.with(
  header: "Calculus 2 Cheatsheet",
  column_count: 2,
  font_size: 9pt,
)

= Trigonometric Substitution // Referenced from lecture notes
#table(
  columns: (0.5fr, auto, 1fr),
  [Form], [Substitution], [Identity],
  [$a^2 - x^2$],
  [$x= a sin theta$ \ $x = a cos theta$],
  [$sin^2 theta = 1 - cos^2 theta$ \ $cos^2 theta = 1 - sin^2 theta$],

  [$a^2+x^2$],
  [$x=a sinh theta$ \ $x = a tan theta$],
  [$sinh^2 theta + 1= cosh^2 theta$ \ $tan^2 theta + 1 = sec^2 theta$],

  [$x^2 - a^2$],
  [$x = a cosh theta$ \ $x = a sec theta$],
  [$cosh^2 theta - 1 = sinh^2 theta$ \ $sec^2 theta - 1 = tan^2 theta$],
)

= Hyperbolic Functions // Reference: lecture notes
#table(
  columns: (3fr, auto, auto, 2fr),
  [*Function*], [*Domain*], [*Range*], [*Properties*],
  [$ sinh x = 1/2 (e^x - e^(-x)) $], [$RR$], [$RR$], [odd, increasing, $sinh(0) = 0$],
  [$ cosh x = 1/2 (e^x + e^(-x)) $], [$RR$], [$[1, oo)$], [even, $cosh(0) = 1$],
  [$ tanh x = (e^x - e^(-x)) / (e^x + e^(-x)) $],
  [$RR$],
  [$(-1, 1)$],
  [odd, increasing, $tanh(0) = 0$, asymptotes $y = pm 1$],

  [$ sech(x) = 1/cosh(x) $], [$RR$], [$(0, 1]$], [even, $sech(0) = 1$, 2 points of inflection, asymptote $y=0$],
  [$ cosech(x) = 1/sinh(x) $], [$RR \\ {0}$], [$RR \\ {0}$], [odd, asymptotes $y=0, x=0$],
  [$ coth(x) = 1/tanh(x) $], [$RR \\ {0}$], [$RR \\ [-1, 1]$], [odd, asymptotes $y= pm 1, \ x=0$],
)
#image("/assets/hyperbolic_1.png")
#image("/assets/reciprocal_hyperbolic.png")

== Inverse Hyperbolic Functions
- $arcsinh(x) = log(x+sqrt(x^2 + 1))$
- $arccosh(x) = log(x + sqrt(x^2 - 1))$
- $arctanh(x) = 1/2 log((1+x)/(1-x))$
#table(
  columns: (auto, auto, auto, auto),
  [*Function*], [*Domain*], [*Range*], [*Cancellation*],
  [$arcsinh(x)$], [$RR$], [$RR$], [$arcsinh(sinh(x)) = x, x in RR$ \ $sinh(arcsinh(x)) = x, x in RR$],
  [$arccosh(x)$],
  [$[1, oo)$],
  [$[0, oo)$],
  [$arccosh(cosh(x)) = x, x in [0, oo)$ \ $cosh(arccosh(x)) = x, x in [1, oo)$],

  [$arctanh(x)$], [$(-1, 1)$], [$RR$], [$arctanh(tanh(x)) = x, x in RR$ \ $tanh(arctanh(x)) = x, x in (-1, 1)$],
)
#image("/assets/inverse_hyperbolic.png")

= Series and Sequences // Reference: lecture notes
- Divergence test: If $lim_(n -> oo) a_n != 0$, then $sum a_n$ diverges. If the limit is 0 then the test is inconclusive. *Never use this test to prove convergence.*
- Ratio test: Requires $a_n>0$. If $lim_(n -> oo) a_(n+1)/a_n = L$, then the series converges if $L < 1$ and diverges if $L > 1$. If $L=1$ then the test is inconclusive.
- Comparison test: If $0 <= a_n <= b_n$ for all $n$ and $sum b_n$ converges, then $sum a_n$ converges. If $sum a_n$ diverges, then $sum b_n$ diverges.
Common series
- p-series: $sum_(n=1)^oo 1/n^p$ converges if $p > 1$ and diverges if $p <= 1$.
- Geometric series: $sum_(n=0)^oo a r^n$ converges if $|r| < 1$ and diverges if $|r| >= 1$. If it converges, then sum is $a/(1-r)$.

== Taylor series
- Taylor series of $f$ about $x=a$: $sum_(n=0)^oo (f^((n)) (a))/n! (x-a)^n$
- Taylor polynomial $n$: include only terms whose total power is less than or equal to $n$.
Common Maclaurin series (Taylor series about $x=0$):
#image("/assets/maclaurin_series.png")

= Complex numbers
- $e^(i theta) = cos(theta) + i sin(theta)$
- $sin(x) = 1/(2 i) (e^(i x) - e^(-i x))$
- $cos(x) = 1/(2) (e^(i x) + e^(-i x))$

= First Order ODEs
- *Homogenous 1st order ODE*: $dv(y, x) = f(y/x)$
  - Technique: Let $u = y/x$, transform, and solve using separation of variables
- *Bernoulli's Equation*: $dv(y, x) + P(x)y = Q(x)y^n$
  - Technique: Let $u = y^(1-n)$, transform into 1st order linear ODE, and solve using integrating factor
- *Mixing Problems*: Let $M$ be the mass of powder/salt in tank. Let $V$ denote volume of solution.
  - $dv(M, t) = C_"in" V_"in" - C_"out" V_"out"$ where C is concentration, $V_"in", V_"out"$ are volumetric flow rates.
  - $dv(M, t) = C_"in" V_"in" - M/V(t) V_"out"$ as $C_"out" = "mass"/"volume"$

== Linear first order ODE
Form $dv(y, x) + P(x)y = Q(x)$ where $P, Q in RR$. Note coefficient of $dv(y, x)$ is always 1.
- Technique: Integrating factor. Solve $e^(int P dif x)$ and let $I(x)$ be any of the solutions. Then the ODE reduces to $dv(, x) (I(x)y) = I(x)Q(x)$

== Equilibria
- *Equilibrium solution*: constant solution of an ODE
  - Found by setting $dv(y, x) = 0$ and solving for y
- *Phase plot*: a plot of $dv(y, x)$ against y. Only useful for autonomous ODEs (ODEs where $dv(y, x) = f(y)$).
#grid(
  columns: 2,
  [Stable], [#image("/assets/stable_equilibria.png", width: 80%)],
  [Unstable], [#image("/assets/unstable_equilibria.png", width: 80%)],
  [Semistable],
  [#image("/assets/semistable_equilibria_1.png", width: 80%) #image("/assets/semistable_equilibria_2.png", width: 80%)],
)

== Second order ODE
Homogenous Linear 2nd order constant coefficient ODE
Form: $a y'' + b y' + c y = 0$ where $a, b, c in RR$ and $a != 0$.
Technique: Characteristic equation. Let $y = e^(lambda x)$. This yields the characteristic equation $a lambda^2 + b lambda + c = 0$. Solve for $lambda$:
- two real roots ($Delta > 0$): $y = A e^(lambda_1 x) + B e^(lambda_2 x)$ where $A, B in RR$ and $lambda_1, lambda_2$ are the two distinct real roots
- one real root ($Delta = 0$): $y = (A x + B) e^(lambda x)$ where $A, B in RR$ and $lambda$ is the repeated real root
- two complex roots ($Delta < 0$): $y = e^(alpha x) (A cos(beta x) + B sin(beta x))$ where $A, B in RR$ and $alpha pm beta i$ are the two complex roots

Non-homogenous Linear 2nd Order ODE ($R(x) != 0$) \
$y = y_H(x) + y_P(x)$ where $y_H$ is the general solution to the homogenous ODE and $y_P$ is a particular solution to the non-homogenous ODE.
- If $R(x)$ is not part of $G S(H)$:
  - $R(x)$ Polynomial: $y_p$ = general polynomial (same degree)
  - $R(x) = e^(k x)$: $y_p = a e^(k x)$
  - $R(x) = sin(k x)$ or $R(x) = cos(k x)$: $y_p = a sin(k x) + b cos(k x)$
- Else: Multiply the above guess by $x$ until it is no longer part of $G S(H)$
*Springs:* $m y'' + beta y' + k y = 0$
- y = displacement of object below equilibrium position (m)
- m = mass of object (kg)
- $beta$ = damping constant ($N s m^(-1)$)
- k = spring constant ($N m^(-1)$)
#grid(
  columns: 2,
  [
    - Overdamped: $beta^2 - 4 m k > 0$ (does not oscillate)
    - Critically damped: $beta^2 - 4 m k = 0$ (oscillates at most once)
    - Underdamped: $beta^2 - 4 m k < 0$ (oscillates infinitely)
    - Simple harmonic motion: $beta = 0$ (undamped)
  ],
  [#figure(image("/assets/springs.png"))],
)

Resonance: external force $f$ has same form as one of the terms in GS(H). If $beta = 0$, then $P S(I H)$ will grow without bound as $t -> oo$.

= Multivariable Calculus
- Stationary point: $grad f = 0$
  - Geometric: tangent plane is horizontal (parallel to the x-y plane).
- Level curve: $z=f(x, y)$ where $z in RR$ is constant
- Contour plot: collection of level curves for different $z$
- Cross section: x-z cross section let $y=0$. y-z cross section let $x=0$.
- Two-variable limit: denoted $lim_((x, y) -> (x_0,y_0)) f(x,y) = L$
  - For limit to exist, L must be the same regardless of the path taken to approach $(x_0, y_0)$.
- Partial derivative: $pdv(f, x)$ is the slope of the tangent line to the x-z cross section. $pdv(f, y)$ is the slope of the tangent line to the y-z cross section.
- Gradient: $grad f = (pdv(f, x), pdv(f, y)) = (f_x (x,y), f_y (x,y))$
  - Geometrically, for the surface $z = f(x, y)$:
    - direction of the vector $grad f$ gives the direction to face to go directly uphill on the surface
    - the length of $grad f$ gives the slope of the surface directly uphill.
- Directional derivative: $D_(bold(hat(u))) f(x, y) = grad f(x, y) dotproduct bold(hat(u)) = |grad f| cos theta$ where $theta$ is the angle between $grad f$ and $bold(hat(u))$.
  - $max(D_(bold(hat(u))) f)$ = $|grad f|$ or $theta = 0$ (i.e. $bold(hat(u))$ points in the direction of the gradient).
  - $min(D_(bold(hat(u))) f)$ = $-|grad f|$ or $theta = pi$ (i.e. $bold(hat(u))$ points in the opposite direction of the gradient).
  - $D_(bold(hat(u))) f = 0$ or $theta = pi/2$ (i.e. $bold(hat(u))$ is perpendicular to the gradient).
- Tangent plane: $z = f(x_0, y_0) + f_x (x_0,y_0)(x-x_0) + f_y (x_0,y_0)(y-y_0)$
- Chain rule for multivariable differentiation
  - Case 1: $z = f(x, y)$ where $x = g(t)$ and $y = h(t)$.
  $display(dv(z, t) = pdv(z, x) dv(x, t) + pdv(z, y) dv(y, t))$
  - Case 2: $z = f(x, y)$ where $x = g(s, t)$ and $y = h(s, t)$.
  $display(pdv(z, s) = pdv(z, x) pdv(x, s) + pdv(z, y) pdv(y, s) wide pdv(z, t) = pdv(z, x) pdv(x, t) + pdv(z, y) pdv(y, t))$
*Second Derivative Test*: Hessian Determinant/Function. Let $A = f_(x x)(P)$, $B = f_(x y)(P) = f_(y x)(P)$, and $C = f_(y y)(P)$. Or, $grad f_x (P) = (A, B)$ and $grad f_y (P) = (B, C)$. Hessian determinant is $A C - B^2$:
- If $A C - B^2 != 0$:
  - If $A C - B^2 > 0$ and $A > 0$, then $P$ is a local minimum
  - If $A C - B^2 > 0$ and $A < 0$, then $P$ is a local maximum
  - If $A C - B^2 < 0$, then $P$ is a saddle point
- If $A C - B^2 = 0$, then the test is inconclusive

= Common mistakes
- When solving DE using seperation of variable, make sure to consider the constant solution case
- When using Pythagorean identities, make sure to include the $pm$ sign when taking square roots
- Don't forget $c+d i$ when calculating integrals of complex numbers
- Check copy errors, variable names
