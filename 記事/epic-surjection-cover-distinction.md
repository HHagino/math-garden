---
title: epic・全射・cover はなぜ一致しないのか ── 右消去・到達・再構成
date: 2026-05-15
tags: [圏論, epic, 全射, cover, monic, 右消去可能性, CRing, 局所化, Spec, faithfully flat, Top, 商写像, 降下理論]
status: done
level: 数学解説(圏論初学者〜代数幾何・トポス・降下理論に関心のある読者)
---

# epic・全射・cover はなぜ一致しないのか ── 右消去・到達・再構成

## 1. 導入:Set の直観に引きずられる

集合の圏 $\mathbf{Set}$ では、射 $f: X \to Y$ が **epic**(エピ射)であることと、$f$ が**全射**であることは一致する。だから圏論を学びはじめると、つい「epic = 全射」と思い込んでしまう。

しかし、一般の圏ではそうではない。epic は本来、もっと抽象的な条件 ── 「**右から消去できる**」という代数的な性質 ── であって、「点集合としてすべての点に届く」という全射性とは別のものである。

さらに、代数幾何やトポス論、降下理論で重要になる **cover**(被覆)は、単なる全射や epic よりも一段**構造的な**条件である。cover は「局所データを貼り合わせる/降下させるのに十分な射」であって、点に届くだけでは足りない。

本記事は、$\mathbb{Z} \hookrightarrow \mathbb{Q}$ と、離散位相から密着位相への恒等写像という二つの例を通じて、**epic・全射・cover が一般には一致しない**ことを見る。しかも面白いことに、ズレ方には少なくとも二種類ある。一つは「epic だが全射でない」、もう一つは「epic かつ全射だが cover でない」。二つの例は、ちょうどこの二種類のズレを体現している。

---

## 2. epic の定義 ── 右消去可能性

まず定義を確認する。圏 $\mathcal{C}$ の射 $f: X \to Y$ が **epic**(エピ射、epimorphism)であるとは、任意の対象 $Z$ と任意の射 $g, h: Y \to Z$ について、

$$g \circ f = h \circ f \quad \Longrightarrow \quad g = h$$

が成り立つことをいう。

これは「**右消去可能性**」である。$f$ を右から掛けたあとで $g$ と $h$ が一致するなら、もとから一致していたはず ── つまり $f$ は、それに続く射 $g, h$ を**区別するのに十分**である。

ここで強調したいのは、この定義のどこにも「点」が出てこないことだ。epic は、$f$ の像が大きいかどうかではなく、「$f$ のあとに来る射を一意に決められるか」を問うている。$\mathbf{Set}$ ではこの二つがたまたま一致するが、それは $\mathbf{Set}$ の特殊事情にすぎない。

以下、この「右消去可能性としての epic」と「全射」がはっきり食い違う例を見ていく。

---

## 3. 例 1:$\mathbb{Z} \hookrightarrow \mathbb{Q}$ ── epic だが全射でない

可換環の圏 $\mathbf{CRing}$ を考える。対象は可換環、射は環準同型である。ここで、自然な包含

$$\iota: \mathbb{Z} \hookrightarrow \mathbb{Q}$$

を見る。

**これは monic である。** 集合写像として単射であり、$\mathbf{CRing}$ では単射な環準同型は monic だからだ。

**これは全射ではない。** $1/2 \in \mathbb{Q}$ は $\mathbb{Z}$ の像に入らない。像 $\iota(\mathbb{Z}) = \mathbb{Z}$ は $\mathbb{Q}$ のごく一部でしかない。

**それにもかかわらず、$\iota$ は $\mathbf{CRing}$ で epic である。**

理由を見よう。任意の可換環 $R$ と、二つの環準同型 $f, g: \mathbb{Q} \to R$ をとる。これらが $\mathbb{Z}$ 上で一致している、すなわち $f \circ \iota = g \circ \iota$ だとする。このとき $f = g$ を示したい。

$\mathbb{Q}$ の任意の元は $a/b$($a \in \mathbb{Z}$, $b \in \mathbb{Z} \setminus \{0\}$)の形である。$b \cdot (1/b) = 1$ に環準同型 $f$ を施すと $f(b) \cdot f(1/b) = 1$。つまり $f(b)$ は $R$ で可逆で、$f(1/b) = f(b)^{-1}$ である。したがって

$$f(a/b) = f(a) \cdot f(b)^{-1}$$

ところが $a, b \in \mathbb{Z}$ なので、$f(a)$ と $f(b)$ は $f$ の $\mathbb{Z}$ への制限だけで決まる。仮定よりそれは $g$ の制限と一致するから、$f(a) = g(a)$, $f(b) = g(b)$。ゆえに

$$f(a/b) = f(a) f(b)^{-1} = g(a) g(b)^{-1} = g(a/b)$$

すべての $a/b$ で $f = g$ となり、$\iota$ が epic であることが示せた。$\blacksquare$

要点はこうだ。**$\mathbb{Q}$ における射の値は、$\mathbb{Z}$ における値によって完全に強制される。** なぜなら $\mathbb{Q}$ は、$\mathbb{Z}$ から非零整数をすべて可逆化して得られる**局所化**

$$\mathbb{Q} = \mathbb{Z}\bigl[(\mathbb{Z}\setminus\{0\})^{-1}\bigr]$$

だからである。$\mathbb{Z}$ 上で一致すれば、可逆元の像も一意に決まり、$\mathbb{Q}$ 上でも一致せざるを得ない。

> $\iota: \mathbb{Z} \hookrightarrow \mathbb{Q}$ は、**像は小さいが、射を決定するには十分**な射である。

これは局所化一般に成り立つ。可換環 $A$ と乗法的集合 $S$ に対し、局所化の射 $A \to S^{-1}A$ はつねに $\mathbf{CRing}$ で epic である。理由は同じで、$S^{-1}A$ の元 $a/s$ の像が $A$ 上の値で強制されるからだ。

### 幾何的な直感:Spec を取る

$\mathbf{CRing}$ に反変関手 $\operatorname{Spec}$ を施すと、幾何的な絵が見える。$\iota$ に対応するのは

$$\operatorname{Spec}\mathbb{Q} \longrightarrow \operatorname{Spec}\mathbb{Z}$$

である。$\operatorname{Spec}\mathbb{Z}$ は、各素数 $p$ に対応する閉点 $(p)$ たちと、ただ一つの**生成点**(generic point)$(0)$ からなる。一方 $\operatorname{Spec}\mathbb{Q}$ は一点である。この一点は、$\operatorname{Spec}\mathbb{Z}$ の生成点 $(0)$ に入る。

つまりこの写像は、**閉点 $(p)$ たちをまったく覆っていない**。生成点ただ一つしか当たっていない。それでも生成点は $\operatorname{Spec}\mathbb{Z}$ で稠密なので、「すべての点を覆ってはいないが、関数的・代数的な情報を決めるには十分」── まさに epic の直感がここに見える。

<figure>
<svg viewBox="0 0 460 150" width="100%" style="max-width:460px;display:block;margin:8px auto" role="img" aria-label="Spec Q は Spec Z の生成点だけに当たる">
  <defs><marker id="es2" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#b1342a"/></marker></defs>
  <g font-family="serif" font-size="10.5" fill="#2b2118">
    <text x="30" y="96" font-size="10.5" fill="#5a4f3f">Spec ℤ</text>
    <line x1="80" y1="88" x2="430" y2="88" stroke="#6b5d44" stroke-width="1.2"/>
    <!-- closed points -->
    <circle cx="120" cy="88" r="4" fill="#2b2118"/><text x="116" y="106" font-size="9">(2)</text>
    <circle cx="170" cy="88" r="4" fill="#2b2118"/><text x="166" y="106" font-size="9">(3)</text>
    <circle cx="220" cy="88" r="4" fill="#2b2118"/><text x="216" y="106" font-size="9">(5)</text>
    <circle cx="270" cy="88" r="4" fill="#2b2118"/><text x="266" y="106" font-size="9">(7)</text>
    <text x="320" y="92" font-size="11">⋯</text>
    <!-- generic point -->
    <circle cx="390" cy="88" r="6" fill="none" stroke="#2f5d7c" stroke-width="2"/><text x="372" y="108" font-size="9" fill="#2f5d7c">(0) 生成点</text>
    <!-- Spec Q -->
    <circle cx="390" cy="30" r="5" fill="#2f5d7c"/><text x="398" y="34" font-size="10" fill="#2f5d7c">Spec ℚ(一点)</text>
    <line x1="390" y1="36" x2="390" y2="80" stroke="#b1342a" stroke-width="1.6" marker-end="url(#es2)"/>
    <text x="240" y="138" text-anchor="middle" font-size="9.5" fill="#b1342a">生成点 (0) だけに当たり、閉点 (p) を覆わない ── ℚ⊗ℤ/p=0 で閉点情報を殺す → cover でない</text>
  </g>
</svg>
<figcaption><b>図2 ─ generic すぎる epic.</b> $\operatorname{Spec}\mathbb Q\to\operatorname{Spec}\mathbb Z$ は、稠密な生成点 $(0)$ ただ一つに当たる。閉点 $(p)$ は覆われず、$\mathbb Q\otimes_{\mathbb Z}\mathbb Z/p=0$ がその情報を殺す。射を決めるには十分(epic)だが、局所を全部検出する(cover)には足りない。<i>(概念図)</i></figcaption>
</figure>

### しかし、これは cover ではない

epic であっても、$\iota$ は **cover ではない**。たとえば fpqc 位相の意味での cover にあたるのは faithfully flat な射だが、$\mathbb{Z} \to \mathbb{Q}$ は flat ではあっても **faithfully flat ではない**。

実際、

$$\mathbb{Q} \otimes_{\mathbb{Z}} \mathbb{Z}/p\mathbb{Z} = 0$$

である($\mathbb{Z}/p\mathbb{Z}$ は $p$ で消える捩れ加群だが、$\mathbb{Q}$ では $p$ が可逆なので、テンソル積が潰れる)。faithfully flat なら「$\mathbb{Q} \otimes_{\mathbb{Z}} M = 0 \Rightarrow M = 0$」が成り立たねばならないが、$M = \mathbb{Z}/p\mathbb{Z} \neq 0$ が反例になる。

これは、$\mathbb{Z} \to \mathbb{Q}$ が $\mathbb{Z}/p\mathbb{Z}$ という**閉点方向の情報を殺してしまう**ことを意味する。生成点しか見ていないのだから当然だ。だから $\iota$ は「局所的に全部を検出できる」写像 ── cover ── ではない。

epic ではあるが、cover ではない。**情報を決めるには十分だが、すべてを検出するには足りない。**

---

## 4. 例 2:離散 $\mathbb{N}$ から密着 $\mathbb{N}$ への恒等写像 ── 全射 epic だが cover でない

今度は位相空間の圏 $\mathbf{Top}$ を考える。同じ集合 $\mathbb{N}$ に二つの位相を入れる。

- $X = (\mathbb{N}, \mathcal{P}(\mathbb{N}))$:**離散位相**(すべての部分集合が開)
- $Y = (\mathbb{N}, \{\emptyset, \mathbb{N}\})$:**密着位相**(開集合は $\emptyset$ と全体のみ)

そして、台集合の上では恒等写像である連続写像

$$f: (\mathbb{N}, \mathcal{P}(\mathbb{N})) \longrightarrow (\mathbb{N}, \{\emptyset, \mathbb{N}\})$$

を見る。

**$f$ は連続である。** $Y$ の開集合は $\emptyset$ と $\mathbb{N}$ だけ。その逆像 $f^{-1}(\emptyset) = \emptyset$, $f^{-1}(\mathbb{N}) = \mathbb{N}$ は、離散位相 $X$ ではもちろん開。連続性の条件「開集合の逆像が開」は満たされる。

**$f$ は monic である。** 台集合の上で全単射(恒等写像)であり、$\mathbf{Top}$ では単射な連続写像は monic だからだ。

**$f$ は epic である。** $\mathbf{Top}$ では、連続写像が epic であることは像が稠密であることに対応する。とくに全射連続写像はつねに epic である。$f$ は台の上で全射だから、epic である。

ここまでで、$f$ は **monic かつ epic** である。だが ──

**$f$ は同相写像(iso)ではない。** 逆向きの台恒等写像

$$(\mathbb{N}, \{\emptyset, \mathbb{N}\}) \longrightarrow (\mathbb{N}, \mathcal{P}(\mathbb{N}))$$

は連続ではない。たとえば一点集合 $\{0\}$ は離散位相 $X$ では開だが、その逆像 $\{0\}$ は密着位相では開でない。だから逆写像は連続にならず、$f$ は同相ではない。

> $f$ は、**monic かつ epic だが iso ではない**例である。

「monic かつ epic なら iso」が成り立つ圏(balanced category と呼ばれる)もあるが、$\mathbf{Top}$ はそうではない。$\mathbf{Set}$ の直観はここでも裏切られる。

### さらに重要:$f$ は商写像ではない

もっと本質的なのは、$f$ が全射連続写像であるにもかかわらず、**商写像(quotient map)ではない**ことだ。

連続写像 $f: X \to Y$ が商写像であるとは、ざっくり言えば

$$U \subseteq Y \text{ が開} \quad \Longleftrightarrow \quad f^{-1}(U) \subseteq X \text{ が開}$$

が成り立つことである。$Y$ の位相が、$X$ の位相から $f$ によって「正しく押し出された」ものになっている、という条件だ。

ところがこの例では、$X$ が離散位相なので、**任意の** $U \subseteq \mathbb{N}$ について $f^{-1}(U) = U$ は $X$ で開である。もし $f$ が商写像なら、上の同値により、任意の $U \subseteq \mathbb{N}$ が $Y$ で開 ── つまり $Y$ も離散位相 ── でなければならない。しかし $Y$ は密着位相である。矛盾。よって $f$ は商写像ではない。

> $f$ は、**点集合としては全部覆っているが、位相構造を正しく押し出していない**全射 epic である。

$f$ は全射であり epic でもあるが、$Y$ の構造を $X$ から再構成する役には立たない。全射 epic であっても cover とは限らない ── この例がそれを示している。

---

## 5. epic と cover の違い ── 一意性と、存在

二つの例を経て、epic と cover の差がはっきりしてきた。それを降下(descent)の言葉で整理しよう。

**epic は「降下の一意性」に近い。** $f: X \to Y$ が epic だとは、$f$ のあとに来る射 $g, h$ が一致するかどうかを、$f$ で precompose した結果だけで判定できる、ということだった。これは「$Y$ 上のデータは、もし $X$ に引き戻して一致するなら、$Y$ 上でも一致する」── すなわち**降下したものの一意性**を保証する。

**cover が要求するのは、それに加えて「存在」である。** cover、あるいは effective epi、あるいは商写像のような概念は、「$X$ 上で与えられた、互換性のある局所データが、実際に $Y$ の上のデータとして**降りてくる**」という存在性まで要求する。局所的に与えられたものが、貼り合わさって大域的なものになる ── その存在を保証するのが cover である。

記号的にまとめれば、

$$\text{epic} \ \approx\ \text{降下の一意性}$$
$$\text{cover} \ \approx\ \text{降下の一意性} \ +\ \text{存在}$$

例 1 の $\mathbb{Z} \to \mathbb{Q}$ は、射を一意に決める(一意性)が、閉点方向の情報を殺してしまう ── 局所データが全部は降りてこない。例 2 の離散 $\mathbb{N} \to$ 密着 $\mathbb{N}$ は、点には全部届く(全射)が、位相構造が押し出されない ── 構造が降りてこない。どちらも「一意性」はあるが「存在」の側で cover に届かない。

---

## 6. まとめ ── generic すぎる epic と、粗すぎる全射 epic

三つの概念を、三つの言葉で対比しよう。

- **epic** は、射を**右から区別する**条件である。$f$ のあとに来るものを一意に決める。
- **全射**は、点集合として**すべての点に届く**条件である。
- **cover** は、局所データを貼り合わせ、降下させるための条件である。一意性に加えて存在を要求する。

<figure>
<svg viewBox="0 0 460 196" width="100%" style="max-width:460px;display:block;margin:8px auto" role="img" aria-label="iso⊂cover⊂全射epic⊂epicの包含と二例の位置">
  <g font-family="serif" font-size="11" fill="#2b2118">
    <!-- nested boxes (containment ladder) -->
    <rect x="20" y="20" width="420" height="160" rx="6" fill="#fbf6ec" stroke="#6b5d44"/><text x="40" y="38" font-size="10.5" fill="#6b5d44">epic(右消去・区別)</text>
    <rect x="44" y="48" width="372" height="120" rx="5" fill="#f4ede0" stroke="#8a7f6c"/><text x="62" y="66" font-size="10.5" fill="#8a7f6c">全射 epic(到達＋区別)</text>
    <rect x="70" y="76" width="320" height="80" rx="4" fill="#eef5fa" stroke="#2f5d7c"/><text x="86" y="94" font-size="10.5" fill="#2f5d7c">cover(再構成・降下の存在)</text>
    <rect x="100" y="104" width="260" height="44" rx="4" fill="#eef1ea" stroke="#5a6e4a"/><text x="230" y="130" text-anchor="middle" font-size="10.5" fill="#5a6e4a">iso(Set では全部ここに潰れる)</text>
    <!-- example placements -->
    <circle cx="400" cy="38" r="4" fill="#b1342a"/><text x="330" y="42" font-size="9" fill="#b1342a">ℤ→ℚ(epicのみ)</text>
    <circle cx="376" cy="66" r="4" fill="#b1342a"/><text x="300" y="70" font-size="9" fill="#b1342a">離散→密着ℕ(全射epic)</text>
  </g>
</svg>
<figcaption><b>図1 ─ 概念の包含と二例の位置.</b> iso ⊊ cover ⊊ 全射epic ⊊ epic。$\mathbf{Set}$ では四つが一点(iso)に潰れて見分けがつかないが、外に出ると分かれる。$\mathbb Z\to\mathbb Q$ は最外殻(epic だが全射でない)、離散→密着 $\mathbb N$ は一つ内側(全射 epic だが cover でない)。どちらも cover の壁の外側で、失敗の仕方が違う。<i>(概念図)</i></figcaption>
</figure>

本記事の二つの例は、この三つがいかにズレうるかを、異なる仕方で照らし出していた。

$$\mathbb{Z} \to \mathbb{Q} \quad \text{は「generic すぎる epic」}$$

像は生成点ただ一つに集中し、閉点をまったく覆わない。射を決めるには十分(epic)だが、全射でなく、cover でもない。

$$(\mathbb{N}, \mathcal{P}(\mathbb{N})) \to (\mathbb{N}, \{\emptyset, \mathbb{N}\}) \quad \text{は「粗すぎる全射 epic」}$$

点には全部届く(全射 epic)が、行き先の位相が粗すぎて、構造が押し出されない。商写像でなく、cover でもない。

どちらも **monic かつ epic だが iso ではなく**、しかも **cover として失敗する理由が異なる**。一方は「届く範囲が狭すぎる(generic)」ために、もう一方は「行き先の構造が粗すぎる」ために失敗する。この二例を並べると、epic・全射・cover の違いが立体的に見えてくる。

最後に、三語で締めよう。

> **epic は区別不能性、全射は到達性、cover は再構成可能性。**

epic は「あとに続くものを区別できる」、全射は「すべての点に到達する」、cover は「局所から大域を再構成できる」。$\mathbf{Set}$ ではこれらが見分けにくく溶け合っているが、一歩外に出れば、三つはくっきりと別の概念になる。

---

> **横断メモ(被覆・降下クラスタ).** ここの **cover**(降下の一意性＋存在)は、Grothendieck 位相=site における「被覆族」の正体だ。空間を点でなく被覆の代数で見る話(別記事「点ではなく、開集合の代数で登る」)では、Zariski が粗すぎて étale 被覆へ豊穣化したが、その「被覆」がまさに本記事の cover(faithfully flat / fpqc)── epic や全射では足りず、降下の存在まで要る、という本記事の主張がそこで効いている。また「epic≈一意性、cover≈一意性＋存在」は、別記事「確率空間を Stone 的に読み替える」の層の公理(整合性 vs 貼り合わせ)と同じ切り分けで、あちらは確率の filtration 塔で貼り合わせ(存在)が崩れる話だった。そして §3 の $\operatorname{Spec}\mathbb Z$(閉点 $(p)$＋生成点)を「数論的曲線」と見る視点は、別記事「有限素点と無限素点」の $\operatorname{Spec}\mathcal O_K$=有限素点と地続きだ。

## 査読・限界(解説モード)

- **依拠する標準事実**:epic の右消去定義、局所化 $A\to S^{-1}A$ が $\mathbf{CRing}$ で epic、$\mathbb Q\otimes_{\mathbb Z}\mathbb Z/p=0$(ゆえ $\mathbb Z\to\mathbb Q$ は faithfully flat でない)、$\mathbf{Top}$ で連続写像が epic ⇄ 像が稠密、商写像の特徴づけ、$\mathbf{Set}$ が balanced(monic+epic⇒iso)であること。標準的な圏論・可換環論・一般位相。
- **境界**:$\mathbf{Set}$ では epic=全射=cover が一致(balanced)── 三概念の区別は Set の外で初めて見える。本記事の二例(ℤ→ℚ、離散→密着ℕ)はその分離の最小実例。
- 既知の概念整理であり、新規主張を含まない。

## 参考文献・確認先

- S. Mac Lane, *Categories for the Working Mathematician*, Springer GTM 5. epic / monic の定義と基本性質。
- E. Riehl, *Category Theory in Context*, Dover. epic・monic・balanced category の現代的な扱い。無料版あり。
- The Stacks Project. fpqc 位相・faithfully flat・descent の標準的な参照先:<https://stacks.math.columbia.edu/>
- 局所化が $\mathbf{CRing}$ で epic になることについては、可換環論の標準的な教科書(Atiyah–Macdonald など)の局所化の章、および圏論的には epi の特徴づけを扱う文献を参照。
- $\mathbf{Top}$ における epi(像の稠密性)・商写像については、一般位相の標準教科書を参照。
