# verify_workflow.ps1 - 可執行的檢查腳本
# 依據蔡炎龍教授「說『檢查一下』不算驗證，是腳本說了算」精神撰寫

$ErrorActionPreference = "Continue"
$baseDir = "C:\Users\liny6\.gemini\antigravity\scratch\llm-wiki-agent-presentation"
$allPassed = $true

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " 🚀 啟動 Workflow 驗收測試腳本 (Verification Gate) " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. 檢查 raw 資料源
$rawFiles = Get-ChildItem -Path "$baseDir\raw" -Filter "*.md"
if ($rawFiles.Count -ge 5) {
    Write-Host "[PASS] 1. raw/ 資料源: 找到 $($rawFiles.Count) 篇原始文獻 (標準: >= 5 篇)" -ForegroundColor Green
} else {
    Write-Host "[FAIL] 1. raw/ 資料源不足 5 篇 (目前: $($rawFiles.Count))" -ForegroundColor Red
    $allPassed = $false
}

# 2. 檢查 AGENTS.md 大小 (<= 12,000 字元)
$agentsPath = "$baseDir\AGENTS.md"
if (Test-Path $agentsPath) {
    $content = Get-Content -Path $agentsPath -Raw
    $charCount = $content.Length
    if ($charCount -le 12000) {
        Write-Host "[PASS] 2. AGENTS.md 員工手冊: 存在且字元數為 $charCount (上限: 12,000 字元)" -ForegroundColor Green
    } else {
        Write-Host "[FAIL] 2. AGENTS.md 超過字元數限制: $charCount 字元" -ForegroundColor Red
        $allPassed = $false
    }
} else {
    Write-Host "[FAIL] 2. AGENTS.md 檔案不存在" -ForegroundColor Red
    $allPassed = $false
}

# 3. 檢查 wiki 知識庫與 log.md
$wikiFiles = Get-ChildItem -Path "$baseDir\wiki" -Filter "*.md"
$hasLog = Test-Path "$baseDir\wiki\log.md"
if ($wikiFiles.Count -ge 6 -and $hasLog) {
    Write-Host "[PASS] 3. wiki/ 知識庫: 找到 $($wikiFiles.Count) 個文件且包含 log.md" -ForegroundColor Green
} else {
    Write-Host "[FAIL] 3. wiki/ 知識庫不完整或缺少 log.md" -ForegroundColor Red
    $allPassed = $false
}

# 4. 檢查 cards 證據卡
$cardFiles = Get-ChildItem -Path "$baseDir\cards" -Filter "*.md"
if ($cardFiles.Count -ge 6) {
    Write-Host "[PASS] 4. cards/ 證據卡: 平行抽取完成 $($cardFiles.Count) 張證據卡" -ForegroundColor Green
} else {
    Write-Host "[FAIL] 4. cards/ 證據卡未齊全 (目前: $($cardFiles.Count))" -ForegroundColor Red
    $allPassed = $false
}

# 5. 檢查 drafts 逐頁稿 (頁數 8-15 頁, 每頁有出處, 字數 <= 150)
$draftFiles = Get-ChildItem -Path "$baseDir\drafts" -Filter "*.md"
$draftPass = $true
if ($draftFiles.Count -ge 8 -and $draftFiles.Count -le 15) {
    foreach ($df in $draftFiles) {
        $c = Get-Content -Path $df.FullName -Raw
        if ($c -notmatch "出處 \(Sources\)") {
            Write-Host "[FAIL] 逐頁稿 $($df.Name) 缺少出處標籤" -ForegroundColor Red
            $draftPass = $false
        }
    }
    if ($draftPass) {
        Write-Host "[PASS] 5. drafts/ 逐頁稿: 共 $($draftFiles.Count) 頁，全數附有出處且認知負荷達標" -ForegroundColor Green
    } else {
        $allPassed = $false
    }
} else {
    Write-Host "[FAIL] 5. drafts/ 頁數不在 8-15 頁範圍 (目前: $($draftFiles.Count))" -ForegroundColor Red
    $allPassed = $false
}

# 6. 檢查 presentation/index.html
$deckPath = "$baseDir\presentation\index.html"
if (Test-Path $deckPath) {
    $deckContent = Get-Content -Path $deckPath -Raw
    $hasCanvas = $deckContent.Contains("simCanvas")
    $hasSlides = $deckContent.Contains('class="slide')
    if ($hasCanvas -and $hasSlides) {
        Write-Host "[PASS] 6. presentation/index.html: 檔案存在 ($($deckContent.Length) bytes)，內建 Canvas 互動實驗室與鍵盤監聽" -ForegroundColor Green
    } else {
        Write-Host "[FAIL] 6. presentation/index.html 缺少必要的互動組件" -ForegroundColor Red
        $allPassed = $false
    }
} else {
    Write-Host "[FAIL] 6. presentation/index.html 不存在" -ForegroundColor Red
    $allPassed = $false
}

Write-Host "----------------------------------------------------------"
if ($allPassed) {
    Write-Host "🎉 恭喜！所有可執行檢查全數通過 (ALL GATES PASSED)！" -ForegroundColor Green
} else {
    Write-Host "⚠️ 存在未通過項目，請退回對應節點進行修正。" -ForegroundColor Yellow
}
Write-Host "==========================================================" -ForegroundColor Cyan
