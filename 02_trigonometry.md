# 02. 三角函數與幾何代數統一 (Trigonometric Functions)

> **所屬模組**：高一/高二數學必修（幾何與週期分析）  
> **知識定位**：從直角三角形比值，到單位圓旋轉，再到旋轉矩陣與傅立葉正交函數空間的起點。

---

## 1. 高中核心概念回顧

### 1.1 從銳角三角比到廣義角與單位圓
- 傳統直角三角形定義：$\sin\theta = \frac{\text{對邊}}{\text{斜邊}}, \cos\theta = \frac{\text{鄰邊}}{\text{斜邊}}$（限制於 $0^\circ < \theta < 90^\circ$）。
- 現代定義（單位圓坐標化）：
  在笛卡兒平面上，令單位圓方程式為 $x^2 + y^2 = 1$。
  角 $\theta$ 的始邊固定於正 $x$ 軸，逆時針旋轉至終邊與單位圓交於點 $P(x, y)$，則嚴格定義：
  $$ \cos\theta = x, \quad \sin\theta = y $$
  這自然保證了商高恆等式：$\cos^2\theta + \sin^2\theta = 1$。

### 1.2 和差角公式（加法定理）
三角函數最核心的代數定理為和角與差角公式：
$$ \cos(\alpha + \beta) = \cos\alpha\cos\beta - \sin\alpha\sin\beta $$
$$ \sin(\alpha + \beta) = \sin\alpha\cos\beta + \cos\alpha\sin\beta $$
由和角公式可推演出二倍角公式、半角公式及合角公式（振幅疊合）：
$$ A\sin x + B\cos x = \sqrt{A^2 + B^2}\sin(x + \phi), \quad \text{其中 } \tan\phi = \frac{B}{A} $$

---

## 2. 深入理解：三角函數即「二維旋轉運算」

高中數學中看似繁瑣的和角公式，若換成向量旋轉的角度看，其本質極其純粹：
設平面向量 $\vec{v} = (\cos\beta, \sin\beta)$，將其逆時針旋轉角度 $\alpha$：
- 旋轉後的向量方向角即為 $\alpha + \beta$。
- 旋轉後的坐標為 $(\cos(\alpha + \beta), \sin(\alpha + \beta))$。

如果以基底向量的旋轉來觀察：
- $\hat{i} = (1, 0)$ 旋轉 $\alpha$ 度後變成 $(\cos\alpha, \sin\alpha)$。
- $\hat{j} = (0, 1)$ 旋轉 $\alpha$ 度後變成 $(-\sin\alpha, \cos\alpha)$。
- 任意向量 $(x, y) = x\hat{i} + y\hat{j}$ 旋轉後的坐標就是：
  $$ x \begin{bmatrix} \cos\alpha \\ \sin\alpha \end{bmatrix} + y \begin{bmatrix} -\sin\alpha \\ \cos\alpha \end{bmatrix} = \begin{bmatrix} x\cos\alpha - y\sin\alpha \\ x\sin\alpha + y\cos\alpha \end{bmatrix} $$
和差角公式根本不是憑空捏造的記憶口訣，而是**剛體旋轉變換的線性組合展開**！

---

## 3. 與線性代數的串接橋樑

1. **旋轉矩陣（Rotation Matrix）的誕生**：
   在線性代數中，逆時針旋轉 $\theta$ 角的線性算子對應矩陣 $R_\theta$：
   $$ R_\theta = \begin{bmatrix} \cos\theta & -\sin\theta \\ \sin\theta & \cos\theta \end{bmatrix} $$
   連續進行兩次旋轉 $R_\alpha \cdot R_\beta$：
   $$
   \begin{bmatrix} \cos\alpha & -\sin\alpha \\ \sin\alpha & \cos\alpha \end{bmatrix}
   \begin{bmatrix} \cos\beta & -\sin\beta \\ \sin\beta & \cos\beta \end{bmatrix}
   =
   \begin{bmatrix} \cos\alpha\cos\beta - \sin\alpha\sin\beta & -(\sin\alpha\cos\beta + \cos\alpha\sin\beta) \\ \sin\alpha\cos\beta + \cos\alpha\sin\beta & \cos\alpha\cos\beta - \sin\alpha\sin\beta \end{bmatrix}
   = R_{\alpha+\beta}
   $$
   **和角公式直接等於矩陣乘法！**
2. **正交變換與保長保角性**：
   $R_\theta^T R_\theta = I$，且 $\det(R_\theta) = \cos^2\theta + \sin^2\theta = 1$。旋轉矩陣是特殊正交群 $SO(2)$ 的元素。
3. **正交函數基底（Fourier Analysis 的種子）**：
   定義函數內積 $\langle f, g \rangle = \int_{-\pi}^\pi f(x)g(x)dx$。
   三角函數集合 $\{1, \cos x, \sin x, \cos 2x, \sin 2x, \dots\}$ 彼此兩兩正交，是無窮維希爾伯特空間（Hilbert Space）的正交基底！
