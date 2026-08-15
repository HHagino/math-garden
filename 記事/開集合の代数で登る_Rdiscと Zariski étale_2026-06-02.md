---
title: "点ではなく、開集合の代数で登る ── ℝ_disc の限界と Zariski→étale を、同じ山の両側として読む"
date: 2026-06-02
abstract: |
  「非可算離散空間 ℝ_disc は ℝⁿ に埋め込めない」という点集合位相の限界定理と、「Zariski 位相は粗すぎるので étale 位相へ豊穣化する」という代数幾何の話は、まったく別分野に見える。だが locale 理論(点なし位相)を蝶番にすると、両者は「空間とは点の集合ではなく、開集合(やがて被覆)の代数である。点と濃度はそこから落ちてくる」という一つの母言語の上に並ぶ。一方は frame の可算生成性が突きつける壁(不可能性)、もう一方は被覆の定義を取り替えて掘るトンネル(豊穣化)── 同じ「位相は何を解像できるか」という山を、逆側から登る二つの話として読む。
---

## 二つの、無関係に見える話

別々の引き出しに入っているはずの、二つの話から始める。

**ひとつめ(点集合位相)**:実数に離散位相を入れた空間 $\mathbb R_{\mathrm{disc}}$ は、どんな $\mathbb R^n$ にも位相的に埋め込めない。集合としては同じ連続体濃度なのに、だ。理由は濃度ではなく、$\mathbb R^n$ が**第二可算**(可算な開基をもつ)であることにあった。標語的には ── **$\mathbb R^n$ は点としては連続体濃度に大きいが、位相的言語としては可算的である。**

**ふたつめ(代数幾何)**:代数多様体の **Zariski 位相**は、開集合があまりにも少なく粗い。そのままでは被覆空間論も、まともな係数のコホモロジーも回らない。そこで Grothendieck は **étale 位相**を導入し、「開被覆」の意味そのものを取り替えることで、基本群や Galois 群が見える舞台を作った。

この二つ、関係なさそうに見える。一方は「非可算性の壁」の話、他方は「粗い位相の豊穣化」の話だ。ところが、**蝶番を一つ入れると、同じ山を逆側から登る二つの話**になる。その蝶番が、**「空間とは点ではなく、開集合(やがて被覆)の代数である」** という見方 ── locale 理論と、その先の topos 理論だ。

以下、点を主役から降ろして、開集合の代数の側から両方を登る。

## 1. 第一の登頂をおさらい ── 壁は「点」ではなく「開集合」の側にある

$\mathbb R_{\mathrm{disc}}\not\hookrightarrow\mathbb R^n$ の証明の要点だけ思い出す。位相的埋め込みなら、像 $D\subset\mathbb R^n$ は部分空間として離散でなければならない。$\mathbb R^n$ は第二可算で、第二可算性は部分空間に遺伝する。ところが「離散かつ第二可算なら高々可算」── 各一点集合が可算基底の要素を一つずつ独占するからだ。$\mathbb R_{\mathrm{disc}}$ は非可算だから、矛盾。

ここで注意したいのは、**効いていたのは終始「開集合の側」の事情**だということ。点が連続体個あること自体は最後まで障害にならなかった。障害は「可算個の開基しか持てない」という、**開集合の代数の制約**だった。

ならば、いっそ点を主役から降ろして、最初から開集合の代数を空間の本体だと思ってみたらどうか。

## 2. 蝶番:空間を「開集合の代数」として見る(locale)

位相空間 $X$ から、その**開集合全体のなす束** $\mathcal O(X)$ を取り出す。これは

- 任意個の合併(join)について閉じ、
- 有限個の共通部分(meet)について閉じ、
- 分配律を満たす

という構造をもつ。こういう束を**フレーム**と呼び、フレームを「空間そのもの」とみなして扱う対象を **locale**(局所体、点なし位相)という。

驚くのは、**点をフレームから復元できる**ことだ。点とは、フレーム $\mathcal O(X)$ から二元フレーム $\{0,1\}$ への準同型(同じことだが、完全素フィルター)に対応する。つまり「点」は、開集合の代数に対する**問いかけの仕方**として二次的に立ち上がる。良い空間(sober な空間)では、フレームから点を復元すると元に戻る。**空間の情報は、点ではなくフレームに宿っている。**

この言葉で、第一の登頂のスローガンが**文字どおりの命題**になる。

> **第二可算 $\iff$ フレーム $\mathcal O(X)$ が可算生成**(可算個の開集合から、join で全体が出る)。

「$\mathbb R^n$ は位相的言語としては可算」とは、比喩ではなく **$\mathcal O(\mathbb R^n)$ が可算生成のフレームである**、という事実だったのだ。

<details>
<summary>もう一段:埋め込み不可能性を、フレームの言葉だけで言い直す(発展・飛ばし可)</summary>

部分空間は、locale の言葉では**商フレーム**(sublocale、フレームの全射準同型 $\mathcal O(X)\twoheadrightarrow M$)に対応する。フレームの全射は join を保つので、**可算生成性は商に遺伝する**:$S$ が $\mathcal O(X)$ を join 生成すれば、その像が商を join 生成する。

一方、$\mathbb R_{\mathrm{disc}}$ のフレームは冪集合 $\mathcal P(\mathbb R)$ で、各一点集合 $\{x\}$ は他の開集合の非自明な join では書けない(原子)。原子は生成系に必ず**自分自身が入っていなければならない**から、非可算個の原子をもつ $\mathcal P(\mathbb R)$ は可算生成ではない。

ゆえに、可算生成フレーム $\mathcal O(\mathbb R^n)$ の商として、非可算離散のフレーム $\mathcal P(\mathbb R)$ は現れえない。$\mathbb R_{\mathrm{disc}}\not\hookrightarrow\mathbb R^n$ が、**点を一切経由せず、フレームの生成濃度だけ**で出た。壁は完全に「開集合の代数」の側にある。
</details>

そして、この「代数を空間とみなす」発想の**原型**が、**Stone の表現定理**だ。Boolean 代数は、その素フィルターのなす空間(Stone 空間=コンパクト Hausdorff 全不連結)と双対になる。Boolean 代数 $\leftrightarrow$ 空間。**「代数が空間だ」という思想は、ここで生まれた。** locale 理論は、これを Boolean から一般のフレームへ広げたものにあたる。

> **語呂への注意(ここでつまずきやすい).** Boolean 代数には補集合という位数2の演算 $\neg$ がある。これを「$\mathrm{Gal}(\mathbb C/\mathbb R)=\mathbb Z/2\mathbb Z$ だ」と繋ぎたくなる ── が、これは**両方 $\mathbb Z/2\mathbb Z$ だというだけの語呂合わせ**で、函手的な同一視ではない。Galois の $\mathbb Z/2\mathbb Z$ が**正しく**現れるのは、補集合としてではなく、後で出てくる**被覆**としてである(§4)。代数を空間と見る母言語で繋ぐと話は立ち、記号の一致で繋ぐと足を滑らせる。

## 3. もう一段上げる ── 開集合から「被覆」へ(site と topos)

locale はまだ「どの点がどの開に入るか」の世界だ。Grothendieck はここをもう一段抽象化した。問いを **「どの族が被覆とみなせるか」** に移したのだ。

圏の上に、「被覆族」の概念を公理的に指定したものを **Grothendieck 位相**、その圏を **site** と呼ぶ。site 上の層全体のなす圏が **topos** で、これが「一般化された空間」になる。位相空間は「開集合という site」の特別な場合にすぎない。

<details>
<summary>「被覆とみなす族」とは何を満たすのか(公理の中身・飛ばし可)</summary>

各対象 $U$ に対し、$U$ への射の族 $\{U_i\to U\}_i$ のうち「被覆」とみなすものを指定する。それが位相と呼べるための条件は、ふつうの開被覆が満たす性質を抽象化した三つだ。

1. **(同型は被覆)** 同型 $\{V\xrightarrow{\sim}U\}$ は被覆。
2. **(引き戻しで安定)** $\{U_i\to U\}$ が被覆なら、任意の $V\to U$ に沿った引き戻し $\{U_i\times_U V\to V\}$ も $V$ の被覆。── 「被覆を制限しても被覆」。
3. **(局所性・推移律)** 被覆 $\{U_i\to U\}$ の各 $U_i$ をさらに被覆すれば、それらを合わせたものも $U$ の被覆。── 「被覆の被覆は被覆」。

点の包含(「$x\in U_i$ のいずれかに入る」)は一切出てこない。**被覆という関係だけで位相を語る**ので、点を持たない圏(代数多様体の étale 射の圏など)の上でも「位相」が定義できる。これが §4 を可能にする一般化だ。
</details>系譜を一本に書けばこうだ。

$$\text{Stone 双対}\ \longrightarrow\ \text{locale(点なし位相)}\ \longrightarrow\ \text{Grothendieck topos(site)}.$$

左端で「代数=空間」が生まれ、中央で点が消え、右端で「開集合」が「被覆」に置き換わる。**第二の登頂は、この右端で起きる。**

## 4. 第二の登頂 ── Zariski は粗すぎる、étale で被覆を見る

代数多様体の Zariski 位相は、とにかく粗い。既約多様体では、空でない開集合二つは**必ず交わる**(Hausdorff ですらない)。開集合は多項式の零点集合の補集合で、どれも馬鹿でかい。零点を見る開集合の少なさ ── これが Zariski の限界だ。この粗さのせいで、定数係数のコホモロジーは潰れ、被覆空間論も基本群も、古典的な形では立ち上がらない。

Grothendieck の処方は、§3 の発想そのものだった。**「開被覆」の定義を、点の包含から取り替える。** 採用するのが **étale 射**だ。étale とは平坦かつ不分岐、すなわち**(解析的・エタール的な意味での)局所同相**の代数版である ── ただし肝心なのは、これは **Zariski 局所では同相ではない**こと。まさに Zariski に欠けていた解像度を、被覆の概念ごと外から補う。

具体例で「Zariski には見えないが étale には見える」を一つ手に取ろう。乗法群 $\mathbb G_m$(つまり $0$ を抜いた直線)の上の **$n$ 乗写像**

$$\mathbb G_m\xrightarrow{\ z\mapsto z^n\ }\mathbb G_m\qquad(n\ \text{は基礎体の標数と互いに素})$$

を考える。微分 $nz^{n-1}$ は $\mathbb G_m$ 上で消えないから、これは**次数 $n$ の有限 étale 被覆**であり、被覆変換群は $1$ の $n$ 乗根のなす群 $\mu_n$ で、Galois だ(Kummer 理論)。解析的に見れば、これは $\mathbb C^\ast$ の $n$ 重被覆 $z\mapsto z^n$ そのものである。ところが **Zariski 位相では、これを局所同相として見られない**:基礎の $\mathbb G_m$ のどんな空でない Zariski 開集合も(既約だから)稠密で大きすぎて、その上で被覆が $n$ 枚の貼り合わせにほどけてくれない。étale 被覆として扱って初めて、$n$ 重性と $\mu_n$ が舞台に乗る。

なぜ Zariski だと被覆論が潰れるのか、根を一言で言える。既約多様体では空でない開集合はどれも稠密で、**定数層は flasque(脆弱)**になる ── 制限写像がすべて同型に近く、引き伸ばしの自由がない。すると定数係数の高次 Zariski コホモロジーは消え、位相が「何も無い」と言ってくる。一方 étale コホモロジーは、たとえば $\operatorname{Spec}\mathbb R$ 上で係数 $\mathbb Z/2\mathbb Z$ を取ると Galois 群 $\mathbb Z/2\mathbb Z$ をちゃんと拾う。**被覆の定義を取り替えた瞬間に、Zariski が「無」と答えた場所から構造が現れる。**

étale 射の族を被覆とする site(étale site)の上では、**基本群** $\pi_1^{\text{ét}}$ が見える。そして $\pi_1^{\text{ét}}$ は**有限 étale 被覆を分類する**。ここで決定的な合流が起きる。点 $\operatorname{Spec} k$(体 $k$)の上では、有限 étale 被覆は有限分離代数にほかならず、

$$\pi_1^{\text{ét}}(\operatorname{Spec} k)\ \cong\ \mathrm{Gal}(k_{\mathrm{sep}}/k).$$

**位相的な被覆空間論と、体の Galois 理論が、同じ $\pi_1$ の二つの顔として統一される**(Grothendieck の Galois 理論)。

ここで、§2 で保留した $\mathbb Z/2\mathbb Z$ が**正しい姿**で戻ってくる。

$$\operatorname{Spec}\mathbb C\ \longrightarrow\ \operatorname{Spec}\mathbb R\qquad(\text{次数 2 の有限 étale 被覆})$$

の被覆変換群が $\mathrm{Gal}(\mathbb C/\mathbb R)=\mathbb Z/2\mathbb Z$(複素共役)であり、$\pi_1^{\text{ét}}(\operatorname{Spec}\mathbb R)=\mathbb Z/2\mathbb Z$。**Galois の $\mathbb Z/2\mathbb Z$ は、Boolean の補集合としてではなく、二重被覆として現れる。** 「代数を空間と見て、被覆を数える」という母言語に乗せて初めて、$\mathbb C/\mathbb R$ が位相的な二重被覆の顔をする。

## 5. 同じ山の、逆側

二つの登頂を、同じ尾根の上に並べる。山の名は **「位相は何をどこまで解像できるか」**。両者はこの一点を、逆向きから突いている。

<figure>
<svg viewBox="0 0 480 272" width="100%" style="max-width:480px;display:block;margin:8px auto" role="img" aria-label="同じ山の両側:壁とトンネル">
  <defs>
    <marker id="aw" markerWidth="9" markerHeight="9" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#2f5d7c"/></marker>
    <marker id="at" markerWidth="9" markerHeight="9" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#5a6e4a"/></marker>
  </defs>
  <path d="M40,205 L240,52 L440,205 Z" fill="#efe6d5" stroke="#6b5d44" stroke-width="2"/>
  <text x="240" y="40" text-anchor="middle" font-family="serif" font-size="13" fill="#2b2118">位相は何を解像できるか?</text>
  <!-- left ascent + wall -->
  <line x1="92" y1="200" x2="158" y2="148" stroke="#2f5d7c" stroke-width="2" stroke-dasharray="6 4" marker-end="url(#aw)"/>
  <line x1="168" y1="120" x2="168" y2="170" stroke="#b1342a" stroke-width="5"/>
  <text x="168" y="110" text-anchor="middle" font-family="serif" font-size="12" fill="#b1342a">壁</text>
  <!-- right ascent + tunnel -->
  <path d="M328,205 a22,30 0 0 1 44,0" fill="#d8cdb8" stroke="#6b5d44" stroke-width="1.6"/>
  <line x1="438" y1="190" x2="320" y2="190" stroke="#5a6e4a" stroke-width="2" marker-end="url(#at)"/>
  <text x="350" y="150" text-anchor="middle" font-family="serif" font-size="12" fill="#5a6e4a">トンネル</text>
  <!-- bottom labels -->
  <text x="118" y="226" text-anchor="middle" font-family="serif" font-size="12.5" fill="#2b2118">第一の登頂:ℝ_disc</text>
  <text x="118" y="241" text-anchor="middle" font-family="serif" font-size="11.5" fill="#6b5d44">可算生成フレーム → 不可能</text>
  <text x="362" y="226" text-anchor="middle" font-family="serif" font-size="12.5" fill="#2b2118">第二の登頂:Zariski→étale</text>
  <text x="362" y="241" text-anchor="middle" font-family="serif" font-size="11.5" fill="#6b5d44">被覆を再定義 → 豊穣化</text>
  <!-- hinge band -->
  <rect x="34" y="250" width="412" height="20" rx="4" fill="#f7f2e6" stroke="#c89b3c" stroke-width="1.2"/>
  <text x="240" y="264" text-anchor="middle" font-family="serif" font-size="12" fill="#2b2118">蝶番 ── locale / topos:空間 = 開集合・被覆の代数(点・濃度は下流)</text>
</svg>
<figcaption><b>図1 ─ 同じ山の両側.</b> 「位相は何を解像できるか」という一つの尾根を、第一の登頂は<b>壁</b>(可算生成フレームによる不可能性)として、第二の登頂は<b>トンネル</b>(被覆の再定義による豊穣化)として、逆向きに突く。両者を一つの山にしているのが、底を貫く locale/topos の母言語。<i>(概念図)</i></figcaption>
</figure>

| | 第一の登頂(ℝ_disc) | 第二の登頂(Zariski→étale) |
|---|---|---|
| 問い | 位相は非可算な孤立を解像できるか | 位相は被覆・Galois を解像できるか |
| 粗さの正体 | フレームが**可算生成** | 開集合が零点の補で**少なすぎる** |
| 点・濃度の役割 | 連続体濃度は障害でない(下流) | 点の個数は問題でない(下流) |
| 結末 | **不可能性**(壁にぶつかる) | **豊穣化**(site で被覆を再定義し、掘り抜く) |

同じ「解像度」という尾根を、片方は**下から塞がれて壁にぶつかり**、片方は**枠を拡張してトンネルを抜ける**。これが「同じ山を逆側から登る」の精密な意味だ。

そして両側を一つの山にしている蝶番が、繰り返すが **「空間とは点ではなく、開集合(やがて被覆)の代数であり、点と濃度はそこから落ちてくる」** という locale/topos の母言語である。第一の登頂は「フレームの生成濃度が点の振る舞いを縛る」という限界として、第二の登頂は「フレームを site に豊穣化すると被覆=Galois が解像される」という解放として、同じ原理の表と裏を見せている。

## 6. 正直な線引き

最後に、編集者としての線を引いておく。**これは family resemblance(家族的類似)であって、定理による同一視ではない。**

- 第二可算性($\mathbb R^n$ の**解析的**位相の性質)、Zariski の粗さ、étale site は、**現象としては別物**だ。直接イコールで結んではいけない。
- 三者を貫いて立っているのは、あくまで **locale/topos という母言語** ── 「開集合・被覆の代数が空間の本体で、点は二次的」── である。繋ぐなら、この母言語で繋ぐ。
- 逆に、記号の一致(Boolean 補集合の $\mathbb Z/2\mathbb Z$ と Galois の $\mathbb Z/2\mathbb Z$)のような**語呂で繋ぐと滑る**。Galois が本当に現れるのは、§4 の被覆としてだ。

この区別さえ守れば、「同じ山の両側」は比喩で終わらず、構造として読める。

## まとめ

- 点集合位相の限界定理($\mathbb R_{\mathrm{disc}}\not\hookrightarrow\mathbb R^n$)も、代数幾何の Zariski→étale も、locale/topos の言葉では **「空間＝開集合(被覆)の代数。点と濃度は下流」** という一つの原理の現れ。
- 第一の登頂:$\mathbb R^n$ のフレームが**可算生成**であることが、非可算な孤立を**不可能**にする(壁)。
- 第二の登頂:Zariski のフレームが**粗すぎる**ので、被覆の定義を site へ**豊穣化**して $\pi_1^{\text{ét}}=\mathrm{Gal}$ を解像する(トンネル)。
- $\mathbb Z/2\mathbb Z$ は Boolean 補集合ではなく、$\operatorname{Spec}\mathbb C\to\operatorname{Spec}\mathbb R$ という**二重被覆**として、Galois の顔で現れる。
- 繋ぐのは母言語(代数が空間)であって、語呂(記号の一致)ではない。

濃度は声が大きいが、下流だ。空間の本体は、開集合の代数 ── そしてその先の、被覆の代数にある。同じ山の片側には**壁**があり、反対側には**トンネル**がある。どちらも「位相という言語が、何をどこまで綴れるか」を問うている。

なお本稿は étale が**なぜ自然な一般化か**(locale/topos の母言語)を扱った。**なぜ歴史的に要請されたか** ── 有限体上で点を数える Weil 予想が Zariski の粗さに突き当たり、跡公式の効くコホモロジーを要求した経緯 ── は姉妹編 [なぜ Zariski では点が数えられないのか ── Grothendieck 位相を要請した Weil 予想](なぜZariskiでは点が数えられないか_Weil予想とGrothendieck位相_2026-06-19.md) に分けた。

---

### タイトル案

1. 点ではなく、開集合の代数で登る ── ℝ_disc の限界と Zariski→étale を同じ山の両側として読む
2. 空間は点ではなく、開集合(と被覆)の代数である ── 二つの位相の限界と豊穣化
3. 壁とトンネル ── 第二可算性の不可能性定理と étale 位相を、locale で繋ぐ
4. 濃度は下流である ── locale/topos から見た「位相が解像できるもの」
