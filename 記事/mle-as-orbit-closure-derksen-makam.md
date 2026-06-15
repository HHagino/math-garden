# 最尤推定が軌道閉包の問題になるとき ── Derksen–Makam の Kronecker quiver

## タイトル案

1. 最尤推定が軌道閉包の問題になるとき ── Derksen–Makam の Kronecker quiver
2. Kronecker 共分散の参考文献に quiver が出てきた話
3. 統計と GIT 安定性の辞書 ── matrix normal model と quiver representation
4. 尤度が無限に逃げない条件は何か ── semistable / polystable / stable の統計的意味
5. $p^2 + q^2 - mpq$ という閾値 ── matrix normal model の MLE が決まる場所

---

## 1. 導入 ── Kronecker covariance を見ていたら quiver が出てきた

ある夜、Kronecker covariance、つまり共分散行列が二つの行列のテンソル積
$$\Sigma = \Psi \otimes \Omega, \qquad \Psi \in \mathrm{PD}(p), \;\Omega \in \mathrm{PD}(q)$$
で書ける Gaussian model(matrix normal model)の周辺論文を漁っていた。その参考文献欄に **quiver representation** が登場する論文があり、何の気なしに開いたら、これが想像以上に面白かった。

開いたのは Derksen–Makam の arXiv:2007.10206。タイトルは matrix normal model の MLE 存在・一意性に関するもので、ツールとして **quiver representation の安定性理論**(Kac, King, Schofield)が使われている。

私の研究テーマ(算術幾何寄り)にすぐ流用したい、という話ではない。ただ、**統計の最尤推定問題が代数幾何的な GIT 安定性判定にきれいに翻訳される**という事実そのものが、深く面白い。今回はその辞書を整理したくて書く。

## 2. Gaussian group model とは何をしているのか

Gaussian group model はざっくり言えば、共分散構造を群作用で制約した Gaussian model だ。

具体的には:

- $V$ を有限次元 Hilbert 空間($\mathbb{R}^n$ あるいは $\mathbb{C}^n$、内積込み)。
- 群 $G$ が rational representation $\rho: G \to GL(V)$ として $V$ に作用する。
- 観測データ $Y = (Y_1, \ldots, Y_m) \in V^m$ は $m$ 個のサンプル。
- 共分散行列は $\rho(g)\rho(g)^*$ の形に制約される。

Kronecker / matrix normal model は、$V = \mathrm{Mat}_{p,q}$、$G = GL_p \times GL_q$、$(g_1, g_2) \cdot Y = g_1 Y g_2^*$ という作用で具体化される特例だ。

MLE を求めるとは、サンプル $Y$ に対し、log-likelihood 関数 $\ell_Y(g)$ を最大化する $g$ を見つけることだ。問題は、

- そもそも $\ell_Y$ は上に有界か?
- 有界だとして、最大値は達成されるか(MLE は存在するか)?
- 存在するとして一意か?

である。

ここで Derksen–Makam の論文の主張が登場する:**これらの統計的問いは、群 $G$ の作用に関する GIT 安定性で完全に判定できる**。

## 3. Theorem 2.5 ── MLE と GIT 安定性の辞書

論文の Theorem 2.5(Gaussian group models の場合)は、ざっくり以下のとおりだ。

$K=\mathbb{R}$ または $\mathbb{C}$、$\rho(G)$ が Zariski closed で「随伴と非零スカラー倍に関して閉じている」適切な条件のもとで、$G_{SL}$(行列式 $1$ への制限)の対角作用を考える。すると次の対応が成り立つ:

$$\boxed{\;Y \text{ is } G_{SL}\text{-semistable} \;\Longleftrightarrow\; \ell_Y \text{ is bounded from above}\;}$$

$$\boxed{\;Y \text{ is } G_{SL}\text{-polystable} \;\Longleftrightarrow\; \text{an MLE exists}\;}$$

$$\boxed{\;Y \text{ is } G_{SL}\text{-stable} \;\Longrightarrow\; \text{there is a unique MLE}\;}$$

さらに、$K = \mathbb{C}$ のときは最後の含意の逆も成立する:
$$\text{unique MLE が存在} \;\Longleftrightarrow\; Y \text{ is stable}.$$

3 行の対応、しかも論理的に強さの順 ── semistable $\supset$ polystable $\supset$ stable とぴったり対応する。「上に有界 $\supset$ 存在 $\supset$ 一意」もまさにこの順だ。

## 4. semistable / polystable / stable の統計的意味

GIT に詳しくない読者のために、直観を書いておく。

**Semistable**。「群作用でデータを 0 に持っていく退化方向がない」ことに対応する。Hilbert–Mumford 判定では「軌道閉包が 0 を含むかどうか」(=「**null cone** に落ちないか」)で判定される。これが統計側では、**尤度が $+\infty$ に逃げず、上から押さえられる**ことに対応している。

直観:ある方向 $\lambda(t)$ に沿ってデータを $\lambda(t)\cdot Y \to 0$ と潰せると、対応する $g = \lambda(t)^{-1}$ の方向で尤度がいくらでも大きくできてしまう ── これが「unbounded」の幾何的理由。

**Polystable**。「軌道が閉じている」ことに対応する。$G \cdot Y$ そのものが閉集合になっており、軌道閉包と軌道が一致する。統計側では、**尤度の上限が境界(無限遠)でしか達成されないのではなく、実際に内部のある $g$ で達成される**ことに対応する。

直観:semistable だが polystable でないとき、上限はある「より退化した軌道」上の点でだけ達成されるので、MLE そのものはどの $g$ でも達成しない。

**Stable**。「閉軌道で、しかも stabilizer が(零次元成分しか持たない、本質的に有限)」ことに対応する。統計側では、**最大点が ridge にならず、一意に決まる**ことに対応する。

直観:連続的な対称性が残っていれば、それに沿って $g$ を動かしても尤度は同じ値を保つので、最大点が一意になりえない。

要するに:
- **semistable = 尤度が無限に逃げない**(null cone 回避)
- **polystable = 最大が達成される**(閉軌道)
- **stable = 最大が一意**(有限 stabilizer)

「群作用の退化具合」と「最適化の質」がそのまま辞書を作っている。

## 5. なぜ Kronecker quiver が現れるのか

ここで quiver が登場する。

Matrix normal model のデータ
$$Y = (Y_1, \ldots, Y_m) \in \mathrm{Mat}_{p,q}^m$$
を眺めると、各 $Y_i$ は線形写像
$$Y_i : K^q \;\longrightarrow\; K^p$$
として見られる。$m$ 個並んでいるので、これは

> 「左に頂点が 1 つ、右に頂点が 1 つ、その間に $m$ 本の矢が走っている」

という **quiver の表現**そのものだ。この quiver を **$m$-Kronecker quiver**(Kronecker $m$-quiver)と呼ぶ。

$$\bullet_{K^q} \xrightarrow[\;\,\cdots\;\,]{Y_1, Y_2, \ldots, Y_m} \bullet_{K^p}$$

各頂点での基底変換は $GL_q$ と $GL_p$ それぞれの作用で、quiver 表現の同型は
$$(g_1, g_2) \cdot (Y_1, \ldots, Y_m) = (g_1 Y_1 g_2^{-1}, \ldots, g_1 Y_m g_2^{-1})$$
で与えられる(matrix normal の作用の真ん中は $g_2^{-1}$ か $g_2^*$ かで convention 差はあるが、Hilbert 空間/正定値性のいい話のためにはほぼ同等)。

そして、GIT 安定性の判定では行列式スケールの自由度は捨てるべきなので、$G_{SL} = SL_p \times SL_q$ の作用を見る。

これでお膳立てができた:**matrix normal model の MLE 問題は、$m$-Kronecker quiver の表現の $SL_p \times SL_q$ 作用に関する安定性問題に翻訳される**。Theorem 2.5 はそのまま使える。

Kac、King、Schofield ら quiver の表現論の人々が長年作ってきた**安定性の組合せ的判定法**(canonical decomposition、dimension vector の条件、Schur root 構造、etc.)を、そのまま統計に持ち込める ── これが Derksen–Makam の鍵。

## 6. matrix normal model における generic な閾値条件

論文の **Theorem 1.2** は、matrix normal model $\mathcal{M}_K(p,q)$ で $m$ サンプル取ったとき、**generic に**(つまり測度 1 で)何が起きるかを完全に分類している。$d := \gcd(p,q)$ と置く。

私の理解(原論文を確認した範囲)では、おおむね次のとおり:

- **$p^2 + q^2 - mpq < 0$ のとき**:generic な $Y$ に対し、**unique MLE がほとんど確実に存在する**。
- **$p^2 + q^2 - mpq = 0$ または $p^2 + q^2 - mpq = d^2$ のとき**:**MLE はほとんど確実に存在する**が、**$d = 1$ のときだけ一意**。
- **それ以外(主に $p^2 + q^2 - mpq$ がより正に大きい場合)**:**log-likelihood は有界でなく、MLE は存在しない**。

ここに**$d = \gcd(p,q)$ が顔を出す**のがエレガントで、$p$ と $q$ の数論的関係が「MLE が一意になるか退化対称性が残るか」を分けている。条件式 $p^2 + q^2 - mpq$ は、quiver 表現の安定性条件における dimension vector $(p, q)$ と矢の本数 $m$ の組合せ的な式そのものだ(Schofield の安定性条件に対応する量)。

ここは数式や不等号を間違えやすいので、本記事の表現が引っかかった読者は Derksen–Makam 原文の Theorem 1.2 を直接確認してほしい(arXiv:2007.10206)。

## 7. 「尤度最大化」が「軌道閉包の問題」になる面白さ

整理すると、二つの世界の辞書はこうだ:

| 統計側の問い | 不変式論・GIT 側の問い |
|---|---|
| 尤度は上に有界か | データの軌道閉包は 0 を含まないか(null cone を外れるか) |
| MLE は存在するか | 軌道は閉じているか(polystable か) |
| MLE は一意か | stabilizer は本質的に有限か(stable か) |
| データに退化方向はあるか | Hilbert–Mumford 判定の 1 パラメータ部分群が存在するか |

最尤推定 ── 統計の中ではおそらく最も古典的で、誰でも一度は数値最適化のために Newton 法を書く対象 ── が、こんなにきれいに群作用の幾何の問題になる。

しかも matrix normal model ではそれが $m$-Kronecker quiver の表現論の問題になり、Kac–King–Schofield が用意した組合せ的安定性条件で、generic なケースは完全に分類できてしまう。**統計のサンプルサイズ条件が、quiver の dimension vector と矢の本数の組合せ的不等式に翻訳される**のだ。

これは私にとって、応用統計や情報幾何の伝統的なノリ(凸解析、KL 距離、natural gradient)と、表現論・代数幾何の世界が予想以上に近いところで握手している瞬間に見える。

## 8. まとめ ── 統計・不変式論・quiver representation が交差する場所

この話の面白さは、**最尤推定量という一見すると応用統計・数値最適化寄りの対象が、実は群作用、不変式論、GIT 安定性、quiver representation の言葉で非常に構造的に理解できる**点にある。

Kronecker 共分散モデルの MLE 問題は、単にパラメータ推定の問題ではなく、

- データの軌道がどのように退化するか(null cone への近づき方)
- どの対称性が残っているか(stabilizer)
- そもそも閉軌道に乗れるか(polystable か)

を見る**幾何学的問題**でもある。ここに、代数統計・情報幾何・表現論の接点が見えてくる。

私自身、当面この方向に研究を振るつもりはないが、**「統計と GIT 安定性が、サンプルサイズという素朴な量を介して握手している」**という事実は、長く頭の隅に置いておきたい。世界がどこで意外な仕方で繋がるかを知っておくのは、それ自体が研究者にとっての資産になる。

### 参照

- H. Derksen, V. Makam, *Maximum Likelihood Estimation for Matrix Normal Models via Quiver Representations*, arXiv:2007.10206 (2020).
- A. King, *Moduli of representations of finite-dimensional algebras*, Quart. J. Math. (1994).
- A. Schofield, *Semi-invariants of quivers*, J. London Math. Soc. (1991).
