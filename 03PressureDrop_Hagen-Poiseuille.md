# Deriving the Hagen-Poiseuille Equation

### Objective
Set up and solve the differential equation for steady, laminar flow through a pipe of radius $R$ and length $L$ to find the total pressure drop ($\Delta P$).

---

### Step 1: The Governing Force Balance
Consider a smaller, cylindrical fluid element of radius $r$ ($r \leq R$) and length $L$ inside the pipe. 

> **Hint for Students:** The flow is at **steady state**. This means the fluid element is not accelerating, and the net force acting on it must equal zero ($\sum F = 0$). 

**Your Task:** Identify the forward-pushing force (driven by pressure drop $\Delta P$) and the resisting friction force (driven by shear stress $\tau$). Sum these forces to prove that:

$$\tau = \frac{\Delta P}{2L} r$$

---

### Step 2: The Differential Equation
Next, introduce Newton's Law of Viscosity, which links shear stress to the velocity gradient ($\frac{dv}{dr}$) using fluid viscosity ($\mu$):

$$\tau = -\mu \frac{dv}{dr}$$

Combining this with your force balance equation yields the primary differential equation for the system:

$$-\mu \frac{dv}{dr} = \frac{\Delta P}{2L} r$$

---

### Step 3: Integration & Final Proof
Using the differential equation from Step 2, complete the mathematical derivation on your own:

1. **Find the Velocity Profile:** Integrate the equation with respect to $r$. Use the **no-slip boundary condition** ($v = 0$ at the solid pipe wall, $r = R$) to solve for your integration constant and isolate $v(r)$.
2. **Calculate the Total Flow Rate ($Q$):** Integrate your velocity profile across the entire pipe cross-section using $Q = \int_{0}^{R} v(r) \cdot 2\pi r \, dr$.
3. **Isolate Pressure Drop:** Rearrange your final result to prove the classic **Hagen-Poiseuille Equation**:

$$\Delta P = \frac{8\mu L Q}{\pi R^4}$$
