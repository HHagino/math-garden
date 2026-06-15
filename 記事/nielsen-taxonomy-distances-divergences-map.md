---
title: 距離とは何か ── Frank Nielsen の距離・発散地図を読む
date: 2026-05-20
tags: [距離, 発散, エントロピー, KL_divergence, Fisher_Rao, Bregman, Wasserstein, 情報幾何, 最適輸送, 量子情報, Nielsen, taxonomy]
status: done
level: 数学解説(情報幾何・機械学習・数理物理に関心のある読者向け)
---

# 距離とは何か ── Frank Nielsen の距離・発散地図を読む

## 0. 入口

Frank Nielsen が出している有名なポスター "Taxonomy of principal distances and divergences" を眺めていた。一枚に、ユークリッド幾何、双曲・球面幾何、統計幾何、リーマン幾何、アフィン微分幾何、情報幾何、最適輸送幾何、量子・行列幾何 ── これだけの領域が同居していて、各領域に代表的な距離・発散・エントロピーが並んでいる。Euclidean、Manhattan、Mahalanobis、Hausdorff、Fisher–Rao、Shannon、KL、Jensen–Shannon、Bhattacharyya、Hellinger、Pearson $\chi^2$、Csiszár $f$-divergence、Amari $\alpha$-divergence、Bregman、Itakura–Saito、Rényi、Chernoff、Wasserstein、Earth Mover's、Sinkhorn、Gromov–Hausdorff、von Neumann entropy、quantum $f$-divergence、log-det divergence ──。

これを「**距離の動物園**」として暗記する読み方もあるが、それでは何も分からない。本記事は、これを **一枚の地図** として読むためのガイドである。中心になる直観はこれだ:

> **距離や発散とは、単に 2 点間の長さではなく、対象をどの幾何で見るかという選択である。**

## 1. distance と divergence は同じではない

最初に区別を入れる。

数学で **metric**(距離関数)と呼ばれるものには、次の性質が要請される:

1. 非負性:$d(x, y) \geq 0$。
2. 同一性:$d(x, y) = 0 \iff x = y$。
3. 対称性:$d(x, y) = d(y, x)$。
4. 三角不等式:$d(x, z) \leq d(x, y) + d(y, z)$。

一方、KL divergence のような **divergence** は、

- 非負性は持つが、
- 一般に **非対称** であり($D(p \| q) \neq D(q \| p)$)、
- 三角不等式を満たさない、

ので、厳密な意味では距離ではない。しかし、統計・情報理論・機械学習では、距離でなくても「**違いを測る量**」として極めて重要になる。

ポスター上の項目を見るときは、それが metric なのか divergence なのか、を常に意識すると見通しがよい。

## 2. ユークリッド幾何の領域

地図の左上、もっとも素朴な距離の世界。対象は主に座標を持つ点やベクトル。

### Euclidean distance

$$
d_2(p, q) \;=\; \sqrt{\sum_i (p_i - q_i)^2}.
$$

普通の直線距離。座標差を二乗して足して平方根。

### Manhattan distance

$$
d_1(p, q) \;=\; \sum_i |p_i - q_i|.
$$

格子状の街路を進むときの距離。$L^1$ ノルム。

### Minkowski distance

$$
d_k(p, q) \;=\; \left(\sum_i |p_i - q_i|^k\right)^{1/k}.
$$

$k = 2$ で Euclidean、$k = 1$ で Manhattan、$k \to \infty$ で Chebyshev(最大成分)。$L^p$ ノルム族の一般化。

### Hamming distance

成分が違う個数を数える距離。文字列・符号理論・離散データで自然。

### Mahalanobis metric

$$
d_M(p, q) \;=\; \sqrt{(p - q)^\top \Sigma^{-1} (p - q)}.
$$

共分散行列 $\Sigma$ で「縮尺を補正した」ユークリッド距離。統計的にスケール調整した「球面」を作る。

ここまでは、「ベクトルや点を **座標差** で比べる」という世界観。

## 3. リーマン幾何と Fisher–Rao 距離

ユークリッド距離は、空間が平らな場合の距離である。空間が曲がっているなら、距離は直線ではなく、多様体上の最短経路 ── **測地線** ── で測る。

リーマン計量は

$$
ds^2 \;=\; g_{ij}\, dx^i\, dx^j
$$

で与えられる。$g_{ij}$ は計量テンソルで、局所的に「どの方向にどれくらい進んだか」を測る装置。

統計では、確率分布の族 $p(x | \theta)$ を、パラメータ $\theta$ によって動く多様体として見る。そのとき自然に現れる計量が **Fisher 情報** である:

$$
I_{ij}(\theta) \;=\; \mathbb{E}_\theta\!\left[ \frac{\partial \log p}{\partial \theta^i}\, \frac{\partial \log p}{\partial \theta^j} \right].
$$

これを計量として使うと、確率分布の空間にリーマン幾何が入る。そこから **Fisher–Rao distance**(その計量による測地線距離)が現れる。

橋渡しとして、重要な事実をひとつ書いておく:

> **KL divergence の局所 2 次近似として Fisher 情報が現れる。**
>
> $$
> D_\mathrm{KL}(p_\theta \| p_{\theta + d\theta}) \;\approx\; \frac{1}{2}\, I_{ij}(\theta)\, d\theta^i\, d\theta^j.
> $$

つまり、KL は遠距離では非対称な発散だが、無限小レベルでは Fisher 計量という対称な 2 次形式に化ける。Fisher–Rao 距離は、その計量による測地線距離。

## 4. エントロピーと KL divergence

地図の右上には、**統計幾何** とエントロピー系の概念がある。

**1 点関数(エントロピー):**

$$
H(p) \;=\; -\int p \log p\, d\mu.
$$

Shannon entropy。分布 $p$ 自体の不確実性を測る。

**2 点関数(divergence):**

$$
D_\mathrm{KL}(p \| q) \;=\; \int p \log \frac{p}{q}\, d\mu.
$$

KL divergence。「本当は $p$ なのに $q$ で近似したときのズレ」を測る。

重要な区別:

- **entropy は一点の関数**(分布ひとつの性質)。
- **divergence は二点の関数**(分布ふたつの関係)。
- KL は統計的推論・情報理論・機械学習の中心的な発散だが、**非対称**($D_\mathrm{KL}(p \| q) \neq D_\mathrm{KL}(q \| p)$)で **三角不等式を満たさない** ので、distance ではない。

## 5. 情報幾何が地図の心臓部であること

中央付近の **Information geometries** が、本記事が中心と見做す領域である。

情報幾何では、確率分布の集合を幾何学的空間として見る。扱うべき主な概念:

- KL divergence
- Fisher information metric
- Fisher–Rao distance
- Amari $\alpha$-divergence
- 双対接続 $\nabla, \nabla^*$
- I-projection(divergence による直交射影)
- generalized Pythagorean theorem(divergence のピタゴラスの定理)

ユークリッド幾何では、直交射影に対してピタゴラスの定理が成り立つ:

$$
\|x - z\|^2 \;=\; \|x - y\|^2 + \|y - z\|^2.
$$

情報幾何では、KL divergence や Bregman divergence に対して、類似の **一般化ピタゴラス定理** が成り立つ場合がある:

$$
D(p \| r) \;=\; D(p \| q) + D(q \| r), \quad \text{$q$ が $p$ から制約集合への $I$-projection のとき。}
$$

直観としては:

> 「**制約を満たす分布の中で、元の分布に一番近いものを選ぶ**」という統計的・最適化的操作が、情報幾何では射影として見える。

最大エントロピー推定、EM アルゴリズム、ベイズ推論の各種特性が、この射影の言葉で統一的に書ける。

## 6. Bregman divergence と凸解析

左下の **Bregman divergences** は、凸解析と情報幾何をつなぐハブ。凸関数 $F$ から作られる Bregman divergence は

$$
B_F(x \| y) \;=\; F(x) - F(y) - \langle x - y,\, \nabla F(y) \rangle.
$$

これは、凸関数 $F$ を点 $y$ で接線近似したとき、点 $x$ でどれだけ上に浮くか(Jensen gap)を測る量。$F$ が凸なら $B_F \geq 0$、$B_F = 0 \iff x = y$。一般に非対称。

代表的な対応:

- $F(x) = \frac{1}{2} \|x\|^2$ なら $B_F(x \| y) = \frac{1}{2} \|x - y\|^2$(二乗ユークリッド距離)。
- 適切な $F$(離散分布なら $F(p) = \sum p_i \log p_i$)から KL divergence が出る。
- Burg entropy から Itakura–Saito divergence。
- Legendre 双対により、双対 divergence と双対座標が現れる。

Bregman divergence は、ユークリッド幾何・凸解析・情報幾何・指数型分布族・最適化を一つの語彙で扱える稀有な構造である。指数型分布族の log-partition function が凸関数で、それから自然に KL divergence(=Bregman divergence)が出る ── これが情報幾何の重要な構造定理の一つ。

## 7. $f$-divergence 系

右中の **Csiszár $f$-divergence**。凸関数 $f$ を用いて、

$$
D_f(p \| q) \;=\; \int q(x)\, f\!\left(\frac{p(x)}{q(x)}\right)\, d\mu(x).
$$

直観としては「**密度比 $p/q$ を見て、そのズレを凸関数で罰する**」。$f$ の選び方で多様な発散が出る:

- $f(t) = t \log t$ → KL divergence
- $f(t) = (\sqrt{t} - 1)^2$ → Hellinger distance(の二乗)
- $f(t) = (t - 1)^2$ → Pearson $\chi^2$ divergence
- $f(t) = -\log t$ → reverse KL
- $\alpha$-divergence 族(Amari)

これらは、Rényi、Bhattacharyya、Chernoff など、さまざまな統計的検定や情報量の母体になる。distance になるものもあれば、divergence にしかならないものもある(KL や $\alpha$-divergence は一般に距離ではない)。

統計的検定(Neyman–Pearson, large deviations)、情報理論(channel capacity の上下界)、ロバスト統計、機械学習の損失関数 ── 至るところで $f$-divergence の族が顔を出す。

## 8. 最適輸送と Wasserstein 距離

地図の下部、**Optimal transport geometry**。**Wasserstein distance** や **Earth mover's distance** は、確率分布を「質量の山」と見て、一方の分布を他方の分布に変形するための **最小輸送コスト** を測る。

KL divergence は「同じ場所で密度を比べる」発想に近い。一方、Wasserstein は「**質量をどれだけ動かせばよいか**」を見る。

直観の比喩:

> KL は、同じ地点で人口密度の違いを見る。
>
> Wasserstein は、一方の人口分布を他方に変えるために、人をどれだけ移動させる必要があるかを見る。

このため、Wasserstein は次の分野で自然に現れる:

- 画像、形状解析、点群
- 生成モデル(WGAN など)
- 自然言語の埋め込み
- 確率測度の幾何

**Sinkhorn divergence** は、エントロピー正則化を加えた最適輸送。計算が劇的に速くなり(Sinkhorn–Knopp 反復)、機械学習で多用される。

Wasserstein は metric(対称・三角不等式を満たす)なので、これらの応用で「距離」として直接扱える点が強い。

## 9. 量子・行列幾何

右下の **Quantum & matrix geometry**。古典的な確率分布 $p$ の代わりに、量子状態では密度行列 $\rho$ を扱う。

Shannon entropy の量子版が **von Neumann entropy**:

$$
S(\rho) \;=\; -\mathrm{Tr}(\rho \log \rho).
$$

KL divergence の量子版として、**von Neumann divergence**(または Umegaki–Araki–Uhlmann の量子相対エントロピー)

$$
D(\rho \| \sigma) \;=\; \mathrm{Tr}\bigl(\rho (\log \rho - \log \sigma)\bigr)
$$

がある。さらに **quantum $f$-divergence**(Petz による一般化)が複数ある。

確率分布は対角行列のように見なせるが、量子状態は **一般の(自己共役・トレース 1・半正定値)行列** なので、**非可換性**

$$
PQ \neq QP
$$

が入る。この非可換性のため、古典的な発散の量子版は一意ではなく、Petz の quantum $f$-divergence、measured relative entropy、max-divergence など、複数の自然な一般化が並ぶ。

行列の幾何としては、**log-det divergence**(正定値行列上)、affine-invariant metric なども現れ、機械学習(共分散行列の比較)・量子情報・微分幾何で重要になる。

## 10. 地図を読むための三つの軸

ここまでの議論を、三つの軸で整理する。

### 軸 1:何を比べているのか(対象)

| 対象 | 代表的な距離・発散 |
|---|---|
| 点・ベクトル | Euclidean, Manhattan, Minkowski, Mahalanobis |
| 文字列・離散データ | Hamming |
| 集合 | Hausdorff |
| 確率分布 | KL, Hellinger, Fisher–Rao, Wasserstein, $f$-divergence |
| 正定値行列 | Log-det, affine-invariant metric |
| 量子状態 | von Neumann, quantum $f$-divergence |
| 距離空間そのもの | Gromov–Hausdorff |

### 軸 2:どの構造を使って比べているのか(手段)

| 構造 | 代表的な距離・発散 |
|---|---|
| 座標差 | Euclidean 系 |
| 共分散構造 | Mahalanobis |
| 密度比 | KL, $f$-divergence |
| 凸関数 | Bregman |
| 輸送コスト | Wasserstein |
| 局所計量 | Fisher–Rao |
| 非可換行列 | 量子情報幾何 |

### 軸 3:metric か divergence か(性質)

- **距離らしい(対称・三角不等式):** Euclidean, Wasserstein, Hellinger, Fisher–Rao
- **非対称な発散(一般には距離ではない):** KL, Bregman, Itakura–Saito, Rényi, $\alpha$-divergence
- **対称化された量(平方根で距離になることも):** Jensen–Shannon divergence

## 11. 結論:同じ "違い" でも、見方によって自然な量が変わる

このポスターは、単なる「距離の動物園」ではない。**幾何学・統計学・情報理論・最適化・量子論が、"差異をどう測るか" という一点でつながっていることを示す地図** である。

同じ「2 つの確率分布の違い」でも、見方によって自然な量が変わる:

- **情報損失として見るなら:** KL divergence。
- **局所的な曲率として見るなら:** Fisher–Rao distance。
- **凸最適化として見るなら:** Bregman divergence。
- **密度比の統計的差として見るなら:** $f$-divergence。
- **質量の移動として見るなら:** Wasserstein distance。
- **量子状態として見るなら:** von Neumann divergence / quantum $f$-divergence。

これらは別物ではない。それぞれが、同じ「**違いを測る**」という活動の、異なる幾何的選択である。

実用的な導線として、もし自分の研究や機械学習で「差異の測り方」を選ぶ場面に立つなら、まず以下の **4 本柱** を押さえるとよい:

- **KL divergence** ── 情報理論的・統計推論の基本
- **Fisher information / Fisher–Rao** ── 局所計量、infinitesimal の KL
- **Bregman divergence** ── 凸関数からの統一視点、指数型分布族の中心
- **Wasserstein distance** ── 質量輸送、生成モデル・分布の幾何

これらが、ポスターのほとんどの項目と相互に翻訳できる。残りは、これらの変形・特殊化・対称化・正則化・量子化として理解できる。

> 距離とは何か。
>
> ── それは 2 点間の長さではなく、**対象をどの幾何で見るかという選択** である。

ポスターを見るたび、そう思い直す。Frank Nielsen, "Taxonomy of principal distances and divergences" は、その選択の地図として読むのがいちばん豊かだ。
