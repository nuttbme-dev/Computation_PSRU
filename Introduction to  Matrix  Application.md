

In engineering, complex physical systems are rarely governed by isolated variables. Instead, real-world phenomena—such as the distribution of forces inside a structural beam or the pressure distribution within a fluid body—depend on interrelated parameters acting in three dimensions. To track, calculate, and solve these interdependent variables simultaneously, engineers rely on linear systems of equations.

![Stress tensor](https://cdn.discordapp.com/attachments/1521724868738023507/1521725252852518942/image.png?ex=6a45e094&is=6a448f14&hm=dcc4e465ce40fb7614f8042cecba411e029744ffb0c21e1ee1285a0c1239fb28&)



Writing these systems out using classical algebra becomes highly inefficient and prone to error as dimensions scale. This is where **Matrix Algebra** becomes an indispensable tool. A matrix transforms an unwieldy system of linear equations into a singular, compact mathematical entity:

$$\mathbf{A}\mathbf{x} = \mathbf{b}$$

By organizing structural stiffness coefficients, material properties, or fluid pressures into structured arrays, we can apply standardized numerical algorithms to find exact physical solutions. Two of the most common applications of this matrix framework in continuum mechanics are:
1. **Solids (Structural Engineering):** Tracking internal normal and shear stresses acting across different cut planes of loaded structures like beams, shafts, or bridges.
2. **Fluids (Fluid Dynamics & Hydraulics):** Resolving hydrostatic pressures, tracking flow fields, and predicting velocity vectors in contained or dynamic fluid bodies.

The sections below outline how we systematically transition from a raw system of algebraic equations to a formal matrix structure, exploring the fundamental computational tools used to resolve them.

---
## 1. Linear System of Equations to Matrix Equation

A system of linear equations consists of multiple algebraic equations sharing common unknowns. For a standard 2D ($2 \times 2$) system, we write:

$$a_{11}x_1 + a_{12}x_2 = b_1$$
$$a_{21}x_1 + a_{22}x_2 = b_2$$

To scale this to arbitrary dimensions efficiently, we map this system into a compact **matrix equation**:

$$\mathbf{A}\mathbf{x} = \mathbf{b}$$

Where:
* **$\mathbf{A}$ (Coefficient Matrix):** A square $2 \times 2$ grid storing the scaling weights of the system:
    $$\mathbf{A} = \begin{bmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{bmatrix}$$
* **$\mathbf{x}$ (Unknown Vector):** The state variables we aim to solve for:
    $$\mathbf{x} = \begin{bmatrix} x_1 \\ x_2 \end{bmatrix}$$
* **$\mathbf{b}$ (Constant Vector):** The boundary conditions or net external outputs:
    $$\mathbf{b} = \begin{bmatrix} b_1 \\ b_2 \end{bmatrix}$$

---
## 2. Spatial Orientation: Row and Column Vectors

In continuum mechanics, physical quantities exist in physical space, requiring strict definitions of vector orientations during matrix multiplications ($\mathbf{A}\mathbf{x}$):

* **Column Vectors ($n \times 1$):** Represent positions, forces, tractions, or directional normals. By default, vectors are assumed to be column vectors:
    $$\mathbf{x} = \begin{bmatrix} x_1 \\ x_2 \end{bmatrix}$$
* **Row Vectors ($1 \times n$):** Represent coordinates projected onto an axis or linear transformations. A row vector is mathematically defined as the transpose ($T$) of a column vector:
    $$\mathbf{x}^T = \begin{bmatrix} x_1 & x_2 \end{bmatrix}$$

### Matrix Multiplication Rule
When computing $\mathbf{A}\mathbf{x} = \mathbf{b}$, each element of row $i$ in matrix $\mathbf{A}$ undergoes a dot product with the column vector $\mathbf{x}$:
$$b_i = \sum_{j=1}^{n} a_{ij}x_j$$

---

## 3. Analytical Methods for Solving $\mathbf{A}\mathbf{x} = \mathbf{b}$

If the coefficient matrix $\mathbf{A}$ is non-singular—meaning its determinant is non-zero ($\det(\mathbf{A}) \neq 0$)—the system has a unique solution. Three classic methods are used to solve it:

### Method A: Matrix Inverse ($\mathbf{A}^{-1}$)
We isolate the unknown vector $\mathbf{x}$ by multiplying both sides from the left by the inverse matrix $\mathbf{A}^{-1}$, where $\mathbf{A}^{-1}\mathbf{A} = \mathbf{I}$ (the identity matrix):

$$\mathbf{x} = \mathbf{A}^{-1}\mathbf{b}$$

For a $2 \times 2$ matrix, the inverse is explicitly defined as:
$$\mathbf{A}^{-1} = \frac{1}{a_{11}a_{22} - a_{12}a_{21}} \begin{bmatrix} a_{22} & -a_{12} \\ -a_{21} & a_{11} \end{bmatrix}$$

### Method B: Gauss-Jordan Elimination
This row-reduction method transforms an **augmented matrix** $[\mathbf{A} \mid \mathbf{b}]$ into its Reduced Row Echelon Form (RREF) using three elementary row operations: scaling a row, swapping rows, or adding/subtracting a scalar multiple of one row to another.

$$\begin{bmatrix} a_{11} & a_{12} & \big| & b_1 \\ a_{21} & a_{22} & \big| & b_2 \end{bmatrix} \xrightarrow{\text{Row Operations}} \begin{bmatrix} 1 & 0 & \big| & x_1 \\ 0 & 1 & \big| & x_2 \end{bmatrix}$$

### Method C: Cramer's Rule
Cramer's Rule solves each unknown variable independently using determinants without computing full matrix row reductions:

$$x_i = \frac{\det(\mathbf{A}_i)}{\det(\mathbf{A})}$$

Where $\mathbf{A}_i$ is the matrix formed by replacing the $i$-th column of $\mathbf{A}$ with the constant column vector $\mathbf{b}$.

---

## 4. Engineering Application: 2D Stress Tensor Analysis

Let us apply this exact mathematical framework to calculate internal stresses. Consider a structural element under a plane stress condition where:
* $\sigma_{xx} = 80 \text{ MPa}$ (Normal tensile stress along the x-axis)
* $\sigma_{yy} = 20 \text{ MPa}$ (Normal tensile stress along the y-axis)
* $\tau_{xy} = \tau_{yx} = 30 \text{ MPa}$ (Internal shear stress)

This state is organized into a symmetric **2D Stress Tensor** ($\boldsymbol{\sigma}$):
$$\boldsymbol{\sigma} = \begin{bmatrix} 80 & 30 \\ 30 & 20 \end{bmatrix}$$

### Problem Statement
Using **Cauchy’s Stress Formula**, the traction vector $\mathbf{T}$ acting on a plane is the product of the stress tensor and the plane's unit normal vector $\mathbf{n}$:
$$\boldsymbol{\sigma}\mathbf{n} = \mathbf{T}$$

If a monitored plane experiences a known internal traction vector $\mathbf{T} = \begin{bmatrix} 70 \\ 40 \end{bmatrix} \text{ MPa}$, what is the orientation of the plane normal $\mathbf{n} = \begin{bmatrix} n_x \\ n_y \end{bmatrix}$?

This yields the linear matrix system:
$$\begin{bmatrix} 80 & 30 \\ 30 & 20 \end{bmatrix} \begin{bmatrix} n_x \\ n_y \end{bmatrix} = \begin{bmatrix} 70 \\ 40 \end{bmatrix}$$

---

### Step-by-Step Solution 1: Gauss-Jordan Elimination

1. **Construct the augmented matrix:**
   $$\begin{bmatrix} 80 & 30 & \big| & 70 \\ 30 & 20 & \big| & 40 \end{bmatrix}$$

2. **Normalize Row 1 ($R_1 \leftarrow R_1 / 80$):**
   $$\begin{bmatrix} 1 & 0.375 & \big| & 0.875 \\ 30 & 20 & \big| & 40 \end{bmatrix}$$

3. **Eliminate the x-coefficient from Row 2 ($R_2 \leftarrow R_2 - 30R_1$):**
   $$20 - 30(0.375) = 20 - 11.25 = 8.75$$
   $$40 - 30(0.875) = 40 - 26.25 = 13.75$$
   $$\begin{bmatrix} 1 & 0.375 & \big| & 0.875 \\ 0 & 8.75 & \big| & 13.75 \end{bmatrix}$$

4. **Isolate the y-coefficient in Row 2 ($R_2 \leftarrow R_2 / 8.75$):**
   $$n_y = \frac{13.75}{8.75} = \frac{55}{35} = \frac{11}{7} \approx 1.5714$$
   $$\begin{bmatrix} 1 & 0.375 & \big| & 0.875 \\ 0 & 1 & \big| & \frac{11}{7} \end{bmatrix}$$

5. **Eliminate the y-coefficient from Row 1 ($R_1 \leftarrow R_1 - 0.375R_2$):**
   $$0.875 - 0.375\left(\frac{11}{7}\right) = \frac{7}{8} - \frac{3}{8}\left(\frac{11}{7}\right) = \frac{49 - 33}{56} = \frac{16}{56} = \frac{2}{7} \approx 0.2857$$
   $$\begin{bmatrix} 1 & 0 & \big| & \frac{2}{7} \\ 0 & 1 & \big| & \frac{11}{7} \end{bmatrix}$$

**Result via Gauss-Jordan:** $$\mathbf{n} = \begin{bmatrix} \frac{2}{7} \\ \frac{11}{7} \end{bmatrix} \approx \begin{bmatrix} 0.2857 \\ 1.5714 \end{bmatrix}$$

---

### Step-by-Step Solution 2: Cramer's Rule

1. **Compute the Principal Determinant ($D = \det(\boldsymbol{\sigma})$):**
   $$D = (80 \times 20) - (30 \times 30) = 1600 - 900 = 700$$

2. **Compute $D_1$ (Replace Column 1 with $\mathbf{T}$):**
   $$\mathbf{A}_1 = \begin{bmatrix} 70 & 30 \\ 40 & 20 \end{bmatrix} \implies D_1 = (70 \times 20) - (30 \times 40) = 1400 - 1200 = 200$$

3. **Compute $D_2$ (Replace Column 2 with $\mathbf{T}$):**
   $$\mathbf{A}_2 = \begin{bmatrix} 80 & 70 \\ 30 & 40 \end{bmatrix} \implies D_2 = (80 \times 40) - (70 \times 30) = 3200 - 2100 = 1100$$

4. **Calculate Final Vector Components:**
   $$n_x = \frac{D_1}{D} = \frac{200}{700} = \frac{2}{7}$$
   $$n_y = \frac{D_2}{D} = \frac{1100}{700} = \frac{11}{7}$$

Both mathematical strategies yield identical coordinates for the structural vector plane!

---
## 6. 3D Fluid Stress Tensor Analysis

In fluid mechanics, the state of mechanical stress at an internal point is fully defined by a 3D $3 \times 3$ Cauchy stress tensor matrix ($\boldsymbol{\sigma}$). Computing the determinant of this matrix provides critical insights into the volumetric and structural energy behavior of the fluid element.

### Student Exercise: Populate the Tensor Matrix
Students must map given physical normal stresses ($\sigma$) and shear stresses ($\tau$) into the standard 3D tensor format:

$$\boldsymbol{\sigma} = \begin{bmatrix} 
\sigma_{xx} & \tau_{xy} & \tau_{xz} \\ 
\tau_{yx} & \sigma_{yy} & \tau_{yz} \\ 
\tau_{zx} & \tau_{zy} & \sigma_{zz} 
\end{bmatrix}$$

Below are three distinct scenarios demonstrating how changing values alter the mathematical determinant and reveal different physical behaviors.

---

### Case A: Negative Determinant ($\det(\boldsymbol{\sigma}) < 0$) — High Viscous Compression

#### Scenario Setup
A fluid element inside a high-pressure vortex pump experiences these forces:
* **Normal stresses:** $\sigma_{xx} = -50 \text{ kPa}$, $\sigma_{yy} = -50 \text{ kPa}$, $\sigma_{zz} = -30 \text{ kPa}$
* **Shear stresses:** $\tau_{xy} = \tau_{yx} = 10 \text{ kPa}$, all other shear terms are $0$.

$$\boldsymbol{\sigma}_A = \begin{bmatrix} 
-50 & 10 & 0 \\ 
10 & -50 & 0 \\ 
0 & 0 & -30 
\end{bmatrix}$$

#### Determinant Calculation
Expanding along the third row:
$$\det(\boldsymbol{\sigma}_A) = -30 \cdot \det\begin{bmatrix} -50 & 10 \\ 10 & -50 \end{bmatrix}$$
$$\det(\boldsymbol{\sigma}_A) = -30 \cdot \left[ (-50 \times -50) - (10 \times 10) \right]$$
$$\det(\boldsymbol{\sigma}_A) = -30 \cdot [2500 - 100] = -30 \cdot [2400] = -72,000$$

#### Physical Interpretation
* **The Meaning:** A large negative determinant indicates that **compressive forces heavily dominate** the spatial volume.
* **Flow State:** Because the shear terms ($10 \text{ kPa}$) are present alongside compression, the fluid layers are actively sliding past each other (viscous shear flow) while being tightly crushed.

---

### Case B: Zero Determinant ($\det(\boldsymbol{\sigma}) = 0$) — Unconfined State / Pure Shear Flow

#### Scenario Setup
A fluid element traveling near a smooth boundary layer experiences no compression along its primary flow axis, but feels high dragging shear:
* **Normal stresses:** $\sigma_{xx} = 0 \text{ kPa}$, $\sigma_{yy} = -40 \text{ kPa}$, $\sigma_{zz} = 0 \text{ kPa}$
* **Shear stresses:** $\tau_{xy} = \tau_{yx} = 40 \text{ kPa}$, all other shear terms are $0$.

$$\boldsymbol{\sigma}_B = \begin{bmatrix} 
0 & 40 & 0 \\ 
40 & -40 & 0 \\ 
0 & 0 & 0 
\end{bmatrix}$$

#### Determinant Calculation
Expanding along the third row (where all terms are zero):
$$\det(\boldsymbol{\sigma}_B) = 0$$

#### Physical Interpretation
* **The Meaning:** A determinant of exactly zero means the matrix is **singular and non-invertible**.
* **Flow State:** Physically, this indicates an unconfined stress state in at least one spatial direction (here, the z-axis has completely relaxed). The normal compression on the y-face is perfectly countered by the sliding shear energy, meaning the fluid element can deform infinitely along a specific plane without any resisting internal pressure.

---

### Case C: Positive Determinant ($\det(\boldsymbol{\sigma}) > 0$) — Internal Cavitation / Tensile Stress

#### Scenario Setup
A fluid element passes through a rapid pipe expansion zone or near a spinning propeller, inducing localized negative pressure (tension):
* **Normal stresses:** $\sigma_{xx} = 20 \text{ kPa}$, $\sigma_{yy} = 20 \text{ kPa}$, $\sigma_{zz} = -10 \text{ kPa}$
* **Shear stresses:** $\tau_{xy} = \tau_{yx} = 5 \text{ kPa}$, all other shear terms are $0$.

$$\boldsymbol{\sigma}_C = \begin{bmatrix} 
20 & 5 & 0 \\ 
5 & 20 & 0 \\ 
0 & 0 & -10 
\end{bmatrix}$$

#### Determinant Calculation
Expanding along the third row:
$$\det(\boldsymbol{\sigma}_C) = -10 \cdot \det\begin{bmatrix} 20 & 5 \\ 5 & 20 \end{bmatrix}$$
$$\det(\boldsymbol{\sigma}_C) = -10 \cdot \left[ (20 \times 20) - (5 \times 5) \right]$$
$$\det(\boldsymbol{\sigma}_C) = -10 \cdot [400 - 25] = -10 \cdot [375] = -3,750$$

*(Note: To make the overall determinant strictly positive in 3D space, let us look at an explosive expanding system where all axes experience tension)*:
* **Revised Normal stresses:** $\sigma_{xx} = 20 \text{ kPa}$, $\sigma_{yy} = 20 \text{ kPa}$, $\sigma_{zz} = +10 \text{ kPa}$

$$\boldsymbol{\sigma}_{C2} = \begin{bmatrix} 
20 & 5 & 0 \\ 
5 & 20 & 0 \\ 
0 & 0 & 10 
\end{bmatrix}$$
$$\det(\boldsymbol{\sigma}_{C2}) = 10 \cdot [400 - 25] = +3,750$$

#### Physical Interpretation
* **The Meaning:** A positive determinant driven by positive normal values indicates **volumetric expansion or pulling tension**.
* **Flow State:** Liquids cannot support sustained tension. When the stress matrix exhibits a positive internal profile like this, it indicates the fluid is tearing apart, leading directly to **cavitation**—the formation of vapor bubbles that can violently collapse and erode nearby engineering equipment.

---

## 7. Eigenvalues and Eigenvectors in Continuum Mechanics

When analyzing a stress matrix, a fundamental design question arises: **Is there an operational orientation where all shear (sliding) stresses disappear, leaving only pure tension or compression?**

Mathematically, this is expressed as an **Eigenvalue Problem**:
$$\boldsymbol{\sigma}\mathbf{v} = \lambda\mathbf{v}$$

Where:
* **Eigenvalues ($\lambda$):** Represent the **Principal Stresses** ($\sigma_1, \sigma_2$). These are the maximum and minimum normal stresses the material experiences at that exact coordinate point.
* **Eigenvectors ($\mathbf{v}$):** Represent the **Principal Directions** (unit vectors $\mathbf{n}$). These point along the precise spatial axes where shear stresses drop to zero.

To find non-trivial solutions, we solve the characteristic equation:
$$\det(\boldsymbol{\sigma} - \lambda\mathbf{I}) = 0$$

---

### Application 1: 2D Fluid Element (Viscous Flow)
Let's find the principal stresses and directions for a moving fluid element carrying this specific internal profile:
$$\boldsymbol{\sigma}_{\text{fluid}} = \begin{bmatrix} -40 & 10 \\ 10 & -40 \end{bmatrix}$$

#### Step 1: Set up the Characteristic Equation
$$\det\begin{bmatrix} -40 - \lambda & 10 \\ 10 & -40 - \lambda \end{bmatrix} = 0$$
$$(-40 - \lambda)^2 - (10 \times 10) = 0$$
$$\lambda^2 + 80\lambda + 1500 = 0$$

#### Step 2: Solve for Eigenvalues ($\lambda$)
Factoring the quadratic equation:
$$(\lambda + 30)(\lambda + 50) = 0 \implies \lambda_1 = -30 \text{ kPa}, \quad \lambda_2 = -50 \text{ kPa}$$

#### Step 3: Solve for Eigenvectors ($\mathbf{v}$)
For $\lambda_1 = -30$:
$$\begin{bmatrix} -10 & 10 \\ 10 & -10 \end{bmatrix}\begin{bmatrix} v_x \\ v_y \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix} \implies -10v_x + 10v_y = 0 \implies v_x = v_y$$
Normalized to a unit length of $1$:
$$\mathbf{v}_1 = \begin{bmatrix} \frac{1}{\sqrt{2}} \\ \frac{1}{\sqrt{2}} \end{bmatrix} \quad (\text{Direction of minimum compression, rotated at } 45^\circ)$$

#### Physical Interpretation
* **The Stress Shift:** The original matrix showed equal compression ($-40 \text{ kPa}$) on both the $x$ and $y$ faces, alongside a sliding shear stress of $10 \text{ kPa}$. Finding the eigenvalues reveals that if we rotate our perspective by $45^\circ$, the shear stress vanishes entirely.
* **Maximum vs. Minimum Pressure:** In this rotated orientation, the fluid element experiences unequal squeezing forces—maximum compression on one axis ($-50 \text{ kPa}$) and minimum compression on the other ($-30 \text{ kPa}$).
* **Engineering Impact:** This directional difference in pressure is what physically drives fluid deformation and flow. In aerodynamics or hydraulics, identifying these principal orientations helps engineers predict where fluid structures (like boundary layers or wake zones) will experience the highest localized crushing forces.

---
### Application 2: 2D Solid Element (Structural Beam Under Pure Shear)
Consider an element on the neutral axis of a structural steel I-beam experiencing pure shear deformation from a heavy vertical load:
$$\boldsymbol{\sigma}_{\text{solid}} = \begin{bmatrix} 0 & 60 \\ 60 & 0 \end{bmatrix}$$

#### Step 1: Set up the Characteristic Equation
$$\det\begin{bmatrix} 0 - \lambda & 60 \\ 60 & 0 - \lambda \end{bmatrix} = 0$$
$$\lambda^2 - 3600 = 0 \implies \lambda^2 = 3600$$

#### Step 2: Solve for Eigenvalues ($\lambda$)
$$\lambda_1 = 60 \text{ MPa} \text{ (Max Tension)}, \quad \lambda_2 = -60 \text{ MPa} \text{ (Max Compression)}$$

#### Step 3: Solve for Eigenvectors ($\mathbf{v}$)
For $\lambda_1 = 60$ (Principal Tensile Stress Axis):
$$\begin{bmatrix} -60 & 60 \\ 60 & -60 \end{bmatrix}\begin{bmatrix} v_x \\ v_y \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix} \implies v_x = v_y \implies \mathbf{v}_1 = \begin{bmatrix} \frac{1}{\sqrt{2}} \\ \frac{1}{\sqrt{2}} \end{bmatrix} \quad (\text{Tensile plane at } 45^\circ)$$

For $\lambda_2 = -60$ (Principal Compressive Stress Axis):
$$\begin{bmatrix} 60 & 60 \\ 60 & 60 \end{bmatrix}\begin{bmatrix} v_x \\ v_y \end{bmatrix} = \begin{bmatrix} 0 \\ 0 \end{bmatrix} \implies v_x = -v_y \implies \mathbf{v}_2 = \begin{bmatrix} -\frac{1}{\sqrt{2}} \\ \frac{1}{\sqrt{2}} \end{bmatrix} \quad (\text{Compressive plane at } 135^\circ)$$

### Physical Conclusion
This result beautifully captures the mechanics of **pure shear**: applying a sliding shear force ($\tau = 60\text{ MPa}$) to a solid element internally creates equal tensile and compressive normal stresses acting along planes rotated exactly at $45^\circ$ and $135^\circ$. This explains why brittle materials like concrete or chalk snap cleanly at a sharp $45^\circ$ angle when twisted!


## 8. Applied Engineering Dynamics & Robotics Problems ($2 \times 2$ Systems)

This section bridges pure matrix algebra with real-world mechanical design and physical systems. For each engineering application, you will follow a strict, systematic workflow:
1. **Derive the Governing Physical Equations**
2. **Construct the Matrix State Form** ($\mathbf{A}\mathbf{x} = \mathbf{b}$ or $\dot{\mathbf{x}} = \mathbf{A}\mathbf{x}$)
3. **Compute the Determinant & Extract its Physical Meaning**
4. **Apply Cramer's Rule** to isolate specific operational parameters
5. **Calculate the System Eigenvalues & Eigenvectors**
6. **Formulate a Physical Interpretation Conclusion**

---

### Problem A: Kinematics of a Differential Drive Robot Car
*This problem references the physical arrangement shown in **below picture**.*

![Robot wheel](https://cdn.discordapp.com/attachments/1521724868738023507/1521739407269429389/image.png?ex=6a45edc3&is=6a449c43&hm=ecddd266c7eb8c47065e67049c7c36a5662909c7ba712ae5fc6094b2145c822e&)
#### Step 1: Derive the Governing Equations
From the geometric layout of the two independent wheels in **image_b776e5.png**, the forward linear velocity of the robot base center ($v_B$) is the direct average of the right wheel velocity ($v_R$) and left wheel velocity ($v_L$). The turning angular velocity ($\omega$) is determined by the velocity difference split across the total wheel track width ($s$). 

For this design model, we define the physical track width as $s = 0.5 \text{ m}$:
$$v_B = 0.5v_R + 0.5v_L$$
$$\omega = \frac{1}{0.5}v_R - \frac{1}{0.5}v_L \implies \omega = 2v_R - 2v_L$$

#### Step 2: Construct the Matrix Form
We group the target control actions on the left-hand side and the individual wheel input speeds on the right-hand side:
$$\begin{bmatrix} v_B \\ \omega \end{bmatrix} = \begin{bmatrix} 0.5 & 0.5 \\ 2 & -2 \end{bmatrix} \begin{bmatrix} v_R \\ v_L \end{bmatrix}$$

#### Step 3: Compute the Determinant & Extract its Physical Meaning
$$\det(\mathbf{A}) = (0.5 \times -2) - (0.5 \times 2) = -1 - 1 = -2$$

* **Physical Meaning:** Because $\det(\mathbf{A}) \neq 0$, the transformation matrix is non-singular and fully invertible. This mathematically proves that for any desired spatial trajectory trajectory combination ($v_B, \omega$), there exists exactly one unique, distinct set of wheel motor commands ($v_R, v_L$). The robotic vehicle is guaranteed to be fully controllable.

#### Step 4: Apply Cramer's Rule to Solve for Control Inputs
The navigation computer demands that the robot execute a precise curve requiring a forward speed of $v_B = 2 \text{ m/s}$ and a turning rate of $\omega = 4 \text{ rad/s}$. Let us isolate the exact individual wheel motor velocities needed:
$$\mathbf{A} = \begin{bmatrix} 0.5 & 0.5 \\ 2 & -2 \end{bmatrix}, \quad \mathbf{b} = \begin{bmatrix} 2 \\ 4 \end{bmatrix}$$

* **Solve for Right Wheel Speed ($v_R$):** Replace the first column of $\mathbf{A}$ with the demand vector $\mathbf{b}$:
$$\det(\mathbf{A}_1) = \det\begin{bmatrix} 2 & 0.5 \\ 4 & -2 \end{bmatrix} = (2 \times -2) - (0.5 \times 4) = -4 - 2 = -6$$
$$v_R = \frac{\det(\mathbf{A}_1)}{\det(\mathbf{A})} = \frac{-6}{-2} = 3 \text{ m/s}$$

* **Solve for Left Wheel Speed ($v_L$):** Replace the second column of $\mathbf{A}$ with the demand vector $\mathbf{b}$:
$$\det(\mathbf{A}_2) = \det\begin{bmatrix} 0.5 & 2 \\ 2 & 4 \end{bmatrix} = (0.5 \times 4) - (2 \times 2) = 2 - 4 = -2$$
$$v_L = \frac{\det(\mathbf{A}_2)}{\det(\mathbf{A})} = \frac{-2}{-2} = 1 \text{ m/s}$$

#### Step 5: Calculate System Eigenvalues & Eigenvectors
To find the intrinsic steering sensitivity modes of the vehicle chassis, we evaluate the characteristic equation $\det(\mathbf{A} - \lambda\mathbf{I}) = 0$:
$$\det\begin{bmatrix} 0.5 - \lambda & 0.5 \\ 2 & -2 - \lambda \end{bmatrix} = 0$$
$$(0.5 - \lambda)(-2 - \lambda) - (0.5 \times 2) = 0$$
$$\lambda^2 + 1.5\lambda - 2 = 0$$

Applying the quadratic formula yields the system eigenvalues:
$$\lambda_1 \approx 0.85, \quad \lambda_2 \approx -2.35$$

Substituting these roots back into the shifted system gives the corresponding directional eigenvectors:
$$\mathbf{v}_1 = \begin{bmatrix} 1 \\ 0.7 \end{bmatrix}, \quad \mathbf{v}_2 = \begin{bmatrix} 1 \\ -5.7 \end{bmatrix}$$

#### Step 6: Physical Interpretation Conclusion
The eigenvalues act as dynamic scaling factors for uncoupled motion states. The positive eigenvalue ($\lambda_1 = 0.85$) represents the stable forward translational mode where both lwheels spin in the same direction. The dominant negative eigenvalue ($\lambda_2 = -2.35$) captures the aggressive rotational counter-action when lwheels run opposite to each other. Because $|\lambda_2| > |\lambda_1|$, the vehicle chassis has a much higher sensitivity to differential steering changes than it does to pure translational changes.

---

### Problem B: Velocity Jacobian of a Two-Link Robotic Manipulator
*This problem references the kinematic arm layout shown in **picture below**.*

![Manipulator](https://cdn.discordapp.com/attachments/1521724868738023507/1521740132342956092/image.png?ex=6a45ee70&is=6a449cf0&hm=2e40c4821d0e2658a7c7b97eb89717b09222c2e8ec3fcf4c438bbcd97770c0b3&)
#### Step 1: Derive the Governing Equations
As illustrated in **image_b78208.png**, a two-joint industrial robotic manipulator maps angular joint motor speeds ($\dot{\theta}_1, \dot{\theta}_2$) to linear tool-tip velocities in Cartesian space ($\dot{x}, \dot{y}$). This mapping matrix is known as the **Kinematic Jacobian ($\mathbf{J}$)**. 

At a chosen non-zero configuration layout where the arms are active, the physical joint transmission simplifies to the following system of non-zero parameters:
$$\dot{x} = 2\dot{\theta}_1 - 2\dot{\theta}_2$$
$$\dot{y} = 3\dot{\theta}_1 + 1\dot{\theta}_2$$

#### Step 2: Construct the Matrix Form
$$\begin{bmatrix} \dot{x} \\ \dot{y} \end{bmatrix} = \begin{bmatrix} 2 & -2 \\ 3 & 1 \end{bmatrix} \begin{bmatrix} \dot{\theta}_1 \\ \dot{\theta}_2 \end{bmatrix}$$

#### Step 3: Compute the Determinant & Extract its Physical Meaning
$$\det(\mathbf{J}) = (2 \times 1) - (-2 \times 3) = 2 + 6 = 8$$

* **Physical Meaning:** A positive, non-zero determinant indicates that the robotic arm is safely positioned inside a highly dexterous workspace zone. If $\det(\mathbf{J})$ were to hit $0$, it would indicate a **kinematic singularity** (e.g., the links are locked perfectly straight or fully folded). In a singularity state, the matrix loses rank, and the robot tip freezes, making it impossible to move in specific physical directions.

#### Step 4: Apply Cramer's Rule to Solve for Control Inputs
To trace an explicit smooth contour, the automation controller requires the end-effector tip to move precisely at $\dot{x} = -4 \text{ m/s}$ and $\dot{y} = 6 \text{ m/s}$. Let us compute the required motor joint speeds:
$$\mathbf{J} = \begin{bmatrix} 2 & -2 \\ 3 & 1 \end{bmatrix}, \quad \mathbf{b} = \begin{bmatrix} -4 \\ 6 \end{bmatrix}$$

* **Solve for Base Motor Speed ($\dot{\theta}_1$):**
$$\det(\mathbf{J}_1) = \det\begin{bmatrix} -4 & -2 \\ 6 & 1 \end{bmatrix} = (-4 \times 1) - (-2 \times 6) = -4 + 12 = 8$$
$$\dot{\theta}_1 = \frac{\det(\mathbf{J}_1)}{\det(\mathbf{J})} = \frac{8}{8} = 1 \text{ rad/s}$$

* **Solve for Elbow Motor Speed ($\dot{\theta}_2$):**
$$\det(\mathbf{J}_2) = \det\begin{bmatrix} 2 & -4 \\ 3 & 6 \end{bmatrix} = (2 \times 6) - (-4 \times 3) = 12 + 12 = 24$$
$$\dot{\theta}_2 = \frac{\det(\mathbf{J}_2)}{\det(\mathbf{J})} = \frac{24}{8} = 3 \text{ rad/s}$$

#### Step 5: Calculate System Eigenvalues & Eigenvectors
To evaluate the spatial velocity coupling profiles of this arm posture, we track the characteristic roots of the Jacobian matrix:
$$\det(\mathbf{J} - \lambda\mathbf{I}) = 0 \implies \det\begin{bmatrix} 2 - \lambda & -2 \\ 3 & 1 - \lambda \end{bmatrix} = 0$$
$$(2 - \lambda)(1 - \lambda) - (-2 \times 3) = 0$$
$$\lambda^2 - 3\lambda + 8 = 0$$

Using the quadratic formula, the resulting eigenvalues are complex conjugates:
$$\lambda = 1.5 \pm 2.39i$$

#### Step 6: Physical Interpretation Conclusion
When the eigenvalues of a kinematic Jacobian are complex numbers, it indicates a highly **coupled, sweeping motion profile**. The real part ($1.5$) represents a scaling velocity expansion outwards from the center. The imaginary part ($2.39$) reveals that raw joint motor speeds naturally manifest at the tool tip as curved, sweeping paths rather than isolated decoupled straight lines along the coordinate axes.

---

### Problem C: State-Space Suspension Dynamics of a Mass-Spring-Damper System
*This problem references the suspension setup shown in **below picture**.*

![Mass-Spring-Damper Model]() (https://cdn.discordapp.com/attachments/1521724868738023507/1521740550217138266/image.png?ex=6a45eed3&is=6a449d53&hm=7edd71fcb0eb23c9e9a98eadfb6ab782e4e67e6485ea5ace4b72fb346fd66cd0&)


#### Step 1: Derive the Governing Equations
Looking at the mechanical system in **image_b781e3.png**, a localized machine mass $m_1$ is constrained by an energy-storing mechanical spring with stiffness $k$ and a dissipative damper fluid element with coefficient $c$. Applying Newton's Second Law ($\Sigma F = m_1 a$):
$$m_1 \ddot{x} + c \dot{x} + k x = F(t)$$

We evaluate a prototype setup where $m_1 = 1 \text{ kg}$, $c = 3 \text{ N}\cdot\text{s/m}$, and $k = 2 \text{ N/m}$:
$$\ddot{x} + 3\dot{x} + 2x = F(t) \implies \ddot{x} = -2x - 3\dot{x} + F(t)$$

To build our matrix system, we convert this single second-order equation into two coupled first-order differential equations by defining state variables for position ($x_1 = x$) and velocity ($x_2 = \dot{x}$):
$$\dot{x}_1 = x_2$$
$$\dot{x}_2 = -2x_1 - 3x_2 + F(t)$$

#### Step 2: Construct the Matrix Form
Expressing the coupled system in standard State-Space matrix layout ($\dot{\mathbf{x}} = \mathbf{A}\mathbf{x} + \mathbf{B}\mathbf{u}$):
$$\begin{bmatrix} \dot{x}_1 \\ \dot{x}_2 \end{bmatrix} = \begin{bmatrix} 0 & 1 \\ -2 & -3 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} + \begin{bmatrix} 0 \\ 1 \end{bmatrix} F(t)$$

#### Step 3: Compute the Determinant & Extract its Physical Meaning
Let $\mathbf{A}$ represent the system matrix $\begin{bmatrix} 0 & 1 \\ -2 & -3 \end{bmatrix}$:
$$\det(\mathbf{A}) = (0 \times -3) - (1 \times -2) = +2$$

* **Physical Meaning:** In mechanical system state-space models, the system determinant is directly proportional to the stiffness-to-mass ratio ($k/m_1$). Because $\det(\mathbf{A})$ is strictly positive, the spring element is guaranteed to act as a stable restoring force that pulls the mass back toward a central equilibrium rather than expanding away into structural failure.

#### Step 4: Apply Cramer's Rule to Solve for Stationary Equilibrium Position
A constant step force of $F(t) = 10 \text{ N}$ is continuously applied to the suspended mass. As time approaches infinity, the system settles completely into a stationary equilibrium, meaning all state derivatives drop to zero ($\dot{x}_1 = 0, \dot{x}_2 = 0$). The matrix equation simplifies to:
$$\begin{bmatrix} 0 & 1 \\ -2 & -3 \end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} = \begin{bmatrix} 0 \\ -10 \end{bmatrix}$$

Let us find the final stationary settlement position ($x_1$) using Cramer's rule:
$$\det(\mathbf{A}_1) = \det\begin{bmatrix} 0 & 1 \\ -10 & -3 \end{bmatrix} = (0 \times -3) - (1 \times -10) = 10$$
$$x_1 = \frac{\det(\mathbf{A}_1)}{\det(\mathbf{A})} = \frac{10}{2} = 5 \text{ meters}$$

#### Step 5: Calculate System Eigenvalues & Eigenvectors
To discover the transient behavior profile of the suspension, we solve for the system poles via $\det(\mathbf{A} - \lambda\mathbf{I}) = 0$:
$$\det\begin{bmatrix} 0 - \lambda & 1 \\ -2 & -3 - \lambda \end{bmatrix} = 0$$
$$\lambda(\lambda + 3) - (1 \times -2) = 0$$
$$\lambda^2 + 3\lambda + 2 = 0$$

Factoring the characteristic equation:
$$(\lambda + 1)(\lambda + 2) = 0 \implies \lambda_1 = -1, \quad \lambda_2 = -2$$

Solving for the fundamental structural eigenvectors:
$$\mathbf{v}_1 = \begin{bmatrix} 1 \\ -1 \end{bmatrix}, \quad \mathbf{v}_2 = \begin{bmatrix} 1 \\ -2 \end{bmatrix}$$

#### Step 6: Physical Interpretation Conclusion
In mechanical design and vibration analysis, the state eigenvalues map directly to the system poles. Because both eigenvalues are purely **real and negative numbers**, the suspension system is definitively confirmed to be **overdamped**. If an external force disturbs the system, the fluid damper absorbs the kinetic energy efficiently enough to prevent all oscillation or bounce. The mass will slide smoothly and exponentially back to its rest position with zero lingering vibrations.







