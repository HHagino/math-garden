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
  'math-history-meaning-catches-up-later.md',

  # --- 2026-08-15 追加(第2便) ---
  # 数論・ガロア理論
  '無限次Galois対応は位相が決める_2026-06-19.md',
  'なぜZariskiでは点が数えられないか_Weil予想とGrothendieck位相_2026-06-19.md',
  # 幾何・トポロジー
  '弧状連結単連結可縮_不変量は何を見て何を見落とすか_2026-06-19.md',
  # 作用素環・作用素空間
  '実構造は非可換でmodular共役Jになる_2026-06-20.md',
  '作用素空間_行列ノルムの塔が入り方を覚えている_2026-07-09.md',
  # 表現論(背骨1と背骨4の親記事)
  '有限群のフーリエはPeter-Weylである_指標表はどこから来るのか_2026-08-15.md',
  'Poisson和公式は格子で割ったPeter-Weylである_関数等式はどこから来るのか_2026-08-15.md',
  # LAOX 三部作
  'LAOX性とは何か何でないか_隣接概念との微差_2026-06-19.md',
  'LAOX曲線_局所在庫あり大域在庫なし_2026-06-19.md',
  'LAOX多様体_次元を上げると障害が増える_2026-06-19.md'
)

# --- 保留中(本人確認後に $public へ移す) ---
$held = @(
  'nakayama-and-basu-reflects-zero-parallel.md',       # 第一論文の核心(Basu=中山0次)に近い
  'probability-space-stone-reading-galois-tower.md',   # 同上(filtration↔Galois)
  'dei-markov-kernel-mathematical-perfume.md',         # DEI フレーム(実名公開で政治色)
  'moral-hazard-as-welfare-dissipation-observation-kernel.md',  # モラルハザード/厚生フレーム

  # --- 2026-08-15 追加。理由は「次の一本(トラック2)の候補そのもの」 ---
  # ⚠️ paper1 は「正しく新しい」が 0 件でトラック1(Expositiones)へ回した。
  #    トラック2 = 次の一本が研究の本体。その探索の中身を先に公開するかは戦略判断。
  '伊藤補正は幾何ではない_Fisher弧長とDirichlet周期_2026-08-03.md',   # TODO が「切り出すならこちらが先」と名指し
  '高さは単体上の平均エントロピーである_調和数が二度出る_2026-08-03.md', # 同日の対になる探索
  '非可換性は情報を覚えているか_遠アーベル幾何と局所体の反例_2026-08-10.md', # Galois 側の核心に寄る
  '補集合は複素共役ではない_確率のStone読みの三つのZ2_2026-06-19.md',  # 「Stone 読み」= filtration↔Galois の語彙
  'Ihara三項式は木の初到達母関数である_2026-08-11.md',                  # 8/11 の探索。ゼータ×木
  'ゼータは記憶から生まれる_ランダムウォークのゼータはGreen核に潰れる_2026-08-11.md', # 同上・対になる一本
  'Basuの定理はscore空間の直交分解_0次vanishingの起動例_2026-06-20.md'  # Basu = 第一論文の核心
)

# --- 公開対象外(記事ではない) ---
# デザイン規則2本・庭のマップ・引継ぎメモ2本・algebraic-gr-READING-BEFORE-REOPEN
# --- 凍結中(アラケロフ影プログラム。趣味として凍結) ---
# algebraic-gr-map-clifford-holonomy-h1.md / algebraic-gr-minimality-postulate-proposal.md

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
