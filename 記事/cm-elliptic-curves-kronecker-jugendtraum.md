---
title: "CM 楕円曲線と Kronecker の青春の夢 — 虚二次体の Abel 拡大の明示構成"
date: 2026-05-23
updated: 2026-06-02
status: 墓場
audience: 楕円曲線・類体論の基礎を一度通った人向け
prerequisite: 楕円曲線(Silverman 第 1 部)、二次体、Hilbert 類体
abstract: |
  Hilbert 第 12 問題(数体の最大 abelian 拡大を解析関数の特殊値で明示構成せよ)は、K=ℚ(円分関数 e^{2πi/n}、Kronecker–Weber)と K=虚二次体(楕円関数・CM 楕円曲線の特殊値)でのみ完全解決されている。CM 楕円曲線は End(E)⊗ℚ が虚二次体になるもので、j(E) が Hilbert 類体を、℘(α/N) が最大 abelian 拡大を生成する(Kronecker の青春の夢)。その l 進 Galois 表現は abelian で二つの Hecke 指標の和に分解し、L 関数は Hecke L 関数の積として明示的に解析接続される。Coates–Wiles(BSD の最初の突破口)もこの CM の特殊性から来る。
---

## 1. Hilbert 第 12 問題と Kronecker の青春の夢

数体 K に対し、その最大 abelian 拡大 K^ab はガロワ群が abelian であるような K の代数閉包内の部分体である。Hilbert の第 12 問題 (1900) は次を問うた:

> 数体 K の最大 abelian 拡大 K^ab を、K に依存する **解析的な関数の特殊値** を用いて明示的に構成せよ。

これは Kronecker の「青春の夢」(*Jugendtraum*, 1880 年頃の手紙で表明された希望)の数学的定式化である。完全に解決されているのは現在のところ:

- **K = ℚ**: 円分関数 e^{2πi/n} の値で K^ab = ℚ(ζ_∞) := ℚ(e^{2πi q}: q ∈ ℚ)。これは **Kronecker-Weber 定理** (1853, Kronecker; 1886, Weber; 完成 Hilbert 1896)
- **K = 虚二次体**: 楕円関数の特殊値 — CM 楕円曲線の n 等分点の座標で記述

それ以外の数体(実二次体、3 次体以上)については完全な解決はなく、現在も未解決の問題である。本稿では虚二次体の場合を扱う。

<figure>
<svg viewBox="0 0 460 156" width="100%" style="max-width:460px;display:block;margin:8px auto" role="img" aria-label="Hilbert第12問題の解決状況">
  <g font-family="serif" font-size="11" fill="#2b2118">
    <text x="230" y="18" text-anchor="middle" font-size="11" fill="#6b5d44">Hilbert 第12問題:K^ab を解析関数の特殊値で明示構成</text>
    <rect x="20" y="30" width="210" height="34" rx="4" fill="#eef1ea" stroke="#5a6e4a"/><text x="125" y="51" text-anchor="middle">K=ℚ:円分 e^{2πi/n}(Kronecker–Weber)✓</text>
    <rect x="20" y="70" width="210" height="34" rx="4" fill="#eef1ea" stroke="#5a6e4a"/><text x="125" y="91" text-anchor="middle">K=虚二次体:楕円関数・CM 値 ✓</text>
    <rect x="250" y="30" width="190" height="74" rx="4" fill="#f6e7e3" stroke="#b1342a"/><text x="345" y="56" text-anchor="middle">実二次体・3次以上</text><text x="345" y="78" text-anchor="middle">── 未解決</text>
    <text x="230" y="128" text-anchor="middle" font-size="9.5" fill="#8a7f6c">解けた二つは「乗法群の torsion(円分)」と「楕円曲線の torsion(CM)」── 本稿は後者</text>
    <text x="230" y="144" text-anchor="middle" font-size="9.5" fill="#b1342a">数論幾何最古級の未解決問題の一つ</text>
  </g>
</svg>
<figcaption><b>図1 ─ 第12問題の解決状況.</b> 最大 abelian 拡大を解析関数の特殊値で書けるのは、$K=\mathbb Q$(円分関数、$\mathbb G_m$ の torsion)と $K=$ 虚二次体(楕円関数、CM 楕円曲線の torsion)のみ。実二次体以上は未解決。本稿は虚二次体=楕円曲線側を扱う。<i>(概念図)</i></figcaption>
</figure>

---

## 2. Complex Multiplication の定義

### 2.1 楕円曲線の自己準同型環

楕円曲線 E/K に対し、自己準同型環

$$ \operatorname{End}(E) := \{f \colon E \to E : f \text{ は代数射, 群準同型}\} $$

を考える。常に整数 m に対する m 倍写像 [m]: E → E ∈ End(E) があるので、ℤ ⊂ End(E) は常に成立する。

定義: E が **complex multiplication (CM)** を持つとは、End(E) ⊗_ℤ ℚ が ℚ より真に大きいこと。

### 2.2 主要事実

K が標数 0 の体(典型例: K = ℂ または数体)で E/K が CM を持つとき、End(E) ⊗ ℚ は虚二次体 F に同型である。End(E) 自身は F の整数環 𝒪_F の order(部分環)である。

具体例:

- E: y² = x³ - x は CM by ℤ[i]（Gauss 整数環）。CM は (x, y) ↦ (-x, iy) で与えられる
- E: y² = x³ - 1 は CM by ℤ[ζ_3]（Eisenstein 整数環）
- E: y² = x³ - 35x - 98 は CM by 𝒪_K, K = ℚ(√-7)

これらは古典的な例で、すべて ℚ の小さな拡大上に定義される CM 楕円曲線。

### 2.3 複素解析的見方

ℂ 上の楕円曲線 E は ℂ/Λ(Λ ⊂ ℂ は離散格子、ランク 2)と同型な複素 Lie 群である。

E が CM を持つことは、Λ が **複素乗法を許す** ことと同値:すなわち α ∈ ℂ \ ℝ で αΛ ⊂ Λ となるものが存在する。

この α は虚二次無理数で、その生成する体 ℚ(α) が CM 体 F = End(E) ⊗ ℚ。

<figure>
<svg viewBox="0 0 320 230" width="100%" style="max-width:320px;display:block;margin:8px auto" role="img" aria-label="複素乗法を持つ格子">
  <g font-family="serif" font-size="10" fill="#2b2118">
    <line x1="20" y1="150" x2="300" y2="150" stroke="#b9ac95" stroke-width="0.8"/>
    <line x1="90" y1="20" x2="90" y2="210" stroke="#b9ac95" stroke-width="0.8"/>
    <!-- lattice points Λ = Z + Zτ, τ ≈ i (imaginary quadratic) -->
    <g fill="#2f5d7c">
      <circle cx="90" cy="150" r="3"/><circle cx="150" cy="150" r="3"/><circle cx="210" cy="150" r="3"/><circle cx="30" cy="150" r="3"/>
      <circle cx="90" cy="90" r="3"/><circle cx="150" cy="90" r="3"/><circle cx="210" cy="90" r="3"/><circle cx="30" cy="90" r="3"/>
      <circle cx="90" cy="210" r="3"/><circle cx="150" cy="210" r="3"/><circle cx="30" cy="210" r="3"/>
    </g>
    <text x="156" y="146" fill="#5a6e4a">1</text><text x="96" y="86" fill="#5a6e4a">τ</text>
    <!-- multiplication by α=τ: rotation+scaling preserving lattice -->
    <path d="M150,150 A60,60 0 0 0 90,90" fill="none" stroke="#b1342a" stroke-width="1.6"/>
    <text x="118" y="118" fill="#b1342a" font-size="10">×α</text>
    <text x="160" y="225" text-anchor="middle" fill="#8a7f6c" font-size="9.5">α·Λ ⊂ Λ(整数倍を超える対称性)</text>
  </g>
</svg>
<figcaption><b>図2 ─ 複素乗法を持つ格子.</b> $E=\mathbb C/\Lambda$ が CM を持つとは、$\alpha\in\mathbb C\setminus\mathbb R$(虚二次無理数)で $\alpha\Lambda\subseteq\Lambda$ となること。整数倍 $\times m$ という当たり前の対称性を超えて、格子を自分自身へ写す「回転＋拡大」の余分な対称性がある ── それが $\mathrm{End}(E)$ を虚二次体まで大きくする。<i>(概念図)</i></figcaption>
</figure>

### 2.4 j 不変量

E/ℂ の j 不変量 j(E) は E の同型類を決める。CM 楕円曲線の場合、j(E) は **代数的整数** であり、しかも特別な数論的性質を持つ:

- F = End(E) ⊗ ℚ, 𝒪_F が End(E) のとき、j(E) は F の Hilbert 類体 H_F の生成元
- すなわち H_F = F(j(E))

これが Kronecker の青春の夢の最初の段階である:F の Hilbert 類体は j 関数の(F の整数の) **CM 値** で生成される。

---

## 3. n 等分点と Galois 表現

### 3.1 等分点の体

楕円曲線 E と整数 n に対し、E の n 等分点 E[n] := {P ∈ E(\bar K) : nP = O} を考える。E[n] ≅ (ℤ/nℤ)² (n が char と互いに素なとき)。

座標を加えた体

$$ K(E[n]) := K(\{x(P), y(P) : P \in E[n]\}) $$

は K のガロワ拡大で、Galois 群は GL_2(ℤ/nℤ) の部分群に埋め込まれる。

### 3.2 CM の場合の特殊性

E が CM by 𝒪_F を持つとき、End(E) = 𝒪_F の作用と整合するため、Galois 群は GL_2 ではなく次の部分群に制限される:

$$ \operatorname{Gal}(K(E[n])/K) \hookrightarrow (\mathcal{O}_F / n \mathcal{O}_F)^\times $$

すなわち 2 × 2 行列群 GL_2(ℤ/n) の中で、𝒪_F の作用と可換な部分群、つまり 𝒪_F/n の単数群。これは **abelian** である(F が可換だから)。

このため CM 楕円曲線の等分点の体は **abelian 拡大** である。

### 3.3 例: ℚ(i) 上の CM 楕円曲線

E: y² = x³ - x, CM by ℤ[i]。

E[3] の座標は ℚ(i) 上で特殊な構造を持ち、ℚ(i)(E[3]) は ℚ(i) の abelian 拡大で、その Galois 群は (ℤ[i]/3ℤ[i])^× ≅ ℤ/8 と同型。

これと CM の作用との整合から、E のすべての torsion 点 E[∞] := ∪_n E[n] を添加した

$$ F^{ab, ram} := F(E[\infty]) $$

は F の(条件付きの)abelian 拡大であり、F の整数環の素元の Lubin-Tate 拡大に密接に関係する。

---

## 4. Main Theorem of Complex Multiplication

### 4.1 Statement

F を虚二次体、𝒪_F をその整数環、E を 𝒪_F による CM 楕円曲線(F の Hilbert 類体 H 上で定義)とする。**Complex Multiplication の主定理**(古典的、Hasse, Weber, Takagi, Shimura-Taniyama):

> F 上の最大 abelian 拡大 F^ab は、F の Hilbert 類体 H と、E のすべての torsion 点を添加した体の合成で得られる:
> $$ F^{ab} = H \cdot F(E[\infty]) = H(j(E), E[\infty]). $$

これが Hilbert 第 12 問題の虚二次体に対する完全な答えである。

### 4.2 補足: 構成的側面

- **H_F = F(j(E))**: F の Hilbert 類体は j 不変量で生成される(階数: F のイデアル類群)
- **F^{ab}/F**: 全ての abel 拡大は j(E) と E[∞] で記述される
- **Idèle 類群との対応**: Artin 写像 𝔸_F^× / F^× → Gal(F^{ab}/F) は楕円関数の特殊値を介して明示化される

### 4.3 解析的記述: Weierstrass ℘ 関数の特殊値

F の元 α と CM 楕円曲線 E = ℂ/𝒪_F に対し、Weierstrass の楕円関数 ℘(z; 𝒪_F) の点 α/N での値 ℘(α/N; 𝒪_F) は F の abelian 拡大の生成元になる。

具体的には:

$$ F(j(E), \wp(α/N; \mathcal{O}_F): α \in F, N \in \mathbb{Z}_{>0}) = F^{ab}. $$

これが「楕円関数の特殊値で abelian 拡大を生成する」Kronecker の青春の夢の精密な実現である。

---

## 5. CM 楕円曲線の Galois 表現

### 5.1 l 進 Galois 表現

E/K が CM by 𝒪_F を持ち、K ⊃ F とする。l 進 Tate 加群

$$ T_l(E) := \varprojlim_n E[l^n] \cong \mathbb{Z}_l^2 $$

は G_K の連続表現を定める。CM の作用と整合するため、ρ_{E,l}: G_K → GL_2(ℚ_l) は次の特別な構造を持つ:

- G_K の像が **abelian** な部分群に含まれる
- 既約な 2 次元表現ではなく、二つの 1 次元表現 ψ_l, ψ_l' の直和:
  $$ V_l(E) \cong \mathbb{Q}_l(\psi_l) \oplus \mathbb{Q}_l(\psi_l') $$
- ψ_l と ψ_l' は互いに複素共役で結ばれた Hecke 指標から来る

### 5.2 Hecke 指標との対応

CM 楕円曲線 E/F に対し、F 上の **Hecke 指標** (Größencharakter)

$$ \psi_E \colon \mathbb{A}_F^\times / F^\times \to \mathbb{C}^\times $$

が canonical に対応する。これは

- 無限位置で z ↦ z(=複素埋め込みそのもの)
- 有限素点で E の還元の Frobenius と整合

によって特徴付けられる。

### 5.3 L 関数

CM 楕円曲線 E/F の L 関数は二つの Hecke L 関数の積として明示的に書ける:

$$ L(E/F, s) = L(\psi_E, s) L(\bar{\psi}_E, s). $$

これは Hecke L 関数の解析接続(Hecke 1936)を経由して E/F の L 関数の解析接続・関数等式を与える。一般の楕円曲線では保型形式との対応 (Wiles の定理) を経由する必要があるが、CM の場合は古典的に確立されている。

### 5.4 例: E: y² = x³ - x over ℚ

CM by ℤ[i], 上記の Hecke 指標は ψ: 𝔸_{ℚ(i)}^× / ℚ(i)^× → ℂ^× で、無限位置 (z ↦ z), 有限素点では Gauss の和に関連する明示的な値を取る。

このため

$$ L(E, s) = L(\psi, s) = \sum_{(a) \subset \mathbb{Z}[i]} \frac{\psi((a))}{N(a)^s} $$

(Gauss 整数のイデアル上の Dirichlet 級数)として書ける。これは 19 世紀後半からの古典的な対象である。

---

## 6. 一般化と現代的視点

### 6.1 高次元: Shimura 多様体と CM アーベル多様体

CM 楕円曲線の高次元化として、CM アーベル多様体 (Shimura-Taniyama 1961) がある。一般に dim g の単純 abelian variety A/K で End(A) ⊗ ℚ が次数 2g の CM 体 F を含むものを CM アーベル多様体という。

これらの Galois 表現も abelian で、対応する Hecke 指標が存在する。Shimura 多様体は CM アーベル多様体の moduli を一般化したもの。

### 6.2 Hilbert 第 12 問題の現状

K = ℚ, 虚二次体以外の数体については、第 12 問題は未解決。

- **実二次体**(stark の予想): Stark 単数の予想、Brumer-Stark 予想を経由した部分的結果
- **CM 体一般**: Hilbert-Speiser-Shimura の枠組み、ただし完全な解決には程遠い
- **完全 CM 多様体の特殊値**: Yang 1990s, Goren-Lauter などの限定的進展

第 12 問題は数論幾何最古の未解決問題の一つで、未だ深い課題。

### 6.3 Coates-Wiles 定理(CM の応用)

CM 楕円曲線 E/ℚ で L(E, 1) ≠ 0 ならば、E(ℚ) は有限群である(Coates-Wiles 1977)。

これは BSD 予想の一方向 (analytic rank 0 ⇒ Mordell-Weil rank 0) の最初の証明例。CM の場合に成立する精密な岩澤理論(Coates-Wiles の Euler system construction)が証明の核心。

- 後の一般化: Gross-Zagier (1986), Kolyvagin (1989), Skinner-Urban (2014)
- これらにより BSD は anal. rank ≤ 1 の場合に多くの楕円曲線で確立

CM の場合の特殊性が、BSD という最深の予想の最初の突破口を与えた。

---

## 7. まとめ

1. CM 楕円曲線 = End(E) ⊗ ℚ が虚二次体 F に同型な楕円曲線
2. j(E) は F の Hilbert 類体 H の生成元(代数的整数)
3. F の最大 abelian 拡大 F^ab = H · F(E[∞]) は楕円関数の特殊値で記述される(Kronecker の青春の夢の虚二次体での解決)
4. CM 楕円曲線の l 進 Galois 表現は二つの Hecke 指標の和に分解
5. L(E/F, s) = L(ψ_E, s) L(\bar{ψ_E}, s) として明示的解析接続・関数等式が得られる
6. Hilbert 第 12 問題は K = ℚ, 虚二次体以外では未解決
7. CM の特殊性が Coates-Wiles 定理(BSD の最初の突破口)の動因

CM 理論は、楕円関数論・類体論・Galois 表現論・L 関数論を結びつける数論幾何の古典的な金鉱で、現代的にも prismatic コホモロジーや Fargues-Fontaine 曲線の中で新しい光を当てられ続けている。

---

> **横断メモ(数論クラスタ).** CM 楕円曲線の l 進表現が二つの Hecke 指標 $\psi_l\oplus\psi_l'$ に分解するのは、別記事「Galois 理論を線形代数として見る」の「**abelian な Galois 群 → 1 次元固有空間(指標)の和**」そのものだ ── $\det\rho=\chi_l$(円分指標)も含め、CM は「Galois 作用を指標で対角化できる」最も数論的な実例。図1 の Jugendtraum の二解(ℚ=円分=$\mu_n$ の torsion / 虚二次体=楕円曲線の torsion)は、円分・Kummer 理論(乗法群)と楕円関数(楕円曲線)の torsion という並行で、別記事「Witt と Artin–Schreier–Witt」の乗法/加法対比とも響く。岩澤・Selmer・Coates–Wiles は別記事「係数の素数とガロワ表現」§8 の CM 部分の深掘り。$j(E)$=Hilbert 類体生成・イデアル上の L 級数は「有限素点と無限素点」の虚二次体・類体の言語だ。

## 査読・限界(解説モード)

- **依拠する標準事実**:CM ⟺ End(E)⊗ℚ が虚二次体、$j(E)$ が Hilbert 類体を生成・代数的整数、CM の主定理($F^{ab}=H\cdot F(E[\infty])$、Hasse–Weber–Takagi–Shimura–Taniyama)、℘ の特殊値による生成、CM 表現の Hecke 指標分解と $L(E/F,s)=L(\psi_E,s)L(\bar\psi_E,s)$、Coates–Wiles(1977)、Kronecker–Weber。標準的な CM 理論・類体論。
- **境界(否定形)**:Hilbert 第12問題が完全解決なのは $K=\mathbb Q$ と虚二次体のみ(§6.2)。実二次体(Stark 予想)以上は未解決。CM は「abelian で指標に分解する」特殊な楕円曲線で、一般(非 CM)の楕円曲線は 2 次元既約表現を持ち保型形式(Wiles)を要する。
- 院生向けサーベイ。新規主張なし。

## 参考文献

- Silverman, *Advanced Topics in the Arithmetic of Elliptic Curves* II — CM 理論の標準的入門
- Shimura, *Introduction to the Arithmetic Theory of Automorphic Functions* (Princeton 1971) — CM 理論の体系
- Lang, *Elliptic Functions* — Weber, Kronecker の古典的構成
- Cox, *Primes of the Form x² + ny²* — Hilbert 類体, CM 楕円曲線の一般読者向け
- Schappacher, *Periods of Hecke Characters* (Springer LNM 1301) — CM と Hecke 指標
- Coates-Sujatha, *Cyclotomic Fields and Zeta Values* — Coates-Wiles の文脈
