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

* **Sample Mean:** $\bar{\sigma} = \frac{\sum \sigma_j}{n}$
* **Sample Standard Deviation:** $SD = \sqrt{\frac{\sum (\sigma_j - \bar{\sigma})^2}{n - 1}}$

### Calculated Metrics:
* **Level 1 ($\epsilon = 0.5 \times 10^{-3}$):** * $\bar{\sigma}_1 = \frac{102+105+108}{3} = \mathbf{105.0\text{ MPa}}$
  
  * $SD_1 = \sqrt{\frac{(102-105)^2 + (105-105)^2 + (108-105)^2}{2}} = \mathbf{3.00\text{ MPa}}$
    
* **Level 2 ($\epsilon = 1.0 \times 10^{-3}$):** * $\bar{\sigma}_2 = \frac{208+211+214}{3} = \mathbf{211.0\text{ MPa}}$
  
  * $SD_2 = \sqrt{\frac{(208-211)^2 + (211-211)^2 + (214-211)^2}{2}} = \mathbf{3.00\text{ MPa}}$
    
* **Level 3 ($\epsilon = 1.5 \times 10^{-3}$):** * $\bar{\sigma}_3 = \frac{312+306+306}{3} = \mathbf{308.0\text{ MPa}}$
  
  * $SD_3 = \sqrt{\frac{(312-308)^2 + (306-308)^2 + (306-308)^2}{2}} = \mathbf{3.46\text{ MPa}}$
    
* **Level 4 ($\epsilon = 2.0 \times 10^{-3}$):** * $\bar{\sigma}_4 = \frac{412+418+415}{3} = \mathbf{415.0\text{ MPa}}$
  
  * $SD_4 = \sqrt{\frac{(412-415)^2 + (418-415)^2 + (415-415)^2}{2}} = \mathbf{3.00\text{ MPa}}$
    
* **Level 5 ($\epsilon = 2.5 \times 10^{-3}$):** * $\bar{\sigma}_5 = \frac{522+515+517}{3} = \mathbf{518.0\text{ MPa}}$
  
  * $SD_5 = \sqrt{\frac{(522-518)^2 + (515-518)^2 + (517-518)^2}{2}} = \mathbf{3.61\text{ MPa}}$

---

## Step 3: Total Sum of Squares ($SST$)
$SST$ characterizes the total variance inherent within the observed mean stress data points relative to the global baseline mean 

$\bar{\bar{\sigma}}=
\frac{1}{n}\sum_{i=1}^{n}y_i
$ = 311.4 MPa

$SST = \sum (\bar{\sigma}_i - \bar{\bar{\sigma}})^2$

* $(\bar{\sigma}_1 - 311.4)^2 = (105.0 - 311.4)^2 = 42,600.96$
* $(\bar{\sigma}_2 - 311.4)^2 = (211.0 - 311.4)^2 = 10,080.36$
* $(\bar{\sigma}_3 - 311.4)^2 = (308.0 - 311.4)^2 = 11.56$
* $(\bar{\sigma}_4 - 311.4)^2 = (415.0 - 311.4)^2 = 10,732.96$
* $(\bar{\sigma}_5 - 311.4)^2 = (518.0 - 311.4)^2 = 42,683.56$

$\mathbf{SST = 106,109.40}$

---

## Step 4: The Prediction Model ($\hat{\sigma}$)
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

## Step 5:  Model Predictions:
### Step 5.1 Calculate the mean strain

$$\bar{\varepsilon}=\frac{0.5+0.5+0.5+1.0+1.0+1.0+1.5+1.5+1.5+2.0+2.0+2.0+2.5+2.5+2.5}{15}=
1.5
$$

The mean stress is

$$\bar{\sigma}=\frac{102+105+108+208+211+214+312+306+306+412+418+415+522+515+517}{15}=
311.4\ \text{MPa}
$$

---

### Step 5.2 Calculate the Slope ($b_1$)

The slope is

$b_1=
\frac{\displaystyle\sum_{i=1}^{15}
(\varepsilon_i-\bar{\varepsilon})
(\sigma_i-\bar{\sigma})}
{\displaystyle\sum_{i=1}^{15}
(\varepsilon_i-\bar{\varepsilon})^2}
$

Substituting the data,

$b_1=\frac{1036.5}{7.5}=
138.2
$

---

### Step 5.3 Calculate the Intercept ($b_0$)

$b_0=\bar{\sigma}-
b_1\bar{\varepsilon}
$

Substituting the calculated values,

$b_0=311.4-
(138.2)(1.5)$

$
b_0=
104.1
$

---

###  Regression Equation

Therefore, the fitted linear regression model is

$\boxed{\hat{\sigma}=104.1+138.2\varepsilon}$

where

- $\hat{\sigma}$ = predicted stress (MPa),
- $\varepsilon$ = strain.


---

## Step 6: Residual Sum of Squares ($SSE$)
$SSE$ quantifies the residual variance that the linear model fails to capture, computing the structural deviation between the empirical mean values ($\bar{\sigma}_i$) and the matching predictions ($\hat{\sigma}_i$).

$SSE = \sum (\bar{\sigma}_i - \hat{\sigma}_i)^2$

* $(\bar{\sigma}_1 - \hat{\sigma}_1)^2 = (105.0 - 104.6)^2 = 0.16$
* $(\bar{\sigma}_2 - \hat{\sigma}_2)^2 = (211.0 - 208.0)^2 = 9.00$
* $(\bar{\sigma}_3 - \hat{\sigma}_3)^2 = (308.0 - 311.4)^2 = 11.56$
* $(\bar{\sigma}_4 - \hat{\sigma}_4)^2 = (415.0 - 414.8)^2 = 0.04$
* $(\bar{\sigma}_5 - \hat{\sigma}_5)^2 = (518.0 - 518.2)^2 = 0.04$

$\mathbf{SSE = 20.80}$

---

## Step 7: Coefficient of Determination ($R^2$)
To assess model fidelity, the global coefficient of determination is calculated:

$R^2 = 1 - \frac{SSE}{SST}$

$R^2 = 1 - \frac{20.80}{106,109.40}$

$R^2 = 1 - 0.000196 = \mathbf{0.99980}$

### Engineering Interpretation:
The resulting $R^2$ value of **$0.99980$** demonstrates that **$99.98\%$** of the stress variation in the material's linear-elastic domain is rigorously explained by this model. The minor intercept offset of $1.2\text{ MPa}$ points to a minor pre-load setting inside the machine grips or a localized voltage calibration offset in the acquisition hardware.
