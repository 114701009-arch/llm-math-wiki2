# 04. 空間向量與維度提升 (Space Vectors in $\mathbb{R}^3$)

> **所屬模組**：高二數學必修（空間幾何與向量）  
> **知識定位**：將維度從二維拓展至三維，引入「外積（Cross Product）」與「三階行列式」，開啟多維幾何與體積測度理論。

---

## 1. 高中核心概念回顧

### 1.1 三維直角坐標系與空間向量
- 任意空間點 $P(x, y, z)$ 與空間向量 $\vec{v} = (x, y, z) = x\hat{i} + y\hat{j} + z\hat{k}$。
- 空間向量的模長：$|\vec{v}| = \sqrt{x^2 + y^2 + z^2}$。
- 空間內積（同樣滿足雙線性）：
  $$ \vec{a} \cdot \vec{b} = a_1 b_1 + a_2 b_2 + a_3 b_3 = |\vec{a}| |\vec{b}| \cos\theta $$
- 空間直線的參數式：通過點 $P_0(x_0, y_0, z_0)$ 且方向向量為 $\vec{d} = (u, v, w)$：
  $$ \begin{cases} x = x_0 + ut \\ y = y_0 + vt \\ z = z_0 + wt \end{cases} \quad (t \in \mathbb{R}) $$
- 空間平面的點法式：法向量 $\vec{n} = (A, B, C)$，通過點 $P_0$：
  $$ A(x - x_0) + B(y - y_0) + C(z - z_0) = 0 \implies Ax + By + Cz + D = 0 $$

### 1.2 空間向量的外積（Cross Product / 向量積）
外積是僅在三維空間（與七維空間）特有的雙線性反對稱運算：
- **幾何意義**：
  1. 方向：$\vec{a} \times \vec{b}$ 同時垂直於 $\vec{a}$ 與 $\vec{b}$，方向遵循右手定則。
  2. 大小：$|\vec{a} \times \vec{b}| = |\vec{a}| |\vec{b}| \sin\theta$（恰等於兩向量所張出的平行四邊形面積）。
- **代數公式（二階行列式組合）**：
  $$ \vec{a} \times \vec{b} = \begin{vmatrix} \hat{i} & \hat{j} & \hat{k} \\ a_1 & a_2 & a_3 \\ b_1 & b_2 & b_3 \end{vmatrix} = \left( \begin{vmatrix} a_2 & a_3 \\ b_2 & b_3 \end{vmatrix}, -\begin{vmatrix} a_1 & a_3 \\ b_1 & b_3 \end{vmatrix}, \begin{vmatrix} a_1 & a_2 \\ b_1 & b_2 \end{vmatrix} \right) $$
- **性質**：反交換律 $\vec{a} \times \vec{b} = -(\vec{b} \times \vec{a})$。

### 1.3 純量三重積（Scalar Triple Product）與平行六面體體積
由三向量 $\vec{a}, \vec{b}, \vec{c}$ 張成的平行六面體有向體積，等於外積與內積的複合運算：
$$ V = (\vec{a} \times \vec{b}) \cdot \vec{c} = \det \begin{bmatrix} a_1 & a_2 & a_3 \\ b_1 & b_2 & b_3 \\ c_1 & c_2 & c_3 \end{bmatrix} $$
- 若 $\det = 0$，表示三向量共面（Coplanar），三向量線性相關，張出的體積為零！

---

## 2. 深入理解：行列式本質是高維體積縮放因子

三階行列式的展開與外積，表面上是複雜的交叉乘加符號遊戲，實際上體現了線性代數核心幾何公理：
1. **多重線性（Multilinear）**：對每一行（或每一列）均滿足線性相加性。
2. **交替性（Alternating）**：任意兩行互換，正負號反轉（幾何上為右手系與左手系的翻轉定向）。
3. **正規化（Normalized）**：單位矩陣 $\det(I_3) = 1$（單位立方體體積為 1）。

---

## 3. 與線性代數的串接橋樑

1. **從外積到反對稱雙線性張量（Lie Bracket）**：
   外積 $\vec{a} \times \vec{b}$ 在高維空間中泛化為「外代數（Exterior Algebra / Wedge Product $\vec{a} \wedge \vec{b}$）」，是現代微分形式與理論物理的核心。
2. **三元一次聯立方程組的克拉瑪公式（Cramer's Rule）**：
   方程組 $A\vec{x} = \vec{b}$ 的解，可完全詮釋為平行六面體體積的比值：
   $$ x_1 = \frac{\det(A_1)}{\det(A)}, \quad x_2 = \frac{\det(A_2)}{\det(A)}, \quad x_3 = \frac{\det(A_3)}{\det(A)} $$
3. **行列式為零的奇異性（Singularity）**：
   三向量共面 $\iff$ 行列式為 $0 \iff$ 矩陣列向量線性相關 $\iff$ 矩陣不可逆 $\iff$ 空間映射將 3D 壓扁成 2D 平面或 1D 線條。
