---
title: "KPZ普遍性クラス入門 ── 成長する界面・ランダム行列・$t^{1/3}$ の世界"
author: "萩野裕正"
date: "2026-06-01"
tags: [数学解説, 確率論, 数理物理, KPZ普遍性, ランダム行列, Tracy-Widom, 統計力学]
---

# KPZ普遍性クラス入門 ── 成長する界面・ランダム行列・$t^{1/3}$ の世界

> **事実確認について**: 本稿の年代・帰属・書誌は 2026-06-01 に web で照合した。各セクションの主張のうち厳密に証明されている部分と、物理レベルの議論・予想にとどまる部分を、できるだけ区別して書く。末尾に参照ソースを付す。

## 0. 何の話か

紙の燃え広がる縁。培養皿で広がる細菌コロニーの輪郭。結晶やコーヒー染みの成長する境界。これらは素材も機構もまるで違うのに、その「界面のでこぼこ(揺らぎ)」が、ある共通の数学的法則に従う——という驚くべき発見が、過去40年の確率論・数理物理の一大テーマになった。それが **KPZ普遍性クラス(KPZ universality class)** だ。

合言葉は二つある。

- 界面の高さの揺らぎは、時間 $t$ に対して **$t^{1/3}$** で伸びる(拡散の常識 $t^{1/2}$ より遅い)。
- その揺らぎの**分布の形**が、ランダム行列理論に現れる **Tracy–Widom 分布**になる。

成長界面の問題が、まったく出自の違うランダム行列の最大固有値の統計に一致する。この一致こそ KPZ 普遍性の核心であり、本稿で順を追って解きほぐす対象だ。

## 1. KPZ 方程式

出発点は 1986 年、Kardar・Parisi・Zhang の論文 "Dynamic Scaling of Growing Interfaces"(*Phys. Rev. Lett.* **56**, 889)である。高さ場 $h(x,t)$ の時間発展を、彼らは次の確率偏微分方程式で記述した(1+1 次元、すなわち空間1次元・時間1次元)。

$$
\partial_t h(x,t) \;=\; \nu\,\partial_x^2 h \;+\; \frac{\lambda}{2}\,(\partial_x h)^2 \;+\; \sqrt{D}\,\xi(x,t).
$$

三つの項にはそれぞれ明確な意味がある。

- $\nu\,\partial_x^2 h$:**拡散(平滑化)**。とがった所をならして界面をなめらかにする。
- $\dfrac{\lambda}{2}(\partial_x h)^2$:**非線形成長**。界面が法線方向に成長することを最低次で表す項。これが KPZ を Edwards–Wilkinson(線形)から分ける本質で、$\lambda \neq 0$ が普遍性クラスを決める。
- $\sqrt{D}\,\xi$:**時空ホワイトノイズ**。ランダムな堆積・ゆらぎ。

KPZ 論文はこの方程式を、**Burgers 方程式**($\partial_x h = u$ とおくと確率 Burgers 方程式になる)や **ランダム媒質中の有向高分子(directed polymer)** の自由エネルギーへの写像を通じて解析した。これらの「同じものの別の顔」が、後の可解模型群の土台になる。

> 注意:この非線形項 $(\partial_x h)^2$ は、解 $h$ がホワイトノイズのせいで微分不可能なほど粗いため、**そのままでは数学的に意味が定まらない**。これを厳密に定義する仕事が、後述の Hairer の理論(§7)で初めて完成する。1986 年の段階では物理的・形式的な方程式だった。

## 2. スケーリング指数と 1:2:3

界面の粗さは、ふつう次の3つの指数で特徴づける(Family–Vicsek スケーリング)。幅 $w(L,t)$(高さの標準偏差)が
$$
w(L,t) \sim L^{\alpha}\, f\!\left(\frac{t}{L^{z}}\right)
$$
の形をとり、

- $\alpha$:**粗さ指数(roughness exponent)**——定常状態での空間的なでこぼこの強さ、
- $z$:**動的指数(dynamic exponent)**——相関が広がる時間スケール $\sim L^z$、
- $\beta = \alpha/z$:**成長指数(growth exponent)**——飽和前の幅の伸び $w \sim t^{\beta}$。

**1+1 次元 KPZ クラスでは、これらの値が厳密に**
$$
\alpha = \tfrac12,\qquad z = \tfrac32,\qquad \beta = \tfrac13
$$
**になる**。1+1 次元では Galilei 不変性から $\alpha + z = 2$ という関係が出て、これと一般のスケーリング関係を合わせると上の値に固定される。

ここから「$t^{1/3}$ と $t^{2/3}$」が出る。高さの揺らぎは時間 $\sim t^{\beta}=t^{1/3}$ で伸び、相関が及ぶ空間距離は $\sim t^{1/z}=t^{2/3}$ で広がる。**高さ : 空間 : 時間 $= 1 : 2 : 3$**(指数 $\tfrac13:\tfrac23:1$)という比が、このクラスの指紋だ。

対照として、非線形項のない線形成長 **Edwards–Wilkinson 方程式**($\lambda=0$)は $z=2$、揺らぎは Gauss 的で、まったく別のクラスになる。KPZ の $z=3/2$ と非 Gauss 性は、$\lambda\neq 0$ がもたらす本質的に新しい現象である。

## 3. 「普遍性」とは何を主張しているか

KPZ 普遍性の主張は、平たく言えばこうだ。

> ミクロには似ても似つかぬ多数の確率模型が、適切に中心化・スケール($1:2:3$)すると、**同じ指数**と、さらに**同じ揺らぎの極限分布・極限過程**に収束する。

「同じクラス」とされる代表的な模型:

- **TASEP / ASEP**((非対称)単純排他過程):格子上の粒子が右へ偏って跳ぶ。粒子の積分が高さ場になる。
- **角成長模型 / 最長経路浸透(last passage percolation, LPP)**:ランダムな重みの格子で最大重み経路を取る。
- **PNG(polynuclear growth、多核成長)模型**。
- **ランダム媒質中の有向高分子**。
- **KPZ 方程式そのもの**、弾道堆積、Eden 模型 など。

重要なのは、指数 $1/3,\,2/3$ が一致するだけでなく、**揺らぎの分布の関数形まで一致する**点だ。指数だけなら偶然もありうるが、分布の形が合うのは、その背後に共通の極限対象(§8)が存在することの強い証拠になる。

ただし正直に言うと、**「すべての模型がこのクラスに入る」ことが一般に証明されているわけではない**。可解構造を持つ特定の模型については厳密に示されているが、一般の(可解でない)模型の普遍性は、いまも大きく予想の段階に残っている。

## 4. Tracy–Widom 分布とランダム行列

揺らぎの極限分布の正体は、ランダム行列理論から来る。Tracy と Widom は 1994 年("Level-spacing distributions and the Airy kernel", *Comm. Math. Phys.* **159**)、Gauss ユニタリ集団(GUE)の **最大固有値**の揺らぎが従う分布を、Painlevé II 方程式の解で表される関数として導いた。これが **Tracy–Widom 分布** $F_2$ である。対称クラスに応じて、

- $F_2$:GUE(ユニタリ)由来、
- $F_1$:GOE(直交)由来、
- $F_4$:GSE(シンプレクティック)由来

の3種がある。いずれも左右非対称で、左裾と右裾の減衰が異なる(片側が指数的、もう一方がより速い)。Gauss 分布とは似て非なる、新しい普遍分布だ。

成長界面という、行列とは縁もゆかりもなさそうな対象に、なぜ最大固有値の分布が現れるのか——それを最初に橋渡ししたのが、次節の可解模型群の歴史である。

## 5. 初期条件(幾何)で分布が変わる

ここは KPZ 普遍性で最も誤解されやすい急所なので、節を立てる。**極限分布は一つではなく、初期条件=界面の大域的な幾何で決まる**。代表的な3つの「下位クラス」:

| 初期条件(幾何) | 一点揺らぎの極限分布 | 空間極限過程 |
|---|---|---|
| 曲面・液滴(droplet / curved, narrow wedge) | **Tracy–Widom GUE**($F_2$) | $\mathrm{Airy}_2$ 過程 |
| 平坦(flat) | **Tracy–Widom GOE**($F_1$) | $\mathrm{Airy}_1$ 過程 |
| 定常(stationary) | **Baik–Rains 分布**($F_0$) | $\mathrm{Airy}_{\mathrm{stat}}$ |

同じ KPZ クラスでも、丸く膨らむ界面と、平らに進む界面では、揺らぎの分布の関数形が違う。指数 $1/3$ は共通だが、その前の「分布」が幾何で切り替わる。この幾何依存性は、後述の実験(§9)でも実際に見えている。

## 6. 厳密に解ける模型と歴史

KPZ の指数 $1/3$ と Tracy–Widom の橋渡しは、可解模型を通じて一段ずつ確立された。主要な里程標:

- **1999 — Baik–Deift–Johansson**:ランダム置換の**最長増加部分列(LIS)**の長さが、中心化・スケール後に **Tracy–Widom GUE($F_2$)** に収束することを証明(*J. Amer. Math. Soc.* **12**)。これが「組合せ論的成長量 = ランダム行列最大固有値の分布」という一致の最初の厳密な現れ。
- **2000 — Johansson**:幾何的 **LPP / TASEP** の形状揺らぎが Tracy–Widom GUE に従うことを示す("Shape fluctuations and random matrices", *Comm. Math. Phys.* **209**, 437–476)。KPZ クラスであることが模型として確立。
- **2002 — Prähofer–Spohn**:**PNG 液滴**の空間極限として **$\mathrm{Airy}_2$ 過程**を構成(*J. Stat. Phys.* **108**)。一点分布だけでなく、空間方向のランダム過程としての極限が現れた。
- **2010 — Sasamoto–Spohn / 2011 — Amir–Corwin–Quastel**:**KPZ 方程式そのもの**を narrow wedge 初期条件で解き、高さの一点分布を行列式型の厳密式で与え、長時間極限で **Tracy–Widom GUE** に収束することを示した(Sasamoto–Spohn: arXiv:1002.1879 / *Phys. Rev. Lett.* **104**, 230602。Amir–Corwin–Quastel は厳密な確率論的取り扱い)。最初は ASEP の弱非対称極限を経由し、のちに replica 法でも再導出された。

これらを貫く道具立てが **Cole–Hopf 変換**だ。$h$ から $Z=e^{h}$(適切な規格化つき)に移ると、$Z$ は乗法的ノイズをもつ **確率熱方程式(stochastic heat equation, SHE)**
$$
\partial_t Z = \tfrac12 \partial_x^2 Z + Z\,\xi
$$
を満たす。$Z$ は連続有向高分子の分配関数でもあり、$h=\log Z$ が KPZ 方程式の(Cole–Hopf 意味での)解になる。SHE は線形なので扱いやすく、可解性の供給源になっている。

## 7. KPZ 方程式そのものを「解く」

§1 で述べたとおり、KPZ 方程式の非線形項はそのままでは意味が定まらない。Cole–Hopf は迂回路を与えるが、方程式を**直接**意味づける一般論が長く欠けていた。これを解決したのが **Martin Hairer の正則構造の理論(theory of regularity structures)** である。

- Hairer, "Solving the KPZ equation"(*Ann. of Math.* **178**, 2013)
- Hairer, "A theory of regularity structures"(*Invent. Math.* **198**, 2014)

粗い解を、方程式に応じて決まる「基底」で展開し、有限個の発散項を**繰り込み**で処理することで、特異な確率偏微分方程式に厳密な意味と適切性(well-posedness)を与える枠組みだ。Hairer はこの業績で **2014 年のフィールズ賞**を受賞した(同年の受賞者は Avila, Bhargava, Mirzakhani, Hairer)。ほぼ同時期に Gubinelli–Imkeller–Perkowski の **paracontrolled distributions** による別アプローチも現れ、特異 SPDE 論という分野そのものを開いた。

## 8. 極限対象 ── Airy 過程・KPZ 固定点・directed landscape

普遍性を「同じ極限に収束する」と述べるからには、その**極限対象**が要る。

- **Airy 過程**(§5 の表):空間方向の普遍極限過程。$\mathrm{Airy}_2$(液滴)、$\mathrm{Airy}_1$(平坦)など。
- **KPZ 固定点(KPZ fixed point)**:すべての初期条件を一斉に扱える、$1:2:3$ スケーリング極限としての普遍 Markov 過程。Matetski–Quastel–Remenik が構成した(*Acta Math.* **227**, 115–203, 2021)。TASEP の厳密な極限としてこの固定点が得られる。
- **directed landscape**:KPZ 固定点を、あらゆる始点・終点・時間にわたって同時に結合する普遍的なランダム幾何(連続体版の LPP 環境)。Dauvergne–Ortmann–Virág が構成した(2018 年プレプリント arXiv:1812.00309、のち *Acta Mathematica* に出版)。

直観的には、ミクロ模型を $1:2:3$ で拡大して時間を飛ばすと、その揺らぎは KPZ 固定点 / directed landscape に収束する——これが普遍性の現代的な定式化だ。TASEP 系など可解な入口を持つ模型については厳密に達成されており、一般模型への拡張が現在進行形の課題である。

## 9. 実験と数値、そして次元の壁

理論だけでなく、**実物の実験**でも Tracy–Widom が見えている。竹内一将・佐野雅己は、ネマティック液晶の電気対流で生じる乱流的な成長界面を観測し、

- **円形(曲面)に広がる界面 → Tracy–Widom GUE**、
- **平坦に進む界面 → Tracy–Widom GOE**

という、§5 の**幾何依存性そのもの**を実験室で確認した(*Phys. Rev. Lett.* **104**, 230601, 2010;Takeuchi–Sano–Sasamoto–Spohn, *Sci. Rep.* **1**, 34, 2011)。指数 $1/3,\,2/3$ だけでなく分布の関数形・空間相関まで可解模型と一致した、説得力のある実証である。ほかに燃焼前線・細菌コロニー・薄膜成長などでも KPZ 的振る舞いの報告がある。

最後に重要な留保。**ここまでの厳密結果はほぼすべて 1+1 次元(空間1次元)に限られる**。2+1 次元以上では指数は数値計算で評価されているものの、Tracy–Widom のような厳密な分布も可解構造も(現時点では)得られていない。1次元の可解性は KPZ の豊かさの源であると同時に、その射程の境界でもある。

## 要するに

KPZ 普遍性とは、出自の異なる多数の成長・浸透・高分子模型が、$1:2:3$ スケーリングのもとで同じ指数($\alpha=\tfrac12,\,z=\tfrac32,\,\beta=\tfrac13$)と、同じ揺らぎ分布に収束する、という現象である。揺らぎの分布はランダム行列の最大固有値の **Tracy–Widom 分布**であり、しかも**界面の幾何(初期条件)で $F_2$(曲面)/ $F_1$(平坦)/ Baik–Rains(定常)に切り替わる**。この一致は、最長増加部分列(BDJ 1999)・LPP/TASEP(Johansson 2000)・PNG(Prähofer–Spohn 2002)・KPZ 方程式の厳密解(Sasamoto–Spohn 2010, Amir–Corwin–Quastel 2011)という可解模型群で一段ずつ確立され、極限対象としての **KPZ 固定点**(MQR 2021)と **directed landscape**(DOV 2018)に結晶した。方程式自体の意味づけは Hairer の正則構造論(フィールズ賞 2014)で完成し、竹内–佐野の液晶乱流実験(2010–11)が幾何依存性まで実証した。ただし一般模型の普遍性と高次元は、なお開いた問題である。

---

## 参照ソース

主要な年代・帰属・書誌は 2026-06-01 に web で照合した。★は本セッションで一次的に確認したもの、それ以外は分野の標準的参照。

- ★ M. Kardar, G. Parisi, Y.-C. Zhang, "Dynamic Scaling of Growing Interfaces", *Phys. Rev. Lett.* **56**, 889–892 (1986). <https://doi.org/10.1103/PhysRevLett.56.889>
- C. A. Tracy, H. Widom, "Level-spacing distributions and the Airy kernel", *Comm. Math. Phys.* **159**, 151–174 (1994).
- ★ J. Baik, P. Deift, K. Johansson, "On the distribution of the length of the longest increasing subsequence of random permutations", *J. Amer. Math. Soc.* **12** (1999). (Baik–Deift–Johansson の定理)
- ★ K. Johansson, "Shape fluctuations and random matrices", *Comm. Math. Phys.* **209**, 437–476 (2000).
- M. Prähofer, H. Spohn, "Scale invariance of the PNG droplet and the Airy process", *J. Stat. Phys.* **108** (2002).
- ★ T. Sasamoto, H. Spohn, "Exact height distributions for the KPZ equation with narrow wedge initial condition", arXiv:1002.1879;同 "One-Dimensional KPZ Equation: An Exact Solution and its Universality", *Phys. Rev. Lett.* **104**, 230602 (2010).
- G. Amir, I. Corwin, J. Quastel, "Probability distribution of the free energy of the continuum directed random polymer in 1+1 dimensions", *Comm. Pure Appl. Math.* **64** (2011).
- ★ K. A. Takeuchi, M. Sano, "Universal Fluctuations of Growing Interfaces: Evidence in Turbulent Liquid Crystals", *Phys. Rev. Lett.* **104**, 230601 (2010);K. A. Takeuchi, M. Sano, T. Sasamoto, H. Spohn, "Growing interfaces uncover universal fluctuations behind scale invariance", *Sci. Rep.* **1**, 34 (2011).
- ★ M. Hairer, "Solving the KPZ equation", *Ann. of Math.* **178** (2013);"A theory of regularity structures", *Invent. Math.* **198** (2014). フィールズ賞 2014。
- I. Corwin, "The Kardar–Parisi–Zhang equation and universality class", *Random Matrices: Theory Appl.* **1** (2012). (総説)
- ★ K. Matetski, J. Quastel, D. Remenik, "The KPZ fixed point", *Acta Math.* **227**, 115–203 (2021).
- ★ D. Dauvergne, J. Ortmann, B. Virág, "The directed landscape", arXiv:1812.00309 (2018);*Acta Mathematica* (2022).
- J. Quastel, "Introduction to KPZ"(survey, Univ. Toronto)。
