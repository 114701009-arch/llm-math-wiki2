# 01. 多項式代數與函數結構 (Polynomials)

> **所屬模組**：高一數學必修（代數與函數）  
> **知識定位**：從古典代數的運算，走向現代線性代數「函數向量空間（Function Space）」的基石。

---

## 1. 高中核心概念回顧

### 1.1 形式定義與基本運算
在實數域 $\mathbb{R}$ 上，一個 $n$ 次一元實係數多項式可表示為：
$$ P(x) = a_n x^n + a_{n-1} x^{n-1} + \dots + a_1 x + a_0 \quad (a_n \neq 0, a_i \in \mathbb{R}) $$
- **多項式除法原理**：設 $f(x), g(x)$ 為多項式且 $g(x) \neq 0$，則存在唯一的多項式 $q(x)$（商式）與 $r(x)$（餘式），使得：
  $$ f(x) = g(x) \cdot q(x) + r(x) \quad (\text{其中 } r(x) = 0 \text{ 或 } \deg r(x) < \deg g(x)) $$
- **餘式定理與因式定理**：
  - $f(x)$ 除以 $(x - c)$ 的餘式為 $f(c)$。
  - $f(c) = 0 \iff (x - c)$ 為 $f(x)$ 的因式。

### 1.2 插值多項式（Lagrange Interpolation）
給定平面上相異的 $n+1$ 個點 $(x_0, y_0), (x_1, y_1), \dots, (x_n, y_n)$（其中 $x_i$ 互異），恰存在唯一的次數不超過 $n$ 次的多項式 $P(x)$ 通過這 $n+1$ 個點：
$$ P(x) = \sum_{i=0}^n y_i \ell_i(x), \quad \text{其中 } \ell_i(x) = \prod_{j \neq i} \frac{x - x_j}{x_i - x_j} $$
此性質揭示了：**決定一個 $n$ 次多項式需要 $n+1$ 個自由度（條件）**。

---

## 2. 深入理解：多項式背後的線性結構

多項式的加法與純量乘法滿足封閉性：
1. 兩個多項式相加仍為多項式：$(P + Q)(x) = P(x) + Q(x)$
2. 實數倍數乘多項式仍為多項式：$(c \cdot P)(x) = c \cdot P(x)$

若我們考慮所有次數不超過 $n$ 的實係數多項式集合，記作 $P_n(\mathbb{R})$：
- 任意元素可寫為：$P(x) = a_0 \cdot 1 + a_1 \cdot x + a_2 \cdot x^2 + \dots + a_n \cdot x^n$
- 這裡的 $\{1, x, x^2, \dots, x^n\}$ 就如同學幾何時的標準單位向量 $\{\hat{i}, \hat{j}, \dots\}$！
- 多項式 $P(x)$ 實際上完全可以等價視為一個 $(n+1)$ 維坐標向量：
  $$ [P(x)]_{\mathcal{B}} = \begin{bmatrix} a_0 \\ a_1 \\ \vdots \\ a_n \end{bmatrix} \in \mathbb{R}^{n+1} $$

---

## 3. 與線性代數的串接橋樑

1. **拉格朗日插值與 Vandermonde 矩陣**：
   將插值問題寫成線性方程組：
   $$
   \begin{bmatrix}
   1 & x_0 & x_0^2 & \dots & x_0^n \\
   1 & x_1 & x_1^2 & \dots & x_1^n \\
   \vdots & \vdots & \vdots & \ddots & \vdots \\
   1 & x_n & x_n^2 & \dots & x_n^n
   \end{bmatrix}
   \begin{bmatrix} a_0 \\ a_1 \\ \vdots \\ a_n \end{bmatrix}
   =
   \begin{bmatrix} y_0 \\ y_1 \\ \vdots \\ y_n \end{bmatrix}
   $$
   只要 $x_i$ 兩兩相異，該矩陣的行列式（Vandermonde 行列式）不為零，必有唯一解！這證明了多項式空間中「點求值映射（Evaluation Map）」為線性雙射。
2. **微分運算子作為線性變換**：
   對多項式求導 $\frac{d}{dx}$ 滿足 $\frac{d}{dx}(c f + g) = c \frac{df}{dx} + \frac{dg}{dx}$，它本質上是一個將 $P_n \to P_{n-1}$ 的線性算子！
