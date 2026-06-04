#import "../template.typ": *

#show: conf.with(
  header: "Midsemester Calculus 2 Cheatsheet",
  author: "Leo",
  column_count: 2,
)

= Integration Techniques
== Products/Quotients of Trigonometric Functions: // Reference: Paul Math Notes
$int sin^n (x) cos^m (x) dif x$
- $n$ odd. Strip 1 sine out and convert rest using $sin^2(x) = 1-cos^2(x)$. Sub $u=cos(x)$.
- $m$ odd. Strip 1 cosine out and convert rest using $cos^2(x) = 1-sin^2(x)$. Sub $u=sin(x)$.
- Both odd. Either of the above works.
- Both even. Use half-angle formulas to reduce powers.

$int tan^n (x) sec^m (x) dif x$
- $n$ odd. Strip 1 tan and 1 secant out and convert rest using $tan^2(x) = sec^2(x) - 1$. Sub $u=sec(x)$.
- $m$ even. Strip 2 secants out and convert rest using $sec^2(x) = tan^2(x) + 1$. Sub $u=tan(x)$.
- $n$ odd and $m$ even. Use either of the above.

== Integration by Parts // Reference: Paul Math Notes, YouTube
$int u dif v = u v - int v dif u$

*LIATE*: Logarithmic, Inverse trigonometric, Algebraic, Trigonometric, Exponential

Choose $u$ to be the first function in LIATE.

== Trigonometric Substitution // Referenced from lecture notes
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

== Rearranged identities for calculus
- $display(sinh^2(x) = (cosh(2x) - 1)/2)$

- $display(cosh^2(x) = (cosh(2x) + 1)/2)$

== Partial fractions // Reference: Paul math Note
#image("/assets/parfrac_1.png", width: 60%)
#image("/assets/parfrac_2.png")

#colbreak()

== Derivatives

#list(
  [$dif / (dif x) [sinh(x)] = cosh(x)$],
  [$dif / (dif x) [cosh(x)] = sinh(x)$],
  [$dif / (dif x) [tanh(x)] = sech^2(x)$],
  [$dif / (dif x) [sech(x)] = -sech(x) tanh(x)$],
  [$dif / (dif x) [cosech(x)] = -coth(x) cosech(x)$],
  [$dif / (dif x) [coth(x)] = -cosech^2(x)$],
)

== Other Integrals
- $int tanh(x) dif x = ln(cosh(x)) + c$
- $int sech(x) dif x = arctan|sinh(x)| + c$

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
Definitions:
- $arcsinh(x) = log(x+sqrt(x^2 + 1))$
- $arccosh(x) = log(x + sqrt(x^2 - 1))$
- $arctanh(x) = 1/2 log((1+x)/(1-x))$
#table(
  columns: (auto, auto, auto, auto),
  [*Function*], [*Domain*], [*Range*], [*Cancellation*],
  [$ arcsinh(x)$], [$RR$], [$RR$], [$arcsinh(sinh(x)) = x, x in RR$ \ $sinh(arcsinh(x)) = x, x in RR$],
  [$ arccosh(x)$], [$[1, oo)$], [$[0, oo)$], [$arccosh(cosh(x)) = x, x in [0, oo)$ \ $cosh(arccosh(x)) = x, x in [1, oo)$],
  [$ arctanh(x)$], [$(-1, 1)$], [$RR$], [$arctanh(tanh(x)) = x, x in RR$ \ $tanh(arctanh(x)) = x, x in (-1, 1)$],
)
#image("/assets/inverse_hyperbolic.png")


= Series and Sequences // Reference: lecture notes
- Divergence test: If $lim_(n -> oo) a_n != 0$, then $sum a_n$ diverges. If the limit is 0 then the test is inconclusive. *Never use this test to prove convergence.* 
- Ratio test: Requires $a_n>0$. If $lim_(n -> oo) a_(n+1)/a_n = L$, then the series converges if $L < 1$ and diverges if $L > 1$. If $L=1$ then the test is inconclusive.
- Comparison test: If $0 <= a_n <= b_n$ for all $n$ and $sum b_n$ converges, then $sum a_n$ converges. If $sum a_n$ diverges, then $sum b_n$ diverges.
p-series: $sum 1/n^p$ converges if $p > 1$ and diverges if $p <= 1$.
Geometric series: $sum a r^n$ converges if $|r| < 1$ and diverges if $|r| >= 1$. If it converges, then the sum is $a/(1-r)$.


= Limits
== L'Hopital Rule
If $lim_(x -> a) f(x)/g(x)$ results in an indeterminate form, then $lim_(x -> a) f(x)/g(x) = lim_(x -> a) (f'(x))/(g'(x))$, provided the limit on the right exists.

Indeterminate forms:
#grid(
  columns: 2,
  gutter: 1em,
  [- $0/0$], [- $oo/oo$],
  [- $0 times oo = 1/oo times oo = oo/oo$], [- $oo - oo = 1/0 - 1/0 = 0/0$]
)

#colbreak()

== Continuity
If $g$ is continuous at $a$ and $f$ is continuous at $g(a)$, then $f(g(x))$ is continuous at $a$.

== Checklist
- Make sure you are actually proving that a series converges after using the ratio test. Do not just evaluate the limit and move on. (compare to 1)
- When you are evaluating an integral involving imaginary numbers, you need to add $c+d i$ as the constant of integration, where $c, d in RR$.
- When evaluating limits, evaluate through everything to make sure that limits actually exist so that limit laws can be used. Even when a term is obviously 0.
- Make sure that you are stating relevant limit laws, especially *continuity*.
  - When evaluating a limit containing $e^x$, you need to state the continuity of $e^x$.

