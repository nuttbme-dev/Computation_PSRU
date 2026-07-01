# Matrix Algebra in Engineering Systems

In engineering, complex physical systems are rarely governed by isolated variables. Instead, real-world phenomena such as stress distribution in a structural beam, pressure distribution in a fluid element, or velocity transformation in a robotic system depend on several interrelated variables acting together.

To describe these interdependent variables in a compact and systematic way, engineers use **linear systems of equations** and **matrix algebra**.

![Stress tensor](<https://cdn.discordapp.com/attachments/1521724868738023507/1521725252852518942/image.png?ex=6a45e094&is=6a448f14&hm=dcc4e465ce40fb7614f8042cecba411e029744ffb0c21e1ee1285a0c1239fb28&>)

A linear system can be written compactly as

$$\mathbf{A}\mathbf{x} = \mathbf{b}$$

where:

- $\mathbf{A}$ is the coefficient matrix.
- $\mathbf{x}$ is the unknown vector.
- $\mathbf{b}$ is the constant vector.

The dimension of each matrix or vector depends on the physical problem. For example, a two-variable algebra problem uses a $2 \times 2$ matrix, a 3D stress tensor uses a $3 \times 3$ matrix, and a state-space model may use a system matrix together with an input matrix.

Two common engineering applications of this matrix framework are:

1. **Solids and Structural Engineering:** stress tensors, principal stresses, and traction vectors.
2. **Fluids, Robotics, and Dynamics:** fluid stress states, velocity transformations, Jacobians, and state-space models.

---

## 1. Linear System of Equations to Matrix Equation

A system of linear equations consists of multiple equations sharing common unknown variables.

For a two-variable system:

$$
a_{11}x_1 + a_{12}x_2 = b_1
$$

$$
a_{21}x_1 + a_{22}x_2 = b_2
$$

This system can be written in matrix form as

$$\mathbf{A}_{2\times2}\mathbf{x}_{2\times1}=\mathbf{b}_{2\times1}$$

where the coefficient matrix is

$$\mathbf{A}_{2\times2}=
\begin{bmatrix}
a_{11} & a_{12} \\
a_{21} & a_{22}
\end{bmatrix}$$

the unknown vector is

$$\mathbf{x}_{2\times1}=
\begin{bmatrix}
x_1 \\
x_2
\end{bmatrix}$$

and the constant vector is

$$\mathbf{b}_{2\times1}=
\begin{bmatrix}
b_1 \\
b_2
\end{bmatrix}$$

Therefore, the full matrix equation becomes

$$\begin{bmatrix}a_{11} & a_{12} \\ a_{21} & a_{22}\end{bmatrix}\begin{bmatrix}x_1 \\ x_2\end{bmatrix}=
\begin{bmatrix}
b_1 \\
b_2
\end{bmatrix}$$

The dimension check is

$$
(2\times2)(2\times1) = (2\times1)
$$

This confirms that the multiplication is valid.

---

## 2. General Matrix Dimension Rule

For a general matrix equation,

$$\mathbf{A}\mathbf{x} = \mathbf{b}$$

the dimensions may be written as

$$\mathbf{A}_{m\times n}\mathbf{x}_{n\times1}=
\mathbf{b}_{m\times1}
$$

The multiplication is valid because the inner dimensions match:

$$(m\times n)(n\times1) = (m\times1)$$

A column vector with $n$ components is written as

$$\mathbf{x}_{n\times1}=
\begin{bmatrix}
x_1 \\
x_2 \\
\vdots \\
x_n
\end{bmatrix}
$$

A row vector is the transpose of a column vector and has dimension $1\times n$:

$$\mathbf{x}^{T}_{1\times n}=
\begin{bmatrix}
x_1 & x_2 & \cdots & x_n
\end{bmatrix}
$$

The matrix multiplication rule is based on row-column multiplication:

$$
b_i = \sum_{j=1}^{n} a_{ij}x_j
$$

This means that each output component $b_i$ is calculated by taking the dot product between row $i$ of matrix $\mathbf{A}$ and the column vector $\mathbf{x}$.

---

## 3. Analytical Methods for Solving a Square Linear System

If the coefficient matrix is square and non-singular, then the system has a unique solution.

For a square system,

$$
\mathbf{A}_{n\times n}\mathbf{x}_{n\times1}
=
\mathbf{b}_{n\times1}
$$

If

$$
\det(\mathbf{A}) \neq 0
$$

then the inverse matrix exists, and the solution is

$$
\mathbf{x} = \mathbf{A}^{-1}\mathbf{b}
$$

---

### 3.1 Matrix Inverse for a 2 × 2 Matrix

For a $2 \times 2$ matrix,

$$
\mathbf{A}_{2\times2}
=
\begin{bmatrix}
a_{11} & a_{12} \\
a_{21} & a_{22}
\end{bmatrix}
$$

the determinant is

$$
\det(\mathbf{A})
=
a_{11}a_{22} - a_{12}a_{21}
$$

If the determinant is not zero, the inverse is

$$
\mathbf{A}^{-1}
=
\frac{1}{a_{11}a_{22}-a_{12}a_{21}}
\begin{bmatrix}
a_{22} & -a_{12} \\
-a_{21} & a_{11}
\end{bmatrix}
$$

The solution is then

$$
\mathbf{x}_{2\times1}
=
\mathbf{A}^{-1}_{2\times2}
\mathbf{b}_{2\times1}
$$

Dimension check:

$$
(2\times2)(2\times1) = (2\times1)
$$

---

### 3.2 Gauss-Jordan Elimination

Gauss-Jordan elimination solves a system by transforming the augmented matrix into reduced row echelon form.

For a two-variable system, the augmented matrix is

$$
\left[
\begin{array}{cc|c}
a_{11} & a_{12} & b_1 \\
a_{21} & a_{22} & b_2
\end{array}
\right]
$$

After row operations, the matrix becomes

$$
\left[
\begin{array}{cc|c}
1 & 0 & x_1 \\
0 & 1 & x_2
\end{array}
\right]
$$

The row operations include:

- Swapping rows
- Multiplying a row by a non-zero scalar
- Adding or subtracting a multiple of one row from another row

---

### 3.3 Cramer's Rule

Cramer's Rule solves each unknown variable using determinants.

For a square matrix system,

$$
\mathbf{A}\mathbf{x} = \mathbf{b}
$$

the $i$-th unknown is

$$
x_i = \frac{\det(\mathbf{A}_i)}{\det(\mathbf{A})}
$$

where $\mathbf{A}_i$ is formed by replacing the $i$-th column of $\mathbf{A}$ with the vector $\mathbf{b}$.

For a two-variable system:

$$
x_1 = \frac{\det(\mathbf{A}_1)}{\det(\mathbf{A})}
$$

$$
x_2 = \frac{\det(\mathbf{A}_2)}{\det(\mathbf{A})}
$$

Cramer's Rule is valid only when

$$
\det(\mathbf{A}) \neq 0
$$

---

## 4. Engineering Application: 2D Stress Tensor Analysis

In solid mechanics, stress at a point can be represented using a stress tensor.

For a 2D plane stress state, the stress tensor has dimension $2\times2$:

$$
\boldsymbol{\sigma}_{2\times2}
=
\begin{bmatrix}
\sigma_{xx} & \tau_{xy} \\
\tau_{yx} & \sigma_{yy}
\end{bmatrix}
$$

Consider a structural element under plane stress with:

- $\sigma_{xx} = 80 \ \text{MPa}$
- $\sigma_{yy} = 20 \ \text{MPa}$
- $\tau_{xy} = \tau_{yx} = 30 \ \text{MPa}$

The stress tensor is

$$
\boldsymbol{\sigma}_{2\times2}
=
\begin{bmatrix}
80 & 30 \\
30 & 20
\end{bmatrix}
$$

---

### 4.1 Cauchy's Stress Formula

Using Cauchy's stress formula, the traction vector $\mathbf{T}$ acting on a plane is

$$
\boldsymbol{\sigma}\mathbf{n} = \mathbf{T}
$$

For the 2D case, the dimension is

$$
\boldsymbol{\sigma}_{2\times2}
\mathbf{n}_{2\times1}
=
\mathbf{T}_{2\times1}
$$

Let the traction vector be

$$
\mathbf{T}_{2\times1}
=
\begin{bmatrix}
70 \\
40
\end{bmatrix}
\ \text{MPa}
$$

and the normal direction vector be

$$
\mathbf{n}_{2\times1}
=
\begin{bmatrix}
n_x \\
n_y
\end{bmatrix}
$$

The matrix system becomes

$$
\begin{bmatrix}
80 & 30 \\
30 & 20
\end{bmatrix}
\begin{bmatrix}
n_x \\
n_y
\end{bmatrix}
=
\begin{bmatrix}
70 \\
40
\end{bmatrix}
$$

Dimension check:

$$
(2\times2)(2\times1) = (2\times1)
$$

---

### 4.2 Solution by Gauss-Jordan Elimination

Construct the augmented matrix:

$$
\left[
\begin{array}{cc|c}
80 & 30 & 70 \\
30 & 20 & 40
\end{array}
\right]
$$

Normalize Row 1:

$$
R_1 \leftarrow \frac{R_1}{80}
$$

$$
\left[
\begin{array}{cc|c}
1 & 0.375 & 0.875 \\
30 & 20 & 40
\end{array}
\right]
$$

Eliminate the first coefficient in Row 2:

$$
R_2 \leftarrow R_2 - 30R_1
$$

$$
20 - 30(0.375) = 8.75
$$

$$
40 - 30(0.875) = 13.75
$$

Thus,

$$
\left[
\begin{array}{cc|c}
1 & 0.375 & 0.875 \\
0 & 8.75 & 13.75
\end{array}
\right]
$$

Normalize Row 2:

$$
R_2 \leftarrow \frac{R_2}{8.75}
$$

$$
n_y = \frac{13.75}{8.75} = \frac{11}{7}
$$

$$
\left[
\begin{array}{cc|c}
1 & 0.375 & 0.875 \\
0 & 1 & \frac{11}{7}
\end{array}
\right]
$$

Eliminate the second coefficient in Row 1:

$$
R_1 \leftarrow R_1 - 0.375R_2
$$

$$
0.875 - 0.375\left(\frac{11}{7}\right)
=
\frac{2}{7}
$$

Therefore,

$$
\left[
\begin{array}{cc|c}
1 & 0 & \frac{2}{7} \\
0 & 1 & \frac{11}{7}
\end{array}
\right]
$$

The solution is

$$
\mathbf{n}
=
\begin{bmatrix}
\frac{2}{7} \\
\frac{11}{7}
\end{bmatrix}
$$

or approximately,

$$
\mathbf{n}
\approx
\begin{bmatrix}
0.2857 \\
1.5714
\end{bmatrix}
$$

---

### 4.3 Solution by Cramer's Rule

The determinant of the stress matrix is

$$
D
=
\det
\begin{bmatrix}
80 & 30 \\
30 & 20
\end{bmatrix}
$$

$$
D = (80)(20) - (30)(30)
$$

$$
D = 1600 - 900 = 700
$$

Replace the first column with $\mathbf{T}$:

$$
\mathbf{A}_1
=
\begin{bmatrix}
70 & 30 \\
40 & 20
\end{bmatrix}
$$

$$
D_1 = (70)(20) - (30)(40)
$$

$$
D_1 = 1400 - 1200 = 200
$$

Thus,

$$
n_x = \frac{D_1}{D}
=
\frac{200}{700}
=
\frac{2}{7}
$$

Replace the second column with $\mathbf{T}$:

$$
\mathbf{A}_2
=
\begin{bmatrix}
80 & 70 \\
30 & 40
\end{bmatrix}
$$

$$
D_2 = (80)(40) - (70)(30)
$$

$$
D_2 = 3200 - 2100 = 1100
$$

Thus,

$$
n_y = \frac{D_2}{D}
=
\frac{1100}{700}
=
\frac{11}{7}
$$

The final result is

$$
\mathbf{n}
=
\begin{bmatrix}
\frac{2}{7} \\
\frac{11}{7}
\end{bmatrix}
$$

---

### 4.4 Important Physical Note

Although the vector is written as $\mathbf{n}$, the result is not a unit normal vector because its magnitude is not equal to 1.

The magnitude is

$$
|\mathbf{n}|
=
\sqrt{
\left(\frac{2}{7}\right)^2
+
\left(\frac{11}{7}\right)^2
}
$$

$$
|\mathbf{n}|
=
\sqrt{\frac{4}{49}+\frac{121}{49}}
=
\sqrt{\frac{125}{49}}
=
\frac{\sqrt{125}}{7}
$$

Since

$$
|\mathbf{n}| \neq 1
$$

this vector should be interpreted as a direction vector associated with the given traction condition, not a true unit normal vector.

If a true unit normal is required, the vector must be normalized:

$$
\hat{\mathbf{n}}
=
\frac{\mathbf{n}}{|\mathbf{n}|}
$$

---

## 5. Three-Dimensional Fluid Stress Tensor Analysis

In fluid mechanics, the complete stress state at a point in 3D space is represented by a $3\times3$ Cauchy stress tensor.

The general 3D stress tensor is

$$
\boldsymbol{\sigma}_{3\times3}
=
\begin{bmatrix}
\sigma_{xx} & \tau_{xy} & \tau_{xz} \\
\tau_{yx} & \sigma_{yy} & \tau_{yz} \\
\tau_{zx} & \tau_{zy} & \sigma_{zz}
\end{bmatrix}
$$

The determinant is computed from the full $3\times3$ matrix:

$$
\det(\boldsymbol{\sigma}_{3\times3})
$$

The determinant gives information about whether the stress state is invertible and how stress acts volumetrically in three-dimensional space.

---

### 5.1 Case A: Negative Determinant — High Viscous Compression

A fluid element inside a high-pressure vortex pump experiences:

- $\sigma_{xx} = -50 \ \text{kPa}$
- $\sigma_{yy} = -50 \ \text{kPa}$
- $\sigma_{zz} = -30 \ \text{kPa}$
- $\tau_{xy} = \tau_{yx} = 10 \ \text{kPa}$
- All other shear terms are zero.

The stress tensor is

$$
\boldsymbol{\sigma}_A
=
\begin{bmatrix}
-50 & 10 & 0 \\
10 & -50 & 0 \\
0 & 0 & -30
\end{bmatrix}
$$

This is a $3\times3$ matrix.

Expanding along the third row:

$$
\det(\boldsymbol{\sigma}_A)
=
-30
\det
\begin{bmatrix}
-50 & 10 \\
10 & -50
\end{bmatrix}
$$

$$
\det(\boldsymbol{\sigma}_A)
=
-30
\left[
(-50)(-50) - (10)(10)
\right]
$$

$$
\det(\boldsymbol{\sigma}_A)
=
-30(2500 - 100)
$$

$$
\det(\boldsymbol{\sigma}_A)
=
-30(2400)
=
-72000
$$

The determinant is negative:

$$
\det(\boldsymbol{\sigma}_A) < 0
$$

A large negative determinant indicates that compressive stresses dominate the fluid element.

---

### 5.2 Case B: Zero Determinant — Unconfined Stress State

A fluid element near a boundary layer experiences:

- $\sigma_{xx} = 0 \ \text{kPa}$
- $\sigma_{yy} = -40 \ \text{kPa}$
- $\sigma_{zz} = 0 \ \text{kPa}$
- $\tau_{xy} = \tau_{yx} = 40 \ \text{kPa}$
- All other shear terms are zero.

The stress tensor is

$$
\boldsymbol{\sigma}_B
=
\begin{bmatrix}
0 & 40 & 0 \\
40 & -40 & 0 \\
0 & 0 & 0
\end{bmatrix}
$$

Because the third row contains only zeros, the determinant is

$$
\det(\boldsymbol{\sigma}_B) = 0
$$

This means the matrix is singular and non-invertible.

Physically, this indicates that the stress state is unconfined in at least one spatial direction. In this case, the $z$-direction does not carry stress resistance.

---

### 5.3 Case C: Positive Determinant — Tensile Expansion State

To demonstrate a positive determinant, consider a fluid element with tensile normal stresses:

- $\sigma_{xx} = 20 \ \text{kPa}$
- $\sigma_{yy} = 20 \ \text{kPa}$
- $\sigma_{zz} = 10 \ \text{kPa}$
- $\tau_{xy} = \tau_{yx} = 5 \ \text{kPa}$
- All other shear terms are zero.

The stress tensor is

$$
\boldsymbol{\sigma}_C
=
\begin{bmatrix}
20 & 5 & 0 \\
5 & 20 & 0 \\
0 & 0 & 10
\end{bmatrix}
$$

Expanding along the third row:

$$
\det(\boldsymbol{\sigma}_C)
=
10
\det
\begin{bmatrix}
20 & 5 \\
5 & 20
\end{bmatrix}
$$

$$
\det(\boldsymbol{\sigma}_C)
=
10
\left[
(20)(20) - (5)(5)
\right]
$$

$$
\det(\boldsymbol{\sigma}_C)
=
10(400 - 25)
$$

$$
\det(\boldsymbol{\sigma}_C)
=
10(375)
=
3750
$$

Therefore,

$$
\det(\boldsymbol{\sigma}_C) > 0
$$

A positive determinant in this example is associated with an expansive or tensile stress state.

In liquids, sustained tensile stress may be related to cavitation, where vapor bubbles form because the fluid cannot support large tensile loading.

---

## 6. Eigenvalues and Eigenvectors in Continuum Mechanics

For a stress tensor, the eigenvalue problem is

$$
\boldsymbol{\sigma}\mathbf{v}
=
\lambda\mathbf{v}
$$

For a 2D stress tensor, the dimension is

$$
\boldsymbol{\sigma}_{2\times2}
\mathbf{v}_{2\times1}
=
\lambda
\mathbf{v}_{2\times1}
$$

The eigenvalues represent the principal stresses.

The eigenvectors represent the principal directions.

To solve for the eigenvalues, use the characteristic equation:

$$
\det(\boldsymbol{\sigma} - \lambda\mathbf{I}) = 0
$$

where $\mathbf{I}$ is the identity matrix.

---

### 6.1 Application 1: 2D Fluid Element

Consider a 2D fluid stress tensor:

$$
\boldsymbol{\sigma}_{fluid}
=
\begin{bmatrix}
-40 & 10 \\
10 & -40
\end{bmatrix}
$$

This is a $2\times2$ matrix.

The eigenvalue equation is

$$
\det
\left(
\boldsymbol{\sigma}_{fluid}
-
\lambda\mathbf{I}
\right)
=
0
$$

Thus,

$$
\det
\begin{bmatrix}
-40-\lambda & 10 \\
10 & -40-\lambda
\end{bmatrix}
=
0
$$

Expanding the determinant:

$$
(-40-\lambda)^2 - (10)(10) = 0
$$

$$
(-40-\lambda)^2 - 100 = 0
$$

Expanding:

$$
\lambda^2 + 80\lambda + 1500 = 0
$$

Factoring:

$$
(\lambda+30)(\lambda+50)=0
$$

Therefore,

$$
\lambda_1 = -30 \ \text{kPa}
$$

$$
\lambda_2 = -50 \ \text{kPa}
$$

For $\lambda_1 = -30$:

$$
\boldsymbol{\sigma}_{fluid}
-
\lambda_1\mathbf{I}
=
\begin{bmatrix}
-10 & 10 \\
10 & -10
\end{bmatrix}
$$

Solve:

$$
\begin{bmatrix}
-10 & 10 \\
10 & -10
\end{bmatrix}
\begin{bmatrix}
v_x \\
v_y
\end{bmatrix}
=
\begin{bmatrix}
0 \\
0
\end{bmatrix}
$$

This gives

$$
-10v_x + 10v_y = 0
$$

Therefore,

$$
v_x = v_y
$$

The normalized eigenvector is

$$
\mathbf{v}_1
=
\begin{bmatrix}
\frac{1}{\sqrt{2}} \\
\frac{1}{\sqrt{2}}
\end{bmatrix}
$$

This direction is rotated at $45^\circ$.

For $\lambda_2 = -50$, the corresponding eigenvector is

$$
\mathbf{v}_2
=
\begin{bmatrix}
-\frac{1}{\sqrt{2}} \\
\frac{1}{\sqrt{2}}
\end{bmatrix}
$$

This direction is rotated at $135^\circ$.

The eigenvalues show that the fluid element experiences different compression levels along the principal directions.

---

### 6.2 Application 2: 2D Solid Element Under Pure Shear

Consider a structural element under pure shear:

$$
\boldsymbol{\sigma}_{solid}
=
\begin{bmatrix}
0 & 60 \\
60 & 0
\end{bmatrix}
$$

This is a $2\times2$ stress tensor.

The characteristic equation is

$$
\det
\begin{bmatrix}
-\lambda & 60 \\
60 & -\lambda
\end{bmatrix}
=
0
$$

Expanding:

$$
\lambda^2 - 3600 = 0
$$

Thus,

$$
\lambda^2 = 3600
$$

Therefore,

$$
\lambda_1 = 60 \ \text{MPa}
$$

$$
\lambda_2 = -60 \ \text{MPa}
$$

For $\lambda_1 = 60$:

$$
\begin{bmatrix}
-60 & 60 \\
60 & -60
\end{bmatrix}
\begin{bmatrix}
v_x \\
v_y
\end{bmatrix}
=
\begin{bmatrix}
0 \\
0
\end{bmatrix}
$$

This gives

$$
v_x = v_y
$$

The normalized eigenvector is

$$
\mathbf{v}_1
=
\begin{bmatrix}
\frac{1}{\sqrt{2}} \\
\frac{1}{\sqrt{2}}
\end{bmatrix}
$$

For $\lambda_2 = -60$:

$$
v_x = -v_y
$$

The normalized eigenvector is

$$
\mathbf{v}_2
=
\begin{bmatrix}
-\frac{1}{\sqrt{2}} \\
\frac{1}{\sqrt{2}}
\end{bmatrix}
$$

This result explains a key feature of pure shear: shear stress creates equal tensile and compressive principal stresses acting along planes rotated by $45^\circ$ and $135^\circ$.

---

## 7. Applied Engineering Dynamics and Robotics Problems

This section applies matrix algebra to engineering systems that use $2\times2$ transformation matrices.

The important point is that not every $2\times2$ matrix has the same physical meaning.

- In algebra, $\mathbf{A}$ is a coefficient matrix.
- In stress analysis, $\boldsymbol{\sigma}$ is a stress tensor.
- In robotics, $\mathbf{J}$ is a Jacobian matrix.
- In dynamics, $\mathbf{A}_{state}$ is a state-space system matrix.

---

## 8. Problem A: Differential Drive Robot Car

![Robot wheel](<https://cdn.discordapp.com/attachments/1521724868738023507/1521739407269429389/image.png?ex=6a45edc3&is=6a449c43&hm=ecddd266c7eb8c47065e67049c7c36a5662909c7ba712ae5fc6094b2145c822e&>)

A differential drive robot uses two independent wheel velocities:

- $v_R$ = right wheel velocity
- $v_L$ = left wheel velocity

The robot motion is described by:

- $v_B$ = forward velocity of the robot body
- $\omega$ = angular turning velocity

Let the wheel track width be

$$
s = 0.5 \ \text{m}
$$

The forward velocity is

$$
v_B = 0.5v_R + 0.5v_L
$$

The angular velocity is

$$
\omega = \frac{1}{s}v_R - \frac{1}{s}v_L
$$

Since $s = 0.5$,

$$
\omega = 2v_R - 2v_L
$$

---

### 8.1 Matrix Form

Define the wheel velocity vector as

$$
\mathbf{u}_{2\times1}
=
\begin{bmatrix}
v_R \\
v_L
\end{bmatrix}
$$

Define the robot motion vector as

$$
\mathbf{y}_{2\times1}
=
\begin{bmatrix}
v_B \\
\omega
\end{bmatrix}
$$

The transformation is

$$
\mathbf{y}_{2\times1}
=
\mathbf{A}_{robot}
\mathbf{u}_{2\times1}
$$

where

$$
\mathbf{A}_{robot}
=
\begin{bmatrix}
0.5 & 0.5 \\
2 & -2
\end{bmatrix}
$$

Therefore,

$$
\begin{bmatrix}
v_B \\
\omega
\end{bmatrix}
=
\begin{bmatrix}
0.5 & 0.5 \\
2 & -2
\end{bmatrix}
\begin{bmatrix}
v_R \\
v_L
\end{bmatrix}
$$

Dimension check:

$$
(2\times2)(2\times1) = (2\times1)
$$

---

### 8.2 Determinant and Physical Meaning

The determinant is

$$
\det(\mathbf{A}_{robot})
=
(0.5)(-2) - (0.5)(2)
$$

$$
\det(\mathbf{A}_{robot})
=
-1 - 1
=
-2
$$

Since

$$
\det(\mathbf{A}_{robot}) \neq 0
$$

the transformation is invertible.

This means that for a desired combination of forward speed and turning rate, there is one unique pair of wheel speeds.

---

### 8.3 Cramer's Rule for Wheel Speeds

Suppose the desired robot motion is

$$
v_B = 2 \ \text{m/s}
$$

$$
\omega = 4 \ \text{rad/s}
$$

Then,

$$
\mathbf{b}
=
\begin{bmatrix}
2 \\
4
\end{bmatrix}
$$

The system is

$$
\begin{bmatrix}
0.5 & 0.5 \\
2 & -2
\end{bmatrix}
\begin{bmatrix}
v_R \\
v_L
\end{bmatrix}
=
\begin{bmatrix}
2 \\
4
\end{bmatrix}
$$

The main determinant is

$$
D = -2
$$

Replace the first column:

$$
\mathbf{A}_1
=
\begin{bmatrix}
2 & 0.5 \\
4 & -2
\end{bmatrix}
$$

$$
D_1 = (2)(-2) - (0.5)(4)
$$

$$
D_1 = -4 - 2 = -6
$$

Therefore,

$$
v_R = \frac{D_1}{D}
=
\frac{-6}{-2}
=
3 \ \text{m/s}
$$

Replace the second column:

$$
\mathbf{A}_2
=
\begin{bmatrix}
0.5 & 2 \\
2 & 4
\end{bmatrix}
$$

$$
D_2 = (0.5)(4) - (2)(2)
$$

$$
D_2 = 2 - 4 = -2
$$

Therefore,

$$
v_L = \frac{D_2}{D}
=
\frac{-2}{-2}
=
1 \ \text{m/s}
$$

The required wheel speeds are

$$
v_R = 3 \ \text{m/s}
$$

$$
v_L = 1 \ \text{m/s}
$$

---

### 8.4 Eigenvalues and Eigenvectors

The characteristic equation is

$$
\det(\mathbf{A}_{robot} - \lambda\mathbf{I}) = 0
$$

Thus,

$$
\det
\begin{bmatrix}
0.5-\lambda & 0.5 \\
2 & -2-\lambda
\end{bmatrix}
=
0
$$

Expanding:

$$
(0.5-\lambda)(-2-\lambda) - (0.5)(2) = 0
$$

This gives

$$
\lambda^2 + 1.5\lambda - 2 = 0
$$

Solving:

$$
\lambda_1 \approx 0.85
$$

$$
\lambda_2 \approx -2.35
$$

The corresponding approximate eigenvectors are

$$
\mathbf{v}_1
\approx
\begin{bmatrix}
1 \\
0.7
\end{bmatrix}
$$

$$
\mathbf{v}_2
\approx
\begin{bmatrix}
1 \\
-5.7
\end{bmatrix}
$$

The positive eigenvalue represents a forward-motion mode where the wheels move in a similar direction.

The negative eigenvalue represents a turning mode where the wheels move in opposite directions.

Because

$$
|\lambda_2| > |\lambda_1|
$$

the robot is more sensitive to differential steering than to pure forward translation.

---

## 9. Problem B: Velocity Jacobian of a Two-Link Robotic Manipulator

![Manipulator](<https://cdn.discordapp.com/attachments/1521724868738023507/1521740132342956092/image.png?ex=6a45ee70&is=6a449cf0&hm=2e40c4821d0e2658a7c7b97eb89717b09222c2e8ec3fcf4c438bbcd97770c0b3&>)

A two-link robotic manipulator maps joint angular velocities into end-effector Cartesian velocities.

The joint velocities are:

- $\dot{\theta}_1$ = base joint angular velocity
- $\dot{\theta}_2$ = elbow joint angular velocity

The end-effector velocities are:

- $\dot{x}$ = horizontal tool-tip velocity
- $\dot{y}$ = vertical tool-tip velocity

The simplified governing equations are

$$
\dot{x} = 2\dot{\theta}_1 - 2\dot{\theta}_2
$$

$$
\dot{y} = 3\dot{\theta}_1 + \dot{\theta}_2
$$

---

### 9.1 Matrix Form

Define the joint velocity vector:

$$
\dot{\boldsymbol{\theta}}_{2\times1}
=
\begin{bmatrix}
\dot{\theta}_1 \\
\dot{\theta}_2
\end{bmatrix}
$$

Define the end-effector velocity vector:

$$
\dot{\mathbf{x}}_{2\times1}
=
\begin{bmatrix}
\dot{x} \\
\dot{y}
\end{bmatrix}
$$

The velocity mapping is

$$
\dot{\mathbf{x}}_{2\times1}
=
\mathbf{J}_{2\times2}
\dot{\boldsymbol{\theta}}_{2\times1}
$$

where $\mathbf{J}$ is the Jacobian matrix:

$$
\mathbf{J}_{2\times2}
=
\begin{bmatrix}
2 & -2 \\
3 & 1
\end{bmatrix}
$$

Therefore,

$$
\begin{bmatrix}
\dot{x} \\
\dot{y}
\end{bmatrix}
=
\begin{bmatrix}
2 & -2 \\
3 & 1
\end{bmatrix}
\begin{bmatrix}
\dot{\theta}_1 \\
\dot{\theta}_2
\end{bmatrix}
$$

Dimension check:

$$
(2\times2)(2\times1) = (2\times1)
$$

---

### 9.2 Determinant and Physical Meaning

The determinant of the Jacobian is

$$
\det(\mathbf{J})
=
(2)(1) - (-2)(3)
$$

$$
\det(\mathbf{J})
=
2 + 6
=
8
$$

Since

$$
\det(\mathbf{J}) \neq 0
$$

the robotic arm is not in a singular configuration.

A non-zero Jacobian determinant means the end-effector can move in both Cartesian directions.

If

$$
\det(\mathbf{J}) = 0
$$

the manipulator would be in a singular configuration, where motion in some direction becomes impossible or requires extremely large joint speeds.

---

### 9.3 Cramer's Rule for Joint Velocities

Suppose the desired end-effector velocity is

$$
\dot{x} = -4 \ \text{m/s}
$$

$$
\dot{y} = 6 \ \text{m/s}
$$

The system becomes

$$
\begin{bmatrix}
2 & -2 \\
3 & 1
\end{bmatrix}
\begin{bmatrix}
\dot{\theta}_1 \\
\dot{\theta}_2
\end{bmatrix}
=
\begin{bmatrix}
-4 \\
6
\end{bmatrix}
$$

The main determinant is

$$
D = 8
$$

Replace the first column:

$$
\mathbf{J}_1
=
\begin{bmatrix}
-4 & -2 \\
6 & 1
\end{bmatrix}
$$

$$
D_1 = (-4)(1) - (-2)(6)
$$

$$
D_1 = -4 + 12 = 8
$$

Therefore,

$$
\dot{\theta}_1
=
\frac{D_1}{D}
=
\frac{8}{8}
=
1 \ \text{rad/s}
$$

Replace the second column:

$$
\mathbf{J}_2
=
\begin{bmatrix}
2 & -4 \\
3 & 6
\end{bmatrix}
$$

$$
D_2 = (2)(6) - (-4)(3)
$$

$$
D_2 = 12 + 12 = 24
$$

Therefore,

$$
\dot{\theta}_2
=
\frac{D_2}{D}
=
\frac{24}{8}
=
3 \ \text{rad/s}
$$

The required joint velocities are

$$
\dot{\theta}_1 = 1 \ \text{rad/s}
$$

$$
\dot{\theta}_2 = 3 \ \text{rad/s}
$$

---

### 9.4 Eigenvalues of the Jacobian

The characteristic equation is

$$
\det(\mathbf{J} - \lambda\mathbf{I}) = 0
$$

Thus,

$$
\det
\begin{bmatrix}
2-\lambda & -2 \\
3 & 1-\lambda
\end{bmatrix}
=
0
$$

Expanding:

$$
(2-\lambda)(1-\lambda) - (-2)(3) = 0
$$

$$
(2-\lambda)(1-\lambda) + 6 = 0
$$

This gives

$$
\lambda^2 - 3\lambda + 8 = 0
$$

The discriminant is

$$
\Delta = b^2 - 4ac
$$

$$
\Delta = (-3)^2 - 4(1)(8)
$$

$$
\Delta = 9 - 32 = -23
$$

Since the discriminant is negative, the eigenvalues are complex:

$$
\lambda
=
\frac{3 \pm \sqrt{-23}}{2}
$$

$$
\lambda
=
1.5 \pm 2.397i
$$

Complex eigenvalues indicate coupled motion between the joint velocity inputs and the Cartesian end-effector velocity outputs.

The real part represents scaling, while the imaginary part represents rotational or sweeping behavior in the velocity mapping.

---

## 10. Problem C: State-Space Suspension Dynamics of a Mass-Spring-Damper System

![Mass-Spring-Damper Model](<https://cdn.discordapp.com/attachments/1521724868738023507/1521740550217138266/image.png?ex=6a45eed3&is=6a449d53&hm=7edd71fcb0eb23c9e9a98eadfb6ab782e4e67e6485ea5ace4b72fb346fd66cd0&>)

A mass-spring-damper system is governed by Newton's Second Law.

The equation of motion is

$$
m\ddot{x} + c\dot{x} + kx = F(t)
$$

where:

- $m$ is the mass.
- $c$ is the damping coefficient.
- $k$ is the spring stiffness.
- $F(t)$ is the external force.

Assume:

$$
m = 1 \ \text{kg}
$$

$$
c = 3 \ \text{N}\cdot\text{s/m}
$$

$$
k = 2 \ \text{N/m}
$$

The equation becomes

$$
\ddot{x} + 3\dot{x} + 2x = F(t)
$$

Solving for acceleration:

$$
\ddot{x} = -2x - 3\dot{x} + F(t)
$$

---

### 10.1 Convert to State-Space Form

Define the state variables:

$$
x_1 = x
$$

$$
x_2 = \dot{x}
$$

Thus,

$$
\dot{x}_1 = x_2
$$

and

$$
\dot{x}_2 = \ddot{x}
$$

Using the equation of motion:

$$
\dot{x}_2 = -2x_1 - 3x_2 + F(t)
$$

The state vector is

$$
\mathbf{x}_{2\times1}
=
\begin{bmatrix}
x_1 \\
x_2
\end{bmatrix}
=
\begin{bmatrix}
x \\
\dot{x}
\end{bmatrix}
$$

The state-space equation is

$$
\dot{\mathbf{x}}_{2\times1}
=
\mathbf{A}_{state}
\mathbf{x}_{2\times1}
+
\mathbf{B}_{2\times1}u
$$

where

$$
u = F(t)
$$

The system matrix is

$$
\mathbf{A}_{state}
=
\begin{bmatrix}
0 & 1 \\
-2 & -3
\end{bmatrix}
$$

The input matrix is

$$
\mathbf{B}_{2\times1}
=
\begin{bmatrix}
0 \\
1
\end{bmatrix}
$$

Therefore,

$$
\begin{bmatrix}
\dot{x}_1 \\
\dot{x}_2
\end{bmatrix}
=
\begin{bmatrix}
0 & 1 \\
-2 & -3
\end{bmatrix}
\begin{bmatrix}
x_1 \\
x_2
\end{bmatrix}
+
\begin{bmatrix}
0 \\
1
\end{bmatrix}
F(t)
$$

Dimension check:

$$
(2\times2)(2\times1) + (2\times1)(1\times1) = (2\times1)
$$

---

### 10.2 Determinant and Physical Meaning

The determinant of the state matrix is

$$
\det(\mathbf{A}_{state})
=
(0)(-3) - (1)(-2)
$$

$$
\det(\mathbf{A}_{state}) = 2
$$

Since

$$
\det(\mathbf{A}_{state}) > 0
$$

the state matrix is invertible.

For this second-order mechanical system, the determinant is related to the stiffness-to-mass ratio:

$$
\det(\mathbf{A}_{state}) = \frac{k}{m}
$$

Here,

$$
\frac{k}{m} = \frac{2}{1} = 2
$$

This confirms that the spring provides a restoring effect in the system.

---

### 10.3 Equilibrium Position Under Constant Force

Assume a constant force:

$$
F(t) = 10 \ \text{N}
$$

At steady state, the derivatives become zero:

$$
\dot{x}_1 = 0
$$

$$
\dot{x}_2 = 0
$$

The state-space equation becomes

$$
\mathbf{0}
=
\mathbf{A}_{state}\mathbf{x}
+
\mathbf{B}F
$$

So,

$$
\mathbf{A}_{state}\mathbf{x}
=
-\mathbf{B}F
$$

Substitute the values:

$$
\begin{bmatrix}
0 & 1 \\
-2 & -3
\end{bmatrix}
\begin{bmatrix}
x_1 \\
x_2
\end{bmatrix}
=
-
\begin{bmatrix}
0 \\
1
\end{bmatrix}
10
$$

Therefore,

$$
\begin{bmatrix}
0 & 1 \\
-2 & -3
\end{bmatrix}
\begin{bmatrix}
x_1 \\
x_2
\end{bmatrix}
=
\begin{bmatrix}
0 \\
-10
\end{bmatrix}
$$

The main determinant is

$$
D = 2
$$

Replace the first column:

$$
\mathbf{A}_1
=
\begin{bmatrix}
0 & 1 \\
-10 & -3
\end{bmatrix}
$$

$$
D_1 = (0)(-3) - (1)(-10)
$$

$$
D_1 = 10
$$

Therefore,

$$
x_1 = \frac{D_1}{D}
=
\frac{10}{2}
=
5 \ \text{m}
$$

At steady state,

$$
x_2 = 0
$$

Therefore, the final equilibrium state is

$$
\mathbf{x}_{ss}
=
\begin{bmatrix}
5 \\
0
\end{bmatrix}
$$

This means the mass settles at

$$
x = 5 \ \text{m}
$$

with zero velocity.

---

### 10.4 Eigenvalues and System Behavior

The characteristic equation is

$$
\det(\mathbf{A}_{state} - \lambda\mathbf{I}) = 0
$$

Thus,

$$
\det
\begin{bmatrix}
-\lambda & 1 \\
-2 & -3-\lambda
\end{bmatrix}
=
0
$$

Expanding:

$$
(-\lambda)(-3-\lambda) - (1)(-2) = 0
$$

$$
\lambda(3+\lambda) + 2 = 0
$$

$$
\lambda^2 + 3\lambda + 2 = 0
$$

Factoring:

$$
(\lambda+1)(\lambda+2)=0
$$

Therefore,

$$
\lambda_1 = -1
$$

$$
\lambda_2 = -2
$$

For $\lambda_1 = -1$, the eigenvector is

$$
\mathbf{v}_1
=
\begin{bmatrix}
1 \\
-1
\end{bmatrix}
$$

For $\lambda_2 = -2$, the eigenvector is

$$
\mathbf{v}_2
=
\begin{bmatrix}
1 \\
-2
\end{bmatrix}
$$

Both eigenvalues are real and negative.

Therefore, the system is stable and overdamped.

Physically, this means that after a disturbance, the mass returns smoothly to equilibrium without oscillation.

---

## 11. Summary of Correct Matrix Dimensions

The following table summarizes the correct matrix names and dimensions used in this document.

| Application | Matrix name | Dimension | Meaning |
|---|---:|---:|---|
| General linear system | $\mathbf{A}$ | $m\times n$ | Coefficient matrix |
| Square solvable system | $\mathbf{A}$ | $n\times n$ | Invertible coefficient matrix if $\det(\mathbf{A})\neq0$ |
| Two-variable algebra example | $\mathbf{A}_{2\times2}$ | $2\times2$ | Coefficient matrix |
| Unknown vector | $\mathbf{x}$ | $n\times1$ | Unknown variables |
| Constant vector | $\mathbf{b}$ | $m\times1$ | Known outputs |
| 2D stress tensor | $\boldsymbol{\sigma}_{2\times2}$ | $2\times2$ | Plane stress tensor |
| 3D stress tensor | $\boldsymbol{\sigma}_{3\times3}$ | $3\times3$ | Full 3D Cauchy stress tensor |
| Differential drive robot | $\mathbf{A}_{robot}$ | $2\times2$ | Wheel-to-body velocity transformation |
| Robot manipulator | $\mathbf{J}_{2\times2}$ | $2\times2$ | Velocity Jacobian |
| Suspension dynamics | $\mathbf{A}_{state}$ | $2\times2$ | State-space system matrix |
| Suspension input matrix | $\mathbf{B}$ | $2\times1$ | Force input matrix |

---

## 12. Final Concept

Matrix algebra is powerful because it allows many engineering systems to be written in one compact mathematical form.

However, the meaning of each matrix depends on the physical context.

A $2\times2$ matrix may represent:

- A coefficient matrix in algebra
- A stress tensor in 2D mechanics
- A velocity transformation in robotics
- A Jacobian matrix
- A state-space system matrix

A $3\times3$ matrix may represent:

- A full 3D stress tensor
- A 3D transformation matrix
- A spatial inertia or dynamics matrix

Therefore, matrix dimension must always be checked together with physical meaning.

The most important rule is:

$$
\text{Inner dimensions must match.}
$$

For example,

$$
\mathbf{A}_{m\times n}\mathbf{x}_{n\times1}
=
\mathbf{b}_{m\times1}
$$

This rule ensures that the matrix operation is mathematically valid and physically meaningful.
