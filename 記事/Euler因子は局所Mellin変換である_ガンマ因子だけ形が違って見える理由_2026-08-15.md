---
title: "Euler 因子は局所 Mellin 変換である ── Γ 因子だけ形が違って見える理由"
date: 2026-08-15
lang: ja
tags: [Tateの学位論文, Euler因子, ガンマ因子, p進数, 局所ゼータ積分, Mellin変換, 自己双対, アデール, 素点, ゼータ関数]
status: done
level: 数学解説(広義積分と等比級数。p 進数は定義から使う)
---

# Euler 因子は局所 Mellin 変換である ── Γ 因子だけ形が違って見える理由

## 1. 導入：$\xi(s)$ の二種類の因子は、同じ積分の値である

完備化されたゼータ関数

$$\xi(s) \;=\; \underbrace{\pi^{-s/2}\Gamma(s/2)}_{\text{解析的な何か}} \cdot \underbrace{\prod_p \bigl(1-p^{-s}\bigr)^{-1}}_{\text{数論的な何か}}$$

は、いつも接ぎ木のように見える。$\Gamma$ は積分から来た超越的な関数で、Euler 因子は素数を数える有理式である。**種類の違うものを掛けて、たまたま綺麗な対称性が出た** ── そう読める形をしている。

[前記事](Poisson和公式は格子で割ったPeter-Weylである_関数等式はどこから来るのか_2026-08-15.md)では「$\pi^{-s/2}\Gamma(s/2)$ は無限素点の局所因子である」と書いた。**書いただけで、計算していない。**ここで計算する。主張はこうである。

> **$\Gamma$ 因子と Euler 因子は、同じ一本の積分**
> $$Z_v(s) \;=\; \int_{K_v^\times} f_v(x)\,|x|_v^{s}\; d^\times x$$
> **に、その素点で自己双対な $f_v$ を入れた値である。**
> 形が違って見えるのは、$\mathbb{Q}_p$ には自己双対な**定義関数**があり、$\mathbb{R}$ には無いからにすぎない。

これは Tate が 1950 年の学位論文で組み上げた見方である。この記事で手を動かすのは**局所の二本だけ**で、大域の一本（アデール上の Poisson 和公式から関数等式を出す段）は名前を挙げるにとどめる。局所の二本は、どちらも紙の上で終わる。

| 素点 $v$ | 自己双対な $f_v$ | $Z_v(s)$ |
|---|---|---|
| **有限素点 $p$** | $\mathbf{1}_{\mathbb{Z}_p}$（整数環の定義関数） | $\bigl(1-p^{-s}\bigr)^{-1}$ |
| **無限素点 $\infty$** | $e^{-\pi x^2}$（Gauss 関数） | $\pi^{-s/2}\Gamma(s/2)$ |

---

## 2. 有限素点を手で計算する ── Euler 因子は等比級数である

$\mathbb{Q}_p$ の絶対値を $|p|_p = 1/p$ で正規化する。乗法群 $\mathbb{Q}_p^\times$ は、**絶対値の値ごとの層（シェル）に分かれる**：

$$\mathbb{Q}_p^\times \;=\; \bigsqcup_{n\in\mathbb{Z}} p^n\,\mathbb{Z}_p^\times, \qquad x\in p^n\mathbb{Z}_p^\times \iff |x|_p = p^{-n}.$$

乗法的 Haar 測度 $d^\times x$ を $\operatorname{vol}^\times(\mathbb{Z}_p^\times) = 1$ と正規化する。平行移動不変だから、**どの層も体積 $1$** である。

テスト関数に $f_p = \mathbf{1}_{\mathbb{Z}_p}$ を取る。$x\in\mathbb{Z}_p$ であることは $n\ge 0$ と同じだから、積分は層ごとの和になる。

$$Z_p(s) = \int_{\mathbb{Q}_p^\times}\mathbf{1}_{\mathbb{Z}_p}(x)\,|x|_p^{s}\,d^\times x = \sum_{n\ge 0} \underbrace{\operatorname{vol}^\times(p^n\mathbb{Z}_p^\times)}_{=1}\cdot\bigl(p^{-n}\bigr)^{s} = \sum_{n\ge 0} p^{-ns}.$$

等比級数だから、$\operatorname{Re} s > 0$ で

$$\boxed{\ Z_p(s) = \frac{1}{1-p^{-s}}\ }$$

**Euler 因子が出た。**素数を「数えた」のではない。$\mathbb{Q}_p^\times$ を層に切って、層の体積を足しただけである。$(1-p^{-s})^{-1}$ という有理式の正体は、**層の体積がすべて $1$ で、重みが等比数列であること**だった。

<figure>
<svg viewBox="0 0 460 190" width="100%" role="img" aria-label="Qp の乗法群が同心の層に分かれ、各層の体積が1で重みが等比数列になる図">
  <circle cx="150" cy="95" r="82" fill="none" stroke="#b8b0a2" stroke-width="1"/>
  <circle cx="150" cy="95" r="62" fill="none" stroke="#b8b0a2" stroke-width="1"/>
  <circle cx="150" cy="95" r="42" fill="none" stroke="#b8b0a2" stroke-width="1"/>
  <circle cx="150" cy="95" r="22" fill="none" stroke="#b8b0a2" stroke-width="1"/>
  <path d="M150 13 A82 82 0 0 1 232 95 L212 95 A62 62 0 0 0 150 33 Z" fill="#c9b98f" opacity="0.85"/>
  <path d="M150 33 A62 62 0 0 1 212 95 L192 95 A42 42 0 0 0 150 53 Z" fill="#c9b98f" opacity="0.6"/>
  <path d="M150 53 A42 42 0 0 1 192 95 L172 95 A22 22 0 0 0 150 73 Z" fill="#c9b98f" opacity="0.4"/>
  <circle cx="150" cy="95" r="3" fill="#3a3630"/>
  <text x="150" y="112" font-size="10" text-anchor="middle" fill="#3a3630">0</text>
  <text x="250" y="40" font-size="11" fill="#3a3630">n=0：|x|=1（Z_p<tspan baseline-shift="super" font-size="8">×</tspan>）　重み 1</text>
  <text x="250" y="62" font-size="11" fill="#3a3630">n=1：|x|=1/p　　　　重み p<tspan baseline-shift="super" font-size="8">−s</tspan></text>
  <text x="250" y="84" font-size="11" fill="#3a3630">n=2：|x|=1/p²　　　 重み p<tspan baseline-shift="super" font-size="8">−2s</tspan></text>
  <text x="250" y="106" font-size="11" fill="#6b6459">…（内側へ無限に続く）</text>
  <text x="250" y="140" font-size="11" fill="#3a3630">どの層も体積 1</text>
  <text x="250" y="160" font-size="11" fill="#3a3630">⟹ Σ p<tspan baseline-shift="super" font-size="8">−ns</tspan> = (1−p<tspan baseline-shift="super" font-size="8">−s</tspan>)<tspan baseline-shift="super" font-size="8">−1</tspan></text>
  <text x="20" y="182" font-size="11" fill="#6b6459">Z_p は「原点に向かって縮む層」を外から内へ足していく積分。1_{Z_p} は n≥0 の層だけを残す。</text>
</svg>
<figcaption>$\mathbb{Q}_p^\times$ は絶対値の値ごとの同心層に分かれ、各層の乗法的体積は等しい。Euler 因子は、その層の上の等比級数である。</figcaption>
</figure>

---

## 3. 無限素点を手で計算する ── $\Gamma$ 因子は同じ積分である

同じ積分を $\mathbb{R}$ でやる。乗法的 Haar 測度は $d^\times x = dx/|x|$、テスト関数は Gauss 関数 $f_\infty(x) = e^{-\pi x^2}$ を取る。

$$Z_\infty(s) = \int_{\mathbb{R}^\times} e^{-\pi x^2}\,|x|^{s}\,\frac{dx}{|x|} \;=\; 2\int_0^\infty e^{-\pi x^2}\,x^{s-1}\,dx$$

（偶関数なので正の側の $2$ 倍）。$u = \pi x^2$ と置くと $x = (u/\pi)^{1/2}$、$dx = \tfrac12 \pi^{-1/2}u^{-1/2}du$ だから

$$2\int_0^\infty e^{-u}\Bigl(\frac{u}{\pi}\Bigr)^{\frac{s-1}{2}}\cdot \tfrac12\pi^{-1/2}u^{-1/2}\,du \;=\; \pi^{-s/2}\int_0^\infty e^{-u}u^{\frac s2 - 1}\,du.$$

右の積分は $\Gamma(s/2)$ の定義そのものである。したがって

$$\boxed{\ Z_\infty(s) = \pi^{-s/2}\,\Gamma(s/2)\ }$$

**$\xi(s)$ の中の $\Gamma$ 因子が、そっくりそのまま出た。**係数の $\pi^{-s/2}$ も、後から辻褄合わせに掛けたものではなく、Gauss 関数の指数に $\pi$ を入れた正規化から自動的に落ちてくる。

そして両者を掛ければ、$\operatorname{Re} s>1$ で

$$\prod_v Z_v(s) \;=\; \pi^{-s/2}\Gamma(s/2)\prod_p\bigl(1-p^{-s}\bigr)^{-1} \;=\; \pi^{-s/2}\Gamma(s/2)\,\zeta(s) \;=\; \xi(s).$$

**$\xi$ は「$\zeta$ に補正因子を掛けたもの」ではなく、はじめから全素点にわたる局所積分の積だった。**$\zeta$ の方が、無限素点を落とした不完全な積である。

---

## 4. なぜその $f_v$ なのか ── 自己双対性が選んでいる

テスト関数は勝手に選べる。$\mathbf{1}_{\mathbb{Z}_p}$ と $e^{-\pi x^2}$ を選んだ理由がいる。**どちらも、その素点で Fourier 変換して自分に戻るからである。**

**無限素点**：$e^{-\pi x^2}$ は Fourier 変換の固有値 $1$ の固有関数である（前記事 §5）。

**有限素点**：$\mathbb{Q}_p$ の加法指標 $\psi_p$ と、$\operatorname{vol}(\mathbb{Z}_p)=1$ となる加法的 Haar 測度を取る。すると

$$\widehat{\mathbf{1}_{\mathbb{Z}_p}}(y) \;=\; \int_{\mathbb{Z}_p}\psi_p(xy)\,dx \;=\; \begin{cases} 1 & (y\in\mathbb{Z}_p)\\ 0 & (y\notin\mathbb{Z}_p)\end{cases} \;=\; \mathbf{1}_{\mathbb{Z}_p}(y).$$

理由は初等的である。$y\in\mathbb{Z}_p$ なら $xy\in\mathbb{Z}_p$ で $\psi_p(xy)=1$ だから積分は $\operatorname{vol}(\mathbb{Z}_p)=1$。$y\notin\mathbb{Z}_p$ なら $x\mapsto\psi_p(xy)$ は**コンパクト群 $\mathbb{Z}_p$ の自明でない指標**になり、指標の直交性から積分は $0$。**「定義関数が自分の Fourier 変換になる」という現象は、コンパクトかつ開な部分環 $\mathbb{Z}_p$ が存在することに全面的に依存している。**

★ ここが「形が違って見える」ことの正体である。$\mathbb{Q}_p$ にはコンパクト開部分環があり、その定義関数が自己双対になる。**$\mathbb{R}$ にはコンパクト開部分環が無い**（$\mathbb{R}$ は連結だから、開かつコンパクトな部分集合は空しかない）。だから $\mathbb{R}$ の自己双対な関数は定義関数になれず、代わりに Gauss 関数が引き受ける。定義関数を入れれば等比級数が出て有理式になり、Gauss 関数を入れれば $\Gamma$ 積分が出て超越関数になる。

> **$\Gamma$ 因子と Euler 因子の見かけの違いは、$\mathbb{R}$ が連結で $\mathbb{Q}_p$ が完全不連結であること、それだけから来ている。**

---

## 5. 否定形：局所因子は素点だけでは決まらない

「$p$ での局所因子は $(1-p^{-s})^{-1}$ である」と言い切ると、間違いになる。**局所因子はテスト関数と組にして初めて決まる。**手で確かめられる。

$f_p = \mathbf{1}_{p\mathbb{Z}_p}$（$\mathbb{Z}_p$ ではなく $p\mathbb{Z}_p$）に取り替える。生き残る層は $n\ge 1$ だから

$$\int_{\mathbb{Q}_p^\times}\mathbf{1}_{p\mathbb{Z}_p}(x)|x|_p^s\,d^\times x = \sum_{n\ge1}p^{-ns} = \frac{p^{-s}}{1-p^{-s}}.$$

$(1-p^{-s})^{-1}$ とは**別の関数**である。$\mathbf{1}_{p\mathbb{Z}_p}$ の Fourier 変換は $\mathbf{1}_{p\mathbb{Z}_p}$ ではない（$p^{-1}\mathbb{Z}_p$ 側に広がる）から、自己双対でもない。

⟹ **Euler 因子は「素点 $p$ の局所因子」ではなく、「素点 $p$ における、自己双対なテスト関数の局所因子」である。** 自己双対性という条件を落とすと、因子は一意でなくなる。$\xi(s)=\xi(1-s)$ の対称性が成り立つのは、**全素点で同時に自己双対を選んだとき**に限る。

これは前記事の主題と同じ構造である。あちらでは $t\leftrightarrow 1/t$ が格子と双対格子の交換だった。こちらでは $s\leftrightarrow 1-s$ が、各素点での Fourier 双対の取り替えになっている。**自己双対な関数を選ぶとは、その交換で動かない点に立つということである。**

<figure>
<svg viewBox="0 0 470 150" width="100%" role="img" aria-label="全素点にわたる局所因子の積として xi が構成される図">
  <text x="18" y="18" font-size="11" fill="#3a3630">ξ(s) ＝ すべての素点の局所積分の積</text>
  <line x1="18" y1="72" x2="452" y2="72" stroke="#d8d2c6" stroke-width="1"/>
  <g>
    <rect x="24" y="40" width="62" height="32" fill="#8fa9c9" stroke="#7a7266" stroke-width="1.2"/>
    <text x="55" y="60" font-size="10" text-anchor="middle" fill="#26313d">∞</text>
    <rect x="98" y="40" width="52" height="32" fill="#c9b98f" stroke="#7a7266" stroke-width="1.2"/>
    <text x="124" y="60" font-size="10" text-anchor="middle" fill="#3a3630">2</text>
    <rect x="162" y="40" width="52" height="32" fill="#c9b98f" stroke="#7a7266" stroke-width="1.2"/>
    <text x="188" y="60" font-size="10" text-anchor="middle" fill="#3a3630">3</text>
    <rect x="226" y="40" width="52" height="32" fill="#c9b98f" stroke="#7a7266" stroke-width="1.2"/>
    <text x="252" y="60" font-size="10" text-anchor="middle" fill="#3a3630">5</text>
    <rect x="290" y="40" width="52" height="32" fill="#c9b98f" stroke="#7a7266" stroke-width="1.2"/>
    <text x="316" y="60" font-size="10" text-anchor="middle" fill="#3a3630">7</text>
    <text x="380" y="60" font-size="11" fill="#6b6459">…</text>
  </g>
  <text x="55" y="90" font-size="9" text-anchor="middle" fill="#26313d">e<tspan baseline-shift="super" font-size="7">−πx²</tspan></text>
  <text x="124" y="90" font-size="9" text-anchor="middle" fill="#6b6459">1_{Z₂}</text>
  <text x="188" y="90" font-size="9" text-anchor="middle" fill="#6b6459">1_{Z₃}</text>
  <text x="252" y="90" font-size="9" text-anchor="middle" fill="#6b6459">1_{Z₅}</text>
  <text x="316" y="90" font-size="9" text-anchor="middle" fill="#6b6459">1_{Z₇}</text>
  <text x="55" y="108" font-size="9" text-anchor="middle" fill="#26313d">π<tspan baseline-shift="super" font-size="7">−s/2</tspan>Γ(s/2)</text>
  <text x="124" y="108" font-size="9" text-anchor="middle" fill="#6b6459">(1−2<tspan baseline-shift="super" font-size="7">−s</tspan>)<tspan baseline-shift="super" font-size="7">−1</tspan></text>
  <text x="188" y="108" font-size="9" text-anchor="middle" fill="#6b6459">(1−3<tspan baseline-shift="super" font-size="7">−s</tspan>)<tspan baseline-shift="super" font-size="7">−1</tspan></text>
  <text x="252" y="108" font-size="9" text-anchor="middle" fill="#6b6459">(1−5<tspan baseline-shift="super" font-size="7">−s</tspan>)<tspan baseline-shift="super" font-size="7">−1</tspan></text>
  <text x="316" y="108" font-size="9" text-anchor="middle" fill="#6b6459">(1−7<tspan baseline-shift="super" font-size="7">−s</tspan>)<tspan baseline-shift="super" font-size="7">−1</tspan></text>
  <text x="18" y="136" font-size="11" fill="#3a3630">上段＝素点、中段＝自己双対なテスト関数、下段＝同じ積分 ∫ f<tspan baseline-shift="sub" font-size="8">v</tspan>|x|<tspan baseline-shift="sub" font-size="8">v</tspan><tspan baseline-shift="super" font-size="8">s</tspan> d<tspan baseline-shift="super" font-size="8">×</tspan>x の値。ζ は左端を落とした積。</text>
</svg>
<figcaption>$\infty$ だけが色違いなのは、そこだけ自己双対関数が定義関数でないからである。積分の形は全素点で同一。</figcaption>
</figure>

---

## 6. どこまでが手の中で、どこからが外か

局所の二本は上で終わった。**残りの一段は、この記事では計算していない。**線を引いておく。

Tate は、局所積分をアデール環 $\mathbb{A}$ 上の一本の積分に束ね、

$$Z(s,f) = \int_{\mathbb{A}^\times} f(x)\,|x|^{s}\,d^\times x$$

に対して $Z(s,f) = Z(1-s,\hat f)$ を示した。その証明の心臓が**アデール上の Poisson 和公式**（$\mathbb{A}/\mathbb{Q}$ がコンパクトであることを使う）であり、前記事で $\mathbb{R}/\mathbb{Z}$ に対してやったことの、素点を全部込みにした版である。$f$ を全素点で自己双対に取れば $\hat f = f$ となり、$\xi(s)=\xi(1-s)$ が落ちる。

**⟹ 関数等式の出所は、前記事と同じ「格子で割ってフーリエ」であり、変わったのは割る対象が $\mathbb{R}$ から $\mathbb{A}$ になったことだけである。**ただし本記事はその段を実行していない。極の位置（$s=0,1$）が、$f(0)$ と $\hat f(0)$ から来る境界項として現れることも、名前を挙げるにとどめる。

### 崩れる場所

- **一般の代数体では、$\mathbf{1}_{\mathcal{O}_v}$ は自己双対とは限らない。**自己双対にするには**共役差積（different）**の逆元で捻る必要があり、その分だけ判別式 $\sqrt{|d_K|}$ が関数等式に顔を出す。$\mathbb{Q}$ で綺麗なのは判別式が $1$ だからで、**一般には綺麗ではない**（[拡大は $e$、ノルムは $f$](dedekind-e-extension-f-norm.md) の分岐の話が、ここで料金として戻ってくる）。
- **分岐した指標**（一般の Hecke 指標）を入れると、局所因子は導手の分だけ形を変える。§2 の計算は自明指標に対するものである。
- 収束域も条件つきで、$Z_p$ は $\operatorname{Re}s>0$、積の方は $\operatorname{Re}s>1$ でしか収束していない。**関数等式は解析接続した後の主張である。**

---

## 7. 横断：この積分はどこで再会するか

**前二記事との関係。** [有限群のフーリエは Peter–Weyl である](有限群のフーリエはPeter-Weylである_指標表はどこから来るのか_2026-08-15.md) では、群環を既約表現ごとに割った。[Poisson 和公式](Poisson和公式は格子で割ったPeter-Weylである_関数等式はどこから来るのか_2026-08-15.md) では、$\mathbb{R}$ を格子で割った。ここでは**アデールを素点ごとに分けた**。三本とも「一つの対象を、双対の側から見て割る」ことをしていて、割った断片の名前がそれぞれ**既約表現・周波数・素点**になっている。$\xi = \prod_v Z_v$ は、$|G| = \sum_i d_i^2$ の乗法版である。

**素点の対等性。** [有限素点と無限素点 ── Dirichlet の単数定理](finite-infinite-primes-dirichlet-unit-theorem.md) で、積公式 $\prod_v|x|_v = 1$ が有限と無限を対等に扱うことを見た。本記事はその対等性を、**測度と積分のレベルで実行した**ものである。単数定理で無限素点が「対数格子の次元」として効いたのと同じ位置に、ここでは $\Gamma$ 因子が座っている。

**$p$ 進の側。** [$\ell$ 進表現と $p$ 進表現](l-adic-vs-p-adic-galois-representation.md) が扱う「係数の $p$ と底の $p$ が一致すると景色が変わる」現象は、本記事の枠内では起きない ── 局所因子はすべて $\mathbb{C}$ 係数で、素点ごとに独立だからである。**その独立性が壊れる場所から $p$ 進 Hodge 理論が始まる。**

**岩澤の側。** [岩澤理論と Selmer 群](iwasawa-theory-selmer-introduction.md) の $p$ 進 $L$ 関数は、この記事の $\mathbb{C}$ 値の積分を $p$ 進側に置き換えたところに立つ。**同じ $\zeta$ を、係数体を変えて二度作る**という手つきが、主予想の両辺を用意している。

---

## 8. 査読・限界

**確立している事実**

- $Z_p(s) = (1-p^{-s})^{-1}$、$Z_\infty(s)=\pi^{-s/2}\Gamma(s/2)$、$\mathbf{1}_{\mathbb{Z}_p}$ の自己双対性、$\xi = \prod_v Z_v$、Tate の大域関数等式 $Z(s,f)=Z(1-s,\hat f)$ ── いずれも標準的である。原典は J. Tate, *Fourier Analysis in Number Fields and Hecke's Zeta-Functions*（1950 年の Princeton 学位論文。Cassels–Fröhlich *Algebraic Number Theory*（1967）に収録されて広く読まれるようになった）。教科書では Ramakrishnan–Valenza、Bump、Weil *Basic Number Theory* など。**本記事に新規な数学的主張はない。**
- §2・§3・§5 の三つの積分は、本文の手順どおりに手計算で再現できる。§4 の自己双対性の証明（コンパクト群の自明でない指標の積分が $0$）も同様。
- 代数体で共役差積による捻りが要ること、判別式が関数等式に現れることも標準的な事実である。

**私見・見立てとして書いた部分**

- 「$\Gamma$ 因子と Euler 因子の見かけの違いは、$\mathbb{R}$ が連結で $\mathbb{Q}_p$ が完全不連結であること、**それだけ**から来ている」（§4）。数学的な内容としては「自己双対な定義関数の存在はコンパクト開部分環の存在と結びつく」までが正しく、「それだけ」と言い切るのは**筆者の強調**である。たとえば $\mathbb{C}$ を素点に持つ体では自己双対関数の形がさらに変わる。
- §7 の「$\xi=\prod_v Z_v$ は $|G|=\sum_i d_i^2$ の乗法版」という対比は、構造の類比であって定理ではない。**証明を伴っていない。**

**書かなかったこと・限界**

- ★ **大域の一段（アデール上の Poisson 和公式）を実行していない。**本記事が示したのは「局所因子が同じ積分の値である」ことまでで、**関数等式そのものは導いていない**。前記事が $\mathbb{R}/\mathbb{Z}$ で実行した部分を、$\mathbb{A}/\mathbb{Q}$ で繰り返す作業が残っている。
- イデール類群による正規化、$Z(s,f)$ の極と留数（$s=0,1$）の扱い、$\mathbb{A}^\times/\mathbb{Q}^\times$ 上の積分への持ち上げに触れていない。
- 分岐した Hecke 指標の局所因子、局所関数等式と $\varepsilon$ 因子（根号数）は範囲外。**Langlands 的な一般化はさらに外側である。**
- 関数体の場合（$\mathbb{F}_q(t)$）には無限素点も同じ形になり、$\xi$ が有理関数になる。**この対称性の良さは数体では起きない**が、本記事は数体だけを見ている。

**未解決と既知の線引き**

本記事の内容に未解決問題は含まれない。Tate の理論は 1950 年に完成しており、**関数等式は定理である**。未解決なのは零点の位置（Riemann 予想）と、より高次の $L$ 関数に対する保型性であって、いずれも本記事の範囲外である。

---

三本並べると、同じ手つきが三度出てくる。群環を既約表現で割り、実数直線を格子で割り、アデールを素点で割った。どれも**「割った断片ごとに一本の同じ操作を走らせ、結果を掛け合わせるか足し合わせる」**という形をしている。違うのは断片の名前と、掛けるか足すかだけである。

では、**断片の側に自然な代表元が無いときはどうするのか。**§5 で見たように、局所因子はテスト関数を選んで初めて決まった。自己双対性がその選択を一意にしたが、選択を一意にする原理が無い場面 ── 分岐した素点、非可換な群 ── では、断片は名前を持っても値を持たない。**不変量が解像度を決める。**
