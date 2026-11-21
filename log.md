# Wiki 維護與更新日誌 (wiki/log.md)

依據蔡炎龍教授「把工作拆成 AI 能做的流程」規範建立。

---

## [2026-11-21 17:35] - 初始化與多源 Ingestion (commit: init-ingest)
- **Ingest 來源**：
  - `raw/01_polynomials_raw.md` (高一多項式)
  - `raw/02_trigonometry_raw.md` (高一高二三角函數)
  - `raw/03_plane_vectors_raw.md` (高二平面向量)
  - `raw/04_space_vectors_raw.md` (高二空間向量)
  - `raw/05_matrices_raw.md` (高二矩陣與方程組)
- **產出筆記**：
  - `00_INDEX.md` (目錄與圖譜)
  - `01_polynomials.md`
  - `02_trigonometry.md`
  - `03_plane_vectors.md`
  - `04_space_vectors.md`
  - `05_matrices.md`
  - `06_linear_algebra_synthesis.md`
- **Lint 狀態**：Gate A 通過（覆蓋率 100%，跨章節鏈結閉環）。

---

## [2026-11-21 17:40] - 證據卡與逐頁稿提煉 (commit: cards-and-drafts)
- **產出卡片**：`cards/card_01_poly.md` ~ `cards/card_06_synthesis.md`（平行抽取完成）。
- **產出逐頁稿**：`drafts/slide_01.md` ~ `drafts/slide_13.md`（通過 Gate B 降維度審查）。

---

## [2026-11-21 17:43] - HTML 簡報渲染與前端測試 (commit: presentation-verified)
- **產出簡報**：`presentation/index.html`（13 頁完整互動 HTML）。
- **腳本檢驗**：執行 `scripts/verify_workflow.py`，全數綠燈驗收通過。
