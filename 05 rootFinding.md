## Root finding
Numerical root-finding algorithms are iterative methods used to approximate the solutions (roots) of equations where f(x) = 0. 
Because analytical solutions (like factoring) are often impossible, these methods systematically guess and test numbers to get closer to the exact root.

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20240607175747/Root-Finding-Algorithm.png" width="70%">

### Application: Cantilever Beam Deflection

<img src="https://cdn.discordapp.com/attachments/1521724868738023507/1523471195771768862/images.png?ex=6a4c3a9d&is=6a4ae91d&hm=899ad750f2c91922251c32ef62bad167d159c8561076a92a8a3a0689e61e320a&" width="50%">


# Root Finding Application: Cantilever Beam Deflection

## 1. Engineering Problem

For a cantilever beam with a point load at the free end, the deflection at position \(x\) from the fixed support is

$\displaystyle y(x)=\frac{Px^2(3L-x)}{6EI}$

Suppose

$\displaystyle L=2 \ \text{m}$

$\displaystyle P=1000 \ \text{N}$

$\displaystyle E=200\times10^9 \ \text{Pa}$

$\displaystyle I=4\times10^{-6} \ \text{m}^4$

We want to find the position where the deflection is

$\displaystyle y(x)=2 \ \text{mm}=0.002 \ \text{m}$

Substitute the values:

$\displaystyle 0.002=\frac{1000x^2(6-x)}{6(200\times10^9)(4\times10^{-6})}$

$\displaystyle 0.002=\frac{1000x^2(6-x)}{4.8\times10^6}$

$\displaystyle 0.002=0.000208333x^2(6-x)$

Therefore,

$\displaystyle x^2(6-x)=9.6$

Move all terms to one side:

$\displaystyle f(x)=x^2(6-x)-9.6$

or

$\displaystyle f(x)=6x^2-x^3-9.6$

So the root-finding problem is

$\displaystyle \boxed{f(x)=6x^2-x^3-9.6=0}$

The root gives the position \(x\) where the beam deflection reaches \(2\) mm.

---

## 2. Exact Solution for Reference

The equation is

$\displaystyle 6x^2-x^3-9.6=0$

or

$\displaystyle x^3-6x^2+9.6=0$

This is a cubic equation. Solving it exactly gives three roots:

$\displaystyle x=-1.1581$

$\displaystyle x=1.4530$

$\displaystyle x=5.7050$

However, the beam length is

$\displaystyle 0 \leq x \leq L$

and

$\displaystyle 0 \leq x \leq 2$

Therefore, the only physically meaningful root is

$\displaystyle \boxed{x=1.4530 \ \text{m}}$

So the exact reference answer is

$\displaystyle \boxed{x_{\text{exact}}=1.4530 \ \text{m}}$

This exact solution is useful for checking the accuracy of numerical methods.

---

## 3. Root-Finding Concept

A root-finding problem has the form

$\displaystyle f(x)=0$

The root is the value of \(x\) where the function crosses the horizontal axis.

For this beam problem,

$\displaystyle f(x)=6x^2-x^3-9.6$

At the root,

$\displaystyle f(x)=0$

This means

$\displaystyle y(x)-y_{\text{target}}=0$

So the physical meaning is:

$\displaystyle \boxed{\text{actual beam deflection}=\text{target beam deflection}}$

In this problem, we are not just solving a mathematical equation. We are finding the position along the beam where the deflection reaches the allowable or target value.

---

## 4. Bisection Method

### Concept

The bisection method uses two initial guesses:

$\displaystyle x_l$

and

$\displaystyle x_u$

where the function changes sign:

$\displaystyle f(x_l)f(x_u)<0$

This means the root is located between \(x_l\) and \(x_u\).

The next approximation is the midpoint:

$\displaystyle x_r=\frac{x_l+x_u}{2}$

After calculating \(x_r\), we evaluate \(f(x_r)\).

If

$\displaystyle f(x_l)f(x_r)<0$

then the root is between \(x_l\) and \(x_r\), so we update

$\displaystyle x_u=x_r$

If

$\displaystyle f(x_l)f(x_r)>0$

then the root is between \(x_r\) and \(x_u\), so we update

$\displaystyle x_l=x_r$

The bisection method is very stable because the root always remains inside the bracket. However, it can be slow because it only cuts the interval in half each time.

### Initial Bracket

Choose

$\displaystyle x_l=1.4$

$\displaystyle x_u=1.5$

Evaluate:

$\displaystyle f(1.4)=6(1.4)^2-(1.4)^3-9.6$

$\displaystyle f(1.4)=11.76-2.744-9.6$

$\displaystyle f(1.4)=-0.584$

and

$\displaystyle f(1.5)=6(1.5)^2-(1.5)^3-9.6$

$\displaystyle f(1.5)=13.5-3.375-9.6$

$\displaystyle f(1.5)=0.525$

Since

$\displaystyle f(1.4)f(1.5)<0$

there is a root between \(1.4\) and \(1.5\).

### Bisection Iterations

| Iteration | $\(x_l\)$ | $\(x_u\)$ | $\(x_r\)$ | $\(f(x_r)\)$ | New interval |
|---:|---:|---:|---:|---:|---|
| 1 | 1.400000 | 1.500000 | 1.450000 | -0.033625 | \([1.450000,1.500000]\) |
| 2 | 1.450000 | 1.500000 | 1.475000 | 0.244703 | \([1.450000,1.475000]\) |
| 3 | 1.450000 | 1.475000 | 1.462500 | 0.105287 | \([1.450000,1.462500]\) |
| 4 | 1.450000 | 1.462500 | 1.456250 | 0.035767 | \([1.450000,1.456250]\) |
| 5 | 1.450000 | 1.456250 | 1.453125 | 0.001055 | \([1.450000,1.453125]\) |

After 5 iterations:

$\displaystyle \boxed{x\approx1.453125 \ \text{m}}$

Compared with the exact solution:

$\displaystyle x_{\text{exact}}=1.453030 \ \text{m}$

The absolute error is approximately

$\displaystyle |1.453125-1.453030|=0.000095 \ \text{m}$

$\displaystyle \boxed{\text{error}\approx0.095 \ \text{mm}}$

---

## 5. False Position Method

### Concept

The False Position method, also called the Regula Falsi method, also uses a lower bound and an upper bound.

Like bisection, it requires

$\displaystyle f(x_l)f(x_u)<0$

However, instead of using the midpoint, False Position uses a straight line between the two function values.

The formula is

$\displaystyle x_r=\frac{x_l f(x_u)-x_u f(x_l)}{f(x_u)-f(x_l)}$

The idea is to estimate where the straight line connecting \((x_l,f(x_l))\) and \((x_u,f(x_u))\) crosses the \(x\)-axis.

This method is usually faster than bisection because it uses the function values, not only the interval length.

### Initial Values

$\displaystyle x_l=1.4$

$\displaystyle x_u=1.5$

$\displaystyle f(x_l)=-0.584$

$\displaystyle f(x_u)=0.525$

### Iteration 1

$\displaystyle x_r=\frac{(1.4)(0.525)-(1.5)(-0.584)}{0.525-(-0.584)}$

$\displaystyle x_r=\frac{0.735+0.876}{1.109}$

$\displaystyle x_r=1.452660$

Evaluate:

$\displaystyle f(1.452660)=-0.004107$

Since \(f(x_r)\) is negative, update the lower bound:

$\displaystyle x_l=1.452660$

### Iteration 2

$\displaystyle x_l=1.452660$

$\displaystyle x_u=1.5$

$\displaystyle f(x_l)=-0.004107$

$\displaystyle f(x_u)=0.525$

$\displaystyle x_r=\frac{(1.452660)(0.525)-(1.5)(-0.004107)}{0.525-(-0.004107)}$

$\displaystyle x_r=1.453027$

Evaluate:

$\displaystyle f(1.453027)=-0.0000275$

Update:

$\displaystyle x_l=1.453027$

### Iteration 3

$\displaystyle x_l=1.453027$

$\displaystyle x_u=1.5$

$\displaystyle x_r=1.45302995$

Evaluate:

$\displaystyle f(1.45302995)=-1.84\times10^{-7}$

Update:

$\displaystyle x_l=1.45302995$

### Iteration 4

$\displaystyle x_l=1.45302995$

$\displaystyle x_u=1.5$

$\displaystyle x_r=1.453029964$

Evaluate:

$\displaystyle f(1.453029964)\approx -1.23\times10^{-9}$

Update:

$\displaystyle x_l=1.453029964$

### Iteration 5

$\displaystyle x_l=1.453029964$

$\displaystyle x_u=1.5$

$\displaystyle x_r=1.453029964$

Evaluate:

$\displaystyle f(1.453029964)\approx 0$

Therefore,

$\displaystyle \boxed{x\approx1.453030 \ \text{m}}$

### False Position Summary

| Iteration | $\(x_l\)$ | $\(x_u\)$ | $\(x_r\)$ | $\(f(x_r)\)$ |
|---:|---:|---:|---:|---:|
| 1 | 1.400000 | 1.500000 | 1.452660 | -0.004107 |
| 2 | 1.452660 | 1.500000 | 1.453027 | -0.0000275 |
| 3 | 1.453027 | 1.500000 | 1.45302995 | $-1.84\times10^{-7}\$ |
| 4 | 1.45302995 | 1.500000 | 1.453029964 | $-1.23\times10^{-9}\$ |
| 5 | 1.453029964 | 1.500000 | 1.453029964 | $\approx0\$ |

---

## 6. Secant Method

### Concept

The Secant method is similar to False Position because both methods use a straight line between two points.

However, there is an important difference.

False Position keeps the root bracket:

$\displaystyle f(x_l)f(x_u)<0$

The Secant method does not require the root to remain bracketed.

The Secant formula is

$\displaystyle x_{i+1}=x_i-\frac{f(x_i)(x_i-x_{i-1})}{f(x_i)-f(x_{i-1})}$

The Secant method does not need a derivative, unlike Newton-Raphson.

It approximates the derivative using two previous points:

$\displaystyle f'(x_i)\approx \frac{f(x_i)-f(x_{i-1})}{x_i-x_{i-1}}$

So the Secant method can be understood as a derivative-free version of Newton-Raphson.

### Initial Guesses

Choose

$\displaystyle x_0=1.4$

$\displaystyle x_1=1.5$

$\displaystyle f(x_0)=-0.584$

$\displaystyle f(x_1)=0.525$

### Iteration 1

$\displaystyle x_2=x_1-\frac{f(x_1)(x_1-x_0)}{f(x_1)-f(x_0)}$

$\displaystyle x_2=1.5-\frac{0.525(1.5-1.4)}{0.525-(-0.584)}$

$\displaystyle x_2=1.5-\frac{0.0525}{1.109}$

$\displaystyle x_2=1.452660$

Evaluate:

$\displaystyle f(x_2)=-0.004107$

### Iteration 2

Now use

$\displaystyle x_1=1.5$

$\displaystyle x_2=1.452660$

$\displaystyle x_3=x_2-\frac{f(x_2)(x_2-x_1)}{f(x_2)-f(x_1)}$

$\displaystyle x_3=1.452660-\frac{(-0.004107)(1.452660-1.5)}{-0.004107-0.525}$

$\displaystyle x_3=1.453027$

Evaluate:

$\displaystyle f(x_3)=-0.0000275$

### Iteration 3

Use

$\displaystyle x_2=1.452660$

$\displaystyle x_3=1.453027$

$\displaystyle x_4=1.453030$

Evaluate:

$\displaystyle f(x_4)\approx 1.49\times10^{-9}$

### Iteration 4

Use

$\displaystyle x_3=1.453027$

$\displaystyle x_4=1.453030$

$\displaystyle x_5=1.453029964$

Evaluate:

$\displaystyle f(x_5)\approx 0$

### Iteration 5

The value is already converged:

$\displaystyle x_6=1.453029964$

$\displaystyle f(x_6)\approx 0$

Therefore,

$\displaystyle \boxed{x\approx1.453030 \ \text{m}}$

### Secant Summary

| Iteration | $\(x_{i-1}\)$ | $\(x_i\)$ | $\(x_{i+1}\)$ | $\(f(x_{i+1})\)$ |
|---:|---:|---:|---:|---:|
| 1 | 1.400000 | 1.500000 | 1.452660 | -0.004107 |
| 2 | 1.500000 | 1.452660 | 1.453027 | -0.0000275 |
| 3 | 1.452660 | 1.453027 | 1.453030 | $1.49\times10^{-9}$ |
| 4 | 1.453027 | 1.453030 | 1.453029964 | $\approx0\$ |
| 5 | 1.453030 | 1.453029964 | 1.453029964 | $\approx0\$ |

---

## 7. Newton-Raphson Method

### Concept

Newton-Raphson uses the tangent line of the function.

The formula is

$\displaystyle x_{i+1}=x_i-\frac{f(x_i)}{f'(x_i)}$

For this problem:

$\displaystyle f(x)=6x^2-x^3-9.6$

Differentiate:

$\displaystyle f'(x)=12x-3x^2$

or

$\displaystyle f'(x)=3x(4-x)$

Newton-Raphson is usually very fast, but it needs a derivative and a good initial guess.

### Initial Guess

Choose

$\displaystyle x_0=1.4$

### Iteration 1

$\displaystyle f(1.4)=-0.584$

$\displaystyle f'(1.4)=12(1.4)-3(1.4)^2$

$\displaystyle f'(1.4)=16.8-5.88$

$\displaystyle f'(1.4)=10.92$

$\displaystyle x_1=1.4-\frac{-0.584}{10.92}$

$\displaystyle x_1=1.453480$

### Iteration 2

$\displaystyle f(1.453480)=0.004995$

$\displaystyle f'(1.453480)=11.103947$

$\displaystyle x_2=1.453480-\frac{0.004995}{11.103947}$

$\displaystyle x_2=1.453030$

### Iteration 3

$\displaystyle f(1.453030)=3.32\times10^{-7}$

$\displaystyle f'(1.453030)=11.102471$

$\displaystyle x_3=1.453030-\frac{3.32\times10^{-7}}{11.102471}$

$\displaystyle x_3=1.453029964$

### Iteration 4

$\displaystyle f(1.453029964)\approx0$

Therefore,

$\displaystyle x_4=1.453029964$

### Iteration 5

$\displaystyle x_5=1.453029964$

Therefore,

$\displaystyle \boxed{x\approx1.453030 \ \text{m}}$

### Newton-Raphson Summary

| Iteration | $\(x_i\)$ | $\(f(x_i)\)$ | $\(f'(x_i)\)$ | $\(x_{i+1}\)$ |
|---:|---:|---:|---:|---:|
| 1 | 1.400000 | -0.584000 | 10.920000 | 1.453480 |
| 2 | 1.453480 | 0.004995 | 11.103947 | 1.453030 |
| 3 | 1.453030 | $\ 3.32\times10^{-7}\$ | 11.102471 | 1.453029964 |
| 4 | 1.453029964 | $\approx0\$ | 11.102471 | 1.453029964 |
| 5 | 1.453029964 | $\approx0\$ | 11.102471 | 1.453029964 |

---

## 8. Difference Between False Position and Secant

This is important for teaching.

| Item | False Position | Secant |
|---|---|---|
| Uses two points? | Yes | Yes |
| Needs derivative? | No | No |
| Needs sign change? | Yes | No |
| Keeps root bracket? | Yes | No |
| Safer? | More stable | Less stable |
| Faster? | Usually fast | Often faster |
| Formula type | Linear interpolation | Linear interpolation |
| Risk | Can stagnate | Can diverge |

The key difference is:

$\displaystyle \boxed{\text{False Position keeps the root inside a bracket.}}$

$\displaystyle \boxed{\text{Secant uses the latest two points and does not guarantee a bracket.}}$

So:

$\displaystyle \text{False Position}=\text{safe secant-like method}$

$\displaystyle \text{Secant}=\text{derivative-free Newton-like method}$

---

## 9. Final Comparison of All Methods

| Method | Main idea | Need bracket? | Need derivative? | Stability | Speed |
|---|---|---:|---:|---|---|
| Bisection | Divide interval in half | Yes | No | Very stable | Slow |
| False Position | Straight line inside bracket | Yes | No | Stable | Medium/Fast |
| Secant | Straight line using latest two points | No | No | Less stable | Fast |
| Newton-Raphson | Tangent line using derivative | No | Yes | Depends on initial guess | Very fast |

Final result:

$\displaystyle \boxed{x=1.4530 \ \text{m}}$

Physical meaning:

$\displaystyle \boxed{\text{The cantilever beam reaches }2\text{ mm deflection at }x=1.4530\text{ m from the fixed end.}}$


# Derivation of Cantilever Beam Equation

## Step 1: Beam Setup

Consider a cantilever beam with a point load \(P\) acting downward at the free end.

The beam is fixed at the left end and free at the right end.

Let

$\displaystyle x=0$

at the fixed end, and

$\displaystyle x=L$

at the free end.

The coordinate \(x\) is measured from the fixed support.

The beam has:

$\displaystyle L=\text{beam length}$

$\displaystyle P=\text{point load at the free end}$

$\displaystyle E=\text{Young's modulus}$

$\displaystyle I=\text{second moment of area}$

$\displaystyle y(x)=\text{vertical deflection at position }x$

The goal is to derive:

$\displaystyle V(x)=\text{shear force}$

$\displaystyle M(x)=\text{bending moment}$

$\displaystyle \theta(x)=\frac{dy}{dx}=\text{slope}$

$\displaystyle y(x)=\text{deflection}$

---

## Step 2: Support Reactions

Because the beam is fixed at \(x=0\), the fixed support must provide a vertical reaction force and a fixed-end moment.

From vertical force equilibrium:

$\displaystyle \sum F_y=0$

$\displaystyle R_A-P=0$

$\displaystyle R_A=P$

So the vertical reaction at the fixed support is

$\displaystyle \boxed{R_A=P}$

From moment equilibrium about the fixed support:

$\displaystyle \sum M_A=0$

$\displaystyle M_A-PL=0$

$\displaystyle M_A=PL$

So the fixed-end moment is

$\displaystyle \boxed{M_A=PL}$

This means the fixed support prevents both vertical movement and rotation.

---

## Step 3: Shear Force Equation

Take a cut at a distance \(x\) from the fixed support.

For a cantilever beam with only an end point load, there is no distributed load along the beam.

Therefore, the internal shear force is constant along the beam.

Using magnitude form:

$\displaystyle \boxed{V(x)=P}$

Using the usual sign convention for a downward load, it may be written as

$\displaystyle \boxed{V(x)=-P}$

In this note, the magnitude form is often easier for students:

$\displaystyle |V(x)|=P$

So the shear force is constant from the fixed end to the free end.

Physical meaning:

The same vertical load \(P\) is transferred through every section of the beam.

---

## Step 4: Bending Moment Equation

At a section located at distance \(x\) from the fixed end, the point load \(P\) is located at the free end.

The distance from the section to the load is

$\displaystyle L-x$

Therefore, the internal bending moment is

$\displaystyle M(x)=-P(L-x)$

or equivalently,

$\displaystyle M(x)=P(x-L)$

The negative sign represents hogging bending moment using the usual cantilever sign convention.

Using magnitude form:

$\displaystyle \boxed{|M(x)|=P(L-x)}$

Check important locations:

At the fixed end:

$\displaystyle x=0$

$\displaystyle M(0)=-P(L-0)$

$\displaystyle M(0)=-PL$

At the free end:

$\displaystyle x=L$

$\displaystyle M(L)=-P(L-L)$

$\displaystyle M(L)=0$

Therefore, the bending moment is maximum at the fixed support and zero at the free end.

---

## Step 5: Moment-Curvature Relationship

From Euler-Bernoulli beam theory:

$\displaystyle EI\frac{d^2y}{dx^2}=M(x)$

This equation links the bending moment to the curvature of the beam.

Using

$\displaystyle M(x)=-P(L-x)$

we get

$\displaystyle EI\frac{d^2y}{dx^2}=-P(L-x)$

Divide by \(EI\):

$\displaystyle \frac{d^2y}{dx^2}=-\frac{P}{EI}(L-x)$

This is the curvature equation of the cantilever beam.

---

## Step 6: First Integration to Obtain Slope

The slope of the beam is

$\displaystyle \theta(x)=\frac{dy}{dx}$

Starting from

$\displaystyle \frac{d^2y}{dx^2}=-\frac{P}{EI}(L-x)$

Integrate once with respect to \(x\):

$\displaystyle \frac{dy}{dx}=-\frac{P}{EI}\int (L-x)\,dx$

Since

$\displaystyle \int (L-x)\,dx=Lx-\frac{x^2}{2}$

we get

$\displaystyle \frac{dy}{dx}=-\frac{P}{EI}\left(Lx-\frac{x^2}{2}\right)+C_1$

or

$\displaystyle EI\frac{dy}{dx}=-P\left(Lx-\frac{x^2}{2}\right)+C_1$

where \(C_1\) is the first integration constant.

---

## Step 7: Apply Boundary Condition for Slope

At the fixed end, the beam cannot rotate.

Therefore, the slope at the fixed end is zero:

$\displaystyle \left.\frac{dy}{dx}\right|_{x=0}=0$

Substitute \(x=0\) into the slope equation:

$\displaystyle 0=-\frac{P}{EI}\left(L(0)-\frac{0^2}{2}\right)+C_1$

$\displaystyle 0=0+C_1$

$\displaystyle C_1=0$

Therefore, the slope equation becomes

$\displaystyle \boxed{\frac{dy}{dx}=-\frac{P}{EI}\left(Lx-\frac{x^2}{2}\right)}$

or

$\displaystyle \boxed{\theta(x)=-\frac{P}{EI}\left(Lx-\frac{x^2}{2}\right)}$

This equation gives the rotation of the beam at any position \(x\).

---

## Step 8: Second Integration to Obtain Deflection

Starting from the slope equation:

$\displaystyle \frac{dy}{dx}=-\frac{P}{EI}\left(Lx-\frac{x^2}{2}\right)$

Integrate again with respect to \(x\):

$\displaystyle y(x)=-\frac{P}{EI}\int \left(Lx-\frac{x^2}{2}\right)dx$

Since

$\displaystyle \int Lx\,dx=\frac{Lx^2}{2}$

and

$\displaystyle \int \frac{x^2}{2}\,dx=\frac{x^3}{6}$

we get

$\displaystyle y(x)=-\frac{P}{EI}\left(\frac{Lx^2}{2}-\frac{x^3}{6}\right)+C_2$

where \(C_2\) is the second integration constant.

---

## Step 9: Apply Boundary Condition for Deflection

At the fixed end, the beam cannot move vertically.

Therefore, the deflection at the fixed end is zero:

$\displaystyle y(0)=0$

Substitute \(x=0\) into the deflection equation:

$\displaystyle 0=-\frac{P}{EI}\left(\frac{L(0)^2}{2}-\frac{0^3}{6}\right)+C_2$

$\displaystyle 0=0+C_2$

$\displaystyle C_2=0$

Therefore,

$\displaystyle y(x)=-\frac{P}{EI}\left(\frac{Lx^2}{2}-\frac{x^3}{6}\right)$

Rewrite the equation:

$\displaystyle y(x)=-\frac{P}{EI}\left(\frac{3Lx^2-x^3}{6}\right)$

$\displaystyle y(x)=-\frac{P}{6EI}\left(3Lx^2-x^3\right)$

Factor out \(x^2\):

$\displaystyle y(x)=-\frac{Px^2}{6EI}(3L-x)$

The negative sign indicates downward deflection.

For deflection magnitude, we use

$\displaystyle \boxed{y(x)=\frac{Px^2(3L-x)}{6EI}}$

This is the cantilever beam deflection equation for a point load at the free end.

---

## Step 10: Maximum Slope and Maximum Deflection

### Maximum Slope

The maximum slope occurs at the free end.

At

$\displaystyle x=L$

use the slope equation:

$\displaystyle \theta(x)=-\frac{P}{EI}\left(Lx-\frac{x^2}{2}\right)$

Substitute \(x=L\):

$\displaystyle \theta(L)=-\frac{P}{EI}\left(L(L)-\frac{L^2}{2}\right)$

$\displaystyle \theta(L)=-\frac{P}{EI}\left(L^2-\frac{L^2}{2}\right)$

$\displaystyle \theta(L)=-\frac{P}{EI}\left(\frac{L^2}{2}\right)$

So the maximum slope magnitude is

$\displaystyle \boxed{\theta_{\max}=\frac{PL^2}{2EI}}$

### Maximum Deflection

The maximum deflection occurs at the free end.

At

$\displaystyle x=L$

use the deflection equation:

$\displaystyle y(x)=\frac{Px^2(3L-x)}{6EI}$

Substitute \(x=L\):

$\displaystyle y(L)=\frac{P(L)^2(3L-L)}{6EI}$

$\displaystyle y(L)=\frac{PL^2(2L)}{6EI}$

$\displaystyle y(L)=\frac{2PL^3}{6EI}$

$\displaystyle y(L)=\frac{PL^3}{3EI}$

Therefore,

$\displaystyle \boxed{y_{\max}=\frac{PL^3}{3EI}}$

---

## Step 11: Link to Root Finding

The deflection equation is

$\displaystyle y(x)=\frac{Px^2(3L-x)}{6EI}$

In a design problem, we may want to find the position \(x\) where the beam reaches a required deflection.

Let

$\displaystyle y_{\text{target}}=\text{required deflection}$

For example, if the required deflection is \(2\) mm, then

$\displaystyle y_{\text{target}}=2 \ \text{mm}=0.002 \ \text{m}$

To find the position where the beam deflection equals this value, set

$\displaystyle y(x)=y_{\text{target}}$

Substitute the deflection equation:

$\displaystyle \frac{Px^2(3L-x)}{6EI}=y_{\text{target}}$

Move all terms to one side:

$\displaystyle \frac{Px^2(3L-x)}{6EI}-y_{\text{target}}=0$

Define a root-finding function:

$\displaystyle \boxed{f(x)=\frac{Px^2(3L-x)}{6EI}-y_{\text{target}}}$

Therefore, the root-finding problem is

$\displaystyle \boxed{f(x)=0}$

Physical meaning:

$\displaystyle \boxed{\text{Find the position }x\text{ where beam deflection equals the target deflection.}}$

This connects structural mechanics to numerical methods.

The full process is:

$\displaystyle \boxed{\text{Load} \rightarrow \text{Shear Force} \rightarrow \text{Bending Moment} \rightarrow \text{Slope} \rightarrow \text{Deflection} \rightarrow \text{Root Finding}}$

---
| Quantity | Equation | Meaning |
|---|---|---|
| Shear force | $V(x)=P$ | Constant along the beam |
| Bending moment | $M(x)=-P(L-x)$ | Maximum at the fixed end |
| Moment-curvature relation | $EIy''=M(x)$ | Connects bending moment to deflection |
| Slope | $\theta(x)=-(P/EI)(Lx-x^2/2)$ | Rotation of beam section |
| Deflection | $y(x)=Px^2(3L-x)/(6EI)$ | Vertical displacement |
| Maximum slope | $\theta_{\max}=PL^2/(2EI)$ | Occurs at free end |
| Maximum deflection | $y_{\max}=PL^3/(3EI)$ | Occurs at free end |


