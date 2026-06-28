
Pressure can be calculated using many different methods depending on the fluid, pressure range, and available information. The four methods you listed are among the most common.

| Method                                  | Applicable to                            | Main Equation                                                                                                                                                                          |
| --------------------------------------- | ---------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **1. Ideal Gas Law**                    | Low-pressure gases                       | $$PV = nRT$$ or $$P=\rho RT$$                                                                                                                                                          |
| **2. Isentropic Relation**              | Reversible adiabatic (compressible) flow | $$  <br>PV^{\displaystyle \gamma} = \text{constant}  <br>$$<br>, $$\frac{P_2}{P_1}<br>=<br>\left(\frac{T_2}{T_1}\right)^{<br>\left(<br>\dfrac{\gamma}{\gamma-1}<br>\right)<br>}<br>$$, |
| **3. Compressibility Factor (Z-Chart)** | Real gases                               | $$PV=ZnRT$$ or $$P=\frac{\rho RT}{Z}$$                                                                                                                                                 |
| **4. van der Waals EOS**                | Real gases (basic EOS)                   | $$P=\frac{RT}{V_m-b}-\frac{a}{V_m^2}$$                                                                                                                                                 |
| **5. Soave–Redlich–Kwong (SRK) EOS**    | Real gases, hydrocarbons                 | $$P=\frac{RT}{V_m-b}-\frac{a\alpha}{V_m(V_m+b)}$$                                                                                                                                      |
| **6. Peng–Robinson (PR) EOS**           | Real gases and supercritical fluids      | $$P=\frac{RT}{V_m-b}-\frac{a\alpha}{V_m(V_m+b)+b(V_m-b)}$$                                                                                                                             |
**  Z  can calculate  from Papay coreration 
$$
Z = 1 - \frac{3.53P_r}{10^{0.9813T_r}} + \frac{0.274P_r^2}{10^{0.8157T_r}}
$$,
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
- Compressibility factors (typical values):  



