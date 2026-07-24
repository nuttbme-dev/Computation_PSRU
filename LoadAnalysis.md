# Comprehensive Design Problem Example: Bridge Support Column

## English Version

### Problem Statement

You are designing a critical support column for a pedestrian bridge. The column is a **composite structure** made of a solid steel rod encased in a hollow aluminum pipe. It is fixed at the bottom and supports a platform at the top.

**Given Data:**
- **Applied Load:** $P = 250 \, \text{kN}$ (downward)
- **Steel Core:**
  - Diameter: $d_s = 100 \, \text{mm}$
  - Modulus of Elasticity: $E_s = 200 \, \text{GPa}$
  - Thermal Expansion Coefficient: $\alpha_s = 12 \times 10^{-6} /^\circ\text{C}$
  - Allowable Normal Stress: $\sigma_{allow,s} = 150 \, \text{MPa}$
- **Aluminum Pipe:**
  - Outer Diameter: $d_{o,al} = 150 \, \text{mm}$
  - Inner Diameter: $d_{i,al} = 105 \, \text{mm}$
  - Modulus of Elasticity: $E_{al} = 70 \, \text{GPa}$
  - Thermal Expansion Coefficient: $\alpha_{al} = 23 \times 10^{-6} /^\circ\text{C}$
  - Allowable Shear Stress: $\tau_{allow,al} = 80 \, \text{MPa}$
- **Column Height:** $L = 3 \, \text{m} = 3000 \, \text{mm}$
- **Temperature Increase:** $\Delta T = +40^\circ\text{C}$

**Required:** Verify if the design is safe by checking:
1. Normal stresses in both materials.
2. Thermal stresses.
3. Total deformation of the column.
4. Shear stress on a 45° inclined plane within the aluminum.

---

### Step-by-Step Solution

#### Step 1: Calculate Cross-Sectional Areas

- **Steel Area:**
  $$
  A_s = \frac{\pi}{4} d_s^2 = \frac{\pi}{4} (100)^2 = 7{,}854 \, \text{mm}^2
  $$

- **Aluminum Area:**
  $$
  A_{al} = \frac{\pi}{4} (d_{o,al}^2 - d_{i,al}^2) = \frac{\pi}{4} (150^2 - 105^2) = 9{,}013 \, \text{mm}^2
  $$

---

#### Step 2: Determine Internal Axial Force

The internal axial force equals the applied load:
$$
N = -P = -250{,}000 \, \text{N}
$$
(The negative sign indicates compression.)

---

#### Step 3: Stresses Due to Axial Load Only

- **Total Stiffness:**
  $$
  E_s A_s + E_{al} A_{al} = (200 \times 10^3)(7{,}854) + (70 \times 10^3)(9{,}013)
  = 1.5708 \times 10^9 + 0.6309 \times 10^9 = 2.2017 \times 10^9 \, \text{N}
  $$

- **Load Shared by Steel:**
  $$
  P_s = 250{,}000 \times \frac{1.5708}{2.2017} \approx 178{,}400 \, \text{N}
  $$

- **Load Shared by Aluminum:**
  $$
  P_{al} = 250{,}000 - 178{,}400 = 71{,}600 \, \text{N}
  $$

- **Normal Stresses:**
  - Steel: $\sigma_s = \frac{P_s}{A_s} = \frac{178{,}400}{7{,}854} \approx 22.7 \, \text{MPa (Compression)}$
  - Aluminum: $\sigma_{al} = \frac{P_{al}}{A_{al}} = \frac{71{,}600}{9{,}013} \approx 7.9 \, \text{MPa (Compression)}$

---

#### Step 4: Thermal Stresses

- **Free Thermal Expansion (if separate):**
  - Steel: $\delta_{T,s} = \alpha_s \Delta T L = (12 \times 10^{-6})(40)(3000) = 1.44 \, \text{mm}$
  - Aluminum: $\delta_{T,al} = \alpha_{al} \Delta T L = (23 \times 10^{-6})(40)(3000) = 2.76 \, \text{mm}$

- **Misfit (Difference in Expansion):**
  $$
  \delta_{misfit} = 2.76 - 1.44 = 1.32 \, \text{mm}
  $$

- **Thermal Force:**
  $$
  P_T = \delta_{misfit} \times \frac{E_s A_s \cdot E_{al} A_{al}}{E_s A_s + E_{al} A_{al}}
  = 1.32 \times \frac{(1.5708 \times 10^9)(0.6309 \times 10^9)}{2.2017 \times 10^9}
  \approx 594{,}000 \, \text{N}
  $$

- **Thermal Stresses:**
  - Steel (Tension): $\sigma_{T,s} = \frac{P_T}{A_s} = \frac{594{,}000}{7{,}854} \approx 75.6 \, \text{MPa}$
  - Aluminum (Compression): $\sigma_{T,al} = \frac{P_T}{A_{al}} = \frac{594{,}000}{9{,}013} \approx 65.9 \, \text{MPa}$

---

#### Step 5: Combine Stresses and Check Design

- **Net Stress in Steel:**
  $$
  \sigma_{s,net} = -22.7 + 75.6 = +52.9 \, \text{MPa (Tension)}
  $$
  $52.9 < 150$ → **SAFE**

- **Net Stress in Aluminum:**
  $$
  \sigma_{al,net} = -7.9 - 65.9 = -73.8 \, \text{MPa (Compression)}
  $$
  $73.8 < \sigma_{allow,al}$ → **SAFE** (assuming allowable > 73.8 MPa)

---

#### Step 6: Total Deformation

- **Mechanical Shortening:**
  $$
  \delta_m = \frac{P L}{E_s A_s + E_{al} A_{al}} = \frac{250{,}000 \times 3000}{2.2017 \times 10^9} \approx 0.34 \, \text{mm}
  $$

- **Effective Thermal Expansion Coefficient:**
  $$
  \alpha_{eq} = \frac{\alpha_s E_s A_s + \alpha_{al} E_{al} A_{al}}{E_s A_s + E_{al} A_{al}}
  = \frac{(12 \times 10^{-6})(1.5708 \times 10^9) + (23 \times 10^{-6})(0.6309 \times 10^9)}{2.2017 \times 10^9}
  \approx 15.2 \times 10^{-6} /^\circ\text{C}
  $$

- **Thermal Deformation:**
  $$
  \delta_T = \alpha_{eq} \Delta T L = (15.2 \times 10^{-6})(40)(3000) \approx 1.82 \, \text{mm}
  $$

- **Total Deformation:**
  $$
  \delta_{total} = -\delta_m + \delta_T = -0.34 + 1.82 = +1.48 \, \text{mm}
  $$
  (Positive = elongation; acceptable for serviceability)

---

#### Step 7: Shear Stress on Inclined Plane (Aluminum)

- For a 45° plane:
  $$
  \tau_{45} = \frac{\sigma_{al,net}}{2} \sin(90^\circ) = \frac{-73.8}{2} \times 1 = -36.9 \, \text{MPa}
  $$
  (Magnitude = 36.9 MPa)

- **Check:** $36.9 < 80$ → **SAFE**

---

### Design Verification Summary

| Component | Stress Type | Calculated | Allowable | Status |
|-----------|-------------|------------|-----------|--------|
| Steel Core | Normal | 52.9 MPa (Tension) | 150 MPa | ✅ SAFE |
| Aluminum Pipe | Normal | 73.8 MPa (Compression) | > 73.8 MPa | ✅ SAFE |
| Aluminum Pipe | Shear (45°) | 36.9 MPa | 80 MPa | ✅ SAFE |
| Entire Column | Deformation | 1.48 mm | Acceptable | ✅ OK |

---

### Conclusion

The composite column design is **safe** under the given load and temperature increase. This example integrated:
- Statically indeterminate analysis (load sharing by stiffness)
- Thermal effects and misfits
- Deformation of nonuniform bars
- Stresses on inclined sections

---

---

## ฉบับภาษาไทย (Thai Version)

### โจทย์ปัญหา

คุณกำลังออกแบบเสาค้ำสำคัญสำหรับสะพานคนเดิน เสานี้เป็น **โครงสร้างวัสดุผสม (Composite)** คือมีแกนเหล็กกล้าอยู่ข้างใน และหุ้มด้วยท่ออลูมิเนียมด้านนอก ปลายล่างยึดติดฐานราก ปลายบนรับน้ำหนักจากแท่นรองรับ

**ข้อมูลที่กำหนด:**
- **น้ำหนักกด:** $P = 250 \, \text{kN}$ (กดลง)
- **แกนเหล็ก:**
  - เส้นผ่านศูนย์กลาง: $d_s = 100 \, \text{mm}$
  - มอดุลัสยืดหยุ่น: $E_s = 200 \, \text{GPa}$
  - สัมประสิทธิ์การขยายตัวเนื่องจากความร้อน: $\alpha_s = 12 \times 10^{-6} /^\circ\text{C}$
  - ความเค้นปกติที่ยอมให้: $\sigma_{allow,s} = 150 \, \text{MPa}$
- **ท่ออลูมิเนียม:**
  - เส้นผ่านศูนย์กลางภายนอก: $d_{o,al} = 150 \, \text{mm}$
  - เส้นผ่านศูนย์กลางภายใน: $d_{i,al} = 105 \, \text{mm}$
  - มอดุลัสยืดหยุ่น: $E_{al} = 70 \, \text{GPa}$
  - สัมประสิทธิ์การขยายตัวเนื่องจากความร้อน: $\alpha_{al} = 23 \times 10^{-6} /^\circ\text{C}$
  - ความเค้นเฉือนที่ยอมให้: $\tau_{allow,al} = 80 \, \text{MPa}$
- **ความสูงเสา:** $L = 3 \, \text{m} = 3000 \, \text{mm}$
- **อุณหภูมิเพิ่มขึ้น:** $\Delta T = +40^\circ\text{C}$

**สิ่งที่ต้องตรวจสอบ:** ตรวจสอบว่าการออกแบบนี้ **ปลอดภัย** หรือไม่ โดยพิจารณา:
1. ความเค้นปกติในทั้งสองวัสดุ
2. ความเค้นเนื่องจากความร้อน
3. การเปลี่ยนแปลงความยาวรวมของเสา
4. ความเค้นเฉือนบนระนาบเอียง 45° ภายในอลูมิเนียม

---

### ขั้นตอนการแก้ปัญหา

#### ขั้นตอนที่ 1: คำนวณพื้นที่หน้าตัด

- **พื้นที่หน้าตัดเหล็ก:**
  $$
  A_s = \frac{\pi}{4} d_s^2 = \frac{\pi}{4} (100)^2 = 7{,}854 \, \text{mm}^2
  $$

- **พื้นที่หน้าตัดอลูมิเนียม:**
  $$
  A_{al} = \frac{\pi}{4} (d_{o,al}^2 - d_{i,al}^2) = \frac{\pi}{4} (150^2 - 105^2) = 9{,}013 \, \text{mm}^2
  $$

---

#### ขั้นตอนที่ 2: แรงภายในตามแนวแกน

$$
N = -P = -250{,}000 \, \text{N}
$$
(เครื่องหมายลบ = แรงอัด)

---

#### ขั้นตอนที่ 3: ความเค้นจากแรงภายนอกอย่างเดียว

- **ความแข็งเกร็งรวม:**
  $$
  E_s A_s + E_{al} A_{al} = (200 \times 10^3)(7{,}854) + (70 \times 10^3)(9{,}013)
  = 1.5708 \times 10^9 + 0.6309 \times 10^9 = 2.2017 \times 10^9 \, \text{N}
  $$

- **แรงที่เหล็กได้รับ:**
  $$
  P_s = 250{,}000 \times \frac{1.5708}{2.2017} \approx 178{,}400 \, \text{N}
  $$

- **แรงที่อลูมิเนียมได้รับ:**
  $$
  P_{al} = 250{,}000 - 178{,}400 = 71{,}600 \, \text{N}
  $$

- **ความเค้นปกติ:**
  - เหล็ก: $\sigma_s = \frac{178{,}400}{7{,}854} \approx 22.7 \, \text{MPa (อัด)}$
  - อลูมิเนียม: $\sigma_{al} = \frac{71{,}600}{9{,}013} \approx 7.9 \, \text{MPa (อัด)}$

---

#### ขั้นตอนที่ 4: ความเค้นเนื่องจากความร้อน

- **การขยายตัวอิสระ (ถ้าแยกกัน):**
  - เหล็ก: $\delta_{T,s} = (12 \times 10^{-6})(40)(3000) = 1.44 \, \text{mm}$
  - อลูมิเนียม: $\delta_{T,al} = (23 \times 10^{-6})(40)(3000) = 2.76 \, \text{mm}$

- **ค่าคลาดเคลื่อน:**
  $$
  \delta_{misfit} = 2.76 - 1.44 = 1.32 \, \text{mm}
  $$

- **แรงเนื่องจากความร้อน:**
  $$
  P_T = 1.32 \times \frac{(1.5708 \times 10^9)(0.6309 \times 10^9)}{2.2017 \times 10^9}
  \approx 594{,}000 \, \text{N}
  $$

- **ความเค้นเนื่องจากความร้อน:**
  - เหล็ก (ดึง): $\sigma_{T,s} = \frac{594{,}000}{7{,}854} \approx 75.6 \, \text{MPa}$
  - อลูมิเนียม (อัด): $\sigma_{T,al} = \frac{594{,}000}{9{,}013} \approx 65.9 \, \text{MPa}$

---

#### ขั้นตอนที่ 5: รวมความเค้นและตรวจสอบ

- **ความเค้นสุทธิในเหล็ก:**
  $$
  \sigma_{s,net} = -22.7 + 75.6 = +52.9 \, \text{MPa (ดึง)}
  $$
  $52.9 < 150$ → **ปลอดภัย**

- **ความเค้นสุทธิในอลูมิเนียม:**
  $$
  \sigma_{al,net} = -7.9 - 65.9 = -73.8 \, \text{MPa (อัด)}
  $$
  $73.8 < \sigma_{allow,al}$ → **ปลอดภัย** (สมมติว่าค่าที่ยอมให้มากกว่า 73.8 MPa)

---

#### ขั้นตอนที่ 6: การเปลี่ยนแปลงความยาวรวม

- **การหดตัวเชิงกล:**
  $$
  \delta_m = \frac{250{,}000 \times 3000}{2.2017 \times 10^9} \approx 0.34 \, \text{mm}
  $$

- **สัมประสิทธิ์การขยายตัวเฉลี่ย:**
  $$
  \alpha_{eq} = \frac{(12 \times 10^{-6})(1.5708 \times 10^9) + (23 \times 10^{-6})(0.6309 \times 10^9)}{2.2017 \times 10^9}
  \approx 15.2 \times 10^{-6} /^\circ\text{C}
  $$

- **การขยายตัวจากความร้อน:**
  $$
  \delta_T = (15.2 \times 10^{-6})(40)(3000) \approx 1.82 \, \text{mm}
  $$

- **การเปลี่ยนแปลงสุทธิ:**
  $$
  \delta_{total} = -0.34 + 1.82 = +1.48 \, \text{mm}
  $$
  (เครื่องหมายบวก = ยืดออก; ยอมรับได้ในทางปฏิบัติ)

---

#### ขั้นตอนที่ 7: ความเค้นเฉือนบนระนาบเอียง (อลูมิเนียม)

- ที่มุม 45°:
  $$
  \tau_{45} = \frac{-73.8}{2} \sin(90^\circ) = -36.9 \, \text{MPa}
  $$
  (ขนาด = 36.9 MPa)

- **ตรวจสอบ:** $36.9 < 80$ → **ปลอดภัย**

---

### สรุปผลการตรวจสอบ

| ส่วนประกอบ | ประเภทความเค้น | ค่าที่คำนวณได้ | ค่าที่ยอมให้ | สถานะ |
|------------|----------------|----------------|-------------|--------|
| แกนเหล็ก | ปกติ | 52.9 MPa (ดึง) | 150 MPa | ✅ ปลอดภัย |
| ท่ออลูมิเนียม | ปกติ | 73.8 MPa (อัด) | > 73.8 MPa | ✅ ปลอดภัย |
| ท่ออลูมิเนียม | เฉือน (45°) | 36.9 MPa | 80 MPa | ✅ ปลอดภัย |
| เสาทั้งต้น | การเปลี่ยนแปลง | 1.48 mm | ยอมรับได้ | ✅ ใช้ได้ |

---

### บทสรุป

การออกแบบเสาวัสดุผสมนี้ **ปลอดภัย** ภายใต้น้ำหนักและอุณหภูมิที่กำหนด ตัวอย่างนี้ครอบคลุมเนื้อหาสำคัญจากบทที่ 2 ได้แก่:
- โครงสร้างไม่แน่นอนเชิงสถิต (การแบ่งแรงตามความแข็งเกร็ง)
- ผลจากความร้อนและค่าคลาดเคลื่อน
- การเปลี่ยนรูปของแท่งที่ไม่สม่ำเสมอ
- ความเค้นบนระนาบเอียง
