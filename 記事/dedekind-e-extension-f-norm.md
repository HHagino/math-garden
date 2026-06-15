---
title: "拡大は e、ノルムは f ── デデキント環の有限拡大に潜む二つの数の役割分担"
date: 2026-05-20
updated: 2026-06-02
status: 墓場
level: 数学解説(代数的整数論・可換環論の初歩を知っている読者向け)
abstract: |
  デデキント環の有限拡大 A⊂B で、イデアルの拡大 I↦IB には分岐指数 e、イデアルノルム J↦N(J) には剰余体次数 f が現れる ── 同じ二環の対応なのに向きを変えると e と f が役割を交代する。e は値群の伸び(垂直の厚み)、f は剰余体の伸び(水平の重み)で、合成すると ∑_{P|p} e_P f_P = [L:K] が回収される。局所では離散付値環で e·f=[L:K]_local。ℚ(i) の split/inert/ramified を例に、二つの独立な層(値群・剰余体)を可視化する。
---

# デデキント拡大における $e$ と $f$ ── 拡大は $e$、ノルムは $f$

## タイトル案

1. 拡大は $e$、ノルムは $f$ ── デデキント環の有限拡大に潜む二つの数の役割分担
2. なぜノルム側に剰余体次数が出てくるのか ── イデアル拡大とイデアルノルムの対比
3. 垂直の厚みと水平の重み ── デデキント拡大の $e$ と $f$ の物語
4. 上へ伸びる $e$、下へ畳む $f$ ── 素イデアル分解とイデアルノルム
5. 拡大次数 $[L:K]$ を $e$ と $f$ で回収する ── デデキント環の基本対比

---

## 素朴な驚きから

デデキント環 $A \subset B$ の有限拡大があり、それぞれの商体を $K \subset L$ とする。このとき、イデアルの間には自然な二つの対応がある。

- **イデアルの拡大**:$A$ のイデアルから $B$ のイデアルへ
  $$I \;\longmapsto\; IB.$$

- **イデアルのノルム**:$B$ のイデアルから $A$ のイデアルへ
  $$J \;\longmapsto\; N_{L/K}(J).$$

どちらもイデアルの積を保つ、つまり乗法的な準同型である。

ここで素朴な驚きがある。

$$\mathfrak p B \;=\; \prod_{\mathfrak P \mid \mathfrak p} \mathfrak P^{e(\mathfrak P/\mathfrak p)}$$

という分解で**分岐指数 $e$** が現れるのは、まあそうだろう、と納得できる。素イデアル $\mathfrak p$ を上に持ち上げたら、上の素イデアル $\mathfrak P$ が「何重に重なって現れるか」を知りたい量なのだから、当然だ。

ところが逆向きの

$$N_{L/K}(\mathfrak P) \;=\; \mathfrak p^{f(\mathfrak P/\mathfrak p)}$$

という公式では、突然**剰余体次数 $f$** が顔を出す。$f$ は何かというと、剰余体の拡大次数
$$f(\mathfrak P/\mathfrak p) \;=\; [B/\mathfrak P : A/\mathfrak p]$$
である。「上の素イデアルを下に押し戻したら、その指数として剰余体の拡大次数が出る」── これは初見だと、ちょっと面白い。

イデアルの拡大では $e$、ノルムでは $f$。**同じ二つの環の間の対応なのに、向きを変えるだけで $e$ と $f$ が役割を交代する**。この対比こそ、本記事の主題だ。

## 1. デデキント環では、素イデアルだけ見れば十分

まずは復習から。デデキント環の非零イデアル $I$ は、素イデアルの積に**一意に分解**できる:
$$I \;=\; \prod_{\mathfrak p} \mathfrak p^{v_{\mathfrak p}(I)}.$$

しかも、イデアルの積はこの指数の足し算に対応する。したがって、イデアルを保つ任意の乗法的対応(積を積に送る写像)は、**素イデアルがどこに行くかを決めれば、すべて決まる**。

ということは、これからやることは単純化された:イデアルの拡大とイデアルノルムを、**素イデアル限定で**見るだけでよい。

## 2. 拡大 $\mathfrak p B$ には分岐指数 $e$ が出る

$A$ の素イデアル $\mathfrak p$ を $B$ に拡げる:
$$\mathfrak p B \;=\; \prod_{\mathfrak P \mid \mathfrak p} \mathfrak P^{e_{\mathfrak P}}, \qquad e_{\mathfrak P} = e(\mathfrak P/\mathfrak p).$$

ここで $\mathfrak P \mid \mathfrak p$ は「$\mathfrak P \cap A = \mathfrak p$」を意味する。指数 $e_{\mathfrak P}$ が**分岐指数**だ。

幾何的な絵で見るとわかりやすい。スキームの言葉で
$$\mathrm{Spec}\, B \;\longrightarrow\; \mathrm{Spec}\, A$$
を考えると、$\mathfrak p \in \mathrm{Spec}\, A$ の逆像は $\mathrm{Spec}\, B$ の中の有限集合で、$\{\mathfrak P_1, \ldots, \mathfrak P_g\}$ という有限個の素イデアルからなる。

ただ「逆像にある」というだけなら $e_{\mathfrak P}$ は出てこない。$e_{\mathfrak P}$ は、その逆像が**重複度込みで**どのくらいの厚みを持って現れるかを測っている。$e_{\mathfrak P} = 1$ なら不分岐、$e_{\mathfrak P} \ge 2$ なら $\mathfrak P$ は $\mathfrak p$ の上で「分岐している」と言う。

イメージとしては、$\mathrm{Spec}\, A$ 上の 1 点 $\mathfrak p$ を $\mathrm{Spec}\, B$ から見たとき、

> $e_{\mathfrak P} \;=\;$ 上の点 $\mathfrak P$ における **垂直方向の厚み**

である。下から上に「点を持ち上げる」操作で生じる厚みだ。

## 3. ノルム $N_{L/K}(\mathfrak P)$ には剰余体次数 $f$ が出る

逆向きを考えよう。$B$ の素イデアル $\mathfrak P$ を取り、そのイデアルノルムを取る:
$$N_{L/K}(\mathfrak P) \;=\; \mathfrak p^{f_{\mathfrak P}}, \qquad f_{\mathfrak P} = [B/\mathfrak P : A/\mathfrak p].$$

ここで $\mathfrak p = \mathfrak P \cap A$ である。

注目すべきは、**ノルムが単に $\mathfrak p$ を返すのではなく、$\mathfrak p^{f_{\mathfrak P}}$ を返す**という点だ。$\mathfrak P$ を下に押し戻すと、ただの $\mathfrak p$ ではなく、$\mathfrak p$ の $f_{\mathfrak P}$ 乗が出てくる。

なぜ $f$ なのか。直感はこうだ。

$\mathfrak P$ は $L$ の中の素イデアル ── 言い換えれば、「$L$ レベルの点」である。一方 $\mathfrak p$ は「$K$ レベルの点」。$L/K$ という拡大の下では、$L$ 側の 1 点は、$K$ 側から見ると剰余体拡大 $A/\mathfrak p \subset B/\mathfrak P$ の次数 $f_{\mathfrak P}$ だけの「重み」を持つ。

ノルムは、まさにこの「点を下へ押し出すときの算術的な重み」を拾う操作になっている。

別の言い方をすれば、$\mathfrak P$ は剰余体 $B/\mathfrak P$ という体を提供しているが、$K$ から見るとそれは $f_{\mathfrak P}$ 次の拡大体である。したがって $\mathfrak P$ という素イデアルが下から見ると $f_{\mathfrak P}$ 個分の「点に相当する大きさ」を持っている、と読める。ノルムはそのサイズを記録する。

## 4. $e$ と $f$ の意味の対比

ここで一度立ち止まり、$e$ と $f$ の意味を並べて書こう。

$$\boxed{\;\text{イデアルの拡大}\;I \mapsto IB \;\text{では、分岐指数 }e\text{ が現れる}\;}$$

$$\boxed{\;\text{イデアルノルム}\;J \mapsto N_{L/K}(J) \;\text{では、剰余体次数 }f\text{ が現れる}\;}$$

直感的には、

$$e \;=\; \text{垂直方向の厚み} \;=\; \text{下の点を上に持ち上げたとき、上の点がどれだけ重なるか}$$

$$f \;=\; \text{水平方向の重み} \;=\; \text{上の点を下から見たときの算術的な大きさ}$$

両者は同じ「素イデアルの対応」を表現しているが、見ている方向が違う。$e$ は値群側の伸び、$f$ は剰余体側の伸び。$e$ は「もとの場所からどれだけ厚くなったか」、$f$ は「その点が下から見るとどれだけ大きいか」。

これがイデアルの拡大とイデアルノルムで $e$ と $f$ が役割を交代する理由だ。**拡大は値群を伸ばす方向の操作、ノルムは剰余体を測る方向の操作**、と言ってもよい。

<figure>
<svg viewBox="0 0 440 200" width="100%" style="max-width:440px;display:block;margin:8px auto" role="img" aria-label="Spec B→Spec A の e と f">
  <defs><marker id="dk1" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#5a4f3f"/></marker></defs>
  <g font-family="serif" font-size="10.5" fill="#2b2118">
    <text x="30" y="44" font-size="10.5" fill="#2f5d7c">Spec B</text>
    <line x1="60" y1="56" x2="400" y2="56" stroke="#2f5d7c" stroke-width="1"/>
    <!-- P1: thick (e=2) -->
    <rect x="110" y="40" width="14" height="30" fill="#b1342a" opacity="0.5" stroke="#b1342a"/><text x="117" y="34" text-anchor="middle" font-size="9" fill="#b1342a">𝔓₁ e=2</text>
    <!-- P2: wide (f=2) -->
    <rect x="240" y="48" width="40" height="14" fill="#5a6e4a" opacity="0.5" stroke="#5a6e4a"/><text x="260" y="34" text-anchor="middle" font-size="9" fill="#5a6e4a">𝔓₂ f=2</text>
    <!-- arrow down -->
    <line x1="160" y1="80" x2="160" y2="140" stroke="#5a4f3f" stroke-width="1.4" marker-end="url(#dk1)"/><text x="172" y="112" font-size="9" fill="#8a7f6c">Spec B→Spec A</text>
    <text x="30" y="160" font-size="10.5" fill="#6b5d44">Spec A</text>
    <line x1="60" y1="170" x2="400" y2="170" stroke="#6b5d44" stroke-width="1"/>
    <circle cx="160" cy="170" r="4" fill="#2b2118"/><text x="160" y="190" text-anchor="middle" font-size="9">𝔭</text>
    <text x="320" y="124" text-anchor="middle" font-size="10" fill="#b1342a">e=垂直の厚み(値群)</text>
    <text x="320" y="140" text-anchor="middle" font-size="10" fill="#5a6e4a">f=水平の重み(剰余体)</text>
    <text x="320" y="156" text-anchor="middle" font-size="10" fill="#2b2118">∑ e𝔓 f𝔓 = [L:K]</text>
  </g>
</svg>
<figcaption><b>図1 ─ $e$ は垂直、$f$ は水平.</b> $\mathrm{Spec}\,B\to\mathrm{Spec}\,A$ で、下の点 $\mathfrak p$ の上にある素イデアル $\mathfrak P$ は、分岐指数 $e$ ぶんの<b>垂直の厚み</b>(値群の伸び)と、剰余体次数 $f$ ぶんの<b>水平の重み</b>(点としての大きさ)を持つ。両者を掛けて上の素イデアルで足すと $\sum e_\mathfrak{P}f_\mathfrak{P}=[L:K]$。<i>(概念図)</i></figcaption>
</figure>

## 5. 合成すると $[L:K]$ が回収される

ここからが綺麗なところだ。$\mathfrak p B$ にノルムを掛けてみよう:

$$N_{L/K}(\mathfrak p B) \;=\; N_{L/K}\!\left(\prod_{\mathfrak P \mid \mathfrak p} \mathfrak P^{e_{\mathfrak P}}\right) \;=\; \prod_{\mathfrak P \mid \mathfrak p} N_{L/K}(\mathfrak P)^{e_{\mathfrak P}} \;=\; \prod_{\mathfrak P \mid \mathfrak p} \mathfrak p^{e_{\mathfrak P} f_{\mathfrak P}} \;=\; \mathfrak p^{\sum_{\mathfrak P \mid \mathfrak p} e_{\mathfrak P} f_{\mathfrak P}}.$$

一方、$A$ のイデアル $I$ に対しては、定義から
$$N_{L/K}(IB) \;=\; I^{[L:K]}$$
が成り立つ(ノルムの底側への作用は $[L:K]$ 乗)。

したがって、$I = \mathfrak p$ の場合に
$$\boxed{\;\sum_{\mathfrak P \mid \mathfrak p} e_{\mathfrak P} f_{\mathfrak P} \;=\; [L:K]\;}$$

という公式が得られる。これがデデキント環の有限拡大における**最も基本的な等式**だ(良い条件 ── たとえば $B$ が $A$ 上有限生成かつ整閉、あるいは $B$ が代数体の整数環で $L/K$ が分離的 ── のもとで)。

$[L:K]$ という、見るからに代数的・大域的な量が、各素イデアル $\mathfrak p$ の上での
$$\{e_{\mathfrak P} f_{\mathfrak P}\}_{\mathfrak P \mid \mathfrak p}$$
という局所的なデータの和として回収される。**全体の拡大次数は、垂直方向の厚みと水平方向の重みを掛け合わせ、それらを上にある素イデアルで足し合わせることで再現される**。

この式が、$e$ と $f$ という二つの数を別々に導入する意味を、もっとも端的に示している。

**手で確かめる($\mathbb Q(i)$).** $A=\mathbb Z\subset B=\mathbb Z[i]$、$[L:K]=2$。素数の振る舞いは $\bmod\,4$ で決まる。

| 素数 | 分解 | $g,\,e,\,f$ | $\sum ef$ |
|---|---|---|---|
| $5\equiv1$ | $(5)=(2+i)(2-i)$ 分解(split) | $g=2,\,e=f=1$ | $1\cdot1+1\cdot1=2$ |
| $3\equiv3$ | 惰性(inert) | $g=1,\,e=1,\,f=2$ | $1\cdot2=2$ |
| $2$ | $(2)=(1+i)^2$ 分岐(ramified) | $g=1,\,e=2,\,f=1$ | $2\cdot1=2$ |

どの素数でも $\sum ef=2=[\mathbb Q(i):\mathbb Q]$。同じ拡大次数 $2$ が、分解(横に $f$・$g$)・分岐(縦に $e$)という別の形で実現されている。

<figure>
<svg viewBox="0 0 460 158" width="100%" style="max-width:460px;display:block;margin:8px auto" role="img" aria-label="Q(i)でのsplit inert ramified">
  <g font-family="serif" font-size="10.5" fill="#2b2118" text-anchor="middle">
    <text x="76" y="20">5:split</text>
    <circle cx="56" cy="50" r="6" fill="#5a6e4a"/><circle cx="96" cy="50" r="6" fill="#5a6e4a"/>
    <text x="76" y="78" font-size="9" fill="#8a7f6c">𝔓₁𝔓₂, e=f=1, g=2</text>
    <circle cx="76" cy="108" r="5" fill="#2b2118"/><text x="76" y="128" font-size="9">(5)</text>
    <line x1="170" y1="80" x2="170" y2="20" stroke="#b9ac95" stroke-dasharray="3 3"/>
    <text x="246" y="20">3:inert</text>
    <rect x="230" y="40" width="32" height="20" fill="#c89b3c" opacity="0.5" stroke="#c89b3c"/>
    <text x="246" y="78" font-size="9" fill="#8a7f6c">e=1, f=2, g=1</text>
    <circle cx="246" cy="108" r="5" fill="#2b2118"/><text x="246" y="128" font-size="9">(3)</text>
    <line x1="330" y1="80" x2="330" y2="20" stroke="#b9ac95" stroke-dasharray="3 3"/>
    <text x="406" y="20">2:ramified</text>
    <rect x="398" y="36" width="16" height="32" fill="#b1342a" opacity="0.5" stroke="#b1342a"/>
    <text x="406" y="78" font-size="9" fill="#8a7f6c">e=2, f=1, g=1</text>
    <circle cx="406" cy="108" r="5" fill="#2b2118"/><text x="406" y="128" font-size="9">(2)</text>
    <text x="230" y="150" font-size="9.5" fill="#2b2118">いずれも ∑ef = 2 = [ℚ(i):ℚ]</text>
  </g>
</svg>
<figcaption><b>図2 ─ $\mathbb Q(i)$ の三つの顔.</b> $p\equiv1$ は分解(横に $g=2$ 個、$e=f=1$)、$p\equiv3$ は惰性(横に $f=2$ 太く)、$p=2$ は分岐(縦に $e=2$ 厚く)。どれも $\sum ef=2$。同じ次数 $2$ が、横の $f,g$ と縦の $e$ という違う形で配分される。<i>(概念図)</i></figcaption>
</figure>

## 6. 局所化と DVR ── 値付け側でもう一度

なぜ $e$ が「値群側」、$f$ が「剰余体側」なのか、局所的にも確認しておこう。

$\mathfrak p$ と $\mathfrak P$ で局所化すると、$A_{\mathfrak p}$ と $B_{\mathfrak P}$ はそれぞれ**離散付値環(DVR)**になる(デデキント環の素イデアルでの局所化は DVR)。

$A_{\mathfrak p}$ の極大イデアル生成元(uniformizer)を $\pi_{\mathfrak p}$、$B_{\mathfrak P}$ のものを $\pi_{\mathfrak P}$ とすると、
$$\pi_{\mathfrak p} \;=\; u \cdot \pi_{\mathfrak P}^{e_{\mathfrak P}}, \qquad u \in B_{\mathfrak P}^\times.$$

つまり値付けは
$$v_{\mathfrak P}(x) \;=\; e_{\mathfrak P/\mathfrak p}\, v_{\mathfrak p}(x), \qquad x \in K^\times$$
のように伸びる。**値群側で $e$ 倍だけ細かくなる**、というのが分岐の意味だ。

これと並行して、剰余体は
$$A/\mathfrak p \;\subset\; B/\mathfrak P$$
という有限次拡大を作る。その次数が $f$ だ。値群でも剰余体でも、それぞれ独立に拡大が起きうる。完備かつ良い条件のもとで、

$$[L:K]_{\text{local}} \;=\; e \cdot f$$

が成り立つ(完備の場合は素イデアルが一つに揃うので、和が積になる)。これは大域版 $\sum e_{\mathfrak P} f_{\mathfrak P} = [L:K]$ の局所版である。

ここでも、$e$ と $f$ はそれぞれ**値群の伸び**と**剰余体の伸び**という、まったく独立な量を測っている。

## 7. なぜノルム側に $f$ が出るのか ── 再度

最初の素朴な驚きに戻ろう。

「$IB$ では $e$ が出るのは自然。ノルムで $f$ が出るのは面白い」── この感覚は、いまやはっきり言語化できる。

**イデアルの拡大** $I \mapsto IB$ は、$A$ の元 $a$ を $B$ の元として見直すだけの「自明な持ち上げ」だ。値付け側で見れば
$$v_{\mathfrak P}(a) \;=\; e_{\mathfrak P}\, v_{\mathfrak p}(a)$$
となり、ここで分岐指数 $e$ が顔を出す。値群を $e$ 倍細かく見直しているのだから、当然 $e$ が現れる。

**ノルム** $J \mapsto N_{L/K}(J)$ は、$B$ の側の「点 $\mathfrak P$」を「下から見たときの全体としての大きさ」に翻訳する操作だ。$\mathfrak P$ は剰余体 $B/\mathfrak P$ を提供しており、それは $A/\mathfrak p$ から見ると $f$ 次の拡大体。だから「$\mathfrak P$ という点ひとつ」は、$A$ から見ると $f$ 個分の「点としての重み」を持っている。

ノルムが拾うのは、まさにこの**剰余体の次数 = 点としての大きさ**なのだ。

拡大は値群を測り、ノルムは剰余体を測る。同じ拡大 $A \subset B$ を、二つの異なる方向から眺めている。

## 8. まとめ ── 二つの方向の情報

デデキント環の有限拡大 $A \subset B$、$K \subset L$ において、素イデアルの振る舞いは「上にいくつあるか」だけでは決まらない。各上位素イデアル $\mathfrak P$ に対し、二つの独立な数が付随する:

- **分岐指数 $e_{\mathfrak P/\mathfrak p}$**:値群・厚み・重なり方の情報
- **剰余体次数 $f_{\mathfrak P/\mathfrak p}$**:剰余体・点の大きさ・算術的な重みの情報

そして、

$$\mathfrak p B \;=\; \prod_{\mathfrak P \mid \mathfrak p} \mathfrak P^{e_{\mathfrak P}}, \qquad N_{L/K}(\mathfrak P) \;=\; \mathfrak p^{f_{\mathfrak P}}$$

という形で、**イデアルの拡大は $e$ を、イデアルノルムは $f$ を拾う**。両者を合わせると、

$$\sum_{\mathfrak P \mid \mathfrak p} e_{\mathfrak P} f_{\mathfrak P} \;=\; [L:K]$$

という形で全体の拡大次数 $[L:K]$ が回収される。

$e$ は上へ伸びる厚み、$f$ は下から見た重み。素イデアルの分解という一見組合せ的に見える現象は、実はこの**垂直の $e$** と**水平の $f$** の二方向に分解されている。「拡大には $e$、ノルムには $f$」という対比は、その二方向性を最も鋭く切り出した瞬間なのだ。

ノルム側に剰余体次数が出てくるのが面白いと感じたとき、感覚は正しい。それは、$L/K$ という拡大が値群と剰余体という二つの独立な層で起きていることに、初めて気付いた瞬間なのである。

> **横断メモ(数論クラスタ).** この $e,f,g$ と $\sum_{\mathfrak P|\mathfrak p}e_\mathfrak{P}f_\mathfrak{P}=[L:K]$ は、別記事「有限素点と無限素点」§5–6 の素数分解(同じ $\mathbb Q(i)$ の split/inert/ramified、$\sum e_if_i=[K:\mathbb Q]$)の、デデキント環レベルでの詳細版だ。$e$=値群側・$f$=剰余体側の分離は、別記事「係数の素数とガロワ表現」§2.2 の分解群・惰性群(野生 $P$/tame)・$G_K/I\cong\hat{\mathbb Z}$ の足場で、局所大域(「ハッセ原理」)の素点ごとの局所データもこの $e,f$ で測られる。「縦の $e$・横の $f$」という二方向分解は、値群と剰余体という二つの独立な層が拡大で別々に伸びる、という一点に帰着する。

## 査読・限界(解説モード)

- **依拠する標準事実**:デデキント環のイデアル一意分解、$\mathfrak pB=\prod\mathfrak P^{e}$、$N_{L/K}(\mathfrak P)=\mathfrak p^{f}$、$N_{L/K}(IB)=I^{[L:K]}$、$\sum_{\mathfrak P|\mathfrak p}e_\mathfrak{P}f_\mathfrak{P}=[L:K]$、局所 DVR での $v_\mathfrak{P}=e\,v_\mathfrak{p}$ と剰余体次数 $f$、$\mathbb Q(i)$ の $5/3/2$ の分解。標準的な代数的整数論。
- **境界**:$\sum ef=[L:K]$ は良い条件($B$ が $A$ 上有限・整閉、$L/K$ 分離的等)のもとで成立。非分離拡大や悪い条件では崩れうる。完備局所では素イデアルが一つに揃い $ef=[L:K]_{\text{local}}$。
- 既知の理論の整理であり、新規主張を含まない。

## 参考文献

- The Stacks Project, *Dedekind domains* / *Ramification* (タグ 0903 周辺)
- J. Neukirch, *Algebraic Number Theory*, Springer (第 I 章および第 II 章)
- J.-P. Serre, *Local Fields*, Springer GTM 67
- J. S. Milne, *Algebraic Number Theory* (オンライン講義ノート)
- *Encyclopaedia of Mathematics*, "Ramification index" / "Residue degree"
