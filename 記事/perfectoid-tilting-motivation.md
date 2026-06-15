---
title: "Perfectoid と tilting — 混標数と等標数を架橋する"
date: 2026-05-23
updated: 2026-06-02
status: 墓場
audience: p 進数体・形式群論・rigid analytic 幾何の基礎を一度通った人向け
prerequisite: 完備離散付値体、p 進数 ℚ_p, ℂ_p、Frobenius
abstract: |
  p 進局所体には混標数(ℚ_p系、char 0/剰余 p)と等標数(𝔽_p((t))系、char p)の二つの宇宙がある。Frobenius が canonical な等標数の方が解きやすく、数論的応用は混標数を要する。両者を翻訳する道具が、体レベルの Fontaine–Wintenberger(field of norms、G_L≅G_{X_K(L)})と、それを空間レベルへ拡張した Scholze の perfectoid/tilting(K↦K^♭=lim_{x↦x^p}K、G_K≅G_{K^♭})だ。等標数で解いて混標数へ戻す ── 重み単項化・Fargues–Fontaine 曲線・prismatic・局所 Langlands の幾何化を支える機構を概観する。
---

## 1. 動機 — なぜ二つの世界を「架橋」する必要があるか

p 進局所体には二つの並行する宇宙がある:

- **混標数**: K = ℚ_p の有限拡大、ℂ_p、…(基礎体は標数 0、剰余体は標数 p)
- **等標数**: K = 𝔽_p((t)) の有限拡大、…(基礎体も剰余体も標数 p)

両者は数論的に多くの並行する構造を持つが、決定的な差もある:

- 混標数は ℤ に近い(Hensel の補題、p 進類体論、ガロワ表現論が綺麗)
- 等標数は函数体に近い(Frobenius が canonical、対称性が高い)

特定の幾何的問題は等標数側の方が解きやすく、特定の数論的応用は混標数側を必要とする。両者を相互に翻訳する道具があれば、解析的に解いた結果を数論側に持ち込めることになる。

この翻訳を最初に与えたのが **Fontaine-Wintenberger (1979)** の field of norms construction、それを **空間レベル** に拡張したのが **Scholze (2012)** の perfectoid 理論である。本稿はその動機と基本構造を扱う。

<figure>
<svg viewBox="0 0 470 168" width="100%" style="max-width:470px;display:block;margin:8px auto" role="img" aria-label="tiltingによる混標数と等標数の架橋">
  <defs><marker id="pt1" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#5a4f3f"/></marker></defs>
  <g font-family="serif" font-size="10.5" fill="#2b2118">
    <rect x="18" y="36" width="172" height="86" rx="5" fill="#eef5fa" stroke="#2f5d7c"/>
    <text x="104" y="30" text-anchor="middle" font-size="11" fill="#2f5d7c">混標数 K</text>
    <text x="104" y="58" text-anchor="middle">char 0 / 剰余 p</text>
    <text x="104" y="78" text-anchor="middle">ℚ_p, ℂ_p, ℚ_p(p^{1/p^∞})^∧</text>
    <text x="104" y="98" text-anchor="middle" font-size="9.5" fill="#8a7f6c">数論的応用に必要</text>
    <rect x="280" y="36" width="172" height="86" rx="5" fill="#f6e7e3" stroke="#b1342a"/>
    <text x="366" y="30" text-anchor="middle" font-size="11" fill="#b1342a">等標数 K^♭</text>
    <text x="366" y="58" text-anchor="middle">char p</text>
    <text x="366" y="78" text-anchor="middle">𝔽_p((t^{1/p^∞}))^∧</text>
    <text x="366" y="98" text-anchor="middle" font-size="9.5" fill="#8a7f6c">Frobenius canonical・解きやすい</text>
    <!-- bridge -->
    <line x1="190" y1="62" x2="280" y2="62" stroke="#5a4f3f" stroke-width="1.4" marker-end="url(#pt1)"/><text x="235" y="54" text-anchor="middle" font-size="9.5" fill="#5a4f3f">tilting K↦K^♭</text>
    <line x1="280" y1="96" x2="190" y2="96" stroke="#c89b3c" stroke-width="1.4" marker-end="url(#pt1)"/><text x="235" y="112" text-anchor="middle" font-size="9.5" fill="#c89b3c">解いて戻す</text>
    <text x="235" y="146" text-anchor="middle" font-size="10" fill="#b1342a">G_K ≅ G_{K^♭}(絶対 Galois 群が同型)</text>
  </g>
</svg>
<figcaption><b>図1 ─ tilting の架橋.</b> 混標数 $K$ と等標数 $K^\flat$ は tilting で結ばれ、絶対 Galois 群が同型 $G_K\cong G_{K^\flat}$。Frobenius が canonical で解きやすい等標数側で問題を解き、結果を混標数へ戻す ── これが Scholze 機構の戦略だ。<i>(概念図)</i></figcaption>
</figure>

---

## 2. Field of norms (Fontaine-Wintenberger, 1979)

### 2.1 設定

K を混標数の局所体(典型例: ℚ_p)、L/K を **strictly arithmetically profinite (APF)** 無限拡大とする。これは大まかに

- L/K がガロワ拡大
- L = ∪_n L_n と有限次部分体の列で書ける
- 分岐の濃度が制御されている(precise definition は技術的)

典型例: 円分塔 K_∞ := ∪_n K(ζ_{p^n})。

### 2.2 ノルム体の構成

L/K の中の有限次部分拡大 L_n を取り、各レベルの uniformizer π_n ∈ L_n を選ぶ。これらをノルム写像 N_{L_{n+1}/L_n} で繋ぐ:

$$ X_K(L) := \varprojlim_n L_n^\times \cup \{0\} $$

(ノルム写像による射影極限)。Fontaine-Wintenberger の構成では、これに環構造を入れる:

- 加法は適切な極限操作で定義
- 乗法は座標ごとの積

得られる X_K(L) は **等標数 p の完備離散付値体** となる。

### 2.3 ガロワ群の同型

Fontaine-Wintenberger の主定理:

$$ G_L \cong G_{X_K(L)}. $$

すなわち、混標数の塔 L 上の絶対 Galois 群と、対応する等標数の Field of norms 上の絶対 Galois 群は標準的に同型である。

これによって、混標数の塔上の Galois 表現の研究が、等標数の体上の Galois 表現の研究に翻訳できる。Fontaine の **(φ, Γ)-加群理論** はこの構造に基づいており、p 進ガロワ表現の研究に革命的な道具を与えた。

### 2.4 限界

Fontaine-Wintenberger 構成には限界がある:

- 体レベルでの構成。空間(スキーム、formal scheme、rigid analytic space)に直接拡張できない
- APF 拡大という条件が必要で、一般の無限拡大には適用できない

Scholze の perfectoid 理論はこれを克服する。

---

## 3. Perfectoid 体の定義

### 3.1 定義(Scholze 2012)

完備位相体 K が **perfectoid** であるとは:

1. K の付値環 𝒪_K = {x ∈ K : |x| ≤ 1} は非離散
2. K^× の付値群 |K^×| ⊂ ℝ_{>0} は p で割り切れる(value group is p-divisible)
3. Frobenius φ: 𝒪_K/p → 𝒪_K/p (x ↦ x^p) が全射

### 3.2 具体例

**混標数の perfectoid 体:**

- ℂ_p(ℚ_p の代数閉包の完備化)
- ℚ_p(ζ_{p^∞})^∧ (= ℚ_p^{cycl,∧} とも書く)
- ℚ_p(p^{1/p^∞})^∧

**等標数の perfectoid 体:**

- 𝔽_p((t^{1/p^∞}))^∧
- (𝔽_p^{alg})((t))^∧ の perfect 化
- 一般に、標数 p の完備位相体で Frobenius が全射なもの

### 3.3 非例

- ℚ_p:value group が ℤ で、p で割り切れない。perfectoid ではない
- 𝔽_p((t)):Frobenius が 𝔽_p((t))/p で全射(自分自身)になるが、value group が ℤ なので条件 2 を満たさず perfectoid ではない(perfect closure を取れば perfectoid)

要点: **perfectoid 体は通常の局所体に "perfect 化"(p-べき根を全部添加して完備化)した完備化として得られる**。

---

## 4. Tilting — 混標数を等標数に変換する操作

### 4.1 構成

K を混標数の perfectoid 体とする。**tilting** (傾斜) を

$$ K^\flat := \varprojlim_{x \mapsto x^p} K $$

(積位相付き、Frobenius による逆極限)で定義する。具体的には

$$ K^\flat = \{(x_0, x_1, x_2, \ldots) \in K^{\mathbb{N}} : x_{i+1}^p = x_i\}. $$

<figure>
<svg viewBox="0 0 460 120" width="100%" style="max-width:460px;display:block;margin:8px auto" role="img" aria-label="K^♭はFrobeniusに沿った逆極限">
  <defs><marker id="pt2" markerWidth="8" markerHeight="8" refX="2" refY="3" orient="auto"><path d="M6 0 L0 3 L6 6 z" fill="#5a4f3f"/></marker></defs>
  <g font-family="serif" font-size="11" fill="#2b2118">
    <text x="60" y="50" text-anchor="middle">x₀</text>
    <text x="150" y="50" text-anchor="middle">x₁</text>
    <text x="240" y="50" text-anchor="middle">x₂</text>
    <text x="312" y="50" text-anchor="middle">⋯</text>
    <line x1="104" y1="46" x2="80" y2="46" stroke="#5a4f3f" stroke-width="1.3" marker-end="url(#pt2)"/><text x="92" y="36" font-size="8.5" fill="#8a7f6c">(·)^p</text>
    <line x1="194" y1="46" x2="170" y2="46" stroke="#5a4f3f" stroke-width="1.3" marker-end="url(#pt2)"/><text x="182" y="36" font-size="8.5" fill="#8a7f6c">(·)^p</text>
    <line x1="284" y1="46" x2="260" y2="46" stroke="#5a4f3f" stroke-width="1.3" marker-end="url(#pt2)"/>
    <text x="60" y="70" text-anchor="middle" font-size="8.5" fill="#8a7f6c">x₁^p=x₀</text>
    <text x="150" y="70" text-anchor="middle" font-size="8.5" fill="#8a7f6c">x₂^p=x₁</text>
    <rect x="356" y="32" width="96" height="28" rx="4" fill="#f6e7e3" stroke="#b1342a"/><text x="404" y="51" text-anchor="middle" font-size="10">K^♭(char p)</text>
    <text x="230" y="100" text-anchor="middle" font-size="10" fill="#b1342a">Frobenius (x↦x^p) に沿った逆極限 ── 加法は p^j 乗で極限調整、乗法は座標ごと</text>
  </g>
</svg>
<figcaption><b>図2 ─ $K^\flat$ は Frobenius 逆極限.</b> $p$ 乗で繋いだ列 $(x_0,x_1,\dots)$($x_{i+1}^p=x_i$)が tilting $K^\flat$。perfectoid 条件(Frobenius が剰余で全射・value 群が $p$-可除)が、加法の極限 $\lim_j(x_{i+j}+y_{i+j})^{p^j}$ の存在を保証する。混標数 $K$ から等標数 $K^\flat$ が生まれる。<i>(概念図)</i></figcaption>
</figure>

これに対し:

- 加法: (x_i) + (y_i) := (lim_{j → ∞} (x_{i+j} + y_{i+j})^{p^j}) (極限が存在することは perfectoid 条件から保証)
- 乗法: 座標ごとの積

定理: K が混標数の perfectoid 体なら、K^♭ は等標数 p の perfectoid 体である。

### 4.2 例

**K = ℂ_p:**

K^♭ = ℂ_p^♭ は 𝔽_p^{alg}((t^{1/p^∞}))^∧ の perfectoid 完備化と同型

**K = ℚ_p(p^{1/p^∞})^∧:**

K^♭ = 𝔽_p((t^{1/p^∞}))^∧、ここで t = (p^{1/p^∞}) の像

### 4.3 ガロワ群の同型

Scholze の主定理:

$$ G_K \cong G_{K^\flat}. $$

すなわち、混標数 perfectoid 体 K の絶対 Galois 群と、その tilting K^♭ の絶対 Galois 群は標準的に同型である。これは Fontaine-Wintenberger の体レベルの定理を、(より広いクラスの) perfectoid 体に拡張したものである。

### 4.4 値群と剰余体の対応

- K と K^♭ は同じ値群を持つ(同型な完備位相群)
- K の剰余体は K^♭ の剰余体と完全 (perfect) 閉包を経由して対応

---

## 5. Perfectoid 空間と tilting の幾何化

### 5.1 動機

体レベルの tilting だけでなく、これを **空間レベル** に拡張したのが Scholze の根本的貢献である。

Perfectoid 空間 X は、局所的に perfectoid 体上の adic spectra Spa(R, R^+) でモデル化される位相空間。tilting 操作

$$ X \mapsto X^\flat $$

を空間に拡張すると、X が混標数 perfectoid 空間なら X^♭ は等標数 perfectoid 空間になる。

### 5.2 主要定理: 同値圏

$$ \{\text{perfectoid spaces over } K\} \xleftrightarrow{\sim} \{\text{perfectoid spaces over } K^\flat\} $$

これは函手としての圏同値で、エタール site, étale cohomology などすべての標準的な不変量で整合する。

### 5.3 応用

- **重み単項化** (weight-monodromy): Scholze の関連論文での古い予想の証明
- **Fargues-Fontaine 曲線**: 局所 Langlands の幾何化の舞台
- **Prismatic コホモロジー** (Bhatt-Scholze 2018-): perfectoid + Frobenius の枠組みで p 進コホモロジーを統一
- **Geometrization of local Langlands** (Fargues-Scholze 2021): 局所 Langlands 対応を Fargues-Fontaine 曲線上の sheaf theory として geometrize

---

## 6. なぜ「等標数の方が解きやすい」か

tilting を経由する理由は、等標数側のメリットにある。

### 6.1 Frobenius が canonical

等標数 p の体・空間では、Frobenius が canonical な自己同型として存在する。これにより:

- カテゴリ論的構造が単純化(モナド構造、co-Frobenius など)
- 不変量計算が直接的(Frobenius の固有値、トレース)
- 微分形式・de Rham 構造が「自動的に」相対化される

### 6.2 函数体類似

等標数 p の体は「曲線 𝒞 = Spec 𝔽_q[t] や Spec 𝔽_q((t))」の函数体に近い。函数体類似(Drinfeld, Lafforgue, …)による Langlands の証明が等標数で先に達成されたのも、この構造の単純さによる。

### 6.3 例: 重み単項化定理

Deligne の重み単項化予想は、エタールコホモロジー上のフロベニウス固有値の絶対値に関する精密な予想だった。Scholze はこれを混標数で証明するときに、tilting で等標数に翻訳して証明する戦略を取った。等標数では既存の Deligne の Weil II の結果が直接適用できるため、tilting がここで決定的な役割を果たした。

---

## 7. 関連: prismatic site

近年(Bhatt-Scholze 2018-)、Witt ベクトル・perfectoid・Frobenius の枠組みを統一する **prismatic site** が整備された。

**Prism** = (A, I): δ-環 A と分歧イデアル I の対(p ∈ I + φ(I) を満たす)。典型例:

- crystalline prism: A = W(k), I = (p)
- de Rham prism: A = 𝒪_K[u]^∧, I = (E(u))(K = ℚ_p の場合は E(u) = u - p)
- Hodge-Tate prism: A^♯ / I^♯
- perfectoid prism: A = W(R^♭), R perfectoid

Prismatic コホモロジー H^i_Δ(X/A, …) は、crystalline, de Rham, Hodge-Tate, étale (l=p) コホモロジーをすべて特殊化として含む統一理論を与える。これにより p 進ホッジ理論が新しい geometric framework の中で整理されつつある。

---

## 8. まとめ

1. Fontaine-Wintenberger (1979): 混標数の APF 塔から等標数の field of norms を構成、Galois 群の同型
2. Scholze (2012): perfectoid 体 K に対し tilting K^♭ を canonical に構成、G_K ≅ G_{K^♭}
3. 空間レベルへの拡張: perfectoid 空間と tilting の圏同値
4. 等標数側で Frobenius が canonical なため、技術的に扱いやすい
5. 応用: 重み単項化、Fargues-Fontaine 曲線、prismatic コホモロジー、局所 Langlands の geometrization
6. p 進ホッジ理論の現代的言語は、perfectoid 機構の上に再構築されつつある

混標数と等標数の世界は、tilting を経由して構造的に同値であり、それぞれの世界の長所を相補的に活用できる。これが Scholze の発見の数学的意義である。

---

> **横断メモ(on-mission 深部).** 本記事は別記事「係数の素数とガロワ表現(l 進と p 進)」§6 の perfectoid/tilting の深掘り版(相互リンク)。Field of norms の $G_L\cong G_{X_K(L)}$、perfectoid の $G_K\cong G_{K^\flat}$ という「**塔 → Galois 群の同型**」は、別記事「確率空間を Stone 的に読み替える」の filtration↔Galois 塔(第一論文の起点)と同じ pro-finite 構造の数論版だ ── 塔を翻訳して Galois 群を移す、という所作が共通する。prismatic の prism=(δ-環, イデアル) と $W(R^\flat)$ は別記事「Witt ベクトルと Artin–Schreier–Witt」の Witt 環が舞台。$K\mapsto K^\flat$ の Frobenius 逆極限(図2)は、別記事「Tate 加群とエタールコホモロジー」の $T_l=\varprojlim E[l^n]$ と同じ「逆系の塔で対象を作る」発想の Frobenius 版。

## 査読・限界(解説モード)

- **引用する標準事実**:Fontaine–Wintenberger(field of norms と $G_L\cong G_{X_K(L)}$、1979)、Scholze の perfectoid 体・tilting・$G_K\cong G_{K^\flat}$・空間レベルの圏同値(2012)、重み単項化の tilting 経由証明、Bhatt–Scholze の prismatic(2022)、Fargues–Scholze の局所 Langlands 幾何化(2021)。いずれも標準・最新で、本記事は証明せず参照に委ねる。
- **境界(否定形)**:Fontaine–Wintenberger は体レベル・APF 拡大限定で空間に拡張できない(§2.4)── それを克服したのが perfectoid。$\mathbb Q_p$(value 群 $\mathbb Z$ が $p$-可除でない)や $\mathbb F_p((t))$(perfect でない)は perfectoid でない(§3.3)。
- 院生〜愛好家向け advanced サーベイ。新規主張なし。

## 参考文献

- Fontaine, Wintenberger, *Le "corps des normes" de certaines extensions algébriques de corps locaux* (CRAS 1979)
- Scholze, *Perfectoid spaces* (Publ. IHES 2012) — 出発点
- Scholze, *Perfectoid spaces: a survey* (Current Developments in Mathematics 2012) — 入門的解説
- Bhatt, *Lecture notes on perfectoid spaces* (2017)
- Bhatt-Scholze, *Prisms and prismatic cohomology* (Ann. of Math. 2022)
- Fargues-Scholze, *Geometrization of the local Langlands correspondence* (preprint 2021)
- Berger, *Lifting the field of norms* (J. Éc. polytech. Math. 2014) — Fontaine-Wintenberger から perfectoid への橋渡し的視点
