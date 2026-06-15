# build.ps1 — 公開サイトのビルドスクリプト
# 墓場/ から「許可リスト($public)」に載ったファイルだけを 記事/ にコピーして quarto render する。
# 許可リスト方式: ここに名前を書かない限り、墓場/ に何を足しても絶対に公開されない。
#
# 使い方: 研究ノート/公開サイト/ で  pwsh ./build.ps1
#
# 公開判断のメモ:
#   - $held = 第一論文(filtration-galois)の核心に近い or 政治社会フレーム。公開前に本人確認。
#   - .html の完成教科書群は v1 では保留(フェーズ2で個別判断)。

$ErrorActionPreference = 'Stop'
$src  = Join-Path $PSScriptRoot '..\墓場'
$dst  = Join-Path $PSScriptRoot '記事'

# --- 公開許可リスト(これだけが世に出る) ---
$public = @(
  # 数論・ガロア理論
  'galois-as-linear-algebra-eigenspace.md',
  'galois-quintic-solvable-classification.md',
  'solvable-group-radical-solvability-galois.md',
  '軌道固定群はG集合版の準同型定理_2026-06-02.md',
  'cm-elliptic-curves-kronecker-jugendtraum.md',
  'finite-infinite-primes-dirichlet-unit-theorem.md',
  'ideal-contravariance-hilbert-class-field.md',
  'hasse-principle-hilbert-symbol-rational-points.md',
  'l-adic-vs-p-adic-galois-representation.md',
  'tate-module-and-etale-cohomology.md',
  'perfectoid-tilting-motivation.md',
  'iwasawa-theory-selmer-introduction.md',
  'witt-vectors-artin-schreier-witt.md',
  'division-algebra-1248-projective-cohomology.md',
  'pythagoras-sqrt2-p-adic-mod-8.md',
  'truncated-multiple-zeta-sum-hoffman-duality.md',
  'jacobian-variety-divisor-of-points.md',
  'dedekind-e-extension-f-norm.md',
  # 幾何・トポロジー・物理
  'noether-theorem-finite-to-infinitesimal.md',
  'noether-1918-general-relativity-energy-problem.md',
  'laplace-beltrami-hodge-global-device.md',
  'spherical-laplacian-from-riemann-metric.md',
  'manifold-to-orbifold-symmetry-as-structure.md',
  'hyperbolic-circle-apollonius-cayley.md',
  'cylindrical-shell-to-aharonov-bohm.md',
  'poisson-bracket-jacobian-phase-space.md',
  'relativity-algebraic-rta-clifford-hurwitz.md',
  'special-relativity-as-completion-of-electromagnetism.md',
  'kinoshita-conjecture-irreducible-rp2-s4.md',
  '観測量は変換の生成子_2026-06-02.md',
  '縮約密度行列_部分トレースと同じか_2026-06-02.md',
  # 確率・情報・解析
  'nielsen-taxonomy-distances-divergences-map.md',
  'mle-as-orbit-closure-derksen-makam.md',
  'kpz-universality-class-introduction.md',
  'strichartz-confluence-of-modern-analysis.md',
  # 代数・圏論・基礎
  'linear-algebra-as-k-theory-of-point.md',
  'identity-map-as-tensor-coevaluation.md',
  'de-morgan-as-categorical-complement-duality.md',
  'epic-surjection-cover-distinction.md',
  'simultaneous-diagonalization-commuting-matrices.md',
  'tsurukame-k-theory-special-class-math.md',
  '開集合の代数で登る_Rdiscと Zariski étale_2026-06-02.md',
  '離散直線はRnに埋め込めない_2026-06-02.md',
  '何を解と呼ぶのか_2026-06-02.md',
  '素数の足し算は人類に向いていない_2026-06-02.md',
  'math-history-meaning-catches-up-later.md'
)

# --- 保留中(本人確認後に $public へ移す) ---
$held = @(
  'nakayama-and-basu-reflects-zero-parallel.md',       # 第一論文の核心(Basu=中山0次)に近い
  'probability-space-stone-reading-galois-tower.md',   # 同上(filtration↔Galois)
  'dei-markov-kernel-mathematical-perfume.md',         # DEI フレーム(実名公開で政治色)
  'moral-hazard-as-welfare-dissipation-observation-kernel.md'  # モラルハザード/厚生フレーム
)

# 記事/ をクリーンに作り直す
if (Test-Path $dst) { Remove-Item $dst -Recurse -Force }
New-Item -ItemType Directory -Path $dst | Out-Null

$copied = 0
foreach ($f in $public) {
  $p = Join-Path $src $f
  if (Test-Path $p) { Copy-Item $p (Join-Path $dst $f); $copied++ }
  else { Write-Warning "許可リストにあるが存在しない: $f" }
}
Write-Host "コピー: $copied / $($public.Count) 本" -ForegroundColor Green
Write-Host "保留中(非公開): $($held.Count) 本" -ForegroundColor Yellow

# --- サニタイズ: 許可リスト外ファイルへの内部リンクを無害化 ---
# 公開セット(basename)を作る。リンク先がここに無い .md は「未公開」。
$pubSet = @{}; foreach ($f in $public) { $pubSet[$f] = $true }
$linkRe = [regex]'\[(?<t>[^\]]+)\]\((?<u>[^)]+)\)'
$sanitized = 0
foreach ($file in Get-ChildItem $dst -Filter *.md) {
  $lines = Get-Content $file.FullName
  $out = New-Object System.Collections.Generic.List[string]
  $touched = $false
  foreach ($line in $lines) {
    # YAML の related: 行(内部相互参照メタ)は丸ごと落とす
    if ($line -match '^related:\s') { $touched = $true; continue }
    $script:dropLine = $false
    $new = $linkRe.Replace($line, {
      param($m)
      $u = $m.Groups['u'].Value.Trim()
      $u = $u -replace '^<','' -replace '>$',''      # <...> 形式
      $u = $u -replace '^\./',''                      # 先頭 ./
      $u = ($u -split '#')[0]                          # アンカー除去
      if ($pubSet.ContainsKey($u)) { return $m.Value } # 公開先 → そのまま
      # 未公開先 → リンク解除。テキストがファイル名なら行ごと落とす印
      $script:txt = $m.Groups['t'].Value
      $cleanTxt = ($txt -replace '`','').Trim()
      if ($cleanTxt -match '\.md$') { $script:dropLine = $true }
      return $txt
    })
    if ($new -ne $line) { $touched = $true }
    if ($script:dropLine) { continue }
    $out.Add($new)
  }
  if ($touched) {
    Set-Content -Path $file.FullName -Value $out -Encoding utf8
    $sanitized++
  }
}
Write-Host "サニタイズ: $sanitized 本の内部リンクを調整" -ForegroundColor Cyan

# レンダリング
Push-Location $PSScriptRoot
try { & quarto render } finally { Pop-Location }
Write-Host "完了: docs/ に出力" -ForegroundColor Green
