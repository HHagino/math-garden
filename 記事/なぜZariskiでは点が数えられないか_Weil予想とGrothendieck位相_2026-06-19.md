---
title: "なぜ Zariski では点が数えられないのか ── Grothendieck 位相を要請した Weil 予想"
date: 2026-06-19
lang: ja
tags: [代数幾何, Zariski位相, Grothendieck位相, étale位相, étaleコホモロジー, Weil予想, Frobenius, Lefschetz跡公式, ゼータ関数, Deligne, l進コホモロジー, 数論]
status: done
level: 数学解説(代数幾何・数論に関心がある読者。コホモロジーと有限体の語に触れていれば十分)
---

# なぜ Zariski では点が数えられないのか ── Grothendieck 位相を要請した Weil 予想

> 無所属の独立研究者による解説ノート。庭の隣家 [点ではなく、開集合の代数で登る ── Zariski→étale](<開集合の代数で登る_Rdiscと Zariski étale_2026-06-02.md>) は、なぜ étale が**自然な一般化か**(locale/topos の母言語)を扱った。本稿はその**裏面** ── なぜ étale が**歴史的に要請されたか**(具体的な計算上の必要)を扱う。事実は末尾で一次照合する。

## 1. 「荒い」を愚痴で終わらせない

Zariski 位相は荒い。閉集合を多項式の零点として定めるので、開集合は零点の補集合 ── どれも馬鹿でかい。既約多様体では空でない開集合は二つとも必ず交わり、Hausdorff ですらない。「開集合が少なすぎて不便」とよく言われる。

だが「荒い・不便」で止めると、肝心の問いを逃す。**誰が、何の計算で、その荒さに本当に困ったのか。** 答えははっきりしている。**有限体上で方程式の解の個数を数えようとした人**だ。点を数えるという、これ以上ないほど具体的な計算が、Zariski 位相には供給できない道具を要求した。その要求から Grothendieck 位相(étale 位相)が生まれた。本稿はこの「要求」を手で触る。

---

## 2. まず手で：$\mathbb P^1$ の点の数が要求するもの

有限体 $\mathbb F_q$ 上の射影直線の点の数は、数えるまでもない:

$$\#\mathbb P^1(\mathbb F_{q^n})=q^n+1$$

($\mathbb F_{q^n}$ の元が $q^n$ 個、それに無限遠点を一つ足す)。問題はこの $q^n+1$ を、**コホモロジーから出せるか**である。

Weil の見立て(§4)では、点の数は **Lefschetz 跡公式**で書けるはずだった ── 位相空間の不動点を跡で数える、あの公式の代数版だ。$\mathbb F_{q^n}$ 値の点とは、$\mathbb F_q$ 上の幾何を $\overline{\mathbb F_q}$ へ広げたときの **Frobenius $\mathrm{Frob}_q$**($x\mapsto x^q$)の $n$ 乗の不動点にほかならない。だから

$$\#X(\mathbb F_{q^n})=\sum_i (-1)^i \operatorname{Tr}\!\big(\mathrm{Frob}_q^{\,n}\,\big|\,H^i(X)\big)$$

が成り立つコホモロジー $H^i$ が欲しい。$\mathbb P^1$ に当てはめてみる。古典的(複素)トポロジーの $\mathbb{CP}^1=S^2$ の Betti 数を真似るなら、$H^0$ と $H^2$ が一次元、$H^1=0$。Frobenius は $H^0$ に自明(固有値 $1$)、$H^2$ に「面積を $q$ 倍する」ように(固有値 $q$)作用してほしい。すると

$$\operatorname{Tr}(\mathrm{Frob}^n\mid H^0)+\operatorname{Tr}(\mathrm{Frob}^n\mid H^2)=1^n+q^n=1+q^n.\ \checkmark$$

ぴたりと合う。点の数の $q^n$ という主要項は、**$H^2$ が非自明で、Frobenius がそこに固有値 $q$ で効いている**ことから出ている。

ところが ── **Zariski コホモロジーは $H^2=0$ を返す。** 既約多様体上では定数層は flasque(脆弱)で、定数係数の高次コホモロジーは消える(§3)。Zariski が供給するのは $H^0$ だけ。すると跡公式は

$$\operatorname{Tr}(\mathrm{Frob}^n\mid H^0_{\mathrm{Zar}})=1$$

しか出せず、「$\mathbb P^1$ の点は $1$ 個」と答える。$q^n$ が丸ごと消えた。**Zariski では点が数えられない。**

<svg viewBox="0 0 720 250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="P¹の点の数の内訳：H⁰が1、H²がqⁿ。Zariskiはコ²を消すのでqⁿが欠落">
<rect x="0" y="0" width="720" height="250" fill="#fbfaf7"/>
<text x="20" y="28" font-family="Georgia, serif" font-size="15" fill="#2b2b2b">#P¹(F_{qⁿ}) = qⁿ + 1 の内訳（跡公式の帳簿）</text>
<!-- columns header -->
<text x="60" y="66" font-family="Georgia, serif" font-size="13" fill="#7a6a4f">コホモロジー</text>
<text x="270" y="66" font-family="Georgia, serif" font-size="13" fill="#7a6a4f">Frob の寄与</text>
<text x="470" y="66" font-family="Georgia, serif" font-size="13" fill="#2f6258">étale で</text>
<text x="590" y="66" font-family="Georgia, serif" font-size="13" fill="#a23b2e">Zariski で</text>
<line x1="40" y1="74" x2="690" y2="74" stroke="#9a8b6f" stroke-width="1"/>
<g font-family="Georgia, serif" font-size="13" fill="#2b2b2b">
<text x="60" y="104">H⁰</text><text x="270" y="104">+1ⁿ = 1</text><text x="470" y="104" fill="#2f6258">1 ✓</text><text x="590" y="104" fill="#2f6258">1 ✓</text>
<text x="60" y="138">H¹</text><text x="270" y="138">0</text><text x="470" y="138" fill="#2f6258">0</text><text x="590" y="138" fill="#7a6a4f">0</text>
<text x="60" y="172">H²</text><text x="270" y="172">+qⁿ</text><text x="470" y="172" fill="#2f6258">qⁿ ✓</text><text x="590" y="172" fill="#a23b2e">0 ✗（消える）</text>
</g>
<line x1="40" y1="186" x2="690" y2="186" stroke="#9a8b6f" stroke-width="1"/>
<g font-family="Georgia, serif" font-size="13">
<text x="60" y="210" fill="#2b2b2b">合計</text><text x="270" y="210" fill="#2b2b2b">1 + qⁿ</text><text x="470" y="210" fill="#2f6258">1+qⁿ ✓ 正しい</text><text x="590" y="210" fill="#a23b2e">1 だけ ✗</text>
</g>
<text x="20" y="240" font-family="Georgia, serif" font-size="11.5" fill="#7a6a4f">(概念図) 点の数の主要項 qⁿ は H² から来る。Zariski は H²=0 を返すのでこの項を供給できない。</text>
</svg>

---

## 3. なぜ Zariski は構造的に荒いのか

$H^2=0$ は偶然ではなく、Zariski の定め方から必然的に出る。三点に分解できる。

**閉集合 = 零点。** 閉集合を多項式 $f_1=\dots=f_r=0$ の共通零点として定める。零点は「少ない」ので閉集合は小さく、その補集合の開集合は大きい。曲線(一次元)では、空でない Zariski 開集合は有限個の点を除いた**補有限集合**になる。開集合の在庫がこれだけ乏しい。

**既約性と生成点。** 既約多様体では、空でない開集合はどれも稠密で、二つあれば必ず交わる。スキームの言葉では、既約成分ごとに**生成点**(その閉包が成分全体になる点)が一つあり、開集合はみなこの生成点を含む。位相が「ほとんど一点に潰れている」ような粗さだ。

**定数層が flasque になる。** その帰結として、定数係数の層 $\underline{A}$ の制限写像 $\underline{A}(U)\to\underline{A}(V)$($V\subset U$ 空でない開)がすべて同型 $A\to A$ になる。引き伸ばしの自由がまるでない層を **flasque(脆弱)** と呼び、flasque 層の高次コホモロジーは消える。ゆえに既約多様体で

$$H^i_{\mathrm{Zar}}(X,\underline{A})=0\quad(i>0).$$

$\mathbb P^1$ で $H^2=0$ だったのはこれだ。Zariski 位相は、定数係数で見るかぎり「穴が無い」と答える ── 複素トポロジーで $S^2$ に立派な $H^2$ があるのに。**位相が荒いと、空間が本来持つ穴(コホモロジー)が見えなくなる。**

---

## 4. Weil の夢：点の数を、位相とゼータで説明する

なぜそんなにコホモロジーが欲しかったのか。Weil(1949)の予想に発する ★。$X/\mathbb F_q$ の点の数の母関数(合同ゼータ関数)

$$Z(X,t)=\exp\!\Big(\sum_{n\ge1}\#X(\mathbb F_{q^n})\,\frac{t^n}{n}\Big)$$

について、Weil は次を予想した:**有理関数**であること、**関数等式**を満たすこと、零点・極の絶対値を定める **Riemann 予想の類似**、そして因子の次数が複素多様体の **Betti 数**に一致すること。

これらは、もし跡公式の効くコホモロジーがあれば一気に説明される。実際、跡公式から

$$Z(X,t)=\prod_i \det\!\big(1-\mathrm{Frob}_q\, t\,\big|\,H^i(X)\big)^{(-1)^{i+1}}$$

と因子分解でき、有理性はこの右辺が多項式の比であることそのもの、Betti 数は各 $H^i$ の次元、Riemann 予想は Frobenius 固有値の絶対値 $|{\alpha}|=q^{i/2}$ の主張になる。$\mathbb P^1$ なら $Z=\dfrac{1}{(1-t)(1-qt)}$、分母の二因子が $H^0,H^2$ に対応する。

要するに Weil は、**複素代数多様体の特異コホモロジーに相当するものを、正標数で作れ**と要求していた。係数は有限(あるいは $\ell$ 進)で、Frobenius が作用し、Lefschetz 跡公式が回るもの。Zariski はその器になれなかった。**夢が先にあって、器が足りなかった。**

---

## 5. Grothendieck の処方：開集合を étale 被覆に取り替える

足りない解像度を、Grothendieck は **被覆の定義を取り替える**ことで補った(母言語としての筋道は隣家 [開集合の代数で登る](<開集合の代数で登る_Rdiscと Zariski étale_2026-06-02.md>) に譲る)。要点だけ言う。

Zariski の「開部分集合への制限」をやめ、**étale 射**(平坦かつ不分岐、解析的局所同相の代数版)の族を「被覆」とみなす。これが **Grothendieck 位相**で、その舞台が **étale site**。肝心なのは étale 被覆が **Zariski 局所では同相でない**ことだ ── まさに Zariski に欠けていた被覆を、外から足す。

この site 上の(ねじれ)係数 $\mathbb Z/\ell^n$ のコホモロジーが **étale コホモロジー**で、その逆極限から **$\ell$ 進コホモロジー** $H^i(X,\mathbb Q_\ell)$ が出る。Grothendieck と M. Artin が、まさに Weil 予想を攻めるために開発した ★。これが Weil の夢の器になった:

- **跡公式**が成り立ち、$\#X(\mathbb F_{q^n})=\sum(-1)^i\operatorname{Tr}(\mathrm{Frob}^n\mid H^i_{\text{ét}})$。$\mathbb P^1$ で $H^2_{\text{ét}}(\mathbb P^1_{\overline{\mathbb F_q}},\mathbb Q_\ell)$ は一次元で Frobenius 固有値 $q$ ── §2 の $q^n$ がここから出る。
- **Artin の比較定理**:$\mathbb C$ 上の多様体では、有限係数で $H^i_{\text{ét}}(X,\mathbb Z/m)\cong H^i_{\mathrm{sing}}(X(\mathbb C),\mathbb Z/m)$ ★。étale は確かに「正標数の特異コホモロジー」だった。Betti 数の一致もこれで説明される。

歴史の決着も書いておく。有理性だけは étale 以前に **Dwork(1960)が $p$ 進解析で**先に証明した ★。有理性・関数等式・Betti 数との関係は **Grothendieck(1965 頃)**が étale で確立 ★。最難関の Riemann 予想の類似は **Deligne(1974, Weil I)**が étale コホモロジーで証明した ★。点を数えるための位相、という当初の要求は、四半世紀かけて果たされた。

<svg viewBox="0 0 720 200" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="要求から道具へ：Weil1949からDeligne1974までの年表">
<rect x="0" y="0" width="720" height="200" fill="#fbfaf7"/>
<text x="20" y="28" font-family="Georgia, serif" font-size="15" fill="#2b2b2b">要求（Weil の夢）から道具（étale）へ</text>
<line x1="50" y1="110" x2="680" y2="110" stroke="#2b2b2b" stroke-width="1.3"/>
<g font-family="Georgia, serif" font-size="12">
<circle cx="90" cy="110" r="5" fill="#a23b2e"/><text x="62" y="135">1949</text><text x="56" y="90" fill="#a23b2e">Weil 予想</text><text x="50" y="76" font-size="10.5" fill="#7a6a4f">器が要る</text>
<circle cx="250" cy="110" r="5" fill="#7a6a4f"/><text x="225" y="135">1960</text><text x="205" y="90" fill="#7a6a4f">Dwork：有理性</text><text x="212" y="76" font-size="10.5" fill="#7a6a4f">(p 進・étale前)</text>
<circle cx="430" cy="110" r="5" fill="#2f6258"/><text x="405" y="135">~1965</text><text x="360" y="90" fill="#2f6258">Grothendieck–Artin：étale</text><text x="380" y="76" font-size="10.5" fill="#7a6a4f">有理性・関数等式・Betti</text>
<circle cx="630" cy="110" r="5" fill="#2f6258"/><text x="605" y="135">1974</text><text x="560" y="90" fill="#2f6258">Deligne：RH 類似</text>
</g>
<text x="20" y="180" font-family="Georgia, serif" font-size="11.5" fill="#7a6a4f">(概念図) 「点を数えるコホモロジーが欲しい」という要求(1949)が、Zariski では満たせず、étale 位相という道具を産んだ。</text>
</svg>

---

## 6. 微妙な点：なぜ係数の素数 $\ell$ は標数 $p$ と別でなければならないか

ここに見落としやすい一線がある。étale コホモロジーで「正しい」Betti 数を出すには、**係数の素数 $\ell$ は基礎体の標数 $p$ と異なる**($\ell\neq p$)必要がある。

理由は否定形で言うのが早い。$\mathbb Z/p$ 係数の étale コホモロジーは、正標数では**正しい答えを返さない** ── Artin–Schreier 系列(加法群の $x\mapsto x^p-x$)が効いて、位相的に期待する次元とずれる。$p$ 進の情報を正しく拾うには étale ではなく別の器、**結晶コホモロジー**(Grothendieck・Berthelot)が要る。$\ell$ 進($\ell\neq p$)と $p$ 進(結晶)は、同じ多様体の別々の顔だ。この $\ell$ と $p$ の食い違いは、庭の [係数の素数とガロワ表現 ── l 進と p 進の差異](l-adic-vs-p-adic-galois-representation.md) の主題そのものである。

Frobenius が主役を張れるのも、$\overline{\mathbb F_q}$ 上の幾何に効く $\mathrm{Frob}_q$ が、§ 今日のもう一本 [無限次 Galois 対応は位相が決める](無限次Galois対応は位相が決める_2026-06-19.md) で見た $\mathrm{Gal}(\overline{\mathbb F_q}/\mathbb F_q)\cong\widehat{\mathbb Z}$ の生成元だからだ。点を数える跡公式は、無限次 Galois 群の生成元の作用を $\ell$ 進コホモロジー上で読む装置にほかならない。étale コホモロジーの供給源としての Tate 加群は [Tate 加群とエタールコホモロジー](tate-module-and-etale-cohomology.md) に譲る。

---

## 7. 結論：道具の荒さではなく、問いの要求が位相を決めた

Zariski が荒いのは欠陥ではない。多項式の零点で閉集合を定めるという、代数のいちばん素直な約束から出る自然な位相だ。問題は位相の側ではなく、**問いの側**にあった。「有限体上で点を数え、ゼータ関数を説明したい」という具体的な要求が、Zariski の解像度では足りないと突きつけた。

ここに庭の署名の逆向きが見える。ふだんは「不変量(コホモロジー)が解像度を決める」と言う。だが歴史の順序は逆だった ── **解くべき問い(点を数える)が先にあり、それが必要な不変量を、ひいては位相そのものを要求した。** Grothendieck 位相とは、「開集合」という古い枠を、被覆という関係に抽象し直すことで、要求された解像度を作り出した発明だ。位相は点の集合に内蔵された所与ではなく、**何を解像したいかに応じて選び直せる**もの ── これが Zariski から étale への移行が教えた、いちばん大きな転換だった。

荒い位相に困った人がいた。その人は位相を取り替えた。取り替えてよいと気づいたこと自体が、二十世紀幾何の分水嶺だった。

---

## 査読・限界(事実の照合と線引き)

★ は web 照合済み。

**確立した事実(証明済み).**
- $\#\mathbb P^1(\mathbb F_{q^n})=q^n+1$。合同ゼータ $Z(\mathbb P^1,t)=1/((1-t)(1-qt))$。初等的事実。
- 既約多様体上、定数層は flasque で $H^i_{\mathrm{Zar}}(X,\underline A)=0\ (i>0)$。標準的事実(例えば Hartshorne, *Algebraic Geometry* III の演習;巻頁未照合・無印)。
- **Weil 予想**:Weil(1949), "Numbers of solutions of equations in finite fields," *Bull. AMS* ★([Weil conjectures, HandWiki](https://handwiki.org/wiki/Weil_conjectures))。
- **有理性**を最初に証明:Dwork(1960), $p$ 進解析 ★(同上)。
- **étale コホモロジー**は Grothendieck と M. Artin が Weil 予想攻略のため開発。Grothendieck(1965 頃)が有理性・関数等式・Betti 数との関係を確立 ★([Weil conjectures, HandWiki](https://handwiki.org/wiki/Weil_conjectures);[Étale cohomology, HandWiki](https://handwiki.org/wiki/%C3%89tale_cohomology))。
- **Riemann 予想の類似**:Deligne(1974), "La conjecture de Weil I," *Publ. IHÉS* ★([Weil conjectures, HandWiki](https://handwiki.org/wiki/Weil_conjectures);英訳 [arXiv:1807.10810](https://arxiv.org/pdf/1807.10810))。
- **Artin 比較定理**:$\mathbb C$ 上で有限係数 $\mathbb Z/m$ に対し $H^i_{\text{ét}}(X,\mathbb Z/m)\cong H^i_{\mathrm{sing}}(X(\mathbb C),\mathbb Z/m)$ ★([comparison theorem (étale cohomology), nLab](https://ncatlab.org/nlab/show/comparison+theorem+%28%C3%A9tale+cohomology%29))。
- $\ell\neq p$ の必要性、$\mathbb Z/p$ 係数 étale の不備(Artin–Schreier)と $p$ 進の代替=結晶コホモロジー ★([Zariski-Étale Comparison, Kummer and Artin–Schreier (Conrad, Stanford 講義ノート)](http://virtualmath1.stanford.edu/~conrad/Weil2seminar/Notes/L4.pdf))。

**スコープと留保.**
- 跡公式は固有(proper)な $X$ では通常のコホモロジー、非固有ではコンパクト台コホモロジー $H^i_c$ を要する。本稿は $\mathbb P^1$(固有)で書いたのでこの区別を表に出していない。
- Frobenius の幾何的/算術的の区別、Tate ひねり $\mathbb Q_\ell(-1)$ の符号規約は、固有値 $q$ の主張に効くが本稿では抑えた(標準的扱いに従う)。
- 「複素トポロジーの $S^2$ を真似る」は動機づけの比喩で、正標数に特異コホモロジーがそのままあるわけではない。比較定理が成り立つのは $\mathbb C$ 上・有限係数という条件の下である。
- 本稿は étale が**なぜ要請されたか**(歴史・計算上の必要)に限る。**なぜ自然な一般化か**(locale/topos・$\pi_1^{\text{ét}}=\mathrm{Gal}$)は隣家 [開集合の代数で登る](<開集合の代数で登る_Rdiscと Zariski étale_2026-06-02.md>) に譲り、重複を避けた。

---

*関連:[点ではなく、開集合の代数で登る ── Zariski→étale](<開集合の代数で登る_Rdiscと Zariski étale_2026-06-02.md>)(母言語側)・[無限次 Galois 対応は位相が決める](無限次Galois対応は位相が決める_2026-06-19.md)(Frobenius $=\widehat{\mathbb Z}$ の生成元)・[Tate 加群とエタールコホモロジー](tate-module-and-etale-cohomology.md)・[l 進と p 進のガロワ表現](l-adic-vs-p-adic-galois-representation.md)($\ell\neq p$)。*
