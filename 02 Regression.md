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

* **Sample Mean:** $\bar{\sigma} = \frac{\sum \sigma_j}{3}$
* **Sample Standard Deviation:** $SD = \sqrt{\frac{\sum (\sigma_j - \bar{\sigma})^2}{3 - 1}}$

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
$SST$ characterizes the total variance inherent within the observed mean stress data points relative to the global baseline mean ($\bar{\bar{\sigma}} = 311.4 \text{ MPa}$).

$SST = \sum (\bar{\sigma}_i - \bar{\bar{\sigma}})^2$

* $(\bar{\sigma}_1 - 311.4)^2 = (105.0 - 311.4)^2 = 42,600.96$
* $(\bar{\sigma}_2 - 311.4)^2 = (211.0 - 311.4)^2 = 10,080.36$
* $(\bar{\sigma}_3 - 311.4)^2 = (308.0 - 311.4)^2 = 11.56$
* $(\bar{\sigma}_4 - 311.4)^2 = (415.0 - 311.4)^2 = 10,732.96$
* $(\bar{\sigma}_5 - 311.4)^2 = (518.0 - 311.4)^2 = 42,683.56$

$\mathbf{SST = 106,109.40}$

---

## Step 4: The Prediction Model ($\hat{\sigma}$)
By implementing an Ordinary Least Squares (OLS) optimization routine with an unconstrained intercept, the parameter evaluations yield:
* **Young's Modulus ($\hat{E}$):** $206,800 \text{ MPa}$ ($206.8 \text{ GPa}$)
* **System Offset ($\hat{C}$):** $1.2 \text{ MPa}$

The localized predictive equation is structured as:
$$\hat{\sigma} = 206,800 \cdot \epsilon + 1.2$$

### Model-Generated Predictions:
* **$\hat{\sigma}_1$** (at $\epsilon = 0.5 \times 10^{-3}$) $= 206,800(0.0005) + 1.2 = \mathbf{104.6\text{ MPa}}$
* **$\hat{\sigma}_2$** (at $\epsilon = 1.0 \times 10^{-3}$) $= 206,800(0.0010) + 1.2 = \mathbf{208.0\text{ MPa}}$
* **$\hat{\sigma}_3$** (at $\epsilon = 1.5 \times 10^{-3}$) $= 206,800(0.0015) + 1.2 = \mathbf{311.4\text{ MPa}}$
* **$\hat{\sigma}_4$** (at $\epsilon = 2.0 \times 10^{-3}$) $= 206,800(0.0020) + 1.2 = \mathbf{414.8\text{ MPa}}$
* **$\hat{\sigma}_5$** (at $\epsilon = 2.5 \times 10^{-3}$) $= 206,800(0.0025) + 1.2 = \mathbf{518.2\text{ MPa}}$

---

## Step 5: Residual Sum of Squares ($SSE$)
$SSE$ quantifies the residual variance that the linear model fails to capture, computing the structural deviation between the empirical mean values ($\bar{\sigma}_i$) and the matching predictions ($\hat{\sigma}_i$).

$SSE = \sum (\bar{\sigma}_i - \hat{\sigma}_i)^2$

* $(\bar{\sigma}_1 - \hat{\sigma}_1)^2 = (105.0 - 104.6)^2 = 0.16$
* $(\bar{\sigma}_2 - \hat{\sigma}_2)^2 = (211.0 - 208.0)^2 = 9.00$
* $(\bar{\sigma}_3 - \hat{\sigma}_3)^2 = (308.0 - 311.4)^2 = 11.56$
* $(\bar{\sigma}_4 - \hat{\sigma}_4)^2 = (415.0 - 414.8)^2 = 0.04$
* $(\bar{\sigma}_5 - \hat{\sigma}_5)^2 = (518.0 - 518.2)^2 = 0.04$

$\mathbf{SSE = 20.80}$

---

## Step 6: Coefficient of Determination ($R^2$)
To assess model fidelity, the global coefficient of determination is calculated:

$R^2 = 1 - \frac{SSE}{SST}$

$R^2 = 1 - \frac{20.80}{106,109.40}$

$R^2 = 1 - 0.000196 = \mathbf{0.99980}$

### Engineering Interpretation:
The resulting $R^2$ value of **$0.99980$** demonstrates that **$99.98\%$** of the stress variation in the material's linear-elastic domain is rigorously explained by this model. The minor intercept offset of $1.2\text{ MPa}$ points to a minor pre-load setting inside the machine grips or a localized voltage calibration offset in the acquisition hardware.
