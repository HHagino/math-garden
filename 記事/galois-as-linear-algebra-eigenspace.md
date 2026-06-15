---
title: Galois 理論を線形代数として見る ── 拡大体は表現空間である
date: 2026-05-15
updated: 2026-06-02
tags: [Galois理論, 線形代数, 表現論, 固有ベクトル, 固有値, 指標, Kummer理論, 円分体, 巡回拡大, アーベル拡大, 群環, 正規基底定理, 類体論, Iwasawa理論]
status: done
level: 数学解説(群・体・線形代数の初歩を知っている読者向け)
---

# Galois 理論を線形代数として見る ── 拡大体は表現空間である

## 1. 導入:Galois 理論のもう一つの顔

Galois 理論を最初に学ぶとき、中心に置かれるのはたいてい **Galois 対応** である。体拡大 $L/K$ の中間体と、Galois 群 $G = \mathrm{Gal}(L/K)$ の部分群とが、包含関係を逆にして一対一に対応する ── 中間体 $\leftrightarrow$ 部分群、という格子の対応。これが主役だ。

しかし、同じ拡大を別の角度から見ることもできる。$L/K$ が与えられたとき、Galois 群 $G$ は $L$ に **作用** している。「作用している」とは、群 $G$ が空間 $L$ の上で動いている、ということだ。そして線形代数を学んだ人なら、「群や演算子が空間に作用する」と聞いた瞬間に、固有ベクトル・固有値・対角化、という言葉を思い出すはずである。

本記事の主張は、この直観がそのまま通用する、ということだ。次の対応表を、これから一つずつ説明していく。

| 線形代数・表現論 | Galois 理論 |
|---|---|
| ベクトル空間 | 拡大体 $L$(を $K$ 上のベクトル空間と見たもの) |
| 線形演算子 | Galois 群の元 $\sigma \in G$ |
| 固有ベクトル | $\sigma(x) = (\text{スカラー}) \cdot x$ をみたす元 $x$ |
| 固有値 | 指標の値 $\chi(\sigma)$ |
| 同時固有ベクトル | Kummer 拡大の生成元 $\sqrt[n]{a}$ |
| 一次元表現 | 指標 $\chi : G \to K^\times$ |

最終的に到達したいのは、「中間体と部分群の対応」ではなく、「**$L$ そのものを、Galois 群が作用する表現空間として見る**」という視点である。

---

## 2. $\sigma$ は $K$-線形変換である

まず一番基本的な事実から始めよう。

$L/K$ を Galois 拡大、$\sigma \in G = \mathrm{Gal}(L/K)$ とする。定義により $\sigma$ は $L$ の体自己同型で、$K$ の元をすべて固定する:任意の $c \in K$ に対し $\sigma(c) = c$。

ここで $L$ を **$K$ 上のベクトル空間** として見よう。これは難しいことではない。$L$ は和と、スカラー倍($K$ の元を掛ける操作)を持つから、$K$-ベクトル空間の公理をみたす。その次元は拡大次数そのものだ:

$$\dim_K L = [L : K].$$

Galois 拡大なら、さらに $[L:K] = |G|$ が成り立つ。

この $K$-ベクトル空間 $L$ の上で、$\sigma$ は何をしているか。$\sigma$ は加法を保つ:$\sigma(x+y) = \sigma(x) + \sigma(y)$。そしてスカラー倍について、$c \in K$ なら

$$\sigma(c x) = \sigma(c)\, \sigma(x) = c \cdot \sigma(x) \qquad (\sigma(c) = c \text{ を使った})$$

となる。つまり $\sigma$ は **$K$-線形写像** である。しかも全単射だから、$L$ 上の可逆な線形変換 ── $K$-線形同型 ── になっている。

注意してほしいのは、$\sigma$ は本当はもっと強い性質(積も保つ体自己同型である)を持っているのに、ここではあえてその一部 ── $K$-線形性 ── だけを見ている、という点だ。「$\sigma$ を線形演算子として見る」とは、$\sigma$ の乗法的な構造をいったん忘れ、線形代数の道具だけで $\sigma$ を調べる、という態度のことである。

こうして $G$ の元はすべて、有限次元 $K$-ベクトル空間 $L$ 上の線形演算子になった。線形代数の出番である。

---

## 3. Kummer 拡大:対角化される演算子

線形演算子を見たら、まず固有ベクトルと固有値を探したくなる。一番きれいに見える例から始めよう。

$K$ を体とし、**1 の原始 $n$ 乗根 $\zeta_n$ が $K$ に含まれている** と仮定する($K$ の標数は $n$ を割らないとする)。$a \in K^\times$ を取り、$x^n - a$ が $K$ 上既約だとして、その根の一つを $\alpha = \sqrt[n]{a}$ と書く。$L = K(\alpha)$ を **Kummer 拡大** と呼ぶ。この仮定のもとで $L/K$ は Galois 拡大で、$[L:K] = n$、Galois 群 $G$ は位数 $n$ の **巡回群** になる。

$\sigma \in G$ は $\alpha$ を $x^n-a$ の別の根 $\zeta_n^k\alpha$ に写すしかない。生成元 $\sigma$ を「$\sigma(\alpha) = \zeta_n \alpha$」となるものに選ぶ。$\{1,\ \alpha,\ \alpha^2,\ \dots,\ \alpha^{n-1}\}$ は $L$ の $K$-基底で、これに $\sigma$ を作用させると

$$\sigma(\alpha^j) = \sigma(\alpha)^j = (\zeta_n \alpha)^j = \zeta_n^{\,j} \cdot \alpha^j.$$

これはまさに線形代数の $T(v) = \lambda v$ の形だ。**$\alpha^j$ は演算子 $\sigma$ の固有ベクトルで、固有値は $\zeta_n^{\,j}$**。基底すべてが固有ベクトルだから、この基底で $\sigma$ を行列表示すると

$$[\sigma] = \mathrm{diag}\bigl(1,\ \zeta_n,\ \zeta_n^2,\ \dots,\ \zeta_n^{\,n-1}\bigr)$$

という対角行列になる。$\sigma$ は対角化されている。

> **具体的に $n=3$ で.** $K=\mathbb Q(\zeta_3)$($\zeta_3=e^{2\pi i/3}$ を含む)、$\alpha=\sqrt[3]{2}$、$L=\mathbb Q(\zeta_3,\sqrt[3]{2})$。$G=\mathrm{Gal}(L/K)$ は位数 $3$ の巡回群で、$\sigma(\sqrt[3]{2})=\zeta_3\sqrt[3]{2}$。基底 $\{1,\sqrt[3]{2},\sqrt[3]{4}\}$ で $[\sigma]=\mathrm{diag}(1,\zeta_3,\zeta_3^2)$。三本の固有直線 $K\cdot1,\ K\cdot\sqrt[3]{2},\ K\cdot\sqrt[3]{4}$ に、固有値 $1,\zeta_3,\zeta_3^2$ がそれぞれ乗る。

$\alpha$ は $\sigma$ の、したがって $\sigma^k$ の固有ベクトルでもあり($\sigma^k(\alpha)=\zeta_n^k\alpha$)、$G$ が $\sigma$ で生成されるから、$\alpha$ は **$G$ のすべての元の同時固有ベクトル**だ。これが対応表の「生成元 $\sqrt[n]{a}$ $\leftrightarrow$ 同時固有ベクトル」の意味である。

<figure>
<svg viewBox="0 0 470 188" width="100%" style="max-width:470px;display:block;margin:8px auto" role="img" aria-label="Kummer拡大の固有空間分解">
  <defs><marker id="ge1" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#5a4f3f"/></marker></defs>
  <!-- diagonal matrix -->
  <text x="86" y="22" text-anchor="middle" font-family="serif" font-size="11" fill="#2b2118">[σ] = 対角行列</text>
  <g font-family="serif" font-size="11">
    <rect x="34" y="32" width="104" height="104" fill="#f7f2e6" stroke="#6b5d44" stroke-width="1.3"/>
    <text x="52" y="54" fill="#b1342a">1</text><text x="78" y="54" fill="#cdbfa0">0</text><text x="104" y="54" fill="#cdbfa0">0</text>
    <text x="52" y="86" fill="#cdbfa0">0</text><text x="78" y="86" fill="#b1342a">ζₙ</text><text x="104" y="86" fill="#cdbfa0">0</text>
    <text x="52" y="118" fill="#cdbfa0">0</text><text x="78" y="118" fill="#cdbfa0">0</text><text x="100" y="118" fill="#b1342a">⋱</text>
  </g>
  <line x1="146" y1="84" x2="210" y2="84" stroke="#5a4f3f" stroke-width="1.4" marker-end="url(#ge1)"/>
  <!-- eigenline decomposition -->
  <g font-family="serif" font-size="11" fill="#2b2118">
    <text x="350" y="22" text-anchor="middle" font-size="11">L = 固有直線の直和</text>
    <rect x="224" y="32" width="252" height="24" fill="#eef5fa" stroke="#2f5d7c"/><text x="232" y="49">K·1            固有値 1</text>
    <rect x="224" y="58" width="252" height="24" fill="#eef5fa" stroke="#2f5d7c"/><text x="232" y="75">K·α           固有値 ζₙ</text>
    <rect x="224" y="84" width="252" height="24" fill="#eef5fa" stroke="#2f5d7c"/><text x="232" y="101">K·α²          固有値 ζₙ²</text>
    <text x="350" y="124" text-anchor="middle" fill="#8a7f6c">⋮  (自明指標の固有空間 K·1 = Lᴳ = K)</text>
  </g>
</svg>
<figcaption><b>図1 ─ Kummer 拡大は対角化される.</b> 基底 $\{1,\alpha,\dots,\alpha^{n-1}\}$ で $\sigma$ は対角行列 $\mathrm{diag}(1,\zeta_n,\zeta_n^2,\dots)$。拡大体 $L$ は固有直線 $K\cdot\alpha^j$ の直和に割れ、固有値 $1$ の固有空間がちょうど基礎体 $K=L^G$。<i>(概念図)</i></figcaption>
</figure>

---

## 4. 固有値の正体は指標である

各 $\alpha^j$ が固有ベクトルになった。「固有値」とは何だったのか、丁寧に見よう。

固定した $j$ に対し $x=\alpha^j$ は $\sigma(x)=\zeta_n^j x$、一般の $\sigma^k$ には $\sigma^k(x)=\zeta_n^{jk}x$ をみたす。つまり「$\sigma^k$ を作用させたときの固有値」は、$\sigma^k$ に $\zeta_n^{jk}$ を対応させる関数

$$\chi_j : G \to K^\times, \qquad \chi_j(\sigma^k) = \zeta_n^{\,jk}$$

で与えられ、$\sigma'(x) = \chi_j(\sigma')\, x$ と一行で書ける。確かめると $\chi_j(\sigma'\sigma'')=\chi_j(\sigma')\chi_j(\sigma'')$ ── $\chi_j$ は **群準同型** $G \to K^\times$、すなわち **一次元表現**、別名 **指標 (character)** だ。

ここで対応表の核心がそろう。固有ベクトル $\leftrightarrow$ $\sigma(x)=\chi(\sigma)x$ をみたす $x$、固有値 $\leftrightarrow$ 指標の値 $\chi(\sigma)$、一次元表現 $\leftrightarrow$ 指標 $\chi:G\to K^\times$。「固有値」は一つの数ではなく、$\sigma$ ごとに値が決まる関数 ── すなわち指標 ── だった。線形代数では一つの演算子の固有値は一つの数だが、ここでは $G$ という群をまるごと相手にするので、固有値は「$G$ 上の関数」へ格上げされる。

---

## 5. 指標ごとの固有空間 $L_\chi$

固有値を指標と読み替えたので、固有空間も定義できる。指標 $\chi:G\to K^\times$ に対し

$$L_\chi := \bigl\{\, x \in L \ \big|\ \sigma(x) = \chi(\sigma)\, x \quad (\forall \sigma \in G) \,\bigr\}$$

が「指標 $\chi$ に属する固有空間」だ。Kummer 拡大では $L_{\chi_j}=K\cdot\alpha^j$($1$ 次元)で、

$$L = L_{\chi_0} \oplus L_{\chi_1} \oplus \cdots \oplus L_{\chi_{n-1}}$$

と直和分解する(図1)。異なる指標の固有空間は固有値が相異なるので独立、次元の合計が $n=\dim_K L$ に一致するから和は $L$ 全体。これは固有空間分解そのものだ。特に自明指標 $\chi_0$ の固有空間は $L_{\chi_0}=L^G=K$ ── 固有値 $1$ の固有空間がちょうど基礎体になっている。

---

## 6. なぜこんなにきれいに分解できたのか

背後に有限群の表現論がある。きいていた仮定は二つ。**(1) $G$ がアーベル(巡回)**、**(2) $K$ が $\zeta_n$ を含む**。

仮定 1 について。有限アーベル群の既約表現は(係数体が十分大きいとき)すべて $1$ 次元だから、高次元のかたまりが出ず、すべてが $1$ 次元固有直線に分かれる。さらにアーベル群の元は可換なので、対応する演算子 $\sigma$ たちも可換になり、**同時対角化** ができる ── 一つの基底ですべての $\sigma$ が同時に対角行列になる。

> **横断メモ.** 「可換な作用素は同時対角化できる/非可換だとできない」は、量子力学で観測量を同時に確定値に持てる条件そのものだ(別記事「生成子が見えると量子力学はわかる」の CSCO・$[L_x,L_y]=i\hbar L_z$)。Galois 群がアーベルか否かと、観測量が可換か否かは、同じ線形代数の事実の二つの顔である。

仮定 2 について。固有値 $\zeta_n^j$ は $1$ の $n$ 乗根だから、それが係数体 $K$ になければ「$K$ 上の固有空間」として閉じない。実行列が実数では対角化できない(固有値が複素数になる)のと同じで、係数体に固有値がそろわないと対角化は止まる。表現論の言葉では、$K$ が標数条件と十分な冪根を満たすとき群環 $K[G]$ は $K$ のコピーの直積に分裂半単純化し、$L$ は $K[G]$-加群として階数 $1$ の自由加群(**正規基底定理**)だから、各指標がちょうど $1$ 回ずつ現れて §5 の分解になる。

---

## 7. 単純化しすぎないために

ここまできれいな話をしてきたが、**一般の Galois 拡大ではこうはいかない**。

**第一に、係数体に固有値がそろっていない場合。** $L=\mathbb Q(\sqrt[3]{2})$ は $\mathbb Q$ 上 Galois ですらない($\sqrt[3]{2}$ の共役 $\zeta_3\sqrt[3]{2}$ が入っていない)。Galois にするには $\zeta_3$ を足して $\mathbb Q(\sqrt[3]{2},\zeta_3)$ を考える必要がある。

**第二に、Galois 群が非可換な場合。** その $\mathbb Q(\sqrt[3]{2},\zeta_3)/\mathbb Q$ の Galois 群は $6$ 次の $S_3$ で非可換だ。非可換な有限群には **$2$ 次元以上の既約表現** が必ず現れる($S_3$ なら $2$ 次元既約表現を持つ)。このとき $L$ はもはや $1$ 次元固有直線だけには分解せず、$2$ 次元以上の「既約なかたまり」が残る。演算子の側でいえば、$\sigma$ たちが可換でないので **同時対角化が不可能**だ。固有空間 $L_\chi$ という $1$ 次元の枠で拾えるのは、$1$ 次元成分だけになる。

<figure>
<svg viewBox="0 0 460 176" width="100%" style="max-width:460px;display:block;margin:8px auto" role="img" aria-label="アーベルは対角化、非可換はブロックが残る">
  <g font-family="serif" font-size="11" fill="#2b2118">
    <text x="116" y="20" text-anchor="middle" font-size="11.5" fill="#5a6e4a">アーベル(巡回):同時対角化 ✓</text>
    <rect x="62" y="32" width="108" height="108" fill="#eef1ea" stroke="#5a6e4a" stroke-width="1.3"/>
    <text x="80" y="56" fill="#b1342a">λ₁</text><text x="108" y="56" fill="#cdbfa0">0</text><text x="140" y="56" fill="#cdbfa0">0</text>
    <text x="80" y="90" fill="#cdbfa0">0</text><text x="106" y="90" fill="#b1342a">λ₂</text><text x="140" y="90" fill="#cdbfa0">0</text>
    <text x="80" y="124" fill="#cdbfa0">0</text><text x="108" y="124" fill="#cdbfa0">0</text><text x="136" y="124" fill="#b1342a">λ₃</text>
    <text x="116" y="160" text-anchor="middle" font-size="10" fill="#8a7f6c">全部1次元の固有直線</text>
    <line x1="230" y1="14" x2="230" y2="160" stroke="#b9ac95" stroke-width="1" stroke-dasharray="3 3"/>
    <text x="346" y="20" text-anchor="middle" font-size="11.5" fill="#b1342a">非可換 S₃:2次元ブロックが残る ✗</text>
    <rect x="292" y="32" width="108" height="108" fill="#f6e7e3" stroke="#b1342a" stroke-width="1.3"/>
    <text x="310" y="56" fill="#2f5d7c">λ</text><text x="338" y="56" fill="#cdbfa0">0</text><text x="370" y="56" fill="#cdbfa0">0</text>
    <rect x="328" y="72" width="64" height="52" fill="none" stroke="#2f5d7c" stroke-width="1.6"/>
    <text x="310" y="100" fill="#cdbfa0">0</text><text x="346" y="92" fill="#2f5d7c">∗</text><text x="372" y="92" fill="#2f5d7c">∗</text>
    <text x="346" y="118" fill="#2f5d7c">∗</text><text x="372" y="118" fill="#2f5d7c">∗</text>
    <text x="346" y="160" text-anchor="middle" font-size="10" fill="#8a7f6c">2次元既約成分(対角化不能)</text>
  </g>
</svg>
<figcaption><b>図2 ─ どこで対角化が止まるか.</b> Galois 群がアーベルで冪根がそろえば、$\sigma$ たちは同時対角化され $L$ は $1$ 次元固有直線の直和。非可換($S_3$ 等)だと $2$ 次元以上の既約ブロックが残り、同時対角化できない。$L_\chi$ で拾えるのは $1$ 次元成分だけだ。<i>(概念図)</i></figcaption>
</figure>

裏を返せば、**この対応がもっとも美しく見えるのは、巡回拡大・アーベル拡大・Kummer 理論・円分体** の世界だ、ということでもある。本記事の線形代数的な見方は、その世界の地図として、ちょうどよい解像度を持っている。

---

## 8. 視点の転換:$L$ は表現空間である

通常の Galois 理論は「中間体 $\leftrightarrow$ 部分群」を主役にする。これは $L$ の部分構造(部分体)を $G$ の部分構造(部分群)で読む見方だ。本記事が推すのは別の見方 ── **$L$ 全体を、群 $G$ が作用する一つの表現空間($K[G]$-加群)として見る**。$\sigma$ は線形演算子、指標 $\chi$ は固有値の担い手、$L_\chi$ は固有空間、$L=\bigoplus_\chi L_\chi$ は固有空間分解(うまくいくとき)。

二つの見方は無関係ではない。部分群 $H\subset G$ の中間体 $L^H$ は「$H$ のすべての元で固定される元」── $H$ に関する不変部分空間だ。Galois 対応は、表現空間 $L$ の不変部分空間と群の部分群を結びつけている、と読み直せる。固有空間分解はその不変部分空間の構造を既約成分のレベルまで割ったものにあたる。「中間体の格子」を静かに眺めるのが静的な Galois 理論なら、「$L$ に作用する $G$ を対角化する」のは動的な Galois 理論だ。

---

## 9. 展望:同じ旋律が鳴り続ける

この「拡大体 $=$ 表現空間」という見方は、いくつもの理論への入口になっている。どれも基本動作は同じ ── **演算子を対角化し、指標ごとの固有空間に分ける**。

<figure>
<svg viewBox="0 0 480 120" width="100%" style="max-width:480px;display:block;margin:8px auto" role="img" aria-label="固有値分解の旋律が理論を貫く">
  <defs><marker id="ge2" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#5a4f3f"/></marker></defs>
  <g font-family="serif" font-size="10" fill="#2b2118">
    <rect x="12" y="40" width="74" height="34" rx="4" fill="#efe6d5" stroke="#6b5d44"/><text x="49" y="55" text-anchor="middle">T(v)=λv</text><text x="49" y="68" text-anchor="middle" font-size="8.5" fill="#8a7f6c">固有値分解</text>
    <line x1="86" y1="57" x2="104" y2="57" stroke="#5a4f3f" stroke-width="1.2" marker-end="url(#ge2)"/>
    <rect x="106" y="40" width="68" height="34" rx="4" fill="#eef5fa" stroke="#2f5d7c"/><text x="140" y="55" text-anchor="middle">Kummer</text><text x="140" y="68" text-anchor="middle" font-size="8.5" fill="#8a7f6c">ζⁿ で対角化</text>
    <line x1="174" y1="57" x2="192" y2="57" stroke="#5a4f3f" stroke-width="1.2" marker-end="url(#ge2)"/>
    <rect x="194" y="40" width="74" height="34" rx="4" fill="#eef5fa" stroke="#2f5d7c"/><text x="231" y="55" text-anchor="middle">円分体</text><text x="231" y="68" text-anchor="middle" font-size="8.5" fill="#8a7f6c">Dirichlet指標</text>
    <line x1="268" y1="57" x2="286" y2="57" stroke="#5a4f3f" stroke-width="1.2" marker-end="url(#ge2)"/>
    <rect x="288" y="40" width="74" height="34" rx="4" fill="#eef5fa" stroke="#2f5d7c"/><text x="325" y="55" text-anchor="middle">類体論</text><text x="325" y="68" text-anchor="middle" font-size="8.5" fill="#8a7f6c">Artin相互</text>
    <line x1="362" y1="57" x2="380" y2="57" stroke="#5a4f3f" stroke-width="1.2" marker-end="url(#ge2)"/>
    <rect x="382" y="40" width="86" height="34" rx="4" fill="#f0e3c4" stroke="#c89b3c"/><text x="425" y="55" text-anchor="middle">Iwasawa</text><text x="425" y="68" text-anchor="middle" font-size="8.5" fill="#8a7f6c">χ-成分分解</text>
  </g>
  <text x="240" y="24" text-anchor="middle" font-family="serif" font-size="11" fill="#2b2118">同じ「固有値=指標で分解」が、塔を昇るほど精緻に反復される</text>
</svg>
<figcaption><b>図3 ─ 一つの旋律.</b> $T(v)=\lambda v$ という線形代数の一行が、Kummer 理論 → 円分体(Dirichlet 指標)→ 類体論(Artin 相互法則)→ Iwasawa 理論($\chi$-成分分解)まで、同じ旋律で鳴り続ける。<i>(概念図)</i></figcaption>
</figure>

**Kummer 理論。** §3 の Kummer 拡大を全部集めると、$\zeta_n$ を含む $K$ の指数 $n$ のアーベル拡大全体が $K^\times/(K^\times)^n$ の部分群と一対一に対応する。各拡大は固有空間 $K\cdot\alpha$ で生成される。

**円分拡大。** $\mathbb Q(\zeta_n)$ の Galois 群は $(\mathbb Z/n\mathbb Z)^\times$ と同型で、このアーベル群の指標がまさに **Dirichlet 指標**だ。円分体を固有空間に分解することは、Dirichlet 指標で和を分解すること ── $L$ 関数論の入口 ── に直結する(別記事「素数の足し算は人類に向いていない」で、算術級数定理の証明が Dirichlet 指標と $L(1,\chi)\neq0$ に乗るのは、まさにこの固有空間分解だ)。

**類体論。** 一般の体 $K$ のアーベル拡大すべてを統制する。中心は、Galois 群のアーベル化の指標を $K$ 側の数論的データ(イデール類群の指標)と同一視する **Artin 相互法則**。「Galois 群の指標」を主役に据える本記事の見方は、そのまま類体論の言葉づかいだ。

**Iwasawa 理論。** 体の無限の塔 $\mathbb Z_p$ 拡大の Galois 作用を、岩澤代数 $\Lambda=\mathbb Z_p[[T]]$ 上の加群として調べる。ここでも加群を指標(Teichmüller 指標)ごとの **$\chi$-成分に分解**して各成分を解析する。本記事の「対角化して指標ごとの固有空間に分ける」所作が、無限次の塔の上で反復される(この pro-finite な Galois 塔の上で確率の filtration 塔と対応を取る試みが、別記事「確率空間を Stone 的に読み替える」── filtration↔Galois の survey ── だ)。

線形代数で習った $T(v) = \lambda v$ ── たったこれだけの式が、Kummer 理論から円分体、類体論、Iwasawa 理論まで、同じ旋律で鳴り続けている。拡大体 $L$ は、Galois 群がその上で踊る舞台なのである。

---

## 査読・限界(解説モード)

- **依拠する標準事実**:$\sigma$ の $K$-線形性、Kummer 拡大の構造と巡回 Galois 群、有限アーベル群の既約表現が(分裂体上で)$1$ 次元であること、正規基底定理($L\cong K[G]$ as $K[G]$-加群)、$\mathrm{Gal}(\mathbb Q(\zeta_n)/\mathbb Q)\cong(\mathbb Z/n)^\times$、Artin 相互法則、Iwasawa 加群の $\chi$-分解。いずれも標準的な代数・整数論の事実。
- **本記事の立ち位置**:新規定理ではなく、既知の Galois 理論を線形代数・表現論の語彙で**配置し直した解説**。オリジナリティは道具でなく視点(「$L$ は表現空間」)にある。
- **境界(§7)**:対応が $1$ 次元固有空間で閉じるのは、Galois 群がアーベル かつ 係数体に冪根がそろうときに限る。非可換だと $2$ 次元以上の既約成分が残り、同時対角化はできない ── そこが「線形代数として見る」見方の射程の端だ。

> **横断メモ(庭の結節点).** この記事は四方に繋がる:同時対角化と可換性は「生成子が見えると量子力学はわかる」(CSCO)、Dirichlet 指標と $L$ 関数は「素数の足し算は人類に向いていない」、Iwasawa の塔と $\chi$-分解は「確率空間を Stone 的に読み替える」(filtration↔Galois)、Galois 群と被覆は「点ではなく、開集合の代数で登る」(étale 基本群)。**「群の作用を指標=固有値で分解する」という一つの所作**が、これら全部を貫いている。
