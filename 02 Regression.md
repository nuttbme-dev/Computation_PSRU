# Solid Mechanics Regression Analysis: Hooke's Law

This document outlines a complete regression analysis for a uniaxial tensile test under a linear-elastic framework. The model accounts for an initial instrumentation offset or residual stress using the equation:

$\sigma = E \cdot \epsilon + C$

Where:
* $\sigma$ = Axial Stress (MPa)
* $\epsilon$ = Axial Strain ($\text{mm/mm}$)
* $E$ = Young's Modulus (Slope)
* $C$ = Stress Offset / Intercept (MPa)

---

## Step 1: Raw Replicated Data
The experiment evaluates 5 distinct strain levels ($\epsilon$), with 3 replicated stress measurements ($R_1, R_2, R_3$) at each level to capture experimental variability.

| Strain ($\epsilon_i$, $\times 10^{-3}$) | Trial 1 ($\sigma_1$, MPa) | Trial 2 ($\sigma_2$, MPa) | Trial 3 ($\sigma_3$, MPa) |
| :---: | :---: | :---: | :---: |
| **0.5** | 102 | 105 | 108 |
| **1.0** | 208 | 211 | 214 |
| **1.5** | 312 | 306 | 306 |
| **2.0** | 412 | 418 | 415 |
| **2.5** | 522 | 515 | 517 |

---

## Step 2: Mean ($\bar{\sigma}$) and Standard Deviation ($SD$)
Summary statistics are calculated for each strain level using the following standard statistical formulations:

**Sample Mean:** $\bar{\sigma} = \frac{\sum \sigma_j}{n}$
**Sample Standard Deviation:** $SD = \sqrt{\frac{\sum (\sigma_j - \bar{\sigma})^2}{n - 1}}$

### Calculated Metrics:
Level 1 ($\epsilon = 0.5 \times 10^{-3}$):  $\bar{\sigma}_1 = \frac{102+105+108}{3} = \mathbf{105.0\text{ MPa}}$
  
$SD_1 = \sqrt{\frac{(102-105)^2 + (105-105)^2 + (108-105)^2}{2}} = \mathbf{3.00\text{ MPa}}$
    
Level 2 ($\epsilon = 1.0 \times 10^{-3}$): $\bar{\sigma}_2 = \frac{208+211+214}{3} = \mathbf{211.0\text{ MPa}}$
  
   $SD_2 = \sqrt{\frac{(208-211)^2 + (211-211)^2 + (214-211)^2}{2}} = \mathbf{3.00\text{ MPa}}$
    
Level 3 ($\epsilon = 1.5 \times 10^{-3}$): $\bar{\sigma}_3 = \frac{312+306+306}{3} = \mathbf{308.0\text{ MPa}}$
  
$SD_3 = \sqrt{\frac{(312-308)^2 + (306-308)^2 + (306-308)^2}{2}} = \mathbf{3.46\text{ MPa}}$
    
 Level 4 ($\epsilon = 2.0 \times 10^{-3}$): $\bar{\sigma}_4 = \frac{412+418+415}{3} = \mathbf{415.0\text{ MPa}}$
  
$SD_4 = \sqrt{\frac{(412-415)^2 + (418-415)^2 + (415-415)^2}{2}} = \mathbf{3.00\text{ MPa}}$
    
 Level 5 ($\epsilon = 2.5 \times 10^{-3}$): $\bar{\sigma}_5 = \frac{522+515+517}{3} = \mathbf{518.0\text{ MPa}}$
  
   $SD_5 = \sqrt{\frac{(522-518)^2 + (515-518)^2 + (517-518)^2}{2}} = \mathbf{3.61\text{ MPa}}$

---

## Step 3: The Prediction Model ($\hat{\sigma}$)
$\hat{\sigma} = b_0 + b_1 \varepsilon,$

or equivalently,

$\hat{y} = b_0 + b_1 x.$

where
$\hat{\sigma}$ = predicted stress (MPa),

$\varepsilon$ = strain,

$b_0$ = regression intercept,

$b_1$ = regression slope.

The slope is

$b_1=\frac{\displaystyle\sum_{i=1}^{n}(x_i-\bar{x})(y_i-\bar{y})}
{\displaystyle\sum_{i=1}^{n}(x_i-\bar{x})^2}.$

The intercept is

$b_0=\bar{y}-b_1\bar{x}.$

## Step 4:  Model Predictions:
### Step 4.1 Calculate the mean strain

$$\bar{\varepsilon}=\frac{0.5+0.5+0.5+1.0+1.0+1.0+1.5+1.5+1.5+2.0+2.0+2.0+2.5+2.5+2.5}{15}=
1.5
$$

The mean stress is

$$\bar{\sigma}=\frac{102+105+108+208+211+214+312+306+306+412+418+415+522+515+517}{15}=
311.4\ \text{MPa}
$$

---

### Step 4.2 Calculate the Slope ($b_1$)

The slope is

$b_1=
\frac{\displaystyle\sum_{i=1}^{15}
(\varepsilon_i-\bar{\varepsilon})
(\sigma_i-\bar{\sigma})}
{\displaystyle\sum_{i=1}^{15}
(\varepsilon_i-\bar{\varepsilon})^2}
$

Substituting the data,

$b_1=\frac{1036.5}{7.5}=138.2$

---

### Step 4.3 Calculate the Intercept ($b_0$)

$b_0=\bar{\sigma}-
b_1\bar{\varepsilon}
$

Substituting the calculated values,

$b_0=311.4-(138.2)(1.5)$

$b_0=104.1$

---

###  Regression Equation

Therefore, the fitted linear regression model is

$\boxed{\hat{\sigma}=104.1+138.2\varepsilon}$

where

- $\hat{\sigma}$ = predicted stress (MPa),
- $\varepsilon$ = strain.

#### Step 5. Calculate SST, SSR, SSE, and $R^2$

 ##### 5.1 Calculate the Total Sum of Squares (SST)

The Total Sum of Squares is

$SST=\sum_{i=1}^{15}
(\sigma_i-\bar{\sigma})^2$
Substituting the data,

$SST=(105-311.4)^2+(211-311.4)^2+(308-311.4)^2$

$\qquad +(415-311.4)^2+(518-311.4)^2$

$=42600.96+10080.16+11.56+10732.96+42683.56$

$SST=106109.20$

##### Step 5.2 Calculate the Regression Sum of Squares (SSR)

The Regression Sum of Squares is

Substituting the predicted values,

$SSR=(173.2-311.4)^2+(242.3-311.4)^2+(311.4-311.4)^2$

$\qquad +(380.5-311.4)^2+(449.6-311.4)^2$

$=(-138.2)^2+(-69.1)^2+0^2+(69.1)^2+(138.2)^2$

$=19099.24+4774.81+0+4774.81+19099.24$

$SSR=47748.10$


##### Step 5.3 Calculation SSE
$SSE=(105-173.2)^2+(211-242.3)^2+(308-311.4)^2$

$\qquad +(415-380.5)^2+(518-449.6)^2$

$=(-68.2)^2+(-31.3)^2+(-3.4)^2$

$\qquad +(34.5)^2+(68.4)^2$

#### step 5.4 Calculate the Coefficient of Determination ($R^2$)

The coefficient of determination is calculated as

$R^2=\frac{SSR}{SST}$

Substituting the calculated values,

$R^2=\frac{47748.10}{106109.20}$

$R^2=0.4499$

Alternatively,

$R^2=1-\frac{SSE}{SST}$

Substituting the calculated values,

$R^2=
1-\frac{11511.30}{106109.20}$

$R^2=1-0.1085$

$R^2=
0.8915$

