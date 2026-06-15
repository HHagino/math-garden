---
title: "Witt ベクトルと Artin-Schreier-Witt — 標数 p の p^n 巡回拡大の明示的構成"
date: 2026-05-23
updated: 2026-06-02
status: 墓場
audience: 体論を一巡した人向け
prerequisite: 有限ガロワ理論、ℤ_p の存在、Frobenius 写像の概念
abstract: |
  Witt ベクトル環 W(A) は、標数 p の完全体 A から混標数 0 の完備離散付値環(剰余体 A・uniformizer p)を canonical に作る「持ち上げ」で、W(𝔽_p)=ℤ_p、W(𝔽_q)=ℤ_q。Frobenius F と Verschiebung V(FV=VF=p)を備え、Artin–Schreier–Witt 完全列で標数 p の体の指数 p^n 巡回拡大が W_n(K)/(F−id)W_n(K) に分類される ── Kummer 理論(乗法的)の加法版だ。de Rham–Witt 複体は crystalline コホモロジーの計算機構として p 進ホッジ理論・prismatic の核に位置する。
---

## 1. 動機 — Witt ベクトルが「ℤ_p の標数 p 版」になる事情

混標数の世界では ℤ_p(p 進整数環)が存在し、ℤ_p の剰余体 ℤ_p/p ≅ 𝔽_p となる。等標数 p の世界では、これに対応する「𝔽_p の係数で書ける、剰余体が 𝔽_p の DVR(離散付値環)」が欲しい。

最初の候補は 𝔽_p[[t]] だが、これは剰余体 𝔽_p までは戻れても、t の選び方が canonical でない(代数的に標準的な uniformizer がない)。

Witt ベクトル環 W(𝔽_p) を導入すると、結果として

$$ W(\mathbb{F}_p) \cong \mathbb{Z}_p $$

となる。すなわち Witt ベクトル構成は「混標数の整数環を、等標数の剰余体から再構成する canonical な手続き」になっている。これは見方を変えれば、標数 p の世界の中で「p 進的な加法則」を持つ環構造を発見していることになる。

本稿では:

1. Witt ベクトル環 W_n(A) の構成
2. Frobenius F と Verschiebung V
3. 標数 p の体での Artin-Schreier-Witt 完全列と p^n 巡回拡大
4. de Rham-Witt 複体への手がかり

を扱う。

---

## 2. Witt ベクトルの構成

### 2.1 ゴーストベクトルからの動機

可換環 A に対し、長さ n+1 の数列 (a_0, a_1, …, a_n) ∈ A^{n+1} を考える。これに対するゴーストベクトル (ghost vector)

$$ w_i(a_0, \ldots, a_n) := \sum_{j=0}^i p^j a_j^{p^{i-j}}, \quad i = 0, 1, \ldots, n $$

を定義する。すなわち

$$ w_0 = a_0, \quad w_1 = a_0^p + p a_1, \quad w_2 = a_0^{p^2} + p a_1^p + p^2 a_2, \ldots $$

A = ℝ (あるいは ℚ など p で割り切れない係数を持つ)上では、ゴーストベクトルの足し算・掛け算は座標ごとの足し算・掛け算で自明に定義できる。

問題: ℤ 係数の多項式として、もとの (a_0, …, a_n) の演算則を求められるか?

### 2.2 Witt の定理

Witt (1936) の発見:

> 有理係数で見ると自然な操作が、ℤ 係数の多項式として整合的に書ける。すなわち普遍多項式
> $$ S_i, P_i \in \mathbb{Z}[X_0, \ldots, X_i, Y_0, \ldots, Y_i] $$
> が存在して、ゴーストベクトルレベルで
> $$ w_i(S_0(\mathbf{a}, \mathbf{b}), \ldots, S_n) = w_i(\mathbf{a}) + w_i(\mathbf{b}) $$
> $$ w_i(P_0, \ldots, P_n) = w_i(\mathbf{a}) \cdot w_i(\mathbf{b}) $$
> を満たす。

具体例(最初の数項):

$$ S_0 = X_0 + Y_0 $$
$$ S_1 = X_1 + Y_1 + \frac{X_0^p + Y_0^p - (X_0+Y_0)^p}{p} $$

$S_1$ の右辺の分母 p は、多項展開後に消える(二項係数の整除性による)ことが鍵で、これが Witt 定理の核心である。

### 2.3 Witt ベクトル環 W_n(A)

可換環 A に対し、集合 A^{n+1} 上に上記の S_i, P_i で定義される加法・乗法を入れた環を **長さ n+1 の Witt ベクトル環** W_n(A) と呼ぶ(n+1 次元の Witt ベクトル)。

無限長 Witt ベクトル環は射影極限

$$ W(A) := \varprojlim_n W_n(A) $$

として定義され、A 上の数列 (a_0, a_1, a_2, …) の環構造を与える。

### 2.4 主要な事実

**Theorem (Witt 1936):** A が標数 p の完全体ならば

$$ W(A) $$

は標数 0 の完備離散付値環で、剰余体は A、uniformizer は p、p ⋅ (a_0, a_1, …) = (0, a_0^p, a_1^p, …) を満たす。

特に A = 𝔽_p なら W(𝔽_p) = ℤ_p。A = 𝔽_q (q = p^f) なら W(𝔽_q) は ℤ_p の f 次不分岐拡大 ℤ_{q^∞}(慣習的表記)。

これにより **任意の標数 p の完全体に対し、混標数の標準的な持ち上げ(lift)が canonical に得られる**。

<figure>
<svg viewBox="0 0 460 150" width="100%" style="max-width:460px;display:block;margin:8px auto" role="img" aria-label="Wittベクトルは標数pから混標数への持ち上げ">
  <defs><marker id="wv1" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#5a4f3f"/></marker></defs>
  <g font-family="serif" font-size="10.5" fill="#2b2118">
    <rect x="30" y="40" width="150" height="68" rx="5" fill="#f6e7e3" stroke="#b1342a"/>
    <text x="105" y="34" text-anchor="middle" font-size="11" fill="#b1342a">標数 p の完全体 A</text>
    <text x="105" y="66" text-anchor="middle">𝔽_p, 𝔽_q, 𝔽_p^alg …</text>
    <line x1="180" y1="74" x2="280" y2="74" stroke="#5a4f3f" stroke-width="1.5" marker-end="url(#wv1)"/>
    <text x="230" y="64" text-anchor="middle" font-size="10" fill="#5a4f3f">W(–) 持ち上げ</text>
    <rect x="280" y="40" width="150" height="68" rx="5" fill="#eef5fa" stroke="#2f5d7c"/>
    <text x="355" y="34" text-anchor="middle" font-size="11" fill="#2f5d7c">混標数 0 の DVR W(A)</text>
    <text x="355" y="62" text-anchor="middle">剰余体 A・uniformizer p</text>
    <text x="355" y="82" text-anchor="middle" font-size="9.5">W(𝔽_p)=ℤ_p, W(𝔽_q)=ℤ_q</text>
    <text x="230" y="132" text-anchor="middle" font-size="9.5" fill="#8a7f6c">tilting(混標数→等標数)の逆向き ── 等標数の剰余体から混標数の整数環を canonical に再構成</text>
  </g>
</svg>
<figcaption><b>図1 ─ Witt は標数 p から混標数への持ち上げ.</b> 標数 $p$ の完全体 $A$ から、剰余体 $A$・uniformizer $p$ をもつ混標数 $0$ の DVR $W(A)$ が canonical に得られる($W(\mathbb F_p)=\mathbb Z_p$)。これは perfectoid の tilting($K\mapsto K^\flat$、混標数→等標数)のちょうど逆向きの操作だ。<i>(概念図)</i></figcaption>
</figure>

---

## 3. Frobenius と Verschiebung

Witt ベクトル環には、二つの自然な自己同型・自己準同型が存在する。

### 3.1 Frobenius F

A が標数 p の場合、Frobenius

$$ F \colon W(A) \to W(A), \quad F(a_0, a_1, a_2, \ldots) = (a_0^p, a_1^p, a_2^p, \ldots) $$

(成分ごとの p 乗)が定義され、これは環準同型である。

A = 𝔽_p のとき F は恒等(𝔽_p 上 x^p = x なので)。A = 𝔽_q (q = p^f) のとき F は ℤ_q 上の **絶対 Frobenius**(剰余体側の x ↦ x^p を持ち上げたもの)。

### 3.2 Verschiebung V

逆方向の写像

$$ V \colon W(A) \to W(A), \quad V(a_0, a_1, a_2, \ldots) = (0, a_0, a_1, \ldots) $$

(右シフト)を **Verschiebung** という。これは加法的だが乗法的ではない。

### 3.3 F と V の関係

A が標数 p のとき:

$$ FV = VF = p \cdot \text{id} $$
$$ V(F(x) \cdot y) = x \cdot V(y) $$

これにより W(A) は p で割ると Frobenius が消える環構造を持ち、「p 進的な構造」と「Frobenius」が分離されている。

### 3.4 Teichmüller representative

A の元 a に対し、Teichmüller 持ち上げ

$$ [a] := (a, 0, 0, \ldots) \in W(A) $$

は乗法的(積を保つ)である。任意の Witt ベクトルは

$$ (a_0, a_1, a_2, \ldots) = \sum_{i \geq 0} V^i([a_i^{p^{-i}}]) $$

(A が完全体のとき)と一意に表せる。これにより Witt ベクトルを「p 進展開」として扱える。

---

## 4. Artin-Schreier-Witt 完全列

### 4.1 標数 p の体での加法的 Galois 理論

体 K が標数 p のとき、x^p - x = a の根を添加することで巡回 p 次拡大が得られる(Artin-Schreier 拡大)。これに対応するガロワコホモロジー的事実は

$$ 0 \to \mathbb{F}_p \to K^{\text{sep}} \xrightarrow{x^p - x} K^{\text{sep}} \to 0 $$

の完全列から得られる長完全列

$$ H^1(G_K, \mathbb{F}_p) \cong K / (\text{Frob} - \text{id}) K. $$

これを p^n 次へ拡張するのが Artin-Schreier-Witt 理論である。

### 4.2 拡張: W_n と Artin-Schreier-Witt 完全列

K が標数 p の体とする。W_n(K^sep) は K^sep を係数とする長さ n+1 の Witt ベクトル環。Frobenius F が自然に作用する。**Artin-Schreier-Witt 演算子**

$$ \wp := F - \text{id} \colon W_n(K^{\text{sep}}) \to W_n(K^{\text{sep}}) $$

を考えると、次の G_K-加群の完全列(Artin-Schreier-Witt 完全列):

$$ 0 \to \mathbb{Z}/p^n \mathbb{Z} \to W_n(K^{\text{sep}}) \xrightarrow{\wp} W_n(K^{\text{sep}}) \to 0. $$

<figure>
<svg viewBox="0 0 470 150" width="100%" style="max-width:470px;display:block;margin:8px auto" role="img" aria-label="KummerとArtin-Schreier-Wittの完全列の対比">
  <g font-family="serif" font-size="10.5" fill="#2b2118">
    <text x="20" y="30" font-size="11" fill="#2f5d7c">Kummer(乗法的・char ∤ n):</text>
    <text x="40" y="54">1 → μ_n → K^sep,× —(·)ⁿ→ K^sep,× → 1</text>
    <text x="40" y="74" font-size="9.5" fill="#8a7f6c">H¹(G_K, μ_n) ≅ K^× / (K^×)ⁿ ── 乗法群を割る</text>
    <line x1="20" y1="86" x2="450" y2="86" stroke="#b9ac95" stroke-width="1" stroke-dasharray="3 3"/>
    <text x="20" y="106" font-size="11" fill="#b1342a">Artin–Schreier–Witt(加法的・char p, 指数 pⁿ):</text>
    <text x="40" y="128">0 → ℤ/pⁿ → W_n(K^sep) —F−id→ W_n(K^sep) → 0</text>
    <text x="40" y="146" font-size="9.5" fill="#8a7f6c">H¹(G_K, ℤ/pⁿ) ≅ W_n(K) / (F−id)W_n(K) ── Witt 加群を割る</text>
  </g>
</svg>
<figcaption><b>図2 ─ 乗法の Kummer、加法の Artin–Schreier–Witt.</b> 巡回拡大を作る完全列は、標数が指数と素なら乗法群 $K^\times$ を $n$ 乗で割る(Kummer)、標数 $p$・指数 $p^n$ なら Witt 加群 $W_n(K)$ を $F-\mathrm{id}$ で割る(ASW)。$\mu_n\leftrightarrow\mathbb Z/p^n$、$(\cdot)^n\leftrightarrow F-\mathrm{id}$ と、乗法と加法がきれいに対応する。<i>(概念図)</i></figcaption>
</figure>

ℤ/p^n の埋め込みは Teichmüller 持ち上げによる:標準的な ℤ/p^n の元 m に対し m ↦ ([m^{1/p^∞}], …) のようにする。

### 4.3 ガロワコホモロジー

この完全列の長完全列で

$$ H^1(G_K, \mathbb{Z}/p^n) \cong W_n(K) / \wp(W_n(K)). $$

すなわち K の指数 p^n の巡回拡大は W_n(K) の F - id による商で分類される。

### 4.4 具体例

n = 1 で k = 𝔽_p の場合は古典的 Artin-Schreier。

n = 2 の場合、W_2(K) は (a_0, a_1) の Witt ベクトル組で、F(a_0, a_1) = (a_0^p, a_1^p)、減算は Witt 多項式で表される複雑な形を取る。指数 p^2 の巡回拡大はこの空間の商として分類される。

n が大きくなるにつれて Witt の加法則が p^n のオーダーで複雑になり、明示的な計算は重い。これが「Artin-Schreier-Witt は面倒くさい」と言われる所以である。

### 4.5 Kummer 理論との対比

| Kummer 理論 | Artin-Schreier-Witt 理論 |
|---|---|
| 標数が n と素 | 標数 p, 指数 p^n |
| 乗法群 K^× / (K^×)^n | Witt 加群 W_n(K) / (F - id) W_n(K) |
| ζ_n を含む必要 | 自動的に成立 |
| 計算: ラジカル ⁿ√a | 計算: Witt ベクトル ⊕Vᵢ[aᵢ] |
| 1 次のコホモロジーは群体上の単純 | コホモロジー計算が Witt 加法則の重さを背負う |

---

## 5. de Rham-Witt 複体への手がかり

p 進ホッジ理論で重要な役割を果たすのが **de Rham-Witt 複体** WΩ^•_X である(Bloch, Illusie 1979)。

### 5.1 動機

標数 p の体 k 上のスキーム X に対し、de Rham コホモロジー H^i_dR(X/k) は良い性質を持たない場合がある。代わりに

$$ H^i(WΩ^\bullet_X) $$

(Witt 微分形式の hyperコホモロジー)を考えることで、crystalline コホモロジー H^i_cris(X/W(k)) を計算できる。

### 5.2 構成の概略

W_n(𝒪_X) 上の Kähler 微分

$$ Ω^1_{W_n(\mathcal{O}_X)/W_n(k)} $$

を取り、適切な商で WΩ^1_{X,n} を定義する。これに F, V を作用させ、複体

$$ WΩ^0 \to WΩ^1 \to WΩ^2 \to \cdots $$

を作る。これが de Rham-Witt 複体である。

### 5.3 主要な性質

Bloch-Illusie の主要定理:

$$ H^i(X, WΩ^\bullet_X) \otimes_{W(k)} K \cong H^i_{\text{cris}}(X/W(k)) \otimes_{W(k)} K $$

(K = W(k) の分数体)。これにより crystalline コホモロジーが Witt 微分形式から具体的に計算できる。

これは p 進ホッジ理論の重要な計算機構で、近年の **prismatic コホモロジー**(Bhatt-Scholze 2018-)はこれをさらに一般化したものと位置付けられる。

---

## 6. まとめ

1. Witt ベクトル環 W(A) は、可換環 A から canonical に作られる「p 進的な構造を持つ」環で、A が標数 p の完全体なら W(A) は混標数 0 の完備離散付値環(剰余体 A、uniformizer p)
2. W(𝔽_q) = ℤ_q (= ℤ_p の f 次不分岐拡大) という直接の例
3. Frobenius F と Verschiebung V が canonical に存在し、FV = VF = p の関係を満たす
4. Artin-Schreier-Witt 完全列により、標数 p の体 K の指数 p^n 巡回拡大は W_n(K)/(F - id) W_n(K) で分類される
5. Witt 加法則の重さが、Kummer 理論との対比における「面倒くささ」の実体
6. de Rham-Witt 複体は crystalline コホモロジーの計算手段として p 進ホッジ理論の核に位置する

Witt ベクトルは「等標数 p の世界から混標数 0 への canonical な持ち上げ」「Frobenius を持つ環構造の自然な実現」という二重の意味を持ち、p 進ホッジ理論全体の基礎部品となっている。

---

> **横断メモ(数論クラスタ).** $W(A)$ の持ち上げ(標数 p→混標数)は、別記事「Perfectoid と tilting」の tilting($K\mapsto K^\flat$、混標数→等標数)のちょうど逆向きで、prism=(δ-環, イデアル)や $W(R^\flat)$ として両者は prismatic で再会する。Artin–Schreier–Witt 完全列は、別記事「Galois 理論を線形代数として見る」§3・「可解群はなぜ可解か」の **Kummer 理論の加法版**(乗法群を割る ↔ Witt 加群を割る)。$W(\mathbb F_q)=\mathbb Z_q$ という不分岐持ち上げと de Rham–Witt→crystalline は、別記事「係数の素数とガロワ表現」の p 進ホッジ理論(crystalline 比較・prismatic)の計算基盤だ。乗法/加法、混標数/等標数、という二項対立が数論クラスタを貫く。

## 査読・限界(解説モード)

- **依拠する標準事実**:Witt の定理(ゴースト成分の整係数多項式化、1936)、$W(A)$ が標数 p 完全体に対し剰余体 $A$・uniformizer $p$ の混標数 DVR、$W(\mathbb F_q)=\mathbb Z_q$、F・V と $FV=VF=p$、Teichmüller 表示、Artin–Schreier–Witt 完全列と $H^1(G_K,\mathbb Z/p^n)\cong W_n(K)/(F-\mathrm{id})W_n(K)$、Bloch–Illusie の de Rham–Witt ⇄ crystalline。標準的な整数論・p 進幾何。
- **境界**:$W(A)$ が綺麗な DVR になるのは $A$ が**完全体**のとき。不完全剰余体では構造が崩れ、現代の積分的 p 進ホッジ理論の難所になる。Witt 加法則は $p^n$ のオーダーで急速に重くなる(明示計算の限界)。
- 院生向けサーベイ。新規主張なし。

## 参考文献

- Serre, *Corps Locaux* II.6 — Witt ベクトルの古典的構成
- Hazewinkel, *Formal Groups and Applications* — Witt ベクトル, λ-rings の体系
- Bloch-Illusie, *De Rham-Witt cohomology* (Ann. Sci. ENS 1979)
- Borger, *The basic geometry of Witt vectors* (preprint, 2011) — Witt ベクトルの幾何学的視点
- Bhatt-Scholze, *Prisms and prismatic cohomology* (Ann. of Math. 2022) — 現代的視点
