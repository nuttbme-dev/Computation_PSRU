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
| :-------------------------------------: | :-----------------------: | :-----------------------: | :-----------------------: |
|                 **0.5**                 |            102            |            105            |            108            |
|                 **1.0**                 |            208            |            211            |            214            |
|                 **1.5**                 |            312            |            306            |            306            |
|                 **2.0**                 |            412            |            418            |            415            |
|                 **2.5**                 |            522            |            515            |            517            |

---

## Step 2: Mean ($\bar{\sigma}$) and Standard Deviation ($SD$)

Summary statistics are calculated for each strain level using the following standard statistical formulations:

**Sample Mean:** $\bar{\sigma} = \frac{\sum \sigma_j}{n}$

**Sample Standard Deviation:** $SD = \sqrt{\frac{\sum (\sigma_j - \bar{\sigma})^2}{n - 1}}$

### Calculated Metrics:

Level 1 ($\epsilon = 0.5 \times 10^{-3}$): $\bar{\sigma}_1 = \frac{102+105+108}{3} = \mathbf{105.0\text{ MPa}}$

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

$\displaystyle b_1=\frac{\sum_{i=1}^{n}(x_i-\bar{x})(y_i-\bar{y})}{\sum_{i=1}^{n}(x_i-\bar{x})^2}.$

The intercept is

$\displaystyle b_0=\bar{y}-b_1\bar{x}.$

---

## Step 4: Model Predictions:

### Step 4.1 Calculate the mean strain

$\displaystyle \bar{\varepsilon}=\frac{0.5+0.5+0.5+1.0+1.0+1.0+1.5+1.5+1.5+2.0+2.0+2.0+2.5+2.5+2.5}{15}=1.5$

The mean stress is

$\displaystyle \bar{\sigma}=\frac{102+105+108+208+211+214+312+306+306+412+418+415+522+515+517}{15}=311.4\ \text{MPa}$

---

### Step 4.2 Calculate the Slope ($b_1$)

The slope is

$\displaystyle b_1=\frac{\sum_{i=1}^{15}(\varepsilon_i-\bar{\varepsilon})(\sigma_i-\bar{\sigma})}{\sum_{i=1}^{15}(\varepsilon_i-\bar{\varepsilon})^2}$

Substituting the data,

$\displaystyle b_1=\frac{1545.0}{7.5}=206.0$

---

### Step 4.3 Calculate the Intercept ($b_0$)

$\displaystyle b_0=\bar{\sigma}-b_1\bar{\varepsilon}$

Substituting the calculated values,

$\displaystyle b_0=311.4-(206.0)(1.5)$

$\displaystyle b_0=2.4$

---

### Regression Equation

Therefore, the fitted linear regression model is

$\boxed{\hat{\sigma}=2.4+206.0\varepsilon}$

where

* $\hat{\sigma}$ = predicted stress (MPa),
* $\varepsilon$ = strain expressed in units of $\times 10^{-3}$.

Since the actual strain is $\epsilon=\varepsilon \times 10^{-3}$, the equation can also be written as

$\boxed{\hat{\sigma}=2.4+206000\epsilon}$

Therefore,

$\boxed{E=206000\ \text{MPa}=206\ \text{GPa}}$

---

#### Step 5. Calculate SST, SSR, SSE, and $R^2$

##### 5.1 Calculate the Total Sum of Squares (SST)

The Total Sum of Squares is

$\displaystyle SST=\sum_{i=1}^{15}(\sigma_i-\bar{\sigma})^2$

Substituting the replicated data,

$\displaystyle SST=(102-311.4)^2+(105-311.4)^2+(108-311.4)^2$

$\displaystyle \qquad +(208-311.4)^2+(211-311.4)^2+(214-311.4)^2$

$\displaystyle \qquad +(312-311.4)^2+(306-311.4)^2+(306-311.4)^2$

$\displaystyle \qquad +(412-311.4)^2+(418-311.4)^2+(415-311.4)^2$

$\displaystyle \qquad +(522-311.4)^2+(515-311.4)^2+(517-311.4)^2$

$\displaystyle SST=318431.60$

---

##### Step 5.2 Calculate the Regression Sum of Squares (SSR)

The Regression Sum of Squares is

$\displaystyle SSR=\sum_{i=1}^{15}(\hat{\sigma}_i-\bar{\sigma})^2$

The predicted values for the five strain levels are:

$\displaystyle \hat{\sigma}_{0.5}=2.4+206.0(0.5)=105.4$

$\displaystyle \hat{\sigma}_{1.0}=2.4+206.0(1.0)=208.4$

$\displaystyle \hat{\sigma}_{1.5}=2.4+206.0(1.5)=311.4$

$\displaystyle \hat{\sigma}_{2.0}=2.4+206.0(2.0)=414.4$

$\displaystyle \hat{\sigma}_{2.5}=2.4+206.0(2.5)=517.4$

Because each strain level has 3 replicated observations,

$\displaystyle SSR=3[(105.4-311.4)^2+(208.4-311.4)^2+(311.4-311.4)^2$

$\displaystyle \qquad +(414.4-311.4)^2+(517.4-311.4)^2]$

$\displaystyle SSR=3[42436+10609+0+10609+42436]$

$\displaystyle SSR=318270.00$

---

##### Step 5.3 Calculation SSE

The Error Sum of Squares is

$\displaystyle SSE=\sum_{i=1}^{15}(\sigma_i-\hat{\sigma}_i)^2$

Substituting the replicated data,

$\displaystyle SSE=(102-105.4)^2+(105-105.4)^2+(108-105.4)^2$

$\displaystyle \qquad +(208-208.4)^2+(211-208.4)^2+(214-208.4)^2$

$\displaystyle \qquad +(312-311.4)^2+(306-311.4)^2+(306-311.4)^2$

$\displaystyle \qquad +(412-414.4)^2+(418-414.4)^2+(415-414.4)^2$

$\displaystyle \qquad +(522-517.4)^2+(515-517.4)^2+(517-517.4)^2$

$\displaystyle SSE=161.60$

The values are consistent because

$\displaystyle SST=SSR+SSE$

$\displaystyle 318431.60=318270.00+161.60$

---

#### Step 5.4 Calculate the Coefficient of Determination ($R^2$)

The coefficient of determination is calculated as

$\displaystyle R^2=\frac{SSR}{SST}$

Substituting the calculated values,

$\displaystyle R^2=\frac{318270.00}{318431.60}$

$\displaystyle R^2=0.99949$

Alternatively,

$\displaystyle R^2=1-\frac{SSE}{SST}$

Substituting the calculated values,

$\displaystyle R^2=1-\frac{161.60}{318431.60}$

$\displaystyle R^2=1-0.00051$

$\displaystyle R^2=0.99949$

Therefore,

$\boxed{R^2=0.9995}$

---

## Mistake Point in the Original Calculation

The original calculation was inconsistent because Step 5 used only the five mean stress values:

$105,\ 211,\ 308,\ 415,\ 518$

but the formula was written as if all 15 replicated data points were used.

Also, the original slope was calculated as

$\displaystyle b_1=\frac{1036.5}{7.5}=138.2$

but the correct numerator for the 15 replicated data points is

$\displaystyle \sum_{i=1}^{15}(x_i-\bar{x})(y_i-\bar{y})=1545.0$

Therefore, the correct slope is

$\displaystyle b_1=\frac{1545.0}{7.5}=206.0$

---

## Final Interpretation

The corrected regression model is

$\boxed{\hat{\sigma}=2.4+206.0\varepsilon}$

where $\varepsilon$ is expressed in units of $\times 10^{-3}$.

In actual strain units,

$\boxed{\hat{\sigma}=2.4+206000\epsilon}$

Thus, the estimated Young's modulus is

$\boxed{E=206000\ \text{MPa}=206\ \text{GPa}}$

The intercept is

$\boxed{C=2.4\ \text{MPa}}$

and the coefficient of determination is

$\boxed{R^2=0.9995}$

This indicates that the tensile test data follow a highly linear elastic stress-strain relationship within the tested strain range.


### Remark
Physical meaning of SST, SSR, SSE, and R² in this stress regression:

SST is the total variation of the measured stress values from the average stress. In this tensile test, SST represents how much the stress changes over the full strain range before applying any regression model. A large SST is expected because the stress increases strongly as strain increases.

SSR is the variation explained by the regression model. In this case, SSR represents the part of the stress change that can be explained by the linear elastic relationship between stress and strain. Because SSR is very close to SST, the Hooke’s law model explains almost all of the stress variation.

SSE is the unexplained variation, or residual error, between the measured stress values and the predicted stress values. Physically, SSE may come from experimental scatter, instrument noise, specimen variability, small measurement errors, or minor non-ideal behavior during testing. Because SSE is very small compared with SST, the measured stresses are very close to the fitted regression line.

R² describes the fraction of total stress variation explained by the regression model. In this case, R² = 0.9995 means that approximately 99.95% of the stress variation is explained by strain using the linear elastic model. This confirms that the tensile data follow Hooke’s law very well within the tested strain range.

In simple physical terms:

SST = total stress change observed in the experiment.

SSR = stress change explained by elastic deformation.

SSE = remaining error not explained by the model.

R² = how well Hooke’s law explains the measured stress-strain behavior.
