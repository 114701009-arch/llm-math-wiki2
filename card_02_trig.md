# 證據卡 02: 三角函數與旋轉算子 (card_02_trig.md)

- **唯一資料來源**：`wiki/02_trigonometry.md`
- **核心事實**：
  1. 單位圓定義：$\cos\theta = x, \sin\theta = y$，自然保證 $\cos^2\theta + \sin^2\theta = 1$。
  2. 和差角公式：
     - $\cos(\alpha+\beta) = \cos\alpha\cos\beta - \sin\alpha\sin\beta$
     - $\sin(\alpha+\beta) = \sin\alpha\cos\beta + \cos\alpha\sin\beta$
  3. 線性代數對接點：旋轉角度 $\theta$ 的二階矩陣為 $R_\theta = \begin{bmatrix} \cos\theta & -\sin\theta \\ \sin\theta & \cos\theta \end{bmatrix}$。連續兩次旋轉 $R_\alpha R_\beta$ 的矩陣乘積即為 $R_{\alpha+\beta}$。
  4. 和角公式的本質就是二維旋轉變換的複合乘法。
- **初學者比喻構想**：時鐘的指針連續撥動兩次，減號源自旋轉進入第二象限時 $x$ 軸的負向投影。
