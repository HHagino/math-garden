---
title: "係数の素数とガロワ表現 — l 進と p 進の差異、p 進ホッジ理論への入口"
date: 2026-05-23
updated: 2026-06-02
status: 墓場
audience: 中堅理工系学生〜代数的整数論に興味のある趣味の数学愛好家
prerequisite: 体論の基礎、有限ガロワ理論、Z_p の存在を知っている程度
abstract: |
  絶対ガロワ群の連続表現 ρ:G_K→GL_n(R) は、係数の素数 l と剰余標数 p の関係で地形が一変する。l≠p では線形代数の延長(エタールコホモロジー・Weil–Deligne 表現・六関手・Weil 予想)で扱えるが、l=p では破綻し p 進ホッジ理論(Fontaine の周期環・比較定理・弱許容 (φ,N)-加群)が要る。Kummer↔Artin–Schreier(乗法↔加法)、混標数↔等標数(perfectoid/tilting)、アルキメデス素点の Hodge 構造との双対、CM から岩澤・Selmer まで、l 進ガロワ表現の地図を一望する。
---

## 1. 問題設定

数論幾何において、絶対ガロワ群 G_K = Gal(K^sep/K) の連続表現

$$ \rho \colon G_K \longrightarrow \operatorname{GL}_n(R) $$

を考えるとき、係数環 R の取り方は本質的である。R = ℤ_l(または ℚ_l, 𝔽_l)とすることが多いが、ここで現れる素数 l と、基礎体 K の剰余標数 p との関係によって、世界の地形が劇的に変わる:

- **l ≠ p**(係数素数と剰余標数が異なる): 表現論は線型代数の延長として扱える
- **l = p**(両者が一致): 線型代数では済まず、**p 進ホッジ理論** という独自の領域が必要

<figure>
<svg viewBox="0 0 470 168" width="100%" style="max-width:470px;display:block;margin:8px auto" role="img" aria-label="l≠pとl=pの二つの世界">
  <g font-family="serif" font-size="10.5" fill="#2b2118">
    <text x="120" y="20" text-anchor="middle" font-size="11.5" fill="#2f5d7c">l ≠ p:線形代数の延長</text>
    <rect x="20" y="30" width="200" height="118" rx="5" fill="#eef5fa" stroke="#2f5d7c"/>
    <text x="120" y="52" text-anchor="middle">エタールコホモロジー H^i_ét</text>
    <text x="120" y="72" text-anchor="middle">Weil–Deligne 表現 (V,r,N)</text>
    <text x="120" y="92" text-anchor="middle">六関手・perverse sheaf</text>
    <text x="120" y="112" text-anchor="middle">Weil 予想・Frob 固有値</text>
    <text x="120" y="134" text-anchor="middle" font-size="9.5" fill="#8a7f6c">l に依らず綺麗に効く</text>
    <text x="350" y="20" text-anchor="middle" font-size="11.5" fill="#b1342a">l = p:p 進ホッジ理論</text>
    <rect x="250" y="30" width="200" height="118" rx="5" fill="#f6e7e3" stroke="#b1342a"/>
    <text x="350" y="52" text-anchor="middle">Fontaine 周期環 B_dR,B_cris,B_st</text>
    <text x="350" y="72" text-anchor="middle">de Rham/cris 比較定理</text>
    <text x="350" y="92" text-anchor="middle">弱許容 (φ,N)-加群</text>
    <text x="350" y="112" text-anchor="middle">prismatic・perfectoid</text>
    <text x="350" y="134" text-anchor="middle" font-size="9.5" fill="#8a7f6c">六関手は破綻、独自の道具</text>
  </g>
</svg>
<figcaption><b>図1 ─ 二つの世界.</b> 係数素数 $l$ と剰余標数 $p$ が異なれば、ガロワ表現はエタールコホモロジーと線形代数(Weil–Deligne・六関手・Weil 予想)で扱える。一致すると線形代数では閉じず、Fontaine の周期環と比較定理に基づく p 進ホッジ理論が要る。この境界が本稿の背骨。<i>(概念図)</i></figcaption>
</figure>

本稿はこの差異の所在と、両側で必要となる道具立てを概観する。さらに

1. Kummer 拡大と Artin-Schreier 拡大の対比(標数 0 vs 標数 p)
2. 混標数体と等標数体の差異と橋渡し(perfectoid)
3. アルキメデス素点における Hodge 構造との双対性
4. CM 楕円曲線から岩澤理論・Selmer 群への道

を扱う。

---

## 2. ガロワ表現の基本

### 2.1 絶対ガロワ群

体 K の分離閉包 K^sep を一つ固定する。その絶対ガロワ群

$$ G_K := \operatorname{Gal}(K^{\text{sep}}/K) = \varprojlim_{L/K \text{ finite Galois}} \operatorname{Gal}(L/K) $$

は射影極限としてのプロ有限群(コンパクト、完全不連続、Hausdorff)である。位相群として扱うのが基本で、ガロワ表現はすべて連続性を要求する。


### 2.2 分解群・惰性群・フロベニウス

K が剰余体 k(K) を持つ完備離散付値体(局所体)で、剰余標数 p のとき、K^sep の付値の延長を一つ固定する。各延長は分解群

$$ D = \operatorname{Gal}(K^{\text{sep}}/K) $$

(ここでは G_K と同一視)に対して惰性群 I ⊂ G_K を持ち、商

$$ G_K / I \cong \operatorname{Gal}(\bar k/k) \cong \hat{\mathbb{Z}} $$

を与える(k が有限体のとき)。この商の位相的生成元の任意のリフトが **算術フロベニウス** Frob_K である(慣習で幾何的フロベニウスを使うこともある)。

さらに惰性群 I は野生惰性群 P(p の Sylow プロ群)と分岐指数の方の商 I/P ≅ ∏_{q ≠ p} ℤ_q(tame 部分)に分かれる。

> 関連: 分岐指数 e と剰余次数 f の Dedekind 環レベルの扱いは [`dedekind-e-extension-f-norm.md`](./dedekind-e-extension-f-norm.md)、有限/無限素点の対比は [`finite-infinite-primes-dirichlet-unit-theorem.md`](./finite-infinite-primes-dirichlet-unit-theorem.md)。

### 2.3 連続表現と Tate 加群

具体的な G_K-加群の供給源として、楕円曲線 E/K の Tate 加群

$$ T_l(E) := \varprojlim_n E[l^n] \cong \mathbb{Z}_l^2 $$

がある。ℤ_l 上自由なランク 2 加群で、G_K が自然に作用する。テンソルして ℚ_l 化したものが

$$ V_l(E) := T_l(E) \otimes_{\mathbb{Z}_l} \mathbb{Q}_l \cong \mathbb{Q}_l^2 $$

であり、対応する ρ_{E,l}: G_K → GL_2(ℚ_l) が「楕円曲線の l 進ガロワ表現」である。

より一般に、滑らかな代数多様体 X/K のエタールコホモロジー H^i_ét(X_{K^sep}, ℚ_l) が標準的なガロワ表現を与える。

> 関連: Tate 加群の具体的構成とエタールコホモロジーの動機は [`tate-module-and-etale-cohomology.md`](./tate-module-and-etale-cohomology.md)、Galois 群を線型代数的に扱う視点は [`galois-as-linear-algebra-eigenspace.md`](./galois-as-linear-algebra-eigenspace.md)、Jacobian の代数多様体としての扱いは [`jacobian-variety-divisor-of-points.md`](./jacobian-variety-divisor-of-points.md)。

### 2.4 円分指標

特に重要な 1 次元表現が **円分指標** (cyclotomic character)

$$ \chi_l \colon G_K \to \mathbb{Z}_l^\times $$

で、これは G_K の 1 のべき乗根への作用

$$ \sigma(\zeta_{l^n}) = \zeta_{l^n}^{\chi_l(\sigma) \mod l^n} $$

によって定義される。Tate 加群 ℤ_l(1) := lim μ_{l^n} の上の作用と言ってもよい。任意の G_K-加群 V に対して

$$ V(n) := V \otimes_{\mathbb{Z}_l} \mathbb{Z}_l(1)^{\otimes n} $$

を **Tate twist** といい、ガロワ表現論の標準操作である。

### 2.5 ガロワコホモロジー

ガロワ表現 V に対する連続ガロワコホモロジー H^i(G_K, V) は、数論幾何の中心的不変量である。たとえば

- H^1(G_K, V): 拡大類、変形空間の接空間
- H^2(G_K, ℚ/ℤ): ブラウアー群(局所体のとき ℚ/ℤ そのもの)
- Tate の局所双対性: H^i(G_K, V) と H^{2-i}(G_K, V^*(1)) の完全ペアリング
- 大域 Euler 標数公式(Tate)

ガロワ表現を「分類」するとき、これらのコホモロジーが基本道具となる。

> 関連: Brauer 群と Hilbert 記号、Hasse 原理の幾何的意味は [`hasse-principle-hilbert-symbol-rational-points.md`](./hasse-principle-hilbert-symbol-rational-points.md)。

---

## 3. l 進ガロワ表現 (l ≠ p) の世界

K を p 進局所体、l を p と異なる素数とする。

### 3.1 エタールコホモロジー

滑らかな射影代数多様体 X/K に対し

$$ H^i_{\text{ét}}(X_{\bar K}, \mathbb{Q}_l) $$

は有限次元 ℚ_l ベクトル空間で、G_K の連続作用を受ける。これが l ≠ p のときに「正しく」振る舞うエタールコホモロジーである。

### 3.2 比較定理

K = ℂ 上で議論できるなら、Artin の比較定理

$$ H^i_{\text{ét}}(X_{\mathbb{C}}, \mathbb{Q}_l) \cong H^i_{\text{sing}}(X(\mathbb{C}), \mathbb{Q}) \otimes_\mathbb{Q} \mathbb{Q}_l $$

により、エタールコホモロジーは特異コホモロジーの l 進複製である。次元(=Betti 数)は l に依らない。

### 3.3 局所モノドロミー定理と Weil-Deligne 表現

K が p 進局所体で l ≠ p のとき、Grothendieck の局所モノドロミー定理が成り立つ:

> 連続表現 ρ: G_K → GL_n(ℚ_l) に対して、惰性群 I_K の作用は **準ベキ零** (quasi-unipotent)。すなわち、開部分群 I' ⊂ I が存在して ρ|_{I'} がベキ零像を持つ。

この定理により、ρ は **Weil-Deligne 表現** (V, r, N) として有限次元データで表せる:

- r: Weil 群 W_K → GL(V) の連続表現(像有限)
- N: V 上のベキ零自己準同型(モノドロミー作用素)
- 関係式: r(σ) N r(σ)^{-1} = ‖σ‖ N

ここで W_K ⊂ G_K は Weil 群(惰性群 I_K と整数べきのフロベニウスで生成される稠密部分群)。ガロワ表現の連続性は ℚ_l 位相に依存していたが、Weil-Deligne 表現は **代数的データ** として ℚ_l に依存しない記述を与える。

### 3.4 フロベニウスのトレースと L 関数

X/K が良還元 (good reduction) を持つとき、フロベニウスのトレース

$$ a_i := \operatorname{tr}(\operatorname{Frob}_K | H^i_{\text{ét}}(X_{\bar K}, \mathbb{Q}_l)) $$

は l に依存しない有理整数で、しかも Weil 予想(Deligne, 1974)により

$$ |a_i^{(j)}| = q_K^{i/2} $$

(各固有値の絶対値が q_K^{i/2}、q_K は剰余体の位数)を満たす。これにより局所 L 因子

$$ L_v(X, s) = \det(1 - \operatorname{Frob}_v q_v^{-s} | H^i_{\text{ét}}(X_{\bar K_v}, \mathbb{Q}_l))^{-1} $$

を組み立てられる(注意: 一般には惰性不変部分を取る)。大域 L 関数はこれらを v に渡ってオイラー積した

$$ L(X, s) = \prod_v L_v(X, s) $$

で定義され、関数等式、解析接続、特殊値の問題が中心問題となる。

### 3.5 大域: Chebotarev とテンソル積定理

大域体 K = 数体上のガロワ表現 ρ: G_K → GL_n(ℚ_l) は、ほとんどの素点で不分岐 (unramified)。Chebotarev 密度定理により、不分岐素点でのフロベニウスの像が ρ(G_K) の中で稠密。したがってフロベニウスのトレースの族 {tr ρ(Frob_v)}_v が ρ をほぼ決定する(Faltings の同型定理)。

ここから Galois 表現の「Tannakian な」記述が可能になり、motivic Galois group や Langlands 対応の構成的部分(局所版は Harris-Taylor、Henniart、Scholze; 大域版は GL_n の場合 Lafforgue, Vincent)が機能する。

### 3.6 l 進局所系と層

エタールサイト X_ét 上の l 進層 (lisse l-adic sheaf) は、π_1(X)^ét → GL_n(ℚ_l) の連続表現と等価。l ≠ p の世界では、Grothendieck の六関手主義 (six functor formalism) が完備で、Verdier 双対や直像・逆像が綺麗に効く。これが Beilinson-Bernstein-Deligne の perverse sheaf 論や、Lafforgue の Langlands 対応の証明の基盤となる。

l = p ではこの形式主義の多くが破綻し、対応物として **prismatic site** が近年(Bhatt-Scholze, 2018-)整備されつつある。

> 関連: l 進エタールコホモロジーの Tate 加群を出発点とする入門は [`tate-module-and-etale-cohomology.md`](./tate-module-and-etale-cohomology.md)。

---

## 4. p 進ガロワ表現 (l = p): p 進ホッジ理論

K を p 進局所体、係数も同じ素数 p で取る。

### 4.1 困難の所在

形式的には H^i_ét(X_{\bar K}, ℚ_p) を定義することはできる。しかし

- 標数 p の有限体への還元と整合させようとすると、表現論的に「正しい」情報を保たない
- 比較定理が単純な形では成立しない
- 例: 楕円曲線 E/ℚ_p について、H^1_ét(E_{\bar{ℚ}_p}, ℚ_p) は ℚ_p^2 だが、その G_{ℚ_p} 加群構造は de Rham コホモロジーや crystalline コホモロジーと "比較" して初めて精緻に解読できる

p 進ガロワ表現の研究は、エタール側だけでは閉じない。

### 4.2 Fontaine の周期環

Fontaine (1980s-) は次の階層の位相環を導入した:

$$ \mathbb{Q}_p \subset B_{\text{HT}} \subset B_{\text{dR}}, \qquad B_{\text{cris}} \subset B_{\text{st}} \subset B_{\text{dR}}. $$

各々の構成は技術的だが、概要:

- **B_dR**(de Rham 周期環): ℂ_p の完備化に類似の構成、自然なフィルター F^i B_dR を持つ離散付値体
- **B_HT**(Hodge-Tate 周期環): ⊕_{i ∈ ℤ} ℂ_p(i)、最も粗い
- **B_cris**(crystalline 周期環): フロベニウス φ を持つ
- **B_st**(semistable 周期環): モノドロミー作用素 N と φ を持つ、N φ = p φ N

全てに G_{ℚ_p} が自然に連続作用する。これらは p 進的な「周期積分」を係数として実現したものと見なせる。

### 4.3 比較定理

X/ℚ_p を滑らかな射影多様体とする。

**de Rham 比較**(Faltings, Niziol, Tsuji):

$$ H^i_{\text{ét}}(X_{\bar{\mathbb{Q}}_p}, \mathbb{Q}_p) \otimes_{\mathbb{Q}_p} B_{\text{dR}} \cong H^i_{\text{dR}}(X/\mathbb{Q}_p) \otimes_{\mathbb{Q}_p} B_{\text{dR}} $$

(G_{ℚ_p} 同変, フィルター付き同型)

**crystalline 比較**(良還元のとき):

$$ H^i_{\text{ét}}(X_{\bar{\mathbb{Q}}_p}, \mathbb{Q}_p) \otimes_{\mathbb{Q}_p} B_{\text{cris}} \cong H^i_{\text{cris}}(X_0/\mathbb{Z}_p) \otimes_{\mathbb{Z}_p} B_{\text{cris}} $$

ここで X_0 は X の特殊ファイバー、H^i_cris は crystalline コホモロジー。

これらの比較定理によって、p 進ガロワ表現は線型代数的データ(フィルター付き (φ, N)-加群)に翻訳される。

### 4.4 表現の分類

p 進ガロワ表現 V に対して、Fontaine 関手

$$ D_*(V) := (V \otimes_{\mathbb{Q}_p} B_*)^{G_K} $$

(* ∈ {HT, dR, st, cris})を考える。階層

$$ \text{crystalline} \subset \text{semistable} \subset \text{de Rham} \subset \text{Hodge-Tate} $$

に従って表現が分類される:

- **Hodge-Tate**: V ⊗ ℂ_p が ⊕ ℂ_p(i_j) と分解(Hodge-Tate 重み)
- **de Rham**: dim_K D_dR(V) = dim_{ℚ_p} V
- **semistable**: dim_K D_st(V) = dim_{ℚ_p} V(N, φ 構造込み)
- **crystalline**: dim_K D_cris(V) = dim_{ℚ_p} V

<figure>
<svg viewBox="0 0 440 184" width="100%" style="max-width:440px;display:block;margin:8px auto" role="img" aria-label="p進ガロワ表現の分類の階層">
  <g font-family="serif" font-size="10.5" fill="#2b2118">
    <rect x="20" y="16" width="400" height="152" rx="6" fill="#fbf6ec" stroke="#6b5d44"/><text x="220" y="34" text-anchor="middle" font-size="10.5" fill="#6b5d44">Hodge–Tate(V⊗ℂ_p が ⊕ℂ_p(i) に分解)</text>
    <rect x="44" y="44" width="352" height="116" rx="5" fill="#f4ede0" stroke="#8a7f6c"/><text x="220" y="62" text-anchor="middle" fill="#8a7f6c">de Rham(D_dR が満次元)── 幾何起源(Faltings)</text>
    <rect x="70" y="72" width="300" height="80" rx="4" fill="#eef5fa" stroke="#2f5d7c"/><text x="220" y="90" text-anchor="middle" fill="#2f5d7c">semistable(D_st、N・φ 構造)── 半安定還元</text>
    <rect x="100" y="100" width="240" height="44" rx="4" fill="#eef1ea" stroke="#5a6e4a"/><text x="220" y="120" text-anchor="middle" fill="#5a6e4a">crystalline(D_cris、N=0)</text>
    <text x="220" y="138" text-anchor="middle" font-size="9.5" fill="#8a7f6c">良還元から来る</text>
  </g>
</svg>
<figcaption><b>図2 ─ p 進ガロワ表現の分類.</b> crystalline ⊊ semistable ⊊ de Rham ⊊ Hodge–Tate。Fontaine 関手 $D_*(V)=(V\otimes B_*)^{G_K}$ の満次元性で判定する。幾何起源は de Rham、半安定還元は semistable、良還元は crystalline ── 内側ほど特殊ファイバーの特異性が小さい。$l\neq p$ の Weil–Deligne 表現に対応する $l=p$ 側の構造だ。<i>(概念図)</i></figcaption>
</figure>

幾何起源のガロワ表現は de Rham(Faltings の定理)。良還元から来るものは crystalline。半安定還元から来るものは semistable。これらの間の差は、特殊ファイバーがどれだけ特異かを反映する。

### 4.5 弱許容加群と Colmez-Fontaine

逆方向: フィルター付き (φ, N)-加群 D から p 進 ガロワ表現 V_st(D) を作る関手が存在する。Colmez-Fontaine (2000) の定理:

> 弱許容 (weakly admissible) フィルター付き (φ, N)-加群と semistable p 進ガロワ表現は圏同値。

これは p 進ガロワ表現の研究を線型代数(フィルター付き加群)に完全に還元する強力な定理であり、p 進ホッジ理論の代数的核心の一つである。

### 4.6 Hodge-Tate 分解

Tate (1967) の予想として始まり、Faltings (1988) が証明した:

> 数体 K 上の代数多様体 X に対し、p ≠ 0 のとき自然な G_K-同変同型

$$ H^n_{\text{ét}}(X_{\bar K}, \mathbb{Q}_p) \otimes_{\mathbb{Q}_p} \mathbb{C}_p \cong \bigoplus_{i+j=n} H^j(X, \Omega^i_{X/K}) \otimes_K \mathbb{C}_p(-i). $$

これは複素ホッジ分解の p 進類似であり、p 進ガロワ表現と複素 Hodge 構造の深い類縁性を示している。

---

## 5. Kummer 理論と Artin-Schreier 理論

p 進と l 進の差異を、最も古典的な場面 — 巡回拡大の構成 — で見直す。

### 5.1 Kummer 理論(標数が n と素)

体 K が原始 n 乗根 ζ_n を含み、char(K) ∤ n とする。次の自然な完全列(Kummer 完全列)

$$ 1 \to \mu_n \to K^{\text{sep},\times} \xrightarrow{x \mapsto x^n} K^{\text{sep},\times} \to 1 $$

から、ガロワコホモロジーで

$$ H^1(G_K, \mu_n) \cong K^\times / (K^\times)^n. $$

このため K の指数 n の abelian 拡大は K^\times / (K^\times)^n と一対一対応し、各拡大は K(√[n]{a}) の形を取る。

要点: **Kummer 理論は K の乗法群 K^\times を扱う。乗法的、有限生成、計算しやすい**。

> 関連: Kummer 拡大は可解群 → ラジカル可解性の連鎖の最後の段階を成す。可解群の Galois 理論的特徴づけは [`solvable-group-radical-solvability-galois.md`](./solvable-group-radical-solvability-galois.md)、5 次方程式の可解性分類は [`galois-quintic-solvable-classification.md`](./galois-quintic-solvable-classification.md)。

### 5.2 Artin-Schreier 理論(標数 p, 指数 p)

K が標数 p の体のとき、x^p = a 型の方程式は新しい体拡大を作らない(Frobenius が単射、x^p - a = (x - a^{1/p})^p)。代わりに

$$ \wp \colon K \to K, \quad \wp(x) := x^p - x $$

(Artin-Schreier 演算子)を考え、Artin-Schreier 完全列

$$ 0 \to \mathbb{F}_p \to K^{\text{sep}} \xrightarrow{\wp} K^{\text{sep}} \to 0. $$

このコホモロジー長完全列から

$$ H^1(G_K, \mathbb{F}_p) \cong K / \wp(K). $$

K の指数 p の巡回拡大は K / ℘(K) と一対一対応し、各拡大は K(α) (℘(α) = a) の形である。

要点: **Artin-Schreier 理論は K の加法群を扱う。加法的、無限次元(指数 p の場合)**。

Kummer 理論が乗法的だったのに対し、Artin-Schreier 理論は加法的に振る舞う。標数 p の体ではこれが p に関するガロワ理論の標準である。

### 5.3 Artin-Schreier-Witt 理論(p^n 次)

p^n 次の巡回拡大を扱うには、Witt ベクトル環 W_n(K) を用いた

$$ \wp \colon W_n(K) \to W_n(K), \quad \wp(\mathbf{x}) := F(\mathbf{x}) - \mathbf{x} $$

(F は Witt フロベニウス)による Artin-Schreier-Witt 完全列を考える:

$$ 0 \to \mathbb{Z}/p^n\mathbb{Z} \to W_n(K^{\text{sep}}) \xrightarrow{\wp} W_n(K^{\text{sep}}) \to 0. $$

これにより H^1(G_K, ℤ/p^n) ≅ W_n(K)/℘W_n(K)。Witt ベクトルの計算は明示的だが煩雑(典型例として加法則が多項式的に複雑)。

> 関連: Witt ベクトル環の明示的構成と Artin-Schreier-Witt 完全列の独立扱いは [`witt-vectors-artin-schreier-witt.md`](./witt-vectors-artin-schreier-witt.md)。

### 5.4 Lubin-Tate 形式群による局所類体論

混標数の局所体 K(剰余標数 p)の最大 abel 拡大 K^ab の明示的構成は、Lubin-Tate 理論によって与えられる:

K の素元 π を固定し、対応する Lubin-Tate 形式群法則 F(X, Y) ∈ 𝒪_K[[X, Y]] を構成する。F の π べきにおける torsion 点

$$ F[\pi^n] := \{\alpha \in \mathfrak{m}_{\bar K} \mid [\pi^n]_F(\alpha) = 0\} $$

の座標を添加すると、K の完全な分岐 abel 拡大の塔

$$ K \subset K_1 \subset K_2 \subset \cdots, \quad K_n = K(F[\pi^n]) $$

を得る。ここで 𝒢al(K_n/K) ≅ (𝒪_K/π^n)^×。これと不分岐拡大の塔(剰余体側の Frobenius)の合成で K^ab 全体が記述される。

Lubin-Tate 形式群は、混標数 p 進局所体における「乗法群 𝔾_m の高次類似」と見なせる。標数 0 の Kummer 理論が(K に 1 のべき乗根があれば)𝔾_m の torsion で拡大を作るのと並行する構造である。等標数の F_p((t)) 上では Carlitz module や Drinfeld module が類似の役割を果たす。

> 関連: イデアル類群と Hilbert 類体の反変的視点は [`ideal-contravariance-hilbert-class-field.md`](./ideal-contravariance-hilbert-class-field.md)。

---

## 6. 混標数 vs 等標数

### 6.1 局所体の二類型

完備離散付値体 K の二種類:

- **混標数**: char(K) = 0, char(剰余体) = p > 0。典型例: ℚ_p, ℚ_p の有限拡大、ℂ_p
- **等標数**: char(K) = char(剰余体) = p > 0。典型例: 𝔽_p((t)), 完全 (perfect) でない剰余体の場合は 𝔽_p((t))(t^{1/p}) など

両者は数論的に並行する側面(p 進ホッジ理論の rigid analytic geometry, 形式群論)を持つ一方、決定的な差もある。

> 関連: p 進数の出発点(Hensel の補題、√2 の mod 8 解読)は [`pythagoras-sqrt2-p-adic-mod-8.md`](./pythagoras-sqrt2-p-adic-mod-8.md)。

### 6.2 不完全剰余体の問題

等標数 p の体では、剰余体が **完全 (perfect)** でないことがある(等標数 p の高次元局所体に典型)。このとき:

- Frobenius が剰余体上で全射でない
- 加法的 Kähler 微分 Ω^1 が非自明な役割を果たす
- de Rham-Witt 複体の構造が混標数の場合と異なる

これは現代的な p 進ホッジ理論の難所の一つで、Scholze の perfectoid 理論や Bhatt-Morrow-Scholze の積分的 p 進ホッジ理論が大きな進展を与えた。

### 6.3 Field of norms (Fontaine-Wintenberger)

Fontaine-Wintenberger (1979) の根本的観察:

> K を混標数局所体、L/K を **strictly arithmetically profinite (APF)** 無限分岐拡大とする(典型例: 円分塔 K_∞ = ∪ K(ζ_{p^n}))。このとき、L の「ノルム体」 X_K(L) が定義でき、これは等標数 p の局所体である。さらに、両者の絶対ガロワ群は同型:

$$ G_L \cong G_{X_K(L)}. $$

これによって、混標数の特定のガロワ表現の研究が、等標数の世界に翻訳できる。Fontaine の (φ, Γ)-加群理論の基盤がここにある。

### 6.4 Perfectoid と tilting (Scholze, 2012)

Scholze の perfectoid 理論は、上の Fontaine-Wintenberger 構成を **空間レベル** に拡張した革命的な発見である。

**Perfectoid 体** K (混標数の場合の典型): ℚ_p の完備化に近い、Frobenius が剰余体上で全射、value group が p で割り切れる、などの性質を満たす完備位相体。

**Tilting**: K^♭ := lim_{x ↦ x^p} K(積位相)。これは標数 p の perfectoid 体。

主要定理(Scholze):

$$ \text{Perfectoid 空間}(K) \xleftrightarrow{\sim} \text{Perfectoid 空間}(K^\flat) $$

混標数の rigid analytic 幾何が、等標数の世界に完全に翻訳される。p 進ホッジ理論の多くの問題が、この tilting を経由して扱いやすい等標数側で解かれた後、混標数側に戻される。Fargues-Fontaine 曲線、prismatic site、近年の Langlands 局所対応の証明など、いずれも perfectoid 機構の上で進展した。

> 関連: Perfectoid 体の定義、tilting の動機、Fontaine-Wintenberger との関係の独立扱いは [`perfectoid-tilting-motivation.md`](./perfectoid-tilting-motivation.md)。

---

## 7. アルキメデス素点と Hodge 構造

数体 K = ℚ の素点には有限素点 (p) だけでなくアルキメデス素点 ∞ がある。adelic 視点ではこれらを並列に扱う。

### 7.1 Gal(ℂ/ℝ) と複素共役

ℝ の絶対ガロワ群は

$$ \operatorname{Gal}(\mathbb{C}/\mathbb{R}) = \langle c \rangle \cong \mathbb{Z}/2\mathbb{Z} $$

(c は複素共役)。これが「無限素点 ∞ の局所ガロワ群」である。ℝ への各埋め込み K ↪ ℝ ごとに G_K 内に「∞ における分解群」を持ち、その作用が複素共役。

> 関連: 有限素点と無限素点の対比 (Dirichlet の単数定理経由) は [`finite-infinite-primes-dirichlet-unit-theorem.md`](./finite-infinite-primes-dirichlet-unit-theorem.md)。

### 7.2 Hodge 構造とその混合版

ℂ 上の代数多様体 X に対し、特異コホモロジー H^n(X(ℂ), ℂ) は **純 Hodge 構造** を持つ:

$$ H^n(X(\mathbb{C}), \mathbb{C}) = \bigoplus_{p+q=n} H^{p,q}(X), \quad \overline{H^{p,q}} = H^{q,p}. $$

これに対応する実構造は Gal(ℂ/ℝ) 作用と整合する。Deligne (1971-74) の混合 Hodge 理論はこれを特異・非コンパクト多様体に拡張し、混合 Hodge 構造の概念を与えた。

### 7.3 p 進 Hodge との対応

p 進 Hodge 理論 ↔ 古典的 Hodge 理論の対応辞書(粗く):

| アルキメデス側 | p 進側 |
|---|---|
| Hodge 構造 (H^{p,q}) | Hodge-Tate 重み |
| 複素共役の作用 | Frobenius φ |
| 実構造 | 自己同型 G_{ℚ_p} 作用 |
| 混合 Hodge 構造 | de Rham 表現の階層構造 |
| ヤコビアン期間積分 | Fontaine の周期環 |

両者は **motive** という未だ部分的にしか定義されていない圏で統一されることが期待される。Grothendieck の motive 圏が完成すれば、これらすべては一つの対象の「実現 (realization)」になる。

### 7.4 L 関数とアルキメデス・ファクター

大域 L 関数 L(X, s) には有限素点からの Euler 因子(§3.4 参照)に加えてアルキメデス因子 L_∞(X, s) が必要である。たとえば Riemann zeta なら

$$ \xi(s) := \pi^{-s/2} \Gamma(s/2) \zeta(s) $$

の Γ(s/2) 部分が L_∞ である。これは Hodge 構造から(Deligne の公式により)系統的に構成され、関数等式 ξ(s) = ξ(1-s) を実現する。Γ 因子こそ「アルキメデス素点における Frobenius のトレース」の代替物と言える。

---

## 8. CM 楕円曲線から岩澤・Selmer まで

p 進ガロワ表現論の主要応用領域として、CM 楕円曲線まわりの数論を概観する。

### 8.1 CM 楕円曲線

楕円曲線 E が **complex multiplication (CM)** を持つとは、End(E) ⊗ ℚ が虚二次体 K に同型なこと。例: E: y^2 = x^3 - x は CM by ℤ[i]。

CM 楕円曲線のガロワ表現 ρ_{E,l}: G_ℚ → GL_2(ℚ_l) は次の特別な構造を持つ:

- G_K 上で abel(G_K ↪ G_ℚ への制限が 1 次元表現の和)
- 対応する Hecke 指標 ψ_E: 𝔸_K^× / K^× → ℂ^× が存在
- L(E, s) = L(ψ_E, s) L(\bar ψ_E, s) (二つの Hecke L 関数の積)

### 8.2 Kronecker の青春の夢

K = 虚二次体に対し、E を K による CM 楕円曲線とする。E の n 等分点の座標 j(E), x(P)(P ∈ E[n]) を K に添加して得られる体 K(E[n]) は、K のアーベル拡大の本質的部分を生成する(Hasse, Weber, Takagi)。これが Kronecker の青春の夢 (Jugendtraum) の K = 虚二次体での具現化、Hilbert 第 12 問題の唯一完全解決された場合である。

> 関連: CM 楕円曲線の定義、Hecke 指標との対応、Hilbert 第12問題の現状の独立扱いは [`cm-elliptic-curves-kronecker-jugendtraum.md`](./cm-elliptic-curves-kronecker-jugendtraum.md)。

### 8.3 岩澤理論

K の円分塔 K_∞ := ∪_n K(ζ_{p^n}) を取り、Γ := Gal(K_∞/K) ≅ ℤ_p とおく。岩澤代数

$$ \Lambda := \mathbb{Z}_p[[\Gamma]] \cong \mathbb{Z}_p[[T]] $$

(後者の同型は γ - 1 ↔ T、γ は Γ の生成元)。

岩澤の主予想(Mazur-Wiles 1984, Wiles 1990 for totally real, Skinner-Urban 2014 for GL_2 over ℚ など):

$$ \text{char}_\Lambda(X_\infty) = (L_p) $$

ここで X_∞ は岩澤加群(イデアル類群の射影極限あるいは Selmer 群の双対の射影極限)、L_p は p 進 L 関数(Kubota-Leopoldt zeta またはその一般化)。

これは

- 解析側: p 進 L 関数(p 進的に補間された特殊値)
- 代数側: Galois 加群の特性多項式

が等しい、という p 進的な「保型形式と Galois 表現の対応」の特殊版である。

### 8.4 Selmer 群

楕円曲線 E/ℚ に対し、Selmer 群

$$ \operatorname{Sel}_{p^\infty}(E/\mathbb{Q}) := \ker\left( H^1(G_\mathbb{Q}, E[p^\infty]) \to \prod_v H^1(G_{\mathbb{Q}_v}, E(\bar{\mathbb{Q}}_v)) \right) $$

は

- 完全列 0 → E(ℚ) ⊗ ℚ_p/ℤ_p → Sel_{p^∞}(E/ℚ) → Ш(E/ℚ)[p^∞] → 0
- BSD 予想 ⇔ rank(E(ℚ)) = corank_{ℤ_p}(Sel_{p^∞}(E/ℚ))(の精密版)

を介して有理点と直結している。

### 8.5 Coates-Wiles 定理

CM 楕円曲線 E/ℚ で L(E, 1) ≠ 0 ならば、E(ℚ) は有限群である(Coates-Wiles 1977)。これは BSD 予想の(一方向の)最初の証明例で、岩澤理論と CM の特殊性を使う。Gross-Zagier, Kolyvagin の Euler system による拡張を経て、Skinner-Urban, Wan などの現代の進展に至る。

> 関連: 円分塔・岩澤代数 Λ・主予想・Selmer 群の独立した導入は [`iwasawa-theory-selmer-introduction.md`](./iwasawa-theory-selmer-introduction.md)。

---

> **横断メモ・位置づけ(on-mission の最深部).** 本記事は庭の数論・Galois 側の最も深いハブで、本文中に豊富な相互リンクを既に張ってある(probability-galois-tower=filtration↔Galois の第一論文起点、tate-module、galois-as-linear-algebra、finite-infinite-primes、hasse、solvable/quintic、witt、perfectoid、cm-elliptic、iwasawa-selmer)。一貫する背骨は「**Galois 群の作用を線形代数(表現・固有値・指標)に翻訳する**」で、$l\neq p$ ではそれがそのまま効き、$l=p$ では周期環という別の翻訳が要る、という一段深い話だ。**§8 の岩澤理論・Selmer は標準的な Mazur–Wiles / Coates–Wiles の数論**であり、確率版・統計ゼータといった凍結中の個人プログラムとは別物(本記事は on-mission の標準 arith-geom 解説)。

## 査読・限界(解説モード)

- **引用する深い定理群(本記事は証明しない)**:Grothendieck 局所モノドロミー定理、Weil 予想(Deligne)、Faltings 同型定理・Hodge–Tate 分解、Colmez–Fontaine(弱許容 ⇄ semistable の圏同値)、Fontaine–Wintenberger(field of norms)、Scholze の perfectoid/tilting、Mazur–Wiles の岩澤主予想、Coates–Wiles、Kronecker の青春の夢(虚二次体)。いずれも標準的だが深く、参考文献に委ねる。
- **境界(否定形・本稿の背骨)**:$l\neq p$ で六関手・Weil–Deligne がきれいに効き、$l=p$ で破綻して p 進ホッジ理論・prismatic が要る(§4・図1)。等標数の不完全剰余体や $l=p$ 局所系も同じ難所。
- 院生〜愛好家向けの advanced サーベイ。新規定理の主張はなく、l 進/p 進ガロワ表現の地図。

## 9. 参考文献

#### 入門〜中級

- Silverman, *The Arithmetic of Elliptic Curves* (Springer GTM 106) — Tate 加群と l 進ガロワ表現の最初の出会い
- Neukirch, *Algebraic Number Theory* — Kummer/Artin-Schreier, 局所体, アルキメデス素点
- Serre, *Local Fields* — 局所体論の聖典

#### l 進と étale 側

- Milne, *Étale Cohomology*(プリンストン本もしくは lecture notes 版) — l ≠ p の世界の標準
- Freitag-Kiehl, *Étale Cohomology and the Weil Conjecture*
- Deligne, *Cohomologie Étale* (SGA 4½)

#### p 進ホッジ理論

- Brinon-Conrad, *p-adic Hodge theory* (CMI Summer School 2009 notes) — 標準的入門
- Berger, *An introduction to the theory of p-adic representations*
- Fontaine-Ouyang, *Theory of p-adic Galois representations* (preprint book)
- Bhatt, *Prismatic cohomology* lecture notes (2018-)

#### 岩澤理論・BSD

- Coates-Sujatha, *Cyclotomic Fields and Zeta Values*
- Washington, *Introduction to Cyclotomic Fields*
- Greenberg, *Iwasawa Theory for Elliptic Curves* (CIME notes)
- Skinner-Urban, *The Iwasawa main conjectures for GL_2* (Invent. Math. 2014)

#### Perfectoid と現代の発展

- Scholze, *Perfectoid spaces* (Publ. IHES 2012)
- Bhatt-Morrow-Scholze, *Integral p-adic Hodge theory* (Publ. IHES 2018)
- Fargues-Scholze, *Geometrization of the local Langlands correspondence* (2021)
