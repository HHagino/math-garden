# 暗号化して組む.ps1 — 数学解説の庭を、パスワード付き（StaticCrypt）で組む。2026-11-22（萩野の決め）。
#
# 使い方（研究ノート/公開サイト/ で）:
#   pwsh ./暗号化して組む.ps1                 # 組む → 関所（暗号化の前）→ 暗号化 → 確かめ → docs/ を差し替え
#   pwsh ./暗号化して組む.ps1 -SkipByHead     # build.ps1 の $publicByHead（頭の語で書いた記事）を除いて試す
#   pwsh ./暗号化して組む.ps1 -RenderCheck    # ↑の後に、描画の点検（Edge で 1 ページずつ 9 ページ＝鍵なしの対照 1・入口・棚 3・前の記事 1・2周目の記事 2・教科書 1。
#                                             #   復号してから数式と図を数える。URL の # に鍵を入れるのは 127.0.0.1 の点検だけ・出力には残さない）
#   pwsh ./暗号化して組む.ps1 -KeepPlain      # 暗号化の前の平文 _plain/ を消さずに残す（既定は最後に消す）
# 何度でも打ち直せる（毎回 _plain/・docs/ を作り直す）。途中で止まったら docs/ は前のまま（平文は docs/ に置かない）。
#
# 流れ:
#   ① build.ps1 で組む（出力は _plain/＝git の外）
#   ② _plain/ の後始末：search.json・listings.json・sitemap.xml を消す／robots.txt は全部 Disallow／404.html を作る／
#      noindex の meta が無い HTML（教科書）に足す
#   ③ 関所：python ../tools/出す前.py 庭 --docs _plain（★ 暗号化の前に当てる。暗号化した後に当てると中が読めず 0 件＝偽の緑）
#   ④ 暗号化：staticrypt（版は固定）。全部の HTML を同じパスワード・同じ salt（_staticrypt_salt.txt）で。「この端末で覚える」は期限なし。
#   ⑤ 確かめ：全 HTML に暗号文の印・平文の語（記事の題の頭・本文の一部・「リーマン予想」）が 0 件（対照＝_plain では当たる）・
#      パスワードとその派生の鍵がどこにも無い（対照＝salt は全ページに当たる）・復号して元と一字一句同じ
#   ⑥ docs/ を差し替え → 結果を _組み立ての記録/結果_<日時>.md に 1 枚
#
# パスワード：../_private/庭の公開/パスワード.txt（git の外）。画面・記録・引数に出さない（環境変数で staticrypt に渡し、終わったら消す）。
# StaticCrypt：%LOCALAPPDATA%\math-garden-staticrypt に staticrypt@3.5.4 を入れて使う（無ければ入れる。integrity を当てる）。
#   ★ npm の名前は staticrypt（c は 1 つ）。staticcrypt（c が 2 つ）は npm に無い名前＝打ち間違えると、誰かが後で登録した物を引きうる。

param(
  [switch]$SkipByHead,
  [switch]$RenderCheck,
  [switch]$KeepPlain
)

$ErrorActionPreference = 'Stop'
# python・node の出力を UTF-8 で読む（cp932 で読むと日本語が化けて、関所の出力の照合が外れる）
[Console]::OutputEncoding = [Text.Encoding]::UTF8
$OutputEncoding = [Text.Encoding]::UTF8
$env:PYTHONIOENCODING = 'utf-8'
$root   = $PSScriptRoot
$note   = (Resolve-Path (Join-Path $root '..')).Path
$pwFile = Join-Path $note '_private\庭の公開\パスワード.txt'
$saltFile = Join-Path $root '_staticrypt_salt.txt'
$template = Join-Path $root '_暗号化の入口.html'
$plain  = Join-Path $root '_plain'
$enc    = Join-Path $root '_enc'
$dec    = Join-Path $root '_dec'
$docs   = Join-Path $root 'docs'
$logDir = Join-Path $root '_組み立ての記録'
$scVersion   = '3.5.4'
$scIntegrity = 'sha512-xmnmSwfcaufUJXwKFagmEXoOtzc/MzNFed7np++2a4Ui4FZrYFzXVUpC+nXVlcfYJAjhslCLRhn6YGlzDLb5VA=='
$scDir = Join-Path $env:LOCALAPPDATA 'math-garden-staticrypt'
$scCli = Join-Path $scDir 'node_modules\staticrypt\cli\index.js'
$marker = 'staticryptEncryptedMsgUniqueVariableName'
$utf8 = New-Object Text.UTF8Encoding $false

$report = New-Object System.Collections.Generic.List[string]
function Say([string]$s, [string]$color = 'Gray') { Write-Host $s -ForegroundColor $color; $script:report.Add($s) }
function Fail([string]$s) { Say "❌ $s" 'Red'; throw $s }
function Remove-Dir([string]$p) {
  if (Test-Path -LiteralPath $p) {
    for ($i = 0; $i -lt 5; $i++) {
      try { Remove-Item -LiteralPath $p -Recurse -Force; break } catch { Start-Sleep -Seconds 2; if ($i -eq 4) { throw } }
    }
  }
}
function Read-AllText([string]$p) { return [IO.File]::ReadAllText($p, [Text.Encoding]::UTF8) }
function Get-Files([string]$dir) { return @(Get-ChildItem -LiteralPath $dir -Recurse -File) }

$started = Get-Date
Say "━━ 暗号化して組む（$($started.ToString('yyyy-MM-dd HH:mm'))）━━" 'Cyan'
if ($SkipByHead) { Say '（-SkipByHead：頭の語で書いた記事を除いて試す組み立て）' 'Yellow' }

# ---------- ⓪ 前提 ----------
if (-not (Test-Path -LiteralPath $pwFile)) { Fail "パスワードのファイルが無い（_private/庭の公開/パスワード.txt）" }
$pwRaw = (Read-AllText $pwFile).TrimStart([char]0xFEFF)
$pwLines = @(($pwRaw -split "`r?`n") | Where-Object { $_ -ne '' })
if ($pwLines.Count -ne 1) { Fail "パスワードのファイルは空でない行がちょうど1行のこと（いま $($pwLines.Count) 行）" }
$pw = [string]$pwLines[0]
Remove-Variable pwRaw, pwLines
if ($pw.Length -lt 14) { Fail 'パスワードが 14 文字未満（公開のファイルは総当たりで試せる。staticrypt の推奨も 14 文字以上）' }
if (-not (Test-Path -LiteralPath $saltFile)) { Fail '_staticrypt_salt.txt が無い（salt を変えると、覚えたブラウザが全部入れ直しになる）' }
$salt = (Read-AllText $saltFile).Trim()
if ($salt -notmatch '^[0-9a-f]{32}$') { Fail '_staticrypt_salt.txt は 32 桁の16進（小文字）のこと' }
if (-not (Test-Path -LiteralPath $template)) { Fail '_暗号化の入口.html が無い' }

# staticrypt（版を固定・integrity を当てる）
$scPkg = Join-Path $scDir 'node_modules\staticrypt\package.json'
$needInstall = -not (Test-Path -LiteralPath $scPkg)
if (-not $needInstall) { $needInstall = ((Read-AllText $scPkg | ConvertFrom-Json).version -ne $scVersion) }
if ($needInstall) {
  Say "staticrypt@$scVersion を $scDir に入れる"
  New-Item -ItemType Directory -Force -Path $scDir | Out-Null
  if (-not (Test-Path -LiteralPath (Join-Path $scDir 'package.json'))) {
    [IO.File]::WriteAllText((Join-Path $scDir 'package.json'), '{"name":"math-garden-staticrypt","private":true}', $utf8)
  }
  Push-Location $scDir
  try { & npm install "staticrypt@$scVersion" --save-exact --no-audit --no-fund | Out-Host; if ($LASTEXITCODE -ne 0) { Fail 'npm install が失敗した' } } finally { Pop-Location }
}
$lock = Read-AllText (Join-Path $scDir 'package-lock.json') | ConvertFrom-Json -AsHashtable
$got = $lock.packages['node_modules/staticrypt']
if (-not $got -or $got.version -ne $scVersion -or $got.integrity -ne $scIntegrity) { Fail "staticrypt の版か integrity が違う（期待 $scVersion）" }
Say "✅ staticrypt $scVersion（integrity 一致）・salt は _staticrypt_salt.txt・パスワードは 14 文字以上" 'Green'

# 前の作業の残りを片付ける（前の回の _plain に残った物が混ざらないよう、_plain も消してから組む）
Remove-Dir $enc; Remove-Dir $dec; Remove-Dir $plain

$ok = $false
try {
  # ---------- ① 組む ----------
  Say '① build.ps1 で組む（出力は _plain/）' 'Cyan'
  & (Join-Path $root 'build.ps1') -SkipByHead:$SkipByHead
  if (-not (Test-Path -LiteralPath (Join-Path $plain 'index.html'))) { Fail '_plain/index.html が無い（組み立てが出力しなかった）' }
  # 2026-11-22：_quarto.yml の resources「教科書/**」が前回の docs/教科書/（暗号化済み）にも当たり、_plain/docs/ に写される
  #   （12:12・13:29 の回が関所 ③「暗号化と平文が混ざる」で止まった原因）。docs/ の入れ子は出すものではないので消す。
  $nested = Join-Path $plain 'docs'
  if (Test-Path -LiteralPath $nested) {
    $nn = @(Get-ChildItem -LiteralPath $nested -Recurse -File).Count
    Remove-Dir $nested
    Say "  消した：_plain/docs/（前回の docs の写し・ファイル $nn 個）"
  }
  # 2026-11-22：GitHub Pages（Linux）はファイル名を UTF-8 で 255 バイトまでしか取り出せない（a83740a の配備が
  #   「File name too long」で落ちた。Windows は文字数で数えるので手元では通る）。.md→.html で 2 バイト伸びる。
  $u8 = [Text.Encoding]::UTF8
  $tooLong = @(Get-ChildItem -LiteralPath $plain -Recurse | Where-Object { $u8.GetByteCount($_.Name) -gt 255 })
  if ($tooLong.Count) { Fail "名前が UTF-8 で 255 バイトを超えるファイルが $($tooLong.Count) 個（Pages で取り出せない・例：$($tooLong[0].Name.Substring(0, [Math]::Min(30, $tooLong[0].Name.Length)))…）。墓場の元の名前を縮める" }
  $artMd = @(Get-ChildItem -LiteralPath (Join-Path $root '記事') -File -Filter *.md)
  $artHtml = @(Get-ChildItem -LiteralPath (Join-Path $plain '記事') -File -Filter *.html)
  if ($artHtml.Count -ne $artMd.Count) { Fail "記事の写し $($artMd.Count) 本に対して HTML が $($artHtml.Count) 本" }
  # 空の頁（Quarto は draft の頁や組めなかった頁を <html></html> だけで出す＝数は合っても中が無い）
  $emptyArt = @($artHtml | Where-Object { (Read-AllText $_.FullName).IndexOf('<main', [StringComparison]::Ordinal) -lt 0 })
  if ($emptyArt.Count) { Fail "中身の無い記事の頁が $($emptyArt.Count) 本（例：$($emptyArt[0].Name.Substring(0, [Math]::Min(30, $emptyArt[0].Name.Length)))…）" }
  # 一覧（index.html）に全部の記事が載っているか
  $idx = Read-AllText (Join-Path $plain 'index.html')
  $inList = @($artHtml | Where-Object { $idx.Contains('記事/' + $_.Name) -or $idx.Contains('記事/' + [uri]::EscapeDataString($_.Name)) }).Count
  if ($inList -ne $artHtml.Count) { Fail "一覧に載っている記事が $inList / $($artHtml.Count) 本" }
  Say "✅ 記事 $($artHtml.Count) 本を組んだ（全部に本文あり・一覧に $inList 本）" 'Green'

  # ---------- ② 後始末 ----------
  Say '② _plain/ の後始末（本文の写しを消す・robots・404・noindex）' 'Cyan'
  foreach ($n in 'search.json', 'listings.json', 'sitemap.xml') {
    $p = Join-Path $plain $n
    if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force; Say "  消した：$n" }
  }
  [IO.File]::WriteAllText((Join-Path $plain 'robots.txt'), "User-agent: *`nDisallow: /`n", $utf8)
  $p404 = @'
<!doctype html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="noindex, nofollow">
<title>ページが見つかりません｜数学解説の庭</title>
<meta property="og:title" content="ページが見つかりません｜数学解説の庭">
<style>
body{margin:0;background:#F2F4F7;color:#162030;font-family:"BIZ UDPGothic","Hiragino Sans","Hiragino Kaku Gothic ProN","Yu Gothic UI","Meiryo",sans-serif;font-size:1rem;line-height:1.75;letter-spacing:.02em}
@media (prefers-color-scheme: dark){body{background:#0E131A;color:#E5EAF1}a{color:#86B4EE}}
main{max-width:43em;margin:0 auto;padding:48px 16px 64px}
h1{font-size:1.5rem;line-height:1.4;margin:0 0 16px}
a{color:#1D58A0;text-underline-offset:3px}
</style>
</head>
<body>
<main lang="ja">
<h1>ページが見つかりません</h1>
<p>このページは、いまの庭にはありません。題が変わった記事は、一覧から探してください。</p>
<p><a href="/math-garden/">数学解説の庭の一覧へ</a></p>
</main>
</body>
</html>
'@
  [IO.File]::WriteAllText((Join-Path $plain '404.html'), $p404, $utf8)
  $plainHtml = @(Get-Files $plain | Where-Object { $_.Extension -in '.html', '.htm' })
  $added = 0
  foreach ($f in $plainHtml) {
    $t = Read-AllText $f.FullName
    if ($t -match '<meta\s+name="robots"') { continue }
    $t2 = [regex]::new('<head(\s[^>]*)?>', 'IgnoreCase').Replace($t, { param($m) $m.Value + "`n<meta name=`"robots`" content=`"noindex, nofollow`">" }, 1)
    if ($t2 -eq $t) { Fail "noindex を入れる <head> が見つからない：$($f.Name)" }
    [IO.File]::WriteAllText($f.FullName, $t2, $utf8); $added++
  }
  $noRobots = @($plainHtml | Where-Object { (Read-AllText $_.FullName) -notmatch '<meta\s+name="robots"[^>]*noindex' })
  if ($noRobots.Count) { Fail "noindex が無い HTML が $($noRobots.Count) 本" }
  Say "✅ HTML $($plainHtml.Count) 本すべてに noindex（このうち $added 本は後から足した＝教科書など）・robots.txt は全部 Disallow" 'Green'
  $exts = Get-Files $plain | Group-Object Extension | Sort-Object Name | ForEach-Object { "$($_.Name):$($_.Count)" }
  Say "  _plain/ のファイルの種類：$($exts -join ' ')"
  $textExt = '.json', '.xml', '.md', '.qmd', '.txt'
  $stray = @(Get-Files $plain | Where-Object { $textExt -contains $_.Extension -and $_.Name -ne 'robots.txt' })
  if ($stray.Count) { Fail "本文の写しになりうる文字のファイルが残っている：$(($stray | ForEach-Object { $_.Name }) -join ', ')" }

  # ---------- ③ 関所（暗号化の前） ----------
  Say '③ 関所：出す前.py 庭 --docs _plain（暗号化の前の平文に当てる）' 'Cyan'
  $gate = & python (Join-Path $note 'tools\出す前.py') 庭 --docs $plain 2>&1
  $gateCode = $LASTEXITCODE
  foreach ($l in $gate) { Say "  | $l" }
  if ($gateCode -ne 0) { Fail "出す前.py が赤（終了コード $gateCode）" }
  if (-not ($gate -match '許可 \d+ 本が全部出ている')) { Fail '出す前.py の出力に「許可 N 本が全部出ている」が無い（検査が中を見ていない）' }
  if (-not ($gate -match 'selftest: ✅')) { Fail '出す前.py の selftest が通っていない' }
  Say '✅ 関所は緑（selftest 通過・対照＝公開分の名前が本文に出ることを道具が確かめた）' 'Green'

  # ---------- ④ 暗号化 ----------
  Say "④ 暗号化（staticrypt $scVersion・同じ salt・覚えるは期限なし）" 'Cyan'
  Push-Location $root
  try {
    $env:STATICRYPT_PASSWORD = $pw
    $o = & node $scCli '_plain' -r -d '_enc' --salt $salt -c false --remember 0 -t $template 2>&1
    $code = $LASTEXITCODE
    $share = & node $scCli --share '' --salt $salt -c false 2>&1
    $code2 = $LASTEXITCODE
  } finally { Remove-Item Env:STATICRYPT_PASSWORD -ErrorAction SilentlyContinue; Pop-Location }
  if ($code -ne 0 -or $o) { foreach ($l in @($o)) { Say ("  | " + ([string]$l).Replace($pw, '(伏せた)')) }; Fail "staticrypt が失敗した（終了コード $code・出力 $(@($o).Count) 行）" }
  if ($code2 -ne 0) { Fail 'staticrypt --share が失敗した' }
  $hashed = ([string]($share | Select-Object -Last 1)) -replace '^.*#staticrypt_pwd=', ''
  Remove-Variable share
  if ($hashed -notmatch '^[0-9a-f]{64}$') { Fail '派生の鍵（staticrypt_pwd）が取れない' }
  $encRoot = Join-Path $enc '_plain'
  $plainFiles = Get-Files $plain
  $encFiles = Get-Files $encRoot
  if ($encFiles.Count -ne $plainFiles.Count) { Fail "暗号化の前 $($plainFiles.Count) 個・後 $($encFiles.Count) 個（数が合わない）" }

  # ---------- ⑤ 確かめ ----------
  Say '⑤ 確かめ' 'Cyan'
  $encText = @{}
  foreach ($f in $encFiles) { $encText[$f.FullName] = Read-AllText $f.FullName }
  $plainText = @{}
  foreach ($f in $plainFiles) { $plainText[$f.FullName] = Read-AllText $f.FullName }
  $encHtml = @($encFiles | Where-Object { $_.Extension -in '.html', '.htm' })
  $noMark = @($encHtml | Where-Object { -not $encText[$_.FullName].Contains($marker) })
  if ($noMark.Count) { Fail "暗号文の印が無い HTML が $($noMark.Count) 本" }
  # 対照：salt（公開してよい値）は暗号化した全 HTML に入っている＝この探し方は当たる
  $saltHits = @($encHtml | Where-Object { $encText[$_.FullName].Contains($salt) }).Count
  if ($saltHits -ne $encHtml.Count) { Fail "対照（salt）が $saltHits / $($encHtml.Count) 本にしか当たらない＝探し方が壊れている" }
  $jaHits = @($encHtml | Where-Object { $encText[$_.FullName].Contains('パスワードを入れてください') -and $encText[$_.FullName].Contains('lang="ja"') -and $encText[$_.FullName].Contains('noindex') }).Count
  if ($jaHits -ne $encHtml.Count) { Fail "入口の画面（日本語・lang=ja・noindex）になっていない HTML がある（$jaHits / $($encHtml.Count)）" }
  Say "✅ HTML $($encHtml.Count) 本すべてに暗号文の印・入口は日本語（lang=ja・noindex）・対照の salt は $saltHits / $($encHtml.Count) 本に当たった" 'Green'
  # 暗号化しないファイル（css・js・png・svg・woff・robots.txt）は元と同じ中身
  $diffCopy = 0
  foreach ($f in ($encFiles | Where-Object { $_.Extension -notin '.html', '.htm' })) {
    $rel = $f.FullName.Substring($encRoot.Length)
    $a = Get-FileHash -LiteralPath $f.FullName; $b = Get-FileHash -LiteralPath (Join-Path $plain $rel)
    if ($a.Hash -ne $b.Hash) { $diffCopy++ }
  }
  if ($diffCopy) { Fail "暗号化しないファイルのうち $diffCopy 個が元と違う" }

  # 平文の語：記事の題の頭（12 字）・本文の一部（12 字）・決まった語
  $words = New-Object System.Collections.Generic.List[string]
  foreach ($w in 'リーマン予想', 'ゼータ', '素数', '零点', '臨界線', 'ガロア') { $words.Add($w) }
  foreach ($h in $artHtml) {
    $t = Read-AllText $h.FullName
    $m = [regex]::Match($t, '<title>(.*?)</title>', 'Singleline')
    if ($m.Success) {
      $title = [Net.WebUtility]::HtmlDecode($m.Groups[1].Value) -replace '\s+–\s+数学解説の庭\s*$', ''
      $title = $title.Trim()
      if ($title.Length -ge 6) { $words.Add($title.Substring(0, [Math]::Min(12, $title.Length))) }
    }
    $mm = [regex]::Match($t, '<main[^>]*>(.*?)</main>', 'Singleline')
    if ($mm.Success) {
      foreach ($pm in [regex]::Matches($mm.Groups[1].Value, '<p>([^<]{24,})')) {
        $s = [Net.WebUtility]::HtmlDecode($pm.Groups[1].Value).Trim()
        if ($s -match '[぀-ヿ一-鿿]' -and $s.Length -ge 24) { $words.Add($s.Substring(6, 12)); break }
      }
    }
  }
  # 入口の画面にわざと書いてある語（「数学解説の庭」など）は外す（暗号化の後にも出てよい語）
  $tplText = Read-AllText $template
  $words = @($words | Select-Object -Unique | Where-Object { -not $tplText.Contains($_) })
  $plainAll = ($plainText.Values -join "`n")
  $ctl = @($words | Where-Object { $plainAll.Contains($_) })
  $ctlMiss = $words.Count - $ctl.Count
  if ($ctl.Count -lt [Math]::Max(10, [int]($artHtml.Count))) { Fail "対照（平文の語が _plain に当たる）が少なすぎる：$($ctl.Count) 語" }
  $encAll = ($encText.Values -join "`n")
  $leak = @($ctl | Where-Object { $encAll.Contains($_) })
  if ($leak.Count) { Fail "暗号化した docs に平文の語が $($leak.Count) 語残っている（例：$($leak[0])）" }
  Say "✅ 平文の語 $($ctl.Count) 語（記事の題の頭・本文の一部・「リーマン予想」など）は暗号化の後 0 件・対照＝暗号化の前の _plain では $($ctl.Count) 語すべて当たる（作った語のうち _plain に当たらず外した $ctlMiss 語）" 'Green'

  # パスワードと派生の鍵（staticrypt_pwd）は、どこにも無い
  $pwHit = @($encFiles | Where-Object { $encText[$_.FullName].Contains($pw) }).Count + @($plainFiles | Where-Object { $plainText[$_.FullName].Contains($pw) }).Count
  $hashHit = @($encFiles | Where-Object { $encText[$_.FullName].Contains($hashed) }).Count
  $pwInRepo = @(Get-ChildItem -LiteralPath $root -Recurse -File -Force | Where-Object { $_.FullName -notlike (Join-Path $root '.git*') -and $_.FullName -notlike "$enc*" -and $_.FullName -notlike "$plain*" -and $_.Length -lt 20MB } | Where-Object { (Read-AllText $_.FullName).Contains($pw) }).Count
  if ($pwHit -or $hashHit -or $pwInRepo) { Fail "パスワードか派生の鍵が出力かリポジトリに入っている（出力 $pwHit・鍵 $hashHit・リポジトリ $pwInRepo）" }
  Say "✅ パスワードは出力（暗号化の前と後 $($plainFiles.Count + $encFiles.Count) 個）にもリポジトリの作業ツリーにも 0 件・派生の鍵も暗号化した出力に 0 件" 'Green'

  # 復号して元と一字一句同じ（パスワードで全部開けること）
  Push-Location $root
  try {
    $env:STATICRYPT_PASSWORD = $pw
    $o = & node $scCli '_enc/_plain' -r --decrypt -d '_dec' --salt $salt -c false 2>&1
    $code = $LASTEXITCODE
  } finally { Remove-Item Env:STATICRYPT_PASSWORD -ErrorAction SilentlyContinue; Pop-Location }
  if ($code -ne 0 -or $o) { Fail "復号の確かめが失敗した（終了コード $code・出力 $(@($o).Count) 行）" }
  $decRoot = Join-Path $dec '_plain'
  $same = 0; $bad = 0
  foreach ($f in $encHtml) {
    $rel = $f.FullName.Substring($encRoot.Length)
    $d = Join-Path $decRoot $rel
    if ((Test-Path -LiteralPath $d) -and ((Get-FileHash -LiteralPath $d).Hash -eq (Get-FileHash -LiteralPath (Join-Path $plain $rel)).Hash)) { $same++ } else { $bad++ }
  }
  if ($bad) { Fail "復号した $($encHtml.Count) 本のうち $bad 本が元と違う" }
  Say "✅ 復号した HTML $same 本は、暗号化の前と一字一句同じ" 'Green'

  # ---------- ⑥ docs/ を差し替え ----------
  Say '⑥ docs/ を差し替え' 'Cyan'
  Remove-Dir $docs
  Move-Item -LiteralPath $encRoot -Destination $docs
  $docsFiles = Get-Files $docs
  if ($docsFiles.Count -ne $plainFiles.Count) { Fail "docs/ のファイル数 $($docsFiles.Count) が組んだ数 $($plainFiles.Count) と違う" }
  $docsPlainHtml = @($docsFiles | Where-Object { $_.Extension -in '.html', '.htm' } | Where-Object { -not (Read-AllText $_.FullName).Contains($marker) })
  if ($docsPlainHtml.Count) { Fail "docs/ に暗号化していない HTML が $($docsPlainHtml.Count) 本" }
  Say "✅ docs/：ファイル $($docsFiles.Count) 個（HTML $($encHtml.Count) 本は全部暗号化）" 'Green'
  $ok = $true
} catch {
  $msg = ([string]$_.Exception.Message)
  if ($pw) { $msg = $msg.Replace($pw, '(伏せた)') }
  Say "❌ 止まった：$msg" 'Red'
  $ok = $false
} finally {
  Remove-Variable pw -ErrorAction SilentlyContinue
  Remove-Dir $enc; Remove-Dir $dec
  if (-not $KeepPlain) { Remove-Dir $plain }
}

# ---------- 描画の点検（任意） ----------
if ($ok -and $RenderCheck) {
  Say '⑦ 描画の点検（127.0.0.1 で配り、Edge で 1 ページずつ・復号してから数える）' 'Cyan'
  $tmp = Join-Path $env:TEMP ('庭の描画点検_' + [guid]::NewGuid().ToString('N').Substring(0, 8))
  New-Item -ItemType Directory -Path $tmp | Out-Null
  $port = 8765
  $srv = Start-Process -FilePath python -ArgumentList @((Join-Path $note 'tools\描画の点検\serve.py'), "`"$docs`"", $port) -PassThru -WindowStyle Hidden
  try {
    Start-Sleep -Seconds 2
    $pick = {
      param($head)
      $f = @(Get-ChildItem -LiteralPath (Join-Path $docs '記事') -File | Where-Object { $_.Name.StartsWith($head, [StringComparison]::Ordinal) })
      if ($f.Count -ne 1) { return $null }
      return '記事/' + [uri]::EscapeDataString($f[0].Name)
    }
    $pages = @(
      @{ label = '入口（鍵なし＝対照・復号されないはず）'; rel = 'index.html'; key = $false },
      @{ label = '入口'; rel = 'index.html'; key = $true },
      @{ label = '棚：リーマン予想への試み29件の年表'; rel = (& $pick 'リーマン予想への試み29件の年表'); key = $true },
      @{ label = '棚：ゲナン＝ヴェイユの明示公式'; rel = (& $pick 'ゲナン＝ヴェイユの明示公式'); key = $true },
      @{ label = '棚：ガウス和の2乗は±p（数式の中の [..](..) をリンクと取り違えた所）'; rel = (& $pick 'ガウス和の2乗は±p'); key = $true },
      @{ label = '前から：Poisson和公式は格子で割ったPeter-Weyl'; rel = (& $pick 'Poisson和公式は格子で割ったPeter-Weylである'); key = $true },
      @{ label = '2周目：有限体上のグラスマン多様体Gr24（図 2 枚の注の重なりを直した記事）'; rel = (& $pick '有限体上のグラスマン多様体Gr24'); key = $true },
      @{ label = '2周目：局所化は分母に許すものを選ぶ操作（図の札に Z_(3) の平文）'; rel = (& $pick '局所化は分母に許すものを選ぶ操作'); key = $true },
      @{ label = '教科書：量子力学から場の量子論へ 第1章'; rel = '教科書/ja/qm-to-qft/ch01.html'; key = $true }
    )
    $list = @()
    foreach ($pg in $pages) {
      if (-not $pg.rel) { Say "  ⚠️ ページが1本に決まらない：$($pg.label)" 'Yellow'; continue }
      $u = "http://127.0.0.1:$port/$($pg.rel)"
      if ($pg.key) { $u += "#staticrypt_pwd=$hashed" }
      $list += [ordered]@{ label = $pg.label; url = $u; timeoutMs = $(if ($pg.key) { 90000 } else { 30000 }); waitFor = "!document.getElementById('staticrypt_content') && document.readyState === 'complete'" }
    }
    $listFile = Join-Path $tmp 'list.json'
    [IO.File]::WriteAllText($listFile, ($list | ConvertTo-Json -Depth 4), $utf8)
    while ($true) {
      $free = (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory / 1KB
      if ($free -ge 250) { break }
      Say "  空きメモリ $([int]$free) MB（250 MB 未満）＝待つ" 'Yellow'; Start-Sleep -Seconds 30
    }
    $out = Join-Path $tmp 'out.jsonl'
    & node (Join-Path $note 'tools\描画の点検\check.mjs') $listFile $out | ForEach-Object { Say "  | $_" }
    Remove-Item -LiteralPath $listFile -Force   # 鍵の入った URL を残さない
    $rows = @(Get-Content -LiteralPath $out -Encoding utf8 | ForEach-Object { $_ | ConvertFrom-Json })
    if ((Get-Content -LiteralPath $out -Raw -Encoding utf8).Contains($hashed)) { Fail '点検の出力に鍵が残っている' }
    foreach ($r in $rows) {
      $c = $r.count
      $nErr = @($c.errors).Count; $nDelim = @($c.delims).Count; $nUnr = @($c.unrenderedKatexSpans).Count; $nSvg = @($c.svgLabels).Count
      $kx = if ($c.counts.katex) { $c.counts.katex } else { 0 }; $mj = if ($c.counts.mjxContainers) { $c.counts.mjxContainers } else { 0 }
      Say ("  {0}：復号={1}・題「{2}」・KaTeX {3}・MathJax {4}・誤り {5}・残った区切り {6}・未描画 {7}・図の札 {8}・JS/ネットの記録 {9}" -f $r.label, $r.waitFor, ([string]$c.title).Substring(0, [Math]::Min(24, ([string]$c.title).Length)), $kx, $mj, $nErr, $nDelim, $nUnr, $nSvg, @($r.console).Count)
      foreach ($e in @($r.console) | Select-Object -First 3) { Say "      ・$($e.type) $($e.text)" }
    }
    $ctlRow = $rows | Where-Object { $_.label -like '入口（鍵なし*' }
    if ($ctlRow -and $ctlRow.waitFor -ne 'timeout') { Say '  ⚠️ 対照（鍵なし）が復号された＝待ち方が壊れている' 'Red' }
    elseif ($ctlRow) { Say '  ✅ 対照：鍵なしの入口は復号されなかった（waitFor=timeout）＝「復号された」の判定は鳴る' 'Green' }
  } finally {
    if ($srv -and -not $srv.HasExited) { Stop-Process -Id $srv.Id -Force }
    Remove-Dir $tmp
  }
  $left = @(Get-ChildItem $env:TEMP -Directory -Filter 'edgeprof*' -ErrorAction SilentlyContinue)
  Say "  使い捨てのプロファイルの残り：$($left.Count)"
}
Remove-Variable hashed -ErrorAction SilentlyContinue

# ---------- 結果を 1 枚に ----------
if (-not (Test-Path -LiteralPath $logDir)) { New-Item -ItemType Directory -Path $logDir | Out-Null }
$res = Join-Path $logDir ("結果_" + $started.ToString('yyyyMMdd-HHmm') + '.md')
$head = @("# 暗号化して組む の結果（$($started.ToString('yyyy-MM-dd HH:mm'))〜$((Get-Date).ToString('HH:mm'))）", '', "- 判定：$(if ($ok) { '✅ 組めた（docs/ を差し替えた）' } else { '❌ 止まった（docs/ は前のまま）' })", '- 外したリンクの一覧：_組み立ての記録/外したリンク.tsv', '', '```')
[IO.File]::WriteAllLines($res, [string[]]($head + $report + @('```')), $utf8)
Write-Host "結果：$res" -ForegroundColor Cyan
if (-not $ok) { exit 1 }
