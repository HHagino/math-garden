# 球座標のラプラシアンはどこから来るのか ── リーマン計量から導く

## タイトル案

1. 球座標のラプラシアンはどこから来るのか ── リーマン計量から導く
2. $\sqrt{|g|}$ がすべてを補正する ── ラプラス＝ベルトラミ作用素入門
3. 丸暗記ではなく幾何で導く球座標ラプラシアン
4. 板書の「極座標」は実は球座標だった ── リーマン計量で読み直す
5. $r^2 \sin\theta$ はどこから来るのか ── 計量・体積・ラプラシアンの三位一体

---

## 冒頭 ── 「極座標」と書かれた板書を読み直す

ホワイトボードに、こう書かれている。

$$\Delta f = \frac{1}{\sqrt{|g|}}\,\partial_i\!\left(\sqrt{|g|}\,g^{ij}\,\partial_j f\right)$$

$$ds^2 = g_{ij}\,dx^i\,dx^j$$

そして「極座標」と書かれた下に、対角行列
$$\mathrm{diag}\!\left(1,\,\frac{1}{r^2},\,\frac{1}{r^2\sin^2\theta}\right)$$

最後に、右下にきれいにまとまった式:
$$\Delta = \frac{1}{r^2\sin\theta}\frac{\partial}{\partial r}\!\left(r^2\sin\theta\,\frac{\partial}{\partial r}\right) + \frac{1}{r^2\sin\theta}\frac{\partial}{\partial \theta}\!\left(\sin\theta\,\frac{\partial}{\partial \theta}\right) + \frac{1}{r^2\sin^2\theta}\,\frac{\partial^2}{\partial \varphi^2}.$$

まず気になることがある。板書では「極座標」と書かれているが、**変数は $(r,\theta,\varphi)$ の 3 つ**で、しかも $\sin\theta$ が現れている。これは厳密には 2 次元の極座標ではなく、**3 次元の球座標**だ。日常的な口語では「極座標」と「球座標」を混用しがちだが、この記事では区別して扱う。

この記事の目的は、上の式が**リーマン計量から自然に導かれる**ことを最後まで追うことだ。丸暗記ではなく、幾何で導く。

## 第1節 ── リーマン計量とは

ユークリッド空間の長さは、直交座標では単に
$$ds^2 = dx^2 + dy^2 + dz^2$$
だ。ところが座標を曲線座標に変えると、この式は単純な平方和でなくなる。一般に
$$ds^2 = g_{ij}\,dx^i\,dx^j$$
と書かれ、$g_{ij}$ が**計量テンソル(リーマン計量)**である。

これは抽象的に言うと「各点で接ベクトルの内積を与える対称双線形形式」だが、初歩的には次のように受け止めれば十分:

> **$g_{ij}$ は、座標 $x^i$ を $dx^i$ だけ動かしたときに、実際の長さがどう変わるかを記録する行列。**

直交座標では $g_{ij} = \delta_{ij}$ で何もしないが、曲線座標では座標方向ごとに長さのスケールが違ってくるので、$g_{ij}$ は単位行列でなくなる。

## 第2節 ── 球座標の計量

3 次元ユークリッド空間を球座標
$$x = r\sin\theta\cos\varphi,\quad y = r\sin\theta\sin\varphi,\quad z = r\cos\theta$$
で表す。微小変位を計算すると(連鎖律と三角公式を素直に展開すれば)、
$$ds^2 = dr^2 + r^2\,d\theta^2 + r^2\sin^2\theta\,d\varphi^2.$$

直交座標と違うのは、$d\theta$ と $d\varphi$ の前に**長さスケール**が掛かっていることだ:
- $d\theta$ の前には $r^2$($\theta$ を少し動かすと、半径 $r$ の球面上で長さ $r\,d\theta$ ぶん動く)
- $d\varphi$ の前には $r^2\sin^2\theta$($\varphi$ を動かすと、緯度 $\theta$ における半径 $r\sin\theta$ の円上で長さ $r\sin\theta\,d\varphi$ ぶん動く)

これは球面の幾何そのものだ。

したがって計量テンソルは
$$g_{ij} \;=\; \mathrm{diag}\!\left(1,\;r^2,\;r^2\sin^2\theta\right),$$
逆計量(逆行列)は
$$g^{ij} \;=\; \mathrm{diag}\!\left(1,\;\frac{1}{r^2},\;\frac{1}{r^2\sin^2\theta}\right).$$

## 第3節 ── 板書の対角行列は逆計量 $g^{ij}$ だった

ここで、最初に板書を読み直そう。板書には
$$\mathrm{diag}\!\left(1,\;\frac{1}{r^2},\;\frac{1}{r^2\sin^2\theta}\right)$$
が書かれていた。

これは計量 $g_{ij}$ そのものではなく、**逆計量 $g^{ij}$** である。ラプラス＝ベルトラミ作用素の公式
$$\Delta f = \frac{1}{\sqrt{|g|}}\,\partial_i\!\left(\sqrt{|g|}\,g^{ij}\,\partial_j f\right)$$
の中に出てくるのは $g^{ij}$ のほうだから、板書では計算で実際に使う形(逆計量)が直接書かれていたわけだ。

初学者がここで混乱しやすいのは、「$g_{ij}$ と $g^{ij}$、添字の上下だけの違いなのに、行列としては逆」という対応に慣れていないからだ。実際、対角行列の場合は
$$g_{ii} = r^2 \quad\Longleftrightarrow\quad g^{ii} = \frac{1}{r^2}$$
のように、対応する成分の**逆数**になる。

## 第4節 ── 計量の行列式と $\sqrt{|g|} = r^2\sin\theta$

ラプラシアンの公式には、$g^{ij}$ のほかに $\sqrt{|g|}$ も顔を出す。$|g|$ は計量の行列式:
$$|g| = \det(g_{ij}) = 1\cdot r^2 \cdot r^2\sin^2\theta = r^4\sin^2\theta.$$

したがって
$$\sqrt{|g|} = r^2\sin\theta.$$

ここで一拍置く。**$r^2\sin\theta$ は、球座標で体積要素を書いたときに出てくる、あのヤコビアン**である:
$$dV = r^2\sin\theta\,dr\,d\theta\,d\varphi.$$

これは偶然ではない。$\sqrt{|g|}$ は座標が局所的に作る平行六面体の体積を測る量で、座標変換のヤコビアンと一致する。

なぜラプラシアンの公式に $\sqrt{|g|}$ が出てくるのか ── これは**曲がった座標における体積の歪みを正しく補正するため**だ。直交座標なら $\sqrt{|g|} = 1$ で何もしないが、球座標では原点付近で体積が小さく、遠方で大きく見える。発散の計算(divergence)はこの体積効果を考慮しないと正しい量にならない:
$$\nabla \cdot \mathbf{F} = \frac{1}{\sqrt{|g|}}\,\partial_i\!\left(\sqrt{|g|}\,F^i\right).$$

ラプラシアンは「勾配の発散」$\Delta f = \nabla\cdot\nabla f$ なので、勾配 $g^{ij}\partial_j f$ に上の発散を掛ければ、ラプラス＝ベルトラミ作用素の公式
$$\Delta f = \frac{1}{\sqrt{|g|}}\,\partial_i\!\left(\sqrt{|g|}\,g^{ij}\,\partial_j f\right)$$
が自然に出てくる。

## 第5節 ── 公式に代入する

球座標の $\sqrt{|g|} = r^2\sin\theta$ と $g^{ij}$ を上の公式に代入する。和は $i,j = r,\theta,\varphi$ に渡るが、$g^{ij}$ が対角なので、各方向独立に処理できる。

### $r$ 方向

$g^{rr} = 1$ なので、
$$\frac{1}{r^2\sin\theta}\,\frac{\partial}{\partial r}\!\left(r^2\sin\theta \cdot 1 \cdot \frac{\partial f}{\partial r}\right) = \frac{1}{r^2\sin\theta}\,\frac{\partial}{\partial r}\!\left(r^2\sin\theta\,\frac{\partial f}{\partial r}\right).$$

$\sin\theta$ は $r$ に依存しないので、$\partial_r$ の外に括り出せて、
$$= \frac{1}{r^2}\,\frac{\partial}{\partial r}\!\left(r^2\,\frac{\partial f}{\partial r}\right).$$

### $\theta$ 方向

$g^{\theta\theta} = 1/r^2$ なので、
$$\frac{1}{r^2\sin\theta}\,\frac{\partial}{\partial \theta}\!\left(r^2\sin\theta \cdot \frac{1}{r^2} \cdot \frac{\partial f}{\partial \theta}\right) = \frac{1}{r^2\sin\theta}\,\frac{\partial}{\partial \theta}\!\left(\sin\theta\,\frac{\partial f}{\partial \theta}\right).$$

$r^2$ がうまくキャンセルして、$\theta$ 方向の作用素から消える。

### $\varphi$ 方向

$g^{\varphi\varphi} = 1/(r^2\sin^2\theta)$ なので、
$$\frac{1}{r^2\sin\theta}\,\frac{\partial}{\partial \varphi}\!\left(r^2\sin\theta \cdot \frac{1}{r^2\sin^2\theta} \cdot \frac{\partial f}{\partial \varphi}\right) = \frac{1}{r^2\sin\theta}\,\frac{\partial}{\partial \varphi}\!\left(\frac{1}{\sin\theta}\,\frac{\partial f}{\partial \varphi}\right).$$

$r$ と $\theta$ は $\varphi$ に依存しないので、$\partial_\varphi$ の外に出せて、
$$= \frac{1}{r^2\sin\theta}\cdot\frac{1}{\sin\theta}\,\frac{\partial^2 f}{\partial \varphi^2} = \frac{1}{r^2\sin^2\theta}\,\frac{\partial^2 f}{\partial \varphi^2}.$$

### 合計

三つを足すと、
$$\boxed{\;\Delta f = \frac{1}{r^2}\,\frac{\partial}{\partial r}\!\left(r^2\,\frac{\partial f}{\partial r}\right) + \frac{1}{r^2\sin\theta}\,\frac{\partial}{\partial \theta}\!\left(\sin\theta\,\frac{\partial f}{\partial \theta}\right) + \frac{1}{r^2\sin^2\theta}\,\frac{\partial^2 f}{\partial \varphi^2}.\;}$$

これが球座標のラプラシアン。物理の本でよく見る形そのものだ。

板書の式 ── $\sin\theta$ を $\partial_r$ の中に残したまま書いたもの ── は数学的にこれと同値で、スカラー関数 $f$ に作用させる微分作用素として両者は同じ働きをする。違いは表記の好みだけだ。

## 第6節 ── 2 次元極座標との対比

念のため、本物の 2 次元極座標を確認しておく。$x = r\cos\theta$, $y = r\sin\theta$ で
$$ds^2 = dr^2 + r^2\,d\theta^2.$$

計量と逆計量、行列式は
$$g_{ij} = \mathrm{diag}(1, r^2),\qquad g^{ij} = \mathrm{diag}\!\left(1, \tfrac{1}{r^2}\right),\qquad \sqrt{|g|} = r.$$

ラプラス＝ベルトラミに代入すると、
$$\Delta f = \frac{1}{r}\,\frac{\partial}{\partial r}\!\left(r\,\frac{\partial f}{\partial r}\right) + \frac{1}{r^2}\,\frac{\partial^2 f}{\partial \theta^2}.$$

3 次元球座標と比べると:
- 体積要素の補正は $r$(2D)vs $r^2\sin\theta$(3D)
- 角度方向の項の係数は $1/r^2$ vs $1/r^2$ と $1/(r^2\sin^2\theta)$
- 軌道方向の数:$r,\theta$ の 2 つ vs $r,\theta,\varphi$ の 3 つ

板書には「極座標」とあったが、$\sin\theta$ が出てきて変数が 3 つあるので、**書かれているのは 3 次元球座標のラプラシアン**だ ── というのが第一の読み取りポイントだった。

## 結論

最後に、今回の板書の本当のポイントを一行で書く。

> **球座標ラプラシアンとは、ユークリッド空間のラプラシアンを、球座標という曲線座標の計量に合わせて書き直したラプラス＝ベルトラミ作用素である。**

組み立て直すと:

- ラプラシアンは直交座標では単に $\partial_x^2 + \partial_y^2 + \partial_z^2$ と書ける。
- 曲線座標では、座標ごとの長さのスケールや体積要素が違う。
- その補正をリーマン計量 $g_{ij}$、その逆 $g^{ij}$、そして $\sqrt{|g|}$ が担う。
- ラプラス＝ベルトラミの公式
  $$\Delta f = \frac{1}{\sqrt{|g|}}\,\partial_i\!\left(\sqrt{|g|}\,g^{ij}\,\partial_j f\right)$$
  に球座標の計量を代入すれば、有名な球座標ラプラシアンが自然に出てくる。

板書の本当の面白さは、「座標変換の公式を丸暗記する」ことではなく、「**リーマン計量から微分作用素を組み立てる**」幾何学的な導出になっている点にある。同じ作業を別の座標(円筒座標、楕円座標、トーラス座標、…)に対しても繰り返せるし、もっと一般の Riemann 多様体に対してもそのまま動く ── これが、ラプラス＝ベルトラミ作用素という抽象が用意してくれている自由度だ。

「$r^2\sin\theta$」の出どころが、計量の行列式の平方根 = ヤコビアン = 体積要素、という三位一体だったと知るだけで、球座標ラプラシアンの見え方はかなり変わる。今日の板書は、その視点を一枚で見せていた。
