---
title: "Tate 加群とエタールコホモロジー — l 進ガロワ表現の供給源"
date: 2026-05-23
updated: 2026-06-02
status: 墓場
audience: 代数曲線・代数幾何の基礎を一度通った人向け
prerequisite: 楕円曲線の基本(Silverman 第 1 部程度)、層と前層の概念、Galois 理論
abstract: |
  楕円曲線の l 等分点を l のべきで射影極限して得る Tate 加群 T_l(E)≅ℤ_l² は、絶対 Galois 群の連続表現(l 進ガロワ表現)を供給する。これを任意の代数多様体へ一般化したのがエタールコホモロジーで、π_1^ét=G_K の表現=l 進局所系として Galois 表現を幾何化する。Weil 予想(Frobenius 固有値・Riemann 仮説)から Faltings・Mordell まで、l 進ガロワ表現が舞台になる。l=p では破綻し p 進ホッジ理論/prismatic を要する。
---

## 1. 動機 — なぜ「Tate 加群」が要るのか

楕円曲線 E/K の n 等分点

$$ E[n] := \{P \in E(\bar K) \mid nP = O\} $$

は、char(K) ∤ n のとき (ℤ/nℤ)^2 と同型な有限アーベル群で、絶対ガロワ群 G_K = Gal(K^sep/K) が自然に作用する。すなわち各 n に対して

$$ \rho_{E,n} \colon G_K \to \operatorname{GL}_2(\mathbb{Z}/n\mathbb{Z}) $$

が得られる。これは mod n ガロワ表現と呼ばれ、数論的に重要(Serre の谷山予想、Khare-Wintenberger の証明の出発点はここ)。

しかし mod n の情報だけを見ていると、n の異なる値を「縦に統一して」追跡できない。たとえば

- L 関数のオイラー因子は、フロベニウスの固有値を要する
- BSD 予想は、E(K) の階数を Selmer 群経由で議論する
- Faltings の同型定理は、すべての l に渡って Tate 加群がほぼ一致することを使う

そこで n を l のべき乗に限り、射影極限を取って統一する:

$$ T_l(E) := \varprojlim_n E[l^n], \qquad V_l(E) := T_l(E) \otimes_{\mathbb{Z}_l} \mathbb{Q}_l. $$

これが Tate 加群 / Tate ベクトル空間で、G_K の連続表現

$$ \rho_{E,l} \colon G_K \to \operatorname{GL}_2(\mathbb{Z}_l) \hookrightarrow \operatorname{GL}_2(\mathbb{Q}_l) $$

を与える。これが「楕円曲線の l 進ガロワ表現」の出発点である。

<figure>
<svg viewBox="0 0 470 152" width="100%" style="max-width:470px;display:block;margin:8px auto" role="img" aria-label="Tate加群は等分点の射影極限">
  <defs><marker id="tm1" markerWidth="8" markerHeight="8" refX="2" refY="3" orient="auto"><path d="M6 0 L0 3 L6 6 z" fill="#5a4f3f"/></marker></defs>
  <g font-family="serif" font-size="11" fill="#2b2118">
    <text x="56" y="56" text-anchor="middle">E[l]</text>
    <text x="146" y="56" text-anchor="middle">E[l²]</text>
    <text x="240" y="56" text-anchor="middle">E[l³]</text>
    <text x="312" y="56" text-anchor="middle">⋯</text>
    <!-- inverse limit arrows (pointing left: multiplication by l) -->
    <line x1="100" y1="52" x2="78" y2="52" stroke="#5a4f3f" stroke-width="1.3" marker-end="url(#tm1)"/><text x="89" y="42" font-size="8" fill="#8a7f6c">×l</text>
    <line x1="196" y1="52" x2="170" y2="52" stroke="#5a4f3f" stroke-width="1.3" marker-end="url(#tm1)"/><text x="183" y="42" font-size="8" fill="#8a7f6c">×l</text>
    <line x1="286" y1="52" x2="264" y2="52" stroke="#5a4f3f" stroke-width="1.3" marker-end="url(#tm1)"/>
    <text x="56" y="76" text-anchor="middle" font-size="8.5" fill="#8a7f6c">(ℤ/l)²</text>
    <text x="146" y="76" text-anchor="middle" font-size="8.5" fill="#8a7f6c">(ℤ/l²)²</text>
    <text x="240" y="76" text-anchor="middle" font-size="8.5" fill="#8a7f6c">(ℤ/l³)²</text>
    <line x1="350" y1="52" x2="386" y2="52" stroke="#2f5d7c" stroke-width="1.4" marker-end="url(#tm1)" transform="scale(-1,1) translate(-736,0)"/>
    <rect x="364" y="38" width="92" height="30" rx="4" fill="#f0e3c4" stroke="#c89b3c"/><text x="410" y="58" text-anchor="middle">T_l(E)=ℤ_l²</text>
    <text x="235" y="108" text-anchor="middle" font-size="10.5" fill="#b1342a">射影極限 lim← E[lⁿ]。G_K が全段に作用 → 連続表現 ρ:G_K→GL₂(ℤ_l)</text>
    <text x="235" y="126" text-anchor="middle" font-size="9.5" fill="#8a7f6c">Weil ペアリングより det ρ = χ_l(円分指標)</text>
  </g>
</svg>
<figcaption><b>図1 ─ Tate 加群は等分点の射影極限.</b> $E[l^n]\cong(\mathbb Z/l^n)^2$ を $\times l$ で繋いだ逆系の極限が $T_l(E)\cong\mathbb Z_l^2$。各段に絶対 Galois 群 $G_K$ が作用し、連続表現 $\rho:G_K\to\mathrm{GL}_2(\mathbb Z_l)$ を与える。Weil ペアリングから $\det\rho=\chi_l$(円分指標)。<i>(概念図)</i></figcaption>
</figure>

---

## 2. Tate 加群の構造

### 2.1 階数

E/K が char(K) ∤ l なら、E[l^n] ≅ (ℤ/l^n ℤ)^2(基礎体の代数閉包上で)。射影極限を取ると

$$ T_l(E) \cong \mathbb{Z}_l^2 $$

がガロワ作用付きの ℤ_l 加群として得られる(自由ランク 2)。

特殊な状況:

- char(K) = p, l = p の場合: E[p^n] は p < (good reduction), ≦ ℤ/p^n ℤ となる(supersingular 楕円曲線では E[p^n] = 0)。このとき T_p(E) は階数 0 か 1 で、構造が全く違う
- アーベル多様体 A/K の場合: dim A = g として T_l(A) ≅ ℤ_l^{2g}

### 2.2 円分指標との接続

Weil ペアリング

$$ e_n \colon E[n] \times E[n] \to \mu_n $$

は G_K-同変な非退化交代形式である。これより determinant が

$$ \det \rho_{E,l} = \chi_l $$

(円分指標)となる。これは Tate 加群が「単なる」 ℚ_l^2 ではなく、円分指標と整合した特別な構造を持つことを意味する。

### 2.3 楕円曲線同型と Tate 加群の同型

Faltings の同型定理(1983, 数体上のアーベル多様体に対する Tate 予想):

> K を数体、A, B を K 上のアーベル多様体とする。任意の l に対し
> $$ \operatorname{Hom}_K(A, B) \otimes_\mathbb{Z} \mathbb{Z}_l \cong \operatorname{Hom}_{G_K}(T_l(A), T_l(B)) $$
> ガロワ同変射が幾何的射からのみ来る。

これは「Tate 加群と Galois 作用込みでアーベル多様体が同型を判定できる」という強力な主張であり、Mordell 予想(Faltings の定理)の証明の核心部分でもある。

---

## 3. 楕円曲線を越えて — エタールコホモロジーの動機

Tate 加群は楕円曲線(あるいはアーベル多様体)に特化した構成だった。一般の代数多様体 X/K に対しては、対応物を作る一般化が必要になる。これがエタールコホモロジーである。

### 3.1 出発点: 特異コホモロジー

K = ℂ のとき、X(ℂ) は位相空間として特異コホモロジー H^i(X(ℂ), ℤ) を持つ。

問題: 一般の体 K (たとえば有限体 𝔽_q) では「位相空間」がない。Zariski 位相は粗すぎる(Zariski 開集合は globalに大きすぎて H^1 が消える)。

### 3.2 Grothendieck の発想

Grothendieck (1957-) は「Zariski 開集合」の代わりに「エタール射 U → X」を使うことを提案した:

- エタール射 = 平坦かつ formally unramified、すなわち「無限小的に同型」
- 例: 既約多項式 f(t) ∈ K[t] による単純拡大 K → K[t]/(f) は (f, f') = 1 の条件下で étale
- 例: 楕円曲線 E に対する n-乗算 [n]: E → E は char ∤ n のとき étale

エタール射の全体を「位相」と思って sheaf cohomology を計算する。これがエタールコホモロジー

$$ H^i_{\text{ét}}(X, \mathscr{F}) $$

である。係数として有限群 ℤ/n、l 進 ℤ_l、ℚ_l などを使う。

### 3.3 比較定理

代数多様体 X/ℂ に対し、Artin の比較定理:

$$ H^i_{\text{ét}}(X, \mathbb{Z}/n) \cong H^i_{\text{sing}}(X(\mathbb{C}), \mathbb{Z}/n) $$

(滑らかな射影多様体の場合)。l 進化して

$$ H^i_{\text{ét}}(X, \mathbb{Q}_l) \cong H^i_{\text{sing}}(X(\mathbb{C}), \mathbb{Q}) \otimes \mathbb{Q}_l. $$

つまりエタールコホモロジーは、ℂ 上では特異コホモロジーの l 進複製であり、有限体上ではそれが「ない」状況での代替物として機能する。

### 3.4 楕円曲線との関係

楕円曲線 E に対しては

$$ H^1_{\text{ét}}(E_{\bar K}, \mathbb{Z}_l) \cong T_l(E)^* \quad (\text{ペアリング双対}) $$

であり、Tate 加群はエタールコホモロジーの特別な例として再現される。

より高次元では、アーベル多様体 A に対して

$$ H^1_{\text{ét}}(A_{\bar K}, \mathbb{Z}_l) \cong \operatorname{Hom}(T_l(A), \mathbb{Z}_l) $$

となる。エタールコホモロジーは Tate 加群の自然な一般化であって、楕円曲線・アーベル多様体に限らず任意の代数多様体に適用できる。

---

## 4. Weil 予想とフロベニウス

### 4.1 Weil 予想の statement

A. Weil (1949) が予想し、Grothendieck 学派(Deligne 1974 で完結)が証明した:

> X を有限体 𝔽_q 上の滑らかな射影多様体とする。ゼータ関数
> $$ Z(X, t) := \exp\left( \sum_{n \geq 1} \frac{|X(\mathbb{F}_{q^n})|}{n} t^n \right) $$
> は次の性質を持つ:
> 1. 有理関数 Z(X, t) = ∏ P_i(t)^{(-1)^{i+1}}, P_i ∈ ℤ[t]
> 2. 関数等式 Z(X, 1/(q^d t)) = ±q^{dχ/2} t^χ Z(X, t)
> 3. Riemann hypothesis: P_i(t) の零点の絶対値は q^{-i/2}

これはエタールコホモロジーで P_i(t) = det(1 - Frob_q t | H^i_ét(X, ℚ_l)) と書くことで証明される。

### 4.2 フロベニウスの幾何的意味

X/𝔽_q に対し、絶対フロベニウス F: X → X (x ↦ x^q on coordinates) が定義される。これは l-進エタールコホモロジー H^i_ét(X_{\bar{𝔽}_q}, ℚ_l) に作用し、その固有値が Weil 予想の対象となる。

特に X = E が楕円曲線なら

$$ \det(1 - \operatorname{Frob}_q t | H^1_{\text{ét}}(E_{\bar{\mathbb{F}}_q}, \mathbb{Q}_l)) = 1 - a_q t + q t^2 $$

ここで a_q = q + 1 - |E(𝔽_q)|。これが楕円曲線の L 因子の主項である。

<figure>
<svg viewBox="0 0 380 220" width="100%" style="max-width:380px;display:block;margin:8px auto" role="img" aria-label="Frobenius固有値とRiemann仮説">
  <g font-family="serif" font-size="10.5" fill="#2b2118">
    <line x1="40" y1="110" x2="340" y2="110" stroke="#b9ac95" stroke-width="1"/>
    <line x1="190" y1="20" x2="190" y2="200" stroke="#b9ac95" stroke-width="1"/>
    <circle cx="190" cy="110" r="74" fill="none" stroke="#2f5d7c" stroke-width="2"/>
    <text x="270" y="58" font-size="10" fill="#2f5d7c">|α|=√q</text>
    <!-- eigenvalues α, β = conjugates on circle -->
    <circle cx="246" cy="62" r="4" fill="#b1342a"/><text x="252" y="58" font-size="10" fill="#b1342a">α</text>
    <circle cx="246" cy="158" r="4" fill="#b1342a"/><text x="252" y="172" font-size="10" fill="#b1342a">β=ᾱ</text>
    <text x="190" y="216" text-anchor="middle" font-size="9.5" fill="#8a7f6c">H¹_ét(E) 上の Frob 固有値:α+β=a_q, αβ=q, |α|=|β|=√q(Riemann 仮説)</text>
    <text x="190" y="14" text-anchor="middle" font-size="10" fill="#2b2118">複素平面・半径 √q の円</text>
  </g>
</svg>
<figcaption><b>図2 ─ Frobenius 固有値は半径 $\sqrt q$ の円に乗る.</b> 点の個数 $|E(\mathbb F_{q^n})|$ は $H^1_{\text{ét}}$ 上の Frobenius 固有値 $\alpha,\beta$ で決まり、$\alpha+\beta=a_q,\ \alpha\beta=q$。Weil 予想の Riemann 仮説は「$|\alpha|=|\beta|=\sqrt q$」── 固有値がちょうど半径 $\sqrt q$ の円上に乗ることを言う。点を数える算術が、コホモロジー上の線形代数(固有値)に化けた。<i>(概念図)</i></figcaption>
</figure>

### 4.3 l 非依存性

Weil 予想の主要部分のひとつは「結果が l に依らない」ことである:

- 多項式 P_i(t) は有理整数係数
- フロベニウスの固有値、トレースは l に依らない
- 次元(= Betti 数)も l に依らない

これは ℓ-進エタールコホモロジーが「正しい」(motivic) コホモロジーの実現であることを示している。

---

## 5. l 進局所系と π_1

### 5.1 π_1^ét

エタール基本群 π_1^ét(X, \bar x) は Galois 理論を「被覆空間」の概念に翻訳する:

- 連結 étale 射の有限 Galois 被覆全体の射影極限の自己同型群
- 体 K に対しては π_1^ét(Spec K) = G_K
- 滑らかな代数曲線 C/ℂ に対しては π_1^ét(C) = π_1^top(C(ℂ))^{プロ有限完備化}

### 5.2 l 進局所系

X の上の l 進 lisse(局所自由)層は、π_1^ét(X) → GL_n(ℚ_l) の連続表現と等価である:

$$ \{\text{l 進 lisse sheaves on } X\} \xleftrightarrow{\sim} \{\text{連続 } \pi_1^{\text{ét}}(X) \to \operatorname{GL}_n(\mathbb{Q}_l) \} $$

これは局所定数化された Galois 表現と層が同じものであることを示しており、Galois 表現の「幾何化」の出発点である。

X = E が楕円曲線、l ≠ char(K) のときは、Tate 加群 T_l(E) が canonical な l 進 lisse sheaf に対応する。

### 5.3 六関手主義

Grothendieck-Verdier の六関手主義により、l 進層の圏 D^b_c(X, ℚ_l) には

$$ f^*, f_*, f^!, f_!, \otimes, \mathcal{H}om $$

が完備に振る舞う。これによって perverse sheaf 論、Lefschetz の不動点公式、Deligne の Weil II 証明、Lafforgue の Langlands などが体系化される。

l = p の場合この形式主義は破綻し、対応物として prismatic site が必要になる。

---

## 6. 大域への接続 — Chebotarev とテンソル積定理

K = 数体上の Galois 表現 ρ_{E,l}: G_K → GL_2(ℚ_l) は、ほとんどの素点で不分岐(E が good reduction を持つ素点で)。各不分岐素点 v でのフロベニウス Frob_v の像が

- ρ(G_K) の中で稠密(Chebotarev 密度定理)
- a_v := tr(ρ(Frob_v)) は l に依らない有理整数

を満たす。L 関数

$$ L(E, s) := \prod_v \det(1 - \operatorname{Frob}_v q_v^{-s} | T_l(E))^{-1} $$

は (a_v) の族から直接構成される。

Faltings の同型定理(§2.3 で述べた)は、E と E' が K-同種(K-isogenous)であることと、すべての a_v が一致することが同値であることを示し、楕円曲線の数論的同種類は L 関数で決まることが示される。

---

## 7. まとめ — l 進ガロワ表現の典型的供給源

1. 楕円曲線 E/K の **Tate 加群** T_l(E) ≅ ℤ_l^2(char ≠ l)
2. アーベル多様体 A/K の Tate 加群 T_l(A) ≅ ℤ_l^{2g}
3. 滑らかな射影多様体 X/K の **エタールコホモロジー** H^i_ét(X_{\bar K}, ℚ_l)
4. 一般に、X 上の **l 進局所系** = π_1^ét(X) の連続表現

これらは l ≠ p の世界で線型代数の延長として扱える。L 関数、Weil 予想、Faltings の定理、Mordell 予想、すべてここを舞台とする。

l = p の世界に踏み込むと p 進ホッジ理論が必要になる。「係数の素数とガロワ表現 — l 進と p 進の差異、p 進ホッジ理論への入口」を参照。

---

> **横断メモ(on-mission・Galois/étale 中核).** 本記事は庭の数論・Galois 側の深部ハブだ。π_1^ét=G_K とエタール位相は別記事「点ではなく、開集合の代数で登る」の étale 基本群の深掘り版。l 進ガロワ表現 ρ:G_K→GL₂ は「Galois 群が線形に作用する」そのもので、$\det\rho=\chi_l$(円分指標)は別記事「Galois 理論を線形代数として見る」の固有値=指標(円分指標=Dirichlet 指標)を l 進・2 次元へ持ち上げたもの。Tate 加群 $T_l=\varprojlim E[l^n]$ という pro-finite 逆系の塔は、別記事「確率空間を Stone 的に読み替える」の filtration↔Galois 塔(第一論文の起点)と同じ pro-finite 構造で、l 進(Iwasawa 的)に各段を追う所作も共通。L 関数 $\prod_v$ の素点ごとの Euler 因子は「有限素点と無限素点」の積公式・素点の言語、Frobenius の不分岐性は局所大域(「ハッセ原理」)と地続きだ。**この記事は第一論文(filtration↔Galois)の到達したい地平の一つ**を、線形代数(Galois 表現・固有値)の延長として描いている。

## 査読・限界(解説モード)

- **依拠する標準事実(深い定理群)**:$E[n]\cong(\mathbb Z/n)^2$ と $T_l\cong\mathbb Z_l^2$、Weil ペアリングと $\det\rho=\chi_l$、Faltings の同型定理(1983)、Artin の比較定理、Weil 予想(Deligne 1974/Weil II 1980)、$\pi_1^{\text{ét}}(\operatorname{Spec}K)=G_K$、l 進 lisse 層 ⇄ π_1^ét の連続表現、Chebotarev 密度定理。いずれも引用であって本記事は証明しない(参考文献参照)。
- **境界(否定形)**:理論は $l\neq\mathrm{char}(K)$ で働く。$l=p$ では $E[p^n]$ の階数が落ち(supersingular で $0$)、六関手形式主義も破綻し、p 進ホッジ理論・prismatic site が要る。
- 院生向けの advanced サーベイ。新規定理の主張はなく、l 進ガロワ表現の供給源を一望する地図。

## 参考文献

- Silverman, *The Arithmetic of Elliptic Curves* III.7 (Tate 加群), V.2 (formal group)
- Silverman, *Advanced Topics in the Arithmetic of Elliptic Curves* II (CM, Tate-Honda)
- Milne, *Étale Cohomology* (Princeton) — 標準的入門
- Milne, *Lectures on Étale Cohomology* — 公開 lecture notes 版
- Deligne, *La conjecture de Weil II* (Publ. IHES 1980)
- Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern* (Invent. Math. 1983) — Mordell 予想の証明
