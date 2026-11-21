# 05. 矩陣與線性映射 (Matrices and Linear Transformations)

> **所屬模組**：高二數學選修（矩陣、方程組與線性變換）  
> **知識定位**：高中數學最具威力、最直接與現代計算機科學接軌的工具。矩陣不僅是資料表格，更是「空間變換」的動作執行器。

---

## 1. 高中核心概念回顧

### 1.1 矩陣的定義與代數運算
- 一個 $m \times n$ 矩陣 $A$ 是由 $m$ 列 $n$ 行實數排列而成的矩形陣列。
- **矩陣加法與純量乘法**：對應元素相加與相乘。
- **矩陣乘法**：設 $A$ 為 $m \times k$，$B$ 為 $k \times n$，其乘積 $C = AB$ 為 $m \times n$ 矩陣，其中：
  $$ c_{ij} = \sum_{r=1}^k a_{ir} b_{rj} $$
  **注意**：矩陣乘法一般不滿足交換律（$AB \neq BA$），但滿足結合律與對加法的分配律。

### 1.2 高斯消去法與增廣矩陣（Gaussian Elimination）
解線性聯立方程組：
$$
\begin{cases}
a_{11} x + a_{12} y + a_{13} z = b_1 \\
a_{21} x + a_{22} y + a_{23} z = b_2 \\
a_{31} x + a_{32} y + a_{33} z = b_3
\end{cases}
\iff
\left[\begin{array}{ccc|c}
a_{11} & a_{12} & a_{13} & b_1 \\
a_{21} & a_{22} & a_{23} & b_2 \\
a_{31} & a_{32} & a_{33} & b_3
\end{array}\right]
$$
透過三種**列基本運算**（Row Operations）：
1. 兩列對調；
2. 某一列乘上一非零實數；
3. 某一列乘上純量加到另一列。
將增廣矩陣化為簡約列梯形（RREF），判別唯一解、無窮多解或無解。

### 1.3 二階方陣與二維平面線性幾何變換
任何二階方陣 $M = \begin{bmatrix} a & b \\ c & d \end{bmatrix}$ 將向量 $\begin{bmatrix} x \\ y \end{bmatrix}$ 變換為 $\begin{bmatrix} x' \\ y' \end{bmatrix}$：
- **旋轉矩陣（Rotation）**：逆時針旋轉 $\theta$ 角
  $$ R_\theta = \begin{bmatrix} \cos\theta & -\sin\theta \\ \sin\theta & \cos\theta \end{bmatrix} $$
- **鏡射矩陣（Reflection）**：對通過原點、斜角為 $\theta$ 的直線進行鏡射
  $$ M_\theta = \begin{bmatrix} \cos 2\theta & \sin 2\theta \\ \sin 2\theta & -\cos 2\theta \end{bmatrix} $$
- **伸縮矩陣（Scaling）**：$x$ 軸伸長 $h$ 倍，$y$ 軸伸長 $k$ 倍
  $$ S = \begin{bmatrix} h & 0 \\ 0 & k \end{bmatrix} $$
- **推移矩陣（Shearing）**：沿 $x$ 軸推移 $k$ 倍
  $$ T = \begin{bmatrix} 1 & k \\ 0 & 1 \end{bmatrix} $$

### 1.4 馬可夫鏈與轉移矩陣（Markov Transition Matrix）
- 狀態向量 $X_n = \begin{bmatrix} p_n \\ q_n \end{bmatrix}$，滿足 $p_n + q_n = 1$。
- 轉移矩陣 $P$ 的每一直行（Column）元素之和大於等於 0 且和為 1（隨機矩陣）。
- 長期穩定狀態（Steady State）：$P X = X$（這正是特徵值 $\lambda = 1$ 的特徵向量問題！）。

---

## 2. 深入理解：矩陣的行視角（Column Picture）

高中教學中最容易被忽視、卻是線性代數最重要的觀念：
$$
M \begin{bmatrix} x \\ y \end{bmatrix}
= \begin{bmatrix} a & b \\ c & d \end{bmatrix} \begin{bmatrix} x \\ y \end{bmatrix}
= x \begin{bmatrix} a \\ c \end{bmatrix} + y \begin{bmatrix} b \\ d \end{bmatrix}
$$
**矩陣乘以向量，本質就是對矩陣的行向量（Columns）做線性組合！**
- 第一行 $\begin{bmatrix} a \\ c \end{bmatrix}$ 就是標準基底 $\hat{i} = \begin{bmatrix} 1 \\ 0 \end{bmatrix}$ 變換後落在哪裡。
- 第二行 $\begin{bmatrix} b \\ d \end{bmatrix}$ 就是標準基底 $\hat{j} = \begin{bmatrix} 0 \\ 1 \end{bmatrix}$ 變換後落在哪裡。
因此，想要理解任何矩陣變換，只需要看它把 $\hat{i}$ 和 $\hat{j}$ 送到了何處！

---

## 3. 與線性代數的串接橋樑

1. **矩陣乘法就是線性變換的「複合（Composition）」**：
   $(AB)\vec{v} = A(B\vec{v})$。先做 $B$ 變換，再做 $A$ 變換。這徹底解釋了為什麼矩陣乘法不是簡單的對應元素相乘！
2. **反矩陣（Inverse Matrix）與變換的可逆性**：
   $A^{-1}$ 存在 $\iff \det(A) \neq 0 \iff$ 變換過程沒有將空間「壓扁」（維度不崩塌），可以完美倒放。
3. **面積變換率**：變換後的圖形面積 = $|\det(A)| \times$ 原圖形面積。
