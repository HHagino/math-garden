---
title: "伊藤補正と Fisher 弧長"
date: 2026-08-03
updated: 2026-10-14
lang: ja
tags: [情報幾何, Fisher計量, Fisher_Rao, 伊藤積分, Stratonovich積分, 確率微分方程式, Wright_Fisher拡散, 確率単体, 分散安定化, arcsine変換, Dirichlet分布, Jeffreys事前分布, 捻れdeRhamコホモロジー, 局所系, 周期, 超幾何関数, Appell_F1, Gauss_Manin接続, holonomic_gradient_method]
status: done
level: 数学解説(確率微分方程式の記法・多様体上の微分形式・Gamma/Beta 関数を知っている読者向け)
---

# 伊藤補正と Fisher 弧長

## 1. 導入：単体の上で、何が構造で何が表示か

確率単体 $\Delta^{n-1}=\{p_i>0,\ \sum_i p_i=1\}$ の上で計算していると、いろいろな「余分な項」に出会う。伊藤公式の補正項、分散安定化のための $\arcsin\sqrt P$、Dirichlet 分布の正規化定数 $\prod\Gamma(\alpha_i)/\Gamma(\sum\alpha_i)$。どれも「技巧」の顔をしている。

本記事の主張は一つだ。

> **この三つのうち、伊藤補正だけが座標表示の産物であり、残る二つは同じ一つの幾何 ── Fisher 計量の体積測度 ── の別の顔である。**

到達点を先に表で出す。

| 現れるもの | 座標に依るか | 正体 |
|---|---|---|
| 伊藤補正 $\frac12 f''\sigma^2\,dt$ | **依る**（Stratonovich では消える） | 連鎖律の破れ。新しい力ではない |
| Fisher 計量 $\sum_i dp_i^2/p_i$ | 依らない | 半径 $2$ の球面の正象限のユークリッド計量 |
| 弧長座標 $2\arcsin\sqrt P$ | 依らない | Fisher 計量の測地座標。分散安定化の正体 |
| Dirichlet 重み $\prod_i p_i^{-1/2}$ | 依らない | **Fisher 計量のリーマン体積**（＝ Jeffreys 事前分布） |
| 正規化定数 $\prod\Gamma(\alpha_i)/\Gamma(A)$ | 依らない | 複素化して因子を抜いた先で、周期として読める（⚠️ **実単体の上ではまだ周期ではない**。§6.1） |

そして最後にもう一段ある。**伊藤補正をゼロにする方程式の定常分布が、ちょうど Dirichlet 重み $\alpha_i=1/2$ である。** 補正を消す座標と、境界を読むための捻りは、無関係な二つの技巧ではなく、同じ $1/2$ を共有している。§4 でこれを閉じた形で確かめる。

本記事は既知の構造の再配置であり、新しい定理は主張しない（§10）。

---

## 2. まず手を動かす ── Bernoulli の伊藤補正を三本

Bernoulli 模型 $\Pr(X=1)=P$、$\Pr(X=0)=1-P$、$0<P<1$ を取る。対数尤度の微分は

$$\partial_P\log\Pr(X=x)=\frac{x}{P}-\frac{1-x}{1-P},$$

その二乗の期待値が Fisher 情報

$$I(P)=\frac{1}{P(1-P)},\qquad ds^2=\frac{dP^2}{P(1-P)}.$$

拡散係数を $\sigma(P)=\sqrt{P(1-P)}$、すなわち **Fisher 計量係数の逆平方根**に取る。これは恣意的な選択ではなく、Wright–Fisher 拡散の標準形（Kimura 1964）そのものである。伊藤形で

$$dP_t=b(P_t)\,dt+\sqrt{P_t(1-P_t)}\,dW_t$$

と書き、伊藤公式 $df(P)=f'\,dP+\frac12 f''\sigma^2\,dt$ を三つの座標に当てる。$\sigma^2=P(1-P)$ なので、補正項 $\frac12f''(P)\,P(1-P)\,dt$ は全部手で出る。

| 座標 $f(P)$ | $f''(P)$ | 補正項 $\frac12f''\sigma^2\,dt$ |
|---|---|---|
| $\log P$ | $-1/P^2$ | $-\dfrac{1-P}{2P}\,dt$ |
| $\log(1-P)$ | $-1/(1-P)^2$ | $-\dfrac{P}{2(1-P)}\,dt$ |
| $U=\log\dfrac{P}{1-P}$ | $\dfrac{1}{(1-P)^2}-\dfrac{1}{P^2}$ | $-\dfrac{1-2P}{2P(1-P)}\,dt$ |

三本とも同じ形をしている。**どれも「境界へ押し戻す向き」の項に見える。** $P$ が $0$ に近ければ $-\frac{1-P}{2P}$ は大きな負の値で、$\log P$ を下へ引く。これを見て「境界には何か力が働いている」と読みたくなる。

その読みが間違っていることを次節で見る。

---

## 3. 補正はどこへ消えるのか ── そして、消した先で何が起きるか

同じ過程を Stratonovich 形

$$dP_t=\beta(P_t)\,dt+\sigma(P_t)\circ dW_t$$

で書くと、滑らかな $f$ に対して**通常の連鎖律** $df(P_t)=f'(P_t)\circ dP_t$ がそのまま成立する。$\circ$ を使うかぎり補正項は現れない。二つの drift の関係は

$$b(P)=\beta(P)+\frac12\sigma(P)\sigma'(P)=\beta(P)+\frac{1-2P}{4}.$$

つまり§2 で見た三本の補正は、**過程に働く力ではなく、$\circ$ を $\,$ に書き換えたときに生じる表示の差**である。$1$-形式 $d\log P$ を確率過程に引き戻したいだけなら、Stratonovich で立てれば済む。この点は多様体上の確率解析の標準的な立場で、Émery『Stochastic Calculus in Manifolds』(Springer Universitext, 1989) と Norris (1992) が枠組みごと与えている。

役割を分けると混乱しない。

| 形式 | 得意なこと | 失うもの |
|---|---|---|
| Stratonovich | 座標変換・連鎖律・$1$-形式の引き戻し | **マルチンゲール性** |
| 伊藤 | マルチンゲール性・Euler–丸山法・非先読み性 | 連鎖律 |

### 3.1 「Stratonovich が正しい」ではない ── 補正を消すと過程が変わる

ここは崩れる場所なので、具体的に書く。

伊藤形で drift をゼロに取った $dP_t=\sqrt{P_t(1-P_t)}\,dW_t$ は**マルチンゲール**で、$\mathbf E[P_t]=P_0$ が全時刻で成り立つ。突然変異のない中立 Wright–Fisher 拡散である。

ところが Stratonovich 形で drift をゼロに取った $dP_t=\sqrt{P_t(1-P_t)}\circ dW_t$ は、**これとは違う過程**である。伊藤 drift に直すと

$$b(P)=\frac{1-2P}{4}=\underbrace{\frac14(1-P)}_{0\to1}-\underbrace{\frac14 P}_{1\to0},$$

すなわち**両向きに率 $1/4$ の対称な突然変異が入った** Wright–Fisher 拡散になる。$P_0=0.2$ なら $\frac{d}{dt}\mathbf E[P_t]\big|_{t=0}=0.15>0$ で、期待値は $1/2$ へ動く。

> 座標を変えたつもりが、集団遺伝学の言葉では**突然変異を一つ入れたことになっている**。

「$\circ$ で書けば補正がなくて綺麗」は、同じ過程の綺麗な記述ではない。$\beta=0$ と $b=0$ は違う模型であって、どちらを $0$ に置くかは幾何の問題ではなく模型の選択である。

### 3.2 消した先に何が待っているか ── arcsine 則

では $\beta=0$ の Stratonovich 版は何をしているのか。この拡散の定常密度は、$\sigma^2=P(1-P)$、$b=a(1-2P)$（$a=1/4$）に対する標準の計算

$$\pi(P)\propto\frac{1}{\sigma^2}\exp\!\left(2\!\int\!\frac{b}{\sigma^2}\right)\propto\bigl(P(1-P)\bigr)^{2a-1}$$

から、$a=1/4$ で

$$\boxed{\ \pi(P)=\frac{1}{\pi\sqrt{P(1-P)}}\ =\ \mathrm{Beta}(\tfrac12,\tfrac12).\ }$$

> ### ⚠️ 境界条件が要る（2026-08-03 追記）
>
> **初版はこれを無条件の「定常分布」として書いていた。足りない。**
> スケール密度と速度密度を出すと
> $$s'(P)=\frac{1}{\sqrt{P(1-P)}},\qquad m(P)=\frac{2}{\sigma^2 s'}=\frac{2}{\sqrt{P(1-P)}}$$
> で、**両方とも端点の近傍で可積分**である。Feller の判定により
> **$P=0,1$ はともに regular（到達可能）境界**であって entrance ではない。
> つまり**過程は有限時間で端に達する。**開区間で止めた（＝端で殺した）過程に、この確率分布は定常として乗らない。
>
> $\mathrm{Beta}(\frac12,\frac12)$ が一意な不変分布になるのは、**両端で反射する（no-flux の）保存的な実現**
> を採ったときである。以下ではその実現を指す。
> **「補正を消す」ことは境界の扱いまでは決めない** ── そこは別に選ぶ必要がある。

**arcsine 則である。** そして次節の弧長座標 $Y=2\arcsin\sqrt P$ に移すと、この分布は $(0,\pi)$ 上の**一様分布**になる。

$$P=\sin^2\tfrac{Y}{2},\qquad \pi(P)\,\Bigl|\tfrac{dP}{dY}\Bigr| = \frac{1}{\pi\sin(Y/2)\cos(Y/2)}\cdot\frac{\sin Y}{2}=\frac1\pi.$$

つまり **「伊藤補正が消える方程式」とは「Fisher 弧長で一様に拡散する方程式」のことだった。** これが本記事を貫く一本目の橋で、§7 の Dirichlet 重みへそのまま繋がる。

---

## 4. Fisher 計量が指定していた座標

弧長座標を

$$Y=\varphi(P)=2\arcsin\sqrt P,\qquad \varphi'(P)=\frac{1}{\sqrt{P(1-P)}}$$

と置く。すると $dY^2=dP^2/(P(1-P))=ds^2$ であり、さらに

$$\varphi'(P)\,\sigma(P)=1.$$

Stratonovich 形なら、$Y$ に移した拡散部分はそのまま $dW_t$ になる。統計で経験則として使われる **arcsine 変換による分散安定化は、Fisher 計量を平坦化する等長写像**にほかならない。分散安定化変換の系譜は Bartlett (1936) の平方根変換に遡り、Anscombe (1948)、Freeman–Tukey (1950) と続くが、そこでの動機は「分散をパラメータから切り離す」であって、幾何としては上の一行に尽きる。

境界の振る舞いに逆説がある。

$$g_{PP}=\frac{1}{P(1-P)}\xrightarrow[P\to0,1]{}\infty,\qquad\text{しかし}\qquad \int_0^1\frac{dP}{\sqrt{P(1-P)}}=\pi<\infty.$$

**計量係数は発散するのに、全長は有限**である。境界は無限遠ではなく、有限距離にある崖の縁だ。

<figure>
<svg viewBox="0 0 700 260" width="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="左: Fisher 計量係数 1/(P(1-P)) が境界で発散する図。右: 弧長 2arcsin√P が π で止まる図。">
  <rect x="0" y="0" width="700" height="260" fill="#ffffff"/>
  <!-- LEFT axes -->
  <line x1="60" y1="210" x2="300" y2="210" stroke="#333" stroke-width="1.2"/>
  <line x1="60" y1="210" x2="60" y2="20" stroke="#333" stroke-width="1.2"/>
  <text x="180" y="238" font-size="13" text-anchor="middle" fill="#333" font-family="serif">P</text>
  <text x="30" y="26" font-size="13" fill="#333" font-family="serif">g</text>
  <text x="56" y="228" font-size="11" fill="#666" font-family="serif">0</text>
  <text x="296" y="228" font-size="11" fill="#666" font-family="serif">1</text>
  <line x1="60" y1="175.5" x2="300" y2="175.5" stroke="#999" stroke-width="0.8" stroke-dasharray="3 3"/>
  <text x="306" y="179" font-size="11" fill="#666" font-family="serif">4</text>
  <path d="M 70.9,20.0 L 76.4,74.5 L 81.9,105.9 L 87.4,124.7 L 92.9,137.0 L 98.4,145.8 L 103.9,152.2 L 109.4,157.2 L 114.9,161.1 L 120.4,164.2 L 125.9,166.6 L 131.4,168.7 L 136.9,170.3 L 142.4,171.7 L 147.9,172.8 L 153.4,173.7 L 158.9,174.4 L 164.4,174.9 L 169.9,175.2 L 175.4,175.4 L 180.9,175.5 L 186.4,175.4 L 191.9,175.1 L 197.4,174.7 L 202.9,174.1 L 208.4,173.4 L 213.9,172.5 L 219.4,171.3 L 224.9,169.8 L 230.4,168.1 L 235.9,165.9 L 241.4,163.2 L 246.9,159.9 L 252.4,155.7 L 257.9,150.3 L 263.4,143.2 L 268.9,133.4 L 274.4,119.3 L 279.9,97.4 L 285.4,58.7 L 289.1,20.0"
        fill="none" stroke="#b3272d" stroke-width="2"/>
  <text x="180" y="252" font-size="12" text-anchor="middle" fill="#333" font-family="serif">計量係数は境界で発散する</text>
  <!-- RIGHT axes -->
  <line x1="400" y1="210" x2="640" y2="210" stroke="#333" stroke-width="1.2"/>
  <line x1="400" y1="210" x2="400" y2="20" stroke="#333" stroke-width="1.2"/>
  <text x="520" y="238" font-size="13" text-anchor="middle" fill="#333" font-family="serif">P</text>
  <text x="372" y="26" font-size="13" fill="#333" font-family="serif">Y</text>
  <text x="396" y="228" font-size="11" fill="#666" font-family="serif">0</text>
  <text x="636" y="228" font-size="11" fill="#666" font-family="serif">1</text>
  <line x1="400" y1="29.1" x2="640" y2="29.1" stroke="#999" stroke-width="0.8" stroke-dasharray="3 3"/>
  <text x="646" y="33" font-size="11" fill="#666" font-family="serif">π</text>
  <path d="M 400.0,210.0 L 404.0,195.0 L 410.1,186.2 L 416.1,179.8 L 422.2,174.4 L 428.2,169.7 L 434.3,165.4 L 440.3,161.4 L 446.4,157.6 L 452.4,154.0 L 458.5,150.5 L 464.5,147.2 L 470.6,144.0 L 476.6,140.8 L 482.7,137.8 L 488.7,134.7 L 494.8,131.7 L 500.8,128.8 L 506.9,125.9 L 512.9,122.9 L 519.0,120.0 L 525.0,117.1 L 531.1,114.2 L 537.1,111.3 L 543.2,108.4 L 549.2,105.4 L 555.3,102.4 L 561.3,99.3 L 567.4,96.2 L 573.4,93.0 L 579.5,89.7 L 585.5,86.3 L 591.6,82.8 L 597.6,79.0 L 603.7,75.1 L 609.7,70.9 L 615.8,66.3 L 621.8,61.2 L 627.9,55.2 L 633.9,47.5 L 638.0,39.7 L 640.0,29.1"
        fill="none" stroke="#2b6cb0" stroke-width="2"/>
  <text x="520" y="252" font-size="12" text-anchor="middle" fill="#333" font-family="serif">それでも全長は π で止まる</text>
</svg>
<figcaption><small>同じ境界を、計量係数（左）と弧長（右）が正反対に報告する。左だけを見ると境界は無限遠に見えるが、右が有限距離だと言っている。以後の議論は右の側に立つ。</small></figcaption>
</figure>

---

## 5. 単体は球面の正象限である

多カテゴリに上げる。$z_i=2\sqrt{p_i}$ と置くと $\sum_i z_i^2=4$ で、単体の接空間（$\sum_i dp_i=0$）の上で

$$\sum_i dz_i^2=\sum_i\frac{dp_i^2}{p_i}.$$

**Fisher 計量つき確率単体は、半径 $2$ の球面の正象限と等長**である。

規約を一つ断る。文献でよく見る $p\mapsto(\sqrt{p_i})$ は**単位球面**への写像で、そこでの測地距離が Bhattacharyya 角 $\arccos\sum_i\sqrt{p_iq_i}$ である（Bhattacharyya 1943）。単位球面のユークリッド計量は Fisher 計量の $1/4$ にあたるので、係数を消したいときは半径 $2$ を取る。本記事は一貫して半径 $2$ を使う。この球面表示自体は古典的で、非パラメトリックな一般化まで込みで Holbrook–Lan–Streets–Shahbaba (UAI 2020, PMLR 124:101–110) が扱っている。

### 5.1 Wright–Fisher の共分散は球面の接方向ノイズである

単体上の標準的な共分散

$$a_{ij}(p)=p_i(\delta_{ij}-p_j)$$

を取る。行和・列和がゼロなので確率の総和を保ち、任意の接ベクトル $u$ に対して $u^{\mathsf T}a(p)u=\sum_ip_iu_i^2-(\sum_ip_iu_i)^2\ge0$、内部では階数 $n-1$ である。係数行列を

$$\sigma_{ia}(p)=\sqrt{p_i}\bigl(\delta_{ia}-\sqrt{p_ip_a}\bigr)$$

と取れば $\sum_i\sigma_{ia}=0$ かつ $\sum_a\sigma_{ia}\sigma_{ja}=a_{ij}$。平方根座標へ移すと

$$\frac{1}{\sqrt{p_i}}\sigma_{ia}(p)=\delta_{ia}-\frac{z_iz_a}{4},\qquad \sum_i z_i\Bigl(\delta_{ia}-\frac{z_iz_a}{4}\Bigr)=0.$$

右の等式が言っているのは、各ノイズ方向が**半径 $2$ の球面に接している**ということだ。つまり $\delta_{ia}-z_iz_a/4$ は球面への射影行列にほかならない。

<figure>
<svg viewBox="0 0 700 300" width="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="確率単体 Δ² が平方根写像で半径 2 の球面の正象限へ等長に写る図。">
  <rect x="0" y="0" width="700" height="300" fill="#ffffff"/>
  <!-- simplex -->
  <polygon points="70,240 260,240 165,80" fill="#f3f0ea" stroke="#333" stroke-width="1.4"/>
  <circle cx="70" cy="240" r="3.5" fill="#b3272d"/><circle cx="260" cy="240" r="3.5" fill="#b3272d"/><circle cx="165" cy="80" r="3.5" fill="#b3272d"/>
  <text x="52" y="256" font-size="12" fill="#333" font-family="serif">e₁</text>
  <text x="266" y="256" font-size="12" fill="#333" font-family="serif">e₂</text>
  <text x="159" y="70" font-size="12" fill="#333" font-family="serif">e₃</text>
  <text x="165" y="278" font-size="12.5" text-anchor="middle" fill="#333" font-family="serif">Δ² ── 平坦に描かれるが、Fisher 計量は平坦ではない</text>
  <!-- arrow -->
  <line x1="300" y1="165" x2="380" y2="165" stroke="#333" stroke-width="1.4"/>
  <polygon points="380,165 372,161 372,169" fill="#333"/>
  <text x="340" y="153" font-size="13" text-anchor="middle" fill="#333" font-family="serif">zᵢ = 2√pᵢ</text>
  <text x="340" y="184" font-size="11" text-anchor="middle" fill="#666" font-family="serif">等長</text>
  <!-- sphere octant -->
  <path d="M 560,80 A 130,130 0 0,0 430,210" fill="#eef3f8" stroke="none"/>
  <path d="M 560,80 A 130,130 0 0,0 430,210" fill="none" stroke="#2b6cb0" stroke-width="2"/>
  <path d="M 430,210 A 130,42 0 0,0 560,210" fill="#eef3f8" stroke="none" opacity="0.75"/>
  <path d="M 430,210 A 130,42 0 0,0 560,210" fill="none" stroke="#2b6cb0" stroke-width="2"/>
  <path d="M 560,80 A 42,130 0 0,0 560,210" fill="#eef3f8" stroke="none" opacity="0.6"/>
  <path d="M 560,80 A 42,130 0 0,0 560,210" fill="none" stroke="#2b6cb0" stroke-width="2"/>
  <line x1="560" y1="210" x2="560" y2="80" stroke="#999" stroke-width="0.9" stroke-dasharray="3 3"/>
  <line x1="560" y1="210" x2="430" y2="210" stroke="#999" stroke-width="0.9" stroke-dasharray="3 3"/>
  <circle cx="560" cy="210" r="3" fill="#333"/>
  <text x="566" y="226" font-size="11" fill="#666" font-family="serif">O</text>
  <text x="493" y="222" font-size="11" fill="#666" font-family="serif">半径 2</text>
  <circle cx="516" cy="140" r="3.5" fill="#b3272d"/>
  <line x1="516" y1="140" x2="556" y2="118" stroke="#b3272d" stroke-width="1.8"/>
  <polygon points="556,118 548,118 551,124" fill="#b3272d"/>
  <text x="560" y="115" font-size="11" fill="#b3272d" font-family="serif">δᵢₐ − zᵢzₐ/4</text>
  <text x="495" y="278" font-size="12.5" text-anchor="middle" fill="#333" font-family="serif">球面の正象限 ── 境界は長さ π の弧、有限距離</text>
</svg>
<figcaption><small>左の三角形は「平坦に描ける」が、それは絵の都合であって計量ではない。右へ移すと、Wright–Fisher の共分散が球面の接方向への射影として読める。境界（三本の辺）は無限遠へ逃げず、長さ $\pi$ の弧として残る。</small></figcaption>
</figure>

### 5.2 ここで止まる ── 「球面上のブラウン運動」では過程は決まらない

上の等長は**確率過程の選択より先に成立する幾何の事実**である。逆は言えない。

- 係数分解 $\sigma_{ia}$ は一意ではない。直交変換でノイズを混ぜても共分散 $a_{ij}$ は変わらない。
- 共分散だけでは drift の全成分は決まらない。多次元では伊藤 drift $b_i=\beta_i+\frac12\sum_{j,a}\sigma_{ja}\partial_j\sigma_{ia}$ が係数分解の取り方に依存して見える。
- 境界に到達した後（吸収か、反射か、突然変異で復帰するか）は別途指定が要る。

だから「Fisher 球面上のブラウン運動」という一言では模型は定まらない。生成作用素と境界条件まで書いて初めて過程になる（Kimura 1964、および Ethier–Kurtz『Markov Processes: Characterization and Convergence』(Wiley, 1986) 第 10 章）。本記事が使うのは等長のほうだけで、過程の一意性は主張しない。

---

## 6. 可縮という壁 ── de Rham は境界を見ない

ここまでで「境界は有限距離にあり、そこに情報がある」という感触が出てきた。それを微分形式で捕まえようとすると、いきなり壁がある。

単体の内部では

$$d\log p_i=\frac{dp_i}{p_i}$$

は $p_i=0$ で極を持つ。だから「境界の情報を持っている」ように見える。ところが $\Delta^{n-1}_\circ$ の**内部だけ**を見れば $\log p_i$ は普通の滑らかな関数で、$d\log p_i$ はその微分、すなわち**完全形式**にすぎない。

単体は凸、したがって可縮である。可縮なら

$$H^k_{\mathrm{dR}}(\Delta^{n-1}_\circ)\cong H^k(\mathrm{pt})=\begin{cases}\mathbf R & k=0\\ 0 & k\ge1\end{cases}$$

で、**素の de Rham コホモロジーは何も見ない。** 極が「ある」ことと、コホモロジーが「それを覚えている」ことは違う。極は開集合を取り除いた先にあり、取り除かなければ何も起きない。

### 6.1 ⚠️ そして、係数を替えるだけでは壁は越えられない（2026-08-03 訂正）

> **初版はここで「足りないのは空間でも極でもなく係数である」と書いていた。これは誤りだった。**
> 独立査読（異系列）で指摘され、確かめたところ**そのとおりだった**ので訂正する。経緯は §10 に書いた。

実単体の**内部**では $\Phi_\alpha=\prod_i p_i^{\alpha_i-1}$ は**正・一価・非消滅**である。したがって

$$\nabla_\alpha f=df+f\,d\log\Phi_\alpha=\Phi_\alpha^{-1}\,d\bigl(\Phi_\alpha f\bigr)$$

と書けてしまう。すなわち **$\Phi_\alpha$ を掛けるだけのゲージ変換で、捻れ複体は素の de Rham 複体と同型**である。可縮空間の上の局所系は自明化できるのだから、当然といえば当然だ。

$$\boxed{\ \Delta^{n-1}_\circ\ \text{の上では、}\ H^\bullet(\nabla_\alpha)\cong H^\bullet_{\mathrm{dR}}(\Delta^{n-1}_\circ)\ =\ \text{自明}.\ }$$

**「可縮だから見えない。ならば係数を局所系に替えればよい」は通らない。** 係数を替えても、空間が可縮なままなら同じ壁の前にいる。

### 6.2 では何を替えるのか

超幾何積分が非自明になる標準的な舞台は、**空間のほうを替える**：

1. **複素化して境界因子を除く** ── $\{\prod_i p_i\prod(\cdots)=0\}$ を抜いた複素超平面配置の補集合を取る
2. そこで $\Phi_\alpha$ は**多価**になり、$p_i=0$ を一周すると枝が $e^{2\pi i(\alpha_i-1)}=e^{2\pi i\alpha_i}$ 倍される。
   ⚠️ **これが非自明なのは $\alpha_i\notin\mathbf Z$ のときだけ。**全部整数なら $\Phi_\alpha$ は補集合上でも一価で、何も起きない
   （本記事の仮定は $\alpha_i>0$ だけなので、**非整数条件を足さないと偽**。共鳴条件も別途ある）。
   ⚠️ 局所系は**二種類ある**。$\Phi$ の枝が定める $\mathcal L_\Phi$ と、その双対 $\mathcal L_\Phi^\vee=\ker\nabla_\alpha$（水平切断＝$\Phi_\alpha^{-1}$ の定数倍）で、**モノドロミーは互いに逆**。サイクル側に枝を載せるか、de Rham 側の水平局所系を指すかで符号が入れ替わる
3. 対になるのは通常のサイクルではなく、**loaded / relative / locally finite cycle**（端点の正則化つき）

境界を記録する道は局所系だけでもない。**相対コホモロジー、Borel–Moore ホモロジー、対数的 de Rham、留数**でも記録できる。初版の「足りないのは係数である」は、**排他的にも数学的にも誤り**だった。

正しい教訓はむしろ一段強い。庭の別記事 [弧状連結・単連結・可縮 ── 似ているが全然違う三つの性質、不変量は何を見て何を見落とすか](弧状連結単連結可縮_不変量は何を見て何を見落とすか_2026-06-19.md) と並べると、こうなる。

> **不変量が解像度を決める。** ただし解像度を上げるのに、係数だけを触っても足りないことがある。
> **可縮な実領域では、係数を替えても自明化されて戻ってくる。**
> 実際に効いたのは**空間を複素化して因子を抜く**という、もっと荒い操作のほうだった。

以下 §7 以降は、**この複素化を済ませた舞台での話**として読んでほしい。実単体上の積分値そのもの（Beta・Dirichlet 積分）は初等的に正しく、そこは何も変わらない。

---

## 7. Dirichlet 重みで捻る ── そして $1/2$ が戻ってくる

$\alpha_i>0$ に対して

$$\Phi_\alpha(p)=\prod_{i=1}^n p_i^{\alpha_i-1},\qquad d\log\Phi_\alpha=\sum_i(\alpha_i-1)\,d\log p_i$$

を取り、微分を

$$\nabla_\alpha=d+d\log\Phi_\alpha\wedge$$

と捻る。$d\log\Phi_\alpha$ は閉形式なので $\nabla_\alpha^2=0$。

⚠️ **ここで「係数を変えたのだから可縮性はもう壁ではない」と書いてはいけない**（§6.1）。
非自明性を作っているのは係数変更ではなく、**因子を除いた複素補集合がもはや可縮でないことと、多価な係数系を組にしたこと**の二つである。以下は §6.2 の複素化を済ませた舞台での話とする。

そして標準アフィン測度に対する基礎周期が、統計でおなじみの正規化定数になる。

$$\int_{\Delta^{n-1}_\circ}\prod_i p_i^{\alpha_i-1}\,d\mu=\frac{\prod_i\Gamma(\alpha_i)}{\Gamma(A)},\qquad A=\sum_i\alpha_i.$$

$n=2$ なら Beta 積分 $B(\alpha,\beta)=\Gamma(\alpha)\Gamma(\beta)/\Gamma(\alpha+\beta)$ そのもので、特別な多変数装置なしに完全に計算できる。

### 7.1 $\alpha_i=1/2$ は Fisher 計量の体積である

ここで§3.2 の伏線が回収される。Fisher 計量 $g_{ij}=\delta_{ij}/p_i+1/p_n$（$i,j\le n-1$、$p_n=1-\sum p_i$）の行列式は

$$\det g=\frac{1}{p_1p_2\cdots p_n},\qquad\text{ゆえに}\qquad \sqrt{\det g}\;=\;\prod_i p_i^{-1/2}.$$

右辺はまさに $\alpha_i=1/2$ の Dirichlet 重みである。したがって

$$\boxed{\ \mathrm{Dirichlet}(\tfrac12,\ldots,\tfrac12)\ =\ \text{Fisher 計量の}\ \textbf{正規化した}\ \text{リーマン体積測度}\ =\ \text{多項分布の Jeffreys 事前分布}.\ }$$

⚠️ **中央は正規化が要る。**素の体積測度 $\prod_i p_i^{-1/2}\,dp$ の全質量は $\Gamma(1/2)^n/\Gamma(n/2)$ で、一般に $1$ ではない。両端は確率測度なので、型を合わせるために割る。

球面の側で言えば、$z_i=2\sqrt{p_i}$ による像は**球面正象限の一様分布**になる。$n=2$ ではこれが $\mathrm{Beta}(\frac12,\frac12)$、すなわち§3.2 で $\beta=0$ の Stratonovich 方程式の定常分布として出てきた arcsine 則にほかならない。

三つの入口が同じ点に着く。

| 入口 | 出てくるもの |
|---|---|
| 伊藤補正を消す（$\beta=0$ の Stratonovich） | 定常分布 $\mathrm{Beta}(\frac12,\frac12)$ |
| Fisher 弧長で一様に測る | $Y\sim\mathrm{Unif}(0,\pi)$ |
| Fisher 計量の体積を取る（Jeffreys） | $\mathrm{Dirichlet}(\frac12,\ldots,\frac12)$ |

**「補正が消える座標」と「境界を読むための捻り」は、同じ $1/2$ を共有している。** これは偶然の一致ではなく、どちらも「Fisher 計量そのもので測る」ことの言い換えだからである。

### 7.2 どこまで有理関数で閉じるか ── 閾値の外

多項式を挿入したモーメント

$$M_m(\alpha)=\int_{\Delta^{n-1}_\circ}\prod_i p_i^{m_i}\,\Phi_\alpha(p)\,d\mu$$

には、指数を一つ動かす閉じた漸化式がある。

$$\boxed{\ M_{m+e_i}(\alpha)=\frac{\alpha_i+m_i}{A+|m|}\,M_m(\alpha),\qquad |m|=\sum_i m_i.\ }$$

したがって**多項式挿入の周期はすべて基礎周期 $M_0$ の有理関数倍**に落ちる。三カテゴリで具体化すれば $\mathbf E[p_i]=\alpha_i/A$、$\operatorname{Cov}(p_i,p_j)=\alpha_i(A\delta_{ij}-\alpha_j)/(A^2(A+1))$ が一行で出る。

ところが $\log$ を挿入した瞬間に閉じなくなる。

$$\partial_{\alpha_i}\log I(\alpha)=\psi(\alpha_i)-\psi(A)\;=\;\mathbf E[\log p_i],\qquad \partial_{\alpha_i}\partial_{\alpha_j}\log I=\delta_{ij}\psi_1(\alpha_i)-\psi_1(A).$$

digamma・trigamma が入り、有理関数の世界から出る。**「有限基底がある」と言えるのは多項式挿入までで、パラメータ微分を含めた途端に別の圏に移る。** ここを区別せずに「Dirichlet 周期には有限基底がある」と言うと過大主張になる。

---

## 8. 純 Dirichlet では捻りが働かない ── 外部パラメータを入れる

前節の周期は $\Gamma$ 関数の比に閉じてしまう。これは綺麗だが、**捻れコホモロジーの立場からは退屈すぎる**。

⚠️ **初版はここで「動く特異点がないので、モノドロミーも接続も出てこない」と書いていた。これは言い過ぎ。**
複素化した超平面配置の補集合では、$\Phi_\alpha$ は固定因子 $p_i=0$ のまわりに局所モノドロミー
$e^{2\pi i(\alpha_i-1)}$ を**持っている**（§6.2）。正しくは
**「$z$ のような配置パラメータをまだ入れていないので、$z$ 空間上の非自明な Gauss–Manin 系がまだ無い」**である。

非自明にするには重みに外部パラメータを入れる。最小の選択は

$$\Phi(p;z)=p^{a-1}(1-p)^{b-1}(1-zp)^{\lambda},\qquad a,b>0,\ z<1$$

で、対応する周期は Euler の積分表示によって

$$J(z)=\int_0^1 p^{a-1}(1-p)^{b-1}(1-zp)^\lambda\,dp=B(a,b)\,{}_2F_1(-\lambda,\,a;\,a+b;\,z).$$

$\rho=-\lambda$、$c=a+b$ と置けば $J$ は Gauss の超幾何方程式

$$z(1-z)J''+\bigl[c-(\rho+a+1)z\bigr]J'-\rho a\,J=0$$

を満たし、$Y=(J,J')^{\mathsf T}$ に対する一階の Gauss–Manin 型接続系は

$$\frac{dY}{dz}=\begin{pmatrix}0&1\\[4pt]\dfrac{\rho a}{z(1-z)}&-\dfrac{c-(\rho+a+1)z}{z(1-z)}\end{pmatrix}Y$$

と明示的に書ける。特異点は $z=0,1,\infty$ である。

なぜここで初めて構造が出るのか。捻れの対数微分を見ればわかる。

$$d\log\Phi=\left(\frac{a-1}{p}-\frac{b-1}{1-p}-\frac{\lambda z}{1-zp}\right)dp.$$

第三項の極 $p=1/z$ は $z$ とともに**動く**。$z$ が $0\to1$ と動くと、この可動極が積分路 $[0,1]$ の端点に衝突する。$z=0,1,\infty$ は分母の都合ではなく、**積分路と特異点の配置が変わる場所**である。純 Dirichlet の場合はこの可動極がなく、だから $\Gamma$ の比で終わっていた。

<figure>
<svg viewBox="0 0 700 230" width="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="積分路 [0,1] と可動極 p=1/z の配置図。z が 0 から 1 へ動くと可動極が無限遠から 1 へ近づき、z=1 で端点に衝突する。">
  <rect x="0" y="0" width="700" height="230" fill="#ffffff"/>
  <text x="20" y="26" font-size="12.5" fill="#333" font-family="serif">p 平面（積分変数）</text>
  <!-- three rows for z values -->
  <g font-family="serif">
    <!-- row 1: z small -->
    <line x1="90" y1="70" x2="620" y2="70" stroke="#ccc" stroke-width="1"/>
    <line x1="150" y1="70" x2="330" y2="70" stroke="#2b6cb0" stroke-width="4"/>
    <circle cx="150" cy="70" r="4" fill="#2b6cb0"/><circle cx="330" cy="70" r="4" fill="#2b6cb0"/>
    <text x="146" y="59" font-size="11" fill="#2b6cb0">0</text><text x="326" y="59" font-size="11" fill="#2b6cb0">1</text>
    <text x="600" y="59" font-size="16" fill="#b3272d" text-anchor="middle">×</text>
    <text x="600" y="90" font-size="10.5" fill="#b3272d" text-anchor="middle">1/z</text>
    <text x="20" y="74" font-size="12" fill="#333">z ≈ 0.3</text>
    <text x="640" y="74" font-size="10.5" fill="#666">遠い</text>
    <!-- row 2 -->
    <line x1="90" y1="130" x2="620" y2="130" stroke="#ccc" stroke-width="1"/>
    <line x1="150" y1="130" x2="330" y2="130" stroke="#2b6cb0" stroke-width="4"/>
    <circle cx="150" cy="130" r="4" fill="#2b6cb0"/><circle cx="330" cy="130" r="4" fill="#2b6cb0"/>
    <text x="430" y="119" font-size="16" fill="#b3272d" text-anchor="middle">×</text>
    <text x="430" y="150" font-size="10.5" fill="#b3272d" text-anchor="middle">1/z</text>
    <text x="20" y="134" font-size="12" fill="#333">z ≈ 0.8</text>
    <text x="640" y="134" font-size="10.5" fill="#666">近づく</text>
    <!-- row 3 -->
    <line x1="90" y1="190" x2="620" y2="190" stroke="#ccc" stroke-width="1"/>
    <line x1="150" y1="190" x2="330" y2="190" stroke="#2b6cb0" stroke-width="4"/>
    <circle cx="150" cy="190" r="4" fill="#2b6cb0"/>
    <text x="330" y="179" font-size="16" fill="#b3272d" text-anchor="middle">×</text>
    <text x="330" y="210" font-size="10.5" fill="#b3272d" text-anchor="middle">1/z = 1</text>
    <text x="20" y="194" font-size="12" fill="#333">z = 1</text>
    <text x="640" y="194" font-size="10.5" fill="#666">衝突</text>
  </g>
</svg>
<figcaption><small>青が固定された積分路 $[0,1]$、赤の × が可動極 $p=1/z$。特異点 $z=1$ は「分母がゼロになるから」ではなく、可動極が積分路の端点に載るからそこにある。純 Dirichlet 重みにはこの赤い点が存在せず、だから周期が $\Gamma$ の比で閉じてしまう。</small></figcaption>
</figure>

三角形へ上げると、同じ構造が二変数になる。

$$\frac{1}{J(0,0)}\int_{\Delta^2}p_1^{a_1-1}p_2^{a_2-1}p_3^{a_3-1}(1-xp_1-yp_2)^{\lambda}\,dp_1dp_2=F_1(\rho;a_1,a_2;A;x,y),$$

すなわち Appell の $F_1$ である。$F_1$ は二階の連立偏微分方程式系を満たし、この段階でようやく「捻れコホモロジーとその双対の対」として読むべき対象になる。一般論は Aomoto–Kita『Theory of Hypergeometric Functions』(Springer Monographs in Mathematics, 2011; DOI 10.1007/978-4-431-53938-4) に譲る。同書は超幾何積分を「開アフィン空間上の捻れ de Rham コホモロジーと、局所系係数のその双対の対」として定式化する枠組みそのものを与えている。

計算アルゴリズムの側では、正規化定数を holonomic な微分方程式系に載せて数値評価する **holonomic gradient method**（Nakayama–Nishiyama–Noro–Ohara–Sei–Takayama–Takemura, *Adv. Appl. Math.* **47** (2011), 639–658; arXiv:1005.5273）が、まさにこの「周期を Pfaffian 系で追う」筋にある。ただし本記事はそこへ**入口を示しただけ**で、Pfaffian 基底も接続行列の全成分もモノドロミーも書いていない（§10）。

---

## 9. 一本の道に並べ直す

$$\text{Bernoulli}\to\text{score}\to\text{Fisher 計量}\to\text{弧長}\to\text{Stratonovich の連鎖律}\to\text{Fisher 体積}=\mathrm{Dir}(\tfrac12)\to\text{捻れ}\to\text{周期}$$

伊藤補正はこの列の**一項ではない**。列を伊藤座標で書き直したときに現れる差分である。それを構造と呼ぶと、連鎖律の破れを不変量と取り違える。逆に伊藤を捨てる理由もない。マルチンゲール性も Euler–丸山法も伊藤の側にしかなく、§3.1 で見たとおり「補正を消す」ことは模型を取り替えることでもある。**幾何を Stratonovich で立て、計算と確率論を伊藤で回す。**

庭の他の記事との接続を三方向に置く。

- **距離の地図の中の位置**：Fisher–Rao・Bhattacharyya・Hellinger が互いにどう並ぶかは [距離とは何か ── Frank Nielsen の距離・発散地図を読む](nielsen-taxonomy-distances-divergences-map.md) の該当欄にある。本記事の球面表示は、その地図で「Fisher–Rao の測地距離」と「Bhattacharyya 角」が同じ球面上の二つの正規化として並んでいることの、単体に限った具体化である。
- **不変量の解像度**：§6 の壁 ── 可縮な空間では素の de Rham が何も見ず、係数を局所系に取り替えるだけでは（可縮なので）まだ何も見えない ── は [弧状連結・単連結・可縮 ── 似ているが全然違う三つの性質、不変量は何を見て何を見落とすか](弧状連結単連結可縮_不変量は何を見て何を見落とすか_2026-06-19.md) と同じ構造をしている。あちらは空間を変えて不変量の解像度を測った。こちらも結局、係数ではなく空間を変えねばならなかった（§6.1）。**同じ結論に、逆方向から二度着いた。**
- **同じ単体を、別の重みで**：本記事は $\mathrm{Dirichlet}(\frac12,\ldots,\frac12)$、すなわち Fisher 計量のリーマン体積を特権的な重みとして選んだ。同じ確率単体に $\mathrm{Dirichlet}(1,\ldots,1)$（一様。本記事の $n$ カテゴリの $\Delta^{n-1}$ では $\mathrm{vol}=1/(n-1)!$、あちらの $\Delta^n$ の記法では $1/n!$）を置き、その上で Shannon エントロピーを平均すると射影空間の Arakelov 高さになる、という別方向が「[射影空間の高さは、単体上の平均エントロピーの (n+1)/2 倍である ── 調和数が算術と情報量の両側から出てくる仕組み](高さは単体上の平均エントロピーである_調和数が二度出る_2026-08-03.md)」にある。**どちらの重みを取るかを単体は決めない。**こちらでは Fisher 計量が、あちらではアルキメデス素点に置いた計量が決めている。Legendre 変換が両方の心臓にあるのも共通で、本記事は $\psi''$（Fisher 情報）まで使い、あちらは $\psi$ の支持直線の切片までを使う。

最後に一つ、この記事の外にある問いを置いておく。$\alpha_i=1/2$ が「Fisher 体積」として選ばれるのは単体の上での話だった。単体を離れて一般の統計模型に上がったとき、$\sqrt{\det g}$ はもはや $\Gamma$ 関数の比では書けず、周期としての意味も自明ではなくなる。**捻れの重みが幾何的に選ばれる範囲はどこまでか** ── そこが、この整理が実際に効く限界線である。

---

## 10. 査読・限界

> ### ⚠️ 2026-08-03 に独立査読（異系列）を受けて訂正した箇所
>
> 初版は著者が書き、**著者自身が検算しただけ**だった。別系列のモデルに殺しに来てもらったところ、
> **中心的な誤りが一つ出た。** 訂正は本文に埋め込んである。
>
> | # | 何が間違っていたか | どこ |
> |---|---|---|
> | 1 | ★ **「可縮だから見えない。ならば係数を局所系に替えればよい」** ── 実単体の内部では $\Phi_\alpha$ が正・一価なので、捻れ複体はゲージ変換で素の de Rham と同型になる。**係数を替えても壁は越えられない。**替えるべきは空間（複素化して因子を抜く） | §6.1・§6.2 を新設 |
> | 2 | **$\mathrm{Beta}(\frac12,\frac12)$ を無条件の定常分布として書いた** ── $P=0,1$ は regular 境界で到達可能。反射（no-flux）実現を指定して初めて一意な不変分布になる | §3.2 に追記 |
> | 3 | **「動く特異点がないのでモノドロミーが出ない」** ── 固定因子のまわりに $e^{2\pi i(\alpha_i-1)}$ がある。無いのは $z$ 空間上の Gauss–Manin 系のほう | §8 冒頭 |
> | 4 | **「正規化定数＝周期」を §1 の表で断定していた** ── 複素化前は周期ではない | §1 の表 |
>
> **1 は、著者が自分で「ここは触れずに済むか」と判断を保留した箇所ではなかった。**
> 保留したのは 2（境界）のほうで、そちらも「触れずに済まない」が答えだった。
> **自分で危ないと思った箇所と、実際に折れた箇所は、別だった。**

本記事は既知の構造の再配置による解説であり、新しい定理を主張しない。判定を三つに分けて置く。

### 検算した（本記事のすべての式）

以下は数式処理・数値積分で確認した。

- §2 の三つの伊藤補正、$\frac12\sigma\sigma'=(1-2P)/4$ による drift 変換。
- §3.2 の定常密度 $\propto(P(1-P))^{2a-1}$、$a=1/4$ での $\mathrm{Beta}(\frac12,\frac12)$、および $Y=2\arcsin\sqrt P$ の下での一様性（Kolmogorov–Smirnov 検定）。
- §4 の $\varphi'^2=g_{PP}$、$\varphi'\sigma=1$、$\int_0^1 dP/\sqrt{P(1-P)}=\pi$。
- §5 の $\sum dz_i^2=\sum dp_i^2/p_i$、$\sum_a\sigma_{ia}\sigma_{ja}=p_i(\delta_{ij}-p_j)$、$\sum_i\sigma_{ia}=0$、$\sum_i z_i(\delta_{ia}-z_iz_a/4)=0$、$a(p)$ の半正定値性と階数 $n-1$。
- §7.1 の $\det g=\prod_i p_i^{-1}$、および $\mathrm{Dir}(\frac12,\ldots,\frac12)$ の像が球面正象限上の一様分布になること（$n=4$ で二標本 KS 検定）。
- §7.2 のモーメント漸化式（三カテゴリ、二重数値積分と照合）、$\partial_\alpha\log I=\psi(\alpha)-\psi(\alpha+\beta)$。
- §8 の $J(z)=B(a,b)\,{}_2F_1(-\lambda,a;a+b;z)$、Gauss–Manin 方程式の残差（$5\times10^{-7}$）、Appell $F_1$ 級数との一致（相対誤差 $10^{-14}$）。

### 本記事で証明していない・触れないこと

- **境界に到達した後の確率論**。吸収・反射・突然変異による復帰のいずれかを選ばなければ過程は一意でない（§5.2）。本記事は単体の内部だけを扱った。
- **$\nabla_\alpha$ のコホモロジー群の次元と基底**。局所系と許容する積分サイクルを明示していないので、「正規化定数＝周期」は厳密な定理の主張ではなく、枠組みを指定した上での**読み替え**である。
- **Appell 系の Pfaffian 基底・接続行列の全成分・モノドロミー**。§8 で書いたのは一変数の接続行列までで、HGM を実装したとは言わない。
- **Aomoto–Kita のページ単位照合**。同書は概念的枠組みの参照にとどめ、個別の定理番号は引いていない。

### 帰属

- Stratonovich 形式と多様体上の確率解析の枠組み：Émery, *Stochastic Calculus in Manifolds*, Springer Universitext, 1989。および Norris, "A complete differential formalism for stochastic calculus in manifolds," *Séminaire de Probabilités* XXVI (1992), 189–209 (LNM 1526)。
- Wright–Fisher 拡散：Kimura, "Diffusion models in population genetics," *J. Appl. Probab.* **1** (1964), 177–232。生成作用素と境界の一般論は Ethier–Kurtz, *Markov Processes*, Wiley, 1986, Ch. 10。
- 平方根写像と球面：Bhattacharyya, *Bull. Calcutta Math. Soc.* **35** (1943), 99–109（Bhattacharyya 角）。Fisher 情報を計量として使う源流は Rao, 同 **37** (1945), 81–91。非パラメトリックな一般化は Holbrook–Lan–Streets–Shahbaba, UAI 2020, PMLR **124**:101–110。
- 分散安定化変換：Bartlett, "The square root transformation in the analysis of variance," *JRSS Suppl.* **3** (1936), 68–78。以後 Anscombe (1948)、Freeman–Tukey (1950)。
- 捻れ de Rham コホモロジーとしての超幾何積分：Aomoto–Kita, *Theory of Hypergeometric Functions*, Springer Monographs in Mathematics, 2011。
- Holonomic gradient method：Nakayama–Nishiyama–Noro–Ohara–Sei–Takayama–Takemura, *Adv. Appl. Math.* **47** (2011), 639–658。

一点、文献の帰属で自分の下書きを訂正した。Numdam 版の "A complete differential formalism for stochastic calculus in manifolds" は Émery ではなく **Norris** の論文である。同じ主題で Émery の名前で引くべきなのは 1989 年の単行本のほうで、URL だけを控えていたために混同しかけた。

### 比喩として述べた箇所

- §6 の「壁」、§3 の「補正が消える」「押し戻す向き」、§5 の「歩く」「崖の縁」は比喩である。数学的内容は各節に書いた式に尽きる。
- §3.1 の「突然変異を入れたことになる」は比喩ではなく、$b(P)=\frac14(1-P)-\frac14P$ という drift の分解が文字どおり両向き率 $1/4$ の対称突然変異であることを指す。ただし集団遺伝学の $\theta$ の規約は文献によって異なるので、率の値は上の式の形で読んでほしい。

### 位置づけ

この庭は無所属の独立研究者による解説ノートであり、査読付きの原著ではない。本記事は情報幾何側の道具の整理にあたる。**不変量が解像度を決める。** 単体の境界は、素の de Rham には見えない。そして**係数を局所系に替えても、可縮なままでは見えない**（§6.1）。見えるようにするには、空間のほうを複素化して因子を抜くしかなかった。
