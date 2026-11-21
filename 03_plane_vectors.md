# 03. 平面向量與基底幾何 (Plane Vectors in $\mathbb{R}^2$)

> **所屬模組**：高二數學必修（幾何與向量）  
> **知識定位**：高中學生首度跨出純量（純數字）思維，進入「方向 + 大小」與「線性組合」的幾何向量世界。

---

## 1. 高中核心概念回顧

### 1.1 向量的幾何與代數定義
- **幾何觀點**：向量是有向線段，具有大小（模長）與方向，平移後視為同一向量（自由向量）。
- **代數觀點**：在給定直角坐標系下，從原點指向點 $(x, y)$ 的向量可唯一表示為有序實數對 $\vec{v} = (x, y)$ 或行向量 $\begin{bmatrix} x \\ y \end{bmatrix}$。
- **純量乘法與向量加法**：
  - $\vec{u} + \vec{v} = (u_1 + v_1, u_2 + v_2)$（幾何上的平行四邊形法則 / 三角形法則）
  - $c\vec{u} = (c u_1, c u_2)$（長度的伸縮與方向的反轉）

### 1.2 線性組合與基底（Basis）
- **線性組合（Linear Combination）**：給定非平行二非零向量 $\vec{a}, \vec{b}$，平面上任意向量 $\vec{p}$ 均可**唯一**寫成：
  $$ \vec{p} = x \vec{a} + y \vec{b} \quad (x, y \in \mathbb{R}) $$
- **分點公式（斜坐標系）**：若點 $P$ 落在線段 $AB$ 上且分比為 $AP:PB = m:n$，則對任意參考點 $O$：
  $$ \vec{OP} = \frac{n}{m+n}\vec{OA} + \frac{m}{m+n}\vec{OB} $$
  當係數和為 $1$ 且均非負時，點 $P$ 剛好描繪出凸多邊形或線段。

### 1.3 向量內積（Dot Product）與正射影
- **幾何定義**：$\vec{a} \cdot \vec{b} = |\vec{a}| |\vec{b}| \cos\theta$
- **坐標形式**：$\vec{a} \cdot \vec{b} = a_1 b_1 + a_2 b_2$
- **垂直判定**：$\vec{a} \perp \vec{b} \iff \vec{a} \cdot \vec{b} = 0$
- **正射影向量（Orthogonal Projection）**：
  $\vec{a}$ 在 $\vec{b}$ 上的正射影向量為：
  $$ \operatorname{proj}_{\vec{b}} \vec{a} = \left(\frac{\vec{a} \cdot \vec{b}}{|\vec{b}|^2}\right) \vec{b} $$
- **柯西不等式（Cauchy-Schwarz Inequality）**：
  由 $|\cos\theta| \le 1$ 直接推出：
  $$ (a_1^2 + a_2^2)(b_1^2 + b_2^2) \ge (a_1 b_1 + a_2 b_2)^2 $$
  等號成立當且僅當 $\vec{a} \parallel \vec{b}$（兩向量共線線性相關）。

---

## 2. 深入理解：從幾何箭頭到線性空間公理

在平面幾何中，我們熟悉的平面 $\mathbb{R}^2$ 是最直觀的二維向量空間：
1. **線性無關（Linearly Independent）**：若 $c_1 \vec{a} + c_2 \vec{b} = \vec{0}$ 僅在 $c_1 = c_2 = 0$ 時成立，則兩向量線性獨立（幾何上為不平行）。
2. **基底（Basis）**：任何一組兩兩不平行的二向量 $\{\vec{a}, \vec{b}\}$ 都能「生成（Span）」整個平面 $\mathbb{R}^2$。
3. **內積的雙線性性質（Bilinearity）**：
   內積是滿足正定性、對稱性與雙線性的內積空間公理實例：
   $$ \langle \vec{u} + \vec{v}, \vec{w} \rangle = \langle \vec{u}, \vec{w} \rangle + \langle \vec{v}, \vec{w} \rangle $$
   $$ \langle c\vec{u}, \vec{v} \rangle = c \langle \vec{u}, \vec{v} \rangle $$

---

## 3. 與線性代數的串接橋樑

1. **坐標換基底（Change of Basis）**：
   將向量從標準基底 $\{\hat{i}, \hat{j}\}$ 轉換為自定義基底 $\{\vec{e}_1, \vec{e}_2\}$，本質上就是求解矩陣方程式：
   $$ \begin{bmatrix} \vec{e}_1 & \vec{e}_2 \end{bmatrix} \begin{bmatrix} c_1 \\ c_2 \end{bmatrix} = \vec{v} $$
2. **內積即矩陣轉置乘法**：
   $\vec{a} \cdot \vec{b} = \vec{a}^T \vec{b} = \begin{bmatrix} a_1 & a_2 \end{bmatrix} \begin{bmatrix} b_1 \\ b_2 \end{bmatrix}$。這說明內積是從 $\mathbb{R}^2 \times \mathbb{R}^2 \to \mathbb{R}$ 的度量張量（Metric Tensor）。
3. **二階行列式的幾何意義**：
   由兩向量 $\vec{a} = (a_1, a_2), \vec{b} = (b_1, b_2)$ 所圍成的平行四邊形有向面積為：
   $$ \text{Area} = \det \begin{bmatrix} a_1 & b_1 \\ a_2 & b_2 \end{bmatrix} = a_1 b_2 - a_2 b_1 $$
   當面積為 $0$ 時，兩向量共線（行列式為零 $\iff$ 矩陣不可逆 $\iff$ 降維）。
