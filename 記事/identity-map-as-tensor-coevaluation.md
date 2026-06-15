# 恒等写像 id_V はテンソルとして何者か：V⊗V* の標準元と coevaluation

## 1. 問い：id_V に対応するテンソルに名前はあるのか

きっかけは、こんな素朴な質問だった。

> 有限次元ベクトル空間 $V$ があったとき、標準的な同型 $V\otimes V^*\cong L(V)$ によって恒等写像 $\mathrm{id}_V$ に対応する $V\otimes V^*$ の元って、名前ある？

ある。しかも一つではない。文脈に応じて「恒等テンソル」「標準元」「余評価元」などと呼ばれる。そして、その複数の名前を一つずつたどっていくと、線形代数のいちばん地味に見える等式が、いつのまにか圏論的双対性の入口に立っている ―― そういう小さな旅になる。本稿はその旅の記録である。

対象読者は、線形代数をひととおり終えた数学科の学部上級〜大学院初年級くらいを想定している。具体式から入って、圏論的な見方へ自然に持ち上げていきたい。

## 2. $V\otimes V^*\cong\operatorname{End}(V)$ の具体形

$V$ を体 $k$ 上の有限次元ベクトル空間、$V^*=\operatorname{Hom}(V,k)$ をその双対空間とする。このとき標準的な同型

$$V\otimes V^* \;\cong\; \operatorname{End}(V)$$

がある。ここで $\operatorname{End}(V)=L(V)$ は $V$ から $V$ への線形写像全体。「標準的」というのは、基底の選び方によらず定まる、という意味だ。同型の具体形は次で与えられる：

$$v\otimes\varphi \;\longmapsto\; \big(x\mapsto \varphi(x)\,v\big).$$

つまり、単純テンソル $v\otimes\varphi$ には、「$x$ を受け取って、スカラー $\varphi(x)$ を $v$ に掛けて返す」という階数 1 の線形写像を対応させる。一般の元は単純テンソルの和なので、線形に拡張すればよい。

これが同型になるのは、有限次元だからである。階数 1 の写像 $x\mapsto\varphi(x)v$ たちは $\operatorname{End}(V)$ を張り、次元はどちらも $(\dim V)^2$。単射性も次元勘定から従う。無限次元では $V\otimes V^*$ は「有限階数の作用素」しか捉えられず、この同型は崩れる ―― 有限次元という仮定が、地味だが効いている。

## 3. id_V に対応する $\sum_i e_i\otimes e^i$

では、この同型のもとで恒等写像 $\mathrm{id}_V$ に対応する $V\otimes V^*$ の元は何か。

基底 $(e_1,\dots,e_n)$ を一つ取り、その双対基底を $(e^1,\dots,e^n)$ とする。双対基底とは $e^i(e_j)=\delta^i_j$ を満たすもので、要するに「$j$ 番目の成分を読み取る関数」だ。このとき、候補は

$$\theta_V \;=\; \sum_{i=1}^{n} e_i\otimes e^i$$

である。実際に同型で送ってみよう。$\theta_V$ が表す写像は

$$x \;\longmapsto\; \sum_i e^i(x)\,e_i.$$

ところが $\sum_i e^i(x)\,e_i$ は、$x$ をその成分で展開し直したものにほかならない ―― すなわち $x$ そのものだ。したがって $\theta_V$ の表す写像は $x\mapsto x$、つまり $\mathrm{id}_V$ である。

結論：**標準同型 $V\otimes V^*\cong\operatorname{End}(V)$ のもとで $\mathrm{id}_V$ に対応するテンソルは $\sum_i e_i\otimes e^i$ である。**

## 4. 基底で書けるが、基底には依存しない

ここで一度立ち止まりたい。$\sum_i e_i\otimes e^i$ という式には、基底 $(e_i)$ が露骨に書かれている。基底を取り替えたら、別の元になってしまうのではないか。

ならない。これがこの元のいちばん大事な性質だ。

理由は二通りある。一つは「定義から」。$\theta_V$ は同型 $V\otimes V^*\cong\operatorname{End}(V)$ のもとで $\mathrm{id}_V$ に対応する元として特徴づけられる。$\mathrm{id}_V$ は基底と無関係に存在し、同型も基底と無関係。だから、その引き戻し $\theta_V$ も基底に依存しない。式の見かけに基底が現れているだけで、元そのものは標準的なのだ。

もう一つは「直接計算で」。別の基底 $(f_j)$、双対基底 $(f^j)$ を取り、$f_j=\sum_i A_{ij}e_i$ と変換すれば、双対基底は逆転置行列で変換し、

$$\sum_j f_j\otimes f^j \;=\; \sum_j\Big(\sum_i A_{ij}e_i\Big)\otimes\Big(\sum_k (A^{-1})_{jk}\,e^k\Big) \;=\; \sum_{i,k}\Big(\sum_j A_{ij}(A^{-1})_{jk}\Big)e_i\otimes e^k \;=\; \sum_{i} e_i\otimes e^i.$$

行列とその逆行列が打ち消し合い、ちゃんと元の式に戻る。

つまり $\sum_i e_i\otimes e^i$ は、**「基底依存の記法で書かれた、基底非依存の対象」**である。線形代数には、基底で書くしかないのに実体は標準的、という対象がときどき現れる ―― トレースがその代表だが、この $\theta_V$ もまさにその一族である。むしろ $\theta_V$ は、その種の対象の「原型」と言ってよい。

## 5. 呼び名：恒等テンソル、標準元、coevaluation element

実体が一つに定まったので、名前を整理しよう。文脈に応じて、次のように呼ばれる。

- **identity tensor / 恒等テンソル** ―― $\mathrm{id}_V$ に対応する、という由来をそのまま名にしたもの。
- **canonical element / canonical tensor / 標準元・標準テンソル** ―― 基底に依存しない標準的な元である、という性質を名にしたもの。
- **coevaluation element / 余評価元** ―― 圏論・テンソル圏の文脈での名前（次節）。
- **Kronecker delta tensor / クロネッカーのデルタテンソル** ―― 成分表示に由来する名前（第 7 節）。

どれが「正しい」ということはなく、どれが自然かは文脈で決まる。線形代数寄りの話、たとえば「$\operatorname{End}(V)$ と $V\otimes V^*$ の同一視」を語る場面では、**恒等テンソル**あるいは **canonical element** と呼ぶのがいちばん素直だ。「$\mathrm{id}_V$ に対応する元」という出自と、「基底によらない標準元」という性質を、それぞれ過不足なく言い当てているからである。

## 6. 圏論的には coev_V : k → V⊗V*

ところが、視点を一段上げると、この元には「もっと構造的な居場所」がある。

テンソル圏や双対性の文脈では、$\theta_V$ は元というより**射**として現れる。基礎体 $k$ を単位対象と見て、線形写像

$$\operatorname{coev}_V\colon k \longrightarrow V\otimes V^*, \qquad 1 \longmapsto \sum_i e_i\otimes e^i$$

を考える。スカラー $1$ を $\theta_V$ に送る写像だ。$k\to V\otimes V^*$ の線形写像は、行き先の元一つで決まるので、「元 $\theta_V$」と「射 $\operatorname{coev}_V$」は同じ情報を持つ。だが射として書くと、対になる相方が見えてくる。相方は **evaluation（評価）**

$$\operatorname{ev}_V\colon V^*\otimes V \longrightarrow k, \qquad \varphi\otimes v \longmapsto \varphi(v)$$

である。$\operatorname{coev}_V$ は「無からペア $\sum e_i\otimes e^i$ を生み出す」射、$\operatorname{ev}_V$ は「ペアを潰してスカラーにする」射。この二つは、いわゆる **cup/cap 図式**の cup（下に開いた弧）と cap（上に開いた弧）に対応する ―― $\operatorname{coev}_V$ が cup、$\operatorname{ev}_V$ が cap だ。

そして両者は、次の **zigzag 恒等式（三角恒等式）**で結ばれている：

$$(\mathrm{id}_V\otimes\operatorname{ev}_V)\circ(\operatorname{coev}_V\otimes\mathrm{id}_V) \;=\; \mathrm{id}_V.$$

左辺を $v\in V$ で追うと、$v\mapsto\big(\sum_i e_i\otimes e^i\big)\otimes v\mapsto\sum_i e_i\,e^i(v)=v$ ―― たしかに $\mathrm{id}_V$ に戻る。図式で言えば「弧をまっすぐに伸ばす」操作だ。$V^*$ 側にも同様の恒等式がある。

この観点では、$\theta_V$ は「$V$ が双対 $V^*$ を持つこと（dualizable であること）を保証する構造データの片割れ」になる。線形代数で見れば $\mathrm{id}_V$ に対応する地味な元が、圏論で見ると**双対性そのものを定義する射**に格上げされる。このとき自然な名前は **coevaluation element / 余評価元**である。

「ああ、あの $\mathrm{id}_V$ は、テンソルとして見ると coev だったのか」―― この記事で腑に落ちてほしいのは、この一点に尽きる。

## 7. δ^i_j としての見方

成分でも見ておこう。$\theta_V=\sum_i e_i\otimes e^i$ を一般のテンソルとして添字で書くと、その成分は

$$\theta^i{}_j \;=\; \delta^i_j$$

―― クロネッカーのデルタである。$(1,1)$ 型テンソルとしての $\theta_V$ は、成分がちょうど $\delta^i_j$ になる。これは第 4 節の「基底非依存」の成分版だ。$\delta^i_j$ は基底変換で $\sum A^i{}_k\,\delta^k_l\,(A^{-1})^l{}_j=\delta^i_j$ と、自分自身に戻る。だからこの元を **Kronecker delta tensor / クロネッカーのデルタテンソル**と呼ぶこともできる。物理や微分幾何で添字計算をする文脈では、この呼び名がいちばん通りがよい。

恒等テンソル、標準元、余評価元、デルタテンソル ―― 四つの名前は、同じ一つの元 $\theta_V$ を、それぞれ「出自」「性質」「圏論的役割」「成分」から照らしたものにすぎない。

## 8. Casimir element との違いに注意

最後に、混同しやすい一点を切り分けておく。

$V$ に内積、あるいはより一般に非退化双線形形式が入っていると、それを使って $V\cong V^*$ という同一視ができる。この同一視を $\theta_V$ に施すと、$V\otimes V^*$ の元だったものが、$V\otimes V$ の元

$$\sum_i e_i\otimes e_i$$

として書き直される（正確には基底と双対基底を計量で対応させたうえでの表示）。リー代数や表現論では、これに近い対象 ―― 不変双線形形式を使って構成される $V\otimes V$（あるいは普遍展開環）の元 ―― が **Casimir element / Casimir tensor** と呼ばれることがある。

ここで注意したいのは、**Casimir と呼ぶには余分な構造が要る**ということだ。Casimir 元の「Casimir らしさ」は、内積や Killing 形式といった不変形式、そしてそれが定める $V\cong V^*$ の同一視に依存している。今回の出発点の問いは、そうした構造を一切仮定せず、ただ

$$V\otimes V^*\cong\operatorname{End}(V)$$

のもとで $\mathrm{id}_V$ に対応する元を訊いていた。この段階ではまだ計量も不変形式もない。だから、いきなり Casimir と呼ぶのは文脈の先取りであり、ミスリーディングになりうる。

整理するとこうだ。

- 構造を足さない素の状態（$V\otimes V^*$ の元、$\mathrm{id}_V$ の対応物）―― **canonical element / coevaluation element / 恒等テンソル**と呼ぶ。
- 計量で $V\cong V^*$ と同一視し、$V\otimes V$ の元として読み替え、さらにリー代数の不変性まで使う ―― そこではじめて **Casimir** という名が妥当になる。

同じ「対角和的なテンソル」に見えても、背負っている構造が違う。名前は、その構造の差を黙って記録している。

## 9. 結論：線形代数に現れる最も基本的な canonical element

まとめよう。

標準同型 $V\otimes V^*\cong\operatorname{End}(V)$ のもとで恒等写像 $\mathrm{id}_V$ に対応するテンソルは、基底で書けば

$$\theta_V \;=\; \sum_i e_i\otimes e^i$$

であり、これは式の見かけに反して**基底に依存しない標準元**である。線形代数の文脈では恒等テンソル・標準テンソル（canonical element）、圏論・テンソル圏の文脈では余評価元 $\operatorname{coev}_V\colon k\to V\otimes V^*$ と呼ぶのが自然だ。成分で見れば $\delta^i_j$、すなわちクロネッカーのデルタテンソルでもある。計量による $V\cong V^*$ を経由して $V\otimes V$ の元と見たうえで不変性まで課せば Casimir の話になるが、それは別の文脈の名前である。

一行で言えば ―― $\theta_V$ は、**線形代数の中に現れる最も基本的な canonical element** である。恒等写像という、いちばん当たり前の対象をテンソルの言葉に翻訳しただけで、双対性・zigzag 恒等式・成分の不変性が一斉に顔を出す。当たり前のものほど、よく見ると構造の結び目になっている ―― $\mathrm{id}_V$ は、その小さくて見事な実例なのだ。
