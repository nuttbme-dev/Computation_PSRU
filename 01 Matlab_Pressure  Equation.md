
Pressure can be calculated using many different methods depending on the fluid, pressure range, and available information. The four methods you listed are among the most common.

| Method                                  | Applicable to                            | Main Equation                                                                                                     |
| --------------------------------------- | ---------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| **1. Ideal Gas Law**                    | Low-pressure gases                       | $$PV = nRT$$ or $$P=\rho RT$$                                                                                     |
| **2. Isentropic Relation**              | Reversible adiabatic (compressible) flow | $$PV^\gamma = \text{constant}$$ , $$\frac{P_2}{P_1} = \left(\frac{T_2}{T_2}\right)^{\frac{\gamma}{\gamma-1}}$$ |
| **3. Compressibility Factor (Z-Chart)** | Real gases                               | $$PV=ZnRT$$                                                                             |
| **4. van der Waals EOS**                | Real gases (basic EOS)                   | $$P=\frac{RT}{V_m-b}-\frac{a}{V_m^2}$$                                                                            |
| **5. Soave–Redlich–Kwong (SRK) EOS**    | Real gases, hydrocarbons                 | $$P=\frac{RT}{V_m-b}-\frac{a\alpha}{V_m(V_m+b)}$$                                                                 |
| **6. Peng–Robinson (PR) EOS**           | Real gases and supercritical fluids      | $$P=\frac{RT}{V_m-b}-\frac{a\alpha}{V_m(V_m+b)+b(V_m-b)}$$                                                        |


**  Z  can calculate  from Papay coreration 
$$Z = 1 - \frac{3.53P_r}{10^{0.9813T_r}} + \frac{0.274P_r^2}{10^{0.8157T_r}}$$ οr $$Z = 1 - 3.53 P_r e^{-2.2595 T_r} + 0.274 P_r^2 e^{-1.8782 T_r}$$
### Notation

$P$ = Pressure (Pa)  
$V$ = Volume (m³)  
$V_m$ = Molar volume (m³/mol)  
$n$ = Number of moles (mol)  
$\rho$ = Density (kg/m³)  
$R$ = Universal gas constant (8.314 J/mol·K)  
$T$ = Absolute temperature (K)  
$a$ = Attraction parameter in the EOS  
 $b$ = Co-volume (excluded volume) parameter in the EOS  
$\alpha$ = Temperature correction factor (used in SRK and PR EOS)  
 $\gamma=\dfrac{C_p}{C_v}$ = Ratio of specific heats  
$C_p$ = Specific heat at constant pressure  
$C_v$ = Specific heat at constant volume  
$Z$ = Compressibility factor  
$P_1,\;P_2$ = Initial and final pressures  
$T_1,\;T_2$ = Initial and final temperatures

### Numerical Example 
Fluid: Air  
  
Given:  
- Temperature, $T = 300\ \text{K}$  
- Volume, $V = 1.0\ \text{m}^3$  
- Gas constant, $R = 287\ \text{J/(kg·K)}$  
- Heat capacity ratio, $\gamma = 1.4$  
- Reference pressure, $P_1 = 100\ \text{kPa}$

### Thermodynamic Properties of Common Gases

This table provides the **acentric factor ($\omega$)**, **critical temperature ($T_c$)**, and **critical pressure ($P_c$)** for commonly used gases. These parameters are essential for cubic equations of state (such as Peng-Robinson or Soave-Redlich-Kwong) to calculate the temperature-dependent alpha factor:
### Gas Properties Table

| Gas Chemical Formula | Substance Name | Acentric Factor ($\omega$) | Critical Temperature ($T_c$, K) | Critical Pressure ($P_c$, bar) |
| :--- | :--- | :---: | :---: | :---: |
| **H₂** | Hydrogen * | `-0.216` | 33.19 | 13.13 |
| **He** | Helium * | `-0.365` | 5.19 | 2.27 |
| **Ar** | Argon | `0.000` | 150.86 | 48.98 |
| **N₂** | Nitrogen | `0.037` | 126.20 | 34.00 |
| **Air** | Air *(Pseudo-pure)* | `0.040` | 132.63 | 37.86 |
| **O₂** | Oxygen | `0.046` | 154.58 | 50.43 |
| **CO** | Carbon Monoxide | `0.048` | 132.85 | 34.94 |
| **CH₄** | Methane | `0.011` | 190.56 | 45.99 |
| **C₂H₆** | Ethane | `0.099` | 305.32 | 48.72 |
| **C₃H₈** | Propane | `0.152` | 369.83 | 42.48 |
| **CO₂** | Carbon Dioxide | `0.224` | 304.13 | 73.75 |
| **H₂O** | Water Vapor | `0.344` | 647.10 | 220.64 |

> **\* Note on Hydrogen and Helium:** The negative acentric factors for Hydrogen and Helium are physically accurate. Because these quantum gases are exceptionally light and small, low-temperature quantum effects cause their properties to deviate in the opposite direction compared to heavier, more complex molecules.


### Example code for Calculation pressure using Ideal gas method

```matlab
clc
clear all
close all

rho=1.26; %kg/m^3
R=287;%J/kg.K
V=1;%m^3
%T=300;%K
%T=[100 300 500];
T=0:50:600;
P=rho*R*T
%m=rho*V
plot(T,P)
title('Pressure calculation (Ideal gas)')
ylabel('Pressure (Pa)')
xlabel('Temperature (K)')
```


### Example of Papay Equation
```matlab
% Papay correlation for Z-factor
Pr = 2.5; 
Tr = 1.3;

% Calculating using the exponential form

% Fraction style
Z1 = 1 - (3.53 * Pr) / (10^(0.9813 * Tr)) + (0.274 * Pr^2) / (10^(0.8157 * Tr))
% Exponential style
Z2 = 1 - 3.53*Pr*exp(-2.2595*Tr) + 0.274*(Pr^2)*exp(-1.8782*Tr)

```
### How to find constants in EOS
$\alpha = \left[ 1 + \kappa \cdot (1 - \sqrt{T_r}) \right]^2$

$\kappa = 0.37464 + 1.54226\omega - 0.26992\omega^2$


  #### van der Waals

  $a = \frac{27 R^2 T_c^2}{64 P_c}$ , $b = \frac{R T_c}{8 P_c}$
  #### SRK
  $a = 0.4278\frac{R^2 T_c^2}{P_c}$ , $b =0.08664R \frac{T_c}{P_c}$

  #### PR
   $a = 0.45724\frac{R^2 T_c^2}{P_c}$ , $b =0.07780R \frac{T_c}{P_c}$
