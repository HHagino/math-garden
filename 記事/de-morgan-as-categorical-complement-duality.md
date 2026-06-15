---
title: ド・モルガンの法則は、冪集合圏における補集合反変同値が極限と余極限を交換することの影である
date: 2026-05-20
updated: 2026-06-02
tags: [圏論, 冪集合, Boolean代数, Heyting代数, 順序集合, 反変関手, 随伴, 極限, 余極限, 量化子, ド・モルガン]
status: done
level: 数学解説(圏論を少し知っている読者向け)
related:
---

# ド・モルガンの法則は、冪集合圏における補集合反変同値が極限と余極限を交換することの影である

## 1. 導入

集合 $X$ の冪集合 $\mathcal{P}(X)$ を、包含関係 $U\to V\iff U\subseteq V$ を矢印とする圏(poset category)として見る。このとき補集合 $c_X(U):=X\setminus U$ は包含の向きを **反転** する($U\subseteq V$ なら $X\setminus V\subseteq X\setminus U$)。冪集合圏では有限の交わり $\bigcap$ が極限、有限の合併 $\bigcup$ が余極限。補集合は反変関手だから、極限と余極限を *入れ替える* はずだ。ここから

$$X \setminus \bigcup_i U_i = \bigcap_i (X \setminus U_i),\qquad X \setminus \bigcap_i U_i = \bigcup_i (X \setminus U_i)$$

── まさに **ド・モルガンの法則** が出る。本記事ではこの構図をほどき、写像 $f:X\to Y$ で逆像・直像・全称像が随伴列 $f_!\dashv f^{-1}\dashv\forall_f$ をなすこと(Lawvere:量化子は随伴)、そして**この対称性が Boolean を離れると崩れること**まで見る。

## 2. 冪集合は圏である

$\mathcal{P}(X)$ を poset category にする:対象は部分集合 $U\subseteq X$、射は $U\subseteq V$ のときただ一つ。poset category では **極限 = meet**($\bigcap U_i$)、**余極限 = join**($\bigcup U_i$)。$\bigcap U_i$ は全 $U_i$ に含まれる最大の部分集合(極限の普遍性)、$\bigcup U_i$ は全 $U_i$ を含む最小の部分集合(余極限の普遍性)で、ちょうど meet と join に一致する。

## 3–4. 補集合は反変同値で、極限と余極限を交換する

$U\subseteq V\Rightarrow X\setminus V\subseteq X\setminus U$ より、補集合は射を反転する **反変関手** $c_X:\mathcal{P}(X)\to\mathcal{P}(X)^{\mathrm{op}}$。しかも $c_X\circ c_X=\mathrm{id}$(対合)だから、単なる反変関手でなく **反変同値(順序反転自己同型)** だ。反変同値は $\mathcal{P}(X)$ の余極限を $\mathcal{P}(X)^{\mathrm{op}}$ の余極限へ写すが、$\mathcal{P}(X)^{\mathrm{op}}$ の余極限とは $\mathcal{P}(X)$ の極限のこと。ゆえに:

> **補集合は、$\mathcal{P}(X)$ の極限(meet)と余極限(join)を入れ替える。**

注意:補集合は極限・余極限を「保存」するのではなく「**交換**」する。反変だからだ。

<figure>
<svg viewBox="0 0 460 196" width="100%" style="max-width:460px;display:block;margin:8px auto" role="img" aria-label="補集合が束を上下反転する">
  <defs><marker id="dm1" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#b1342a"/></marker></defs>
  <g font-family="serif" font-size="10.5" fill="#2b2118">
    <text x="100" y="18" text-anchor="middle" font-size="10.5" fill="#8a7f6c">P({1,2}) の束</text>
    <text x="100" y="40" text-anchor="middle">{1,2} (join)</text>
    <text x="56" y="100" text-anchor="middle">{1}</text><text x="144" y="100" text-anchor="middle">{2}</text>
    <text x="100" y="160" text-anchor="middle">∅ (meet)</text>
    <line x1="92" y1="48" x2="60" y2="90" stroke="#6b5d44" stroke-width="1"/><line x1="108" y1="48" x2="140" y2="90" stroke="#6b5d44" stroke-width="1"/>
    <line x1="60" y1="108" x2="92" y2="150" stroke="#6b5d44" stroke-width="1"/><line x1="140" y1="108" x2="108" y2="150" stroke="#6b5d44" stroke-width="1"/>
    <!-- complement flip arrow -->
    <line x1="190" y1="100" x2="262" y2="100" stroke="#b1342a" stroke-width="1.6" marker-end="url(#dm1)"/>
    <text x="226" y="92" text-anchor="middle" font-size="10" fill="#b1342a">補集合 c</text>
    <text x="226" y="116" text-anchor="middle" font-size="9" fill="#8a7f6c">上下反転</text>
    <text x="360" y="18" text-anchor="middle" font-size="10.5" fill="#8a7f6c">c で反転(join⇄meet)</text>
    <text x="360" y="40" text-anchor="middle">∅ (旧 join)</text>
    <text x="316" y="100" text-anchor="middle">{2}</text><text x="404" y="100" text-anchor="middle">{1}</text>
    <text x="360" y="160" text-anchor="middle">{1,2} (旧 meet)</text>
    <line x1="352" y1="48" x2="320" y2="90" stroke="#6b5d44" stroke-width="1"/><line x1="368" y1="48" x2="400" y2="90" stroke="#6b5d44" stroke-width="1"/>
    <line x1="320" y1="108" x2="352" y2="150" stroke="#6b5d44" stroke-width="1"/><line x1="400" y1="108" x2="368" y2="150" stroke="#6b5d44" stroke-width="1"/>
  </g>
</svg>
<figcaption><b>図1 ─ 補集合は束を上下反転する.</b> $\mathcal P(\{1,2\})$ の Hasse 図を補集合で写すと、最上の join と最下の meet が入れ替わる。$\bigcup$ と $\bigcap$ の交換 ── これがド・モルガンの法則の幾何的な姿だ。<i>(概念図)</i></figcaption>
</figure>

## 5. ド・モルガンの法則 ── 具体例つき

第2・4節を合わせると、$\bigcup$(join)と $\bigcap$(meet)が補集合で交換し、

$$\boxed{X\setminus\textstyle\bigcup_i U_i=\bigcap_i(X\setminus U_i),}\qquad \boxed{X\setminus\textstyle\bigcap_i U_i=\bigcup_i(X\setminus U_i).}$$

**手で確かめる.** $X=\{1,2,3\},\ U_1=\{1,2\},\ U_2=\{2,3\}$。$U_1\cup U_2=\{1,2,3\}$ ゆえ $X\setminus(U_1\cup U_2)=\varnothing$。一方 $X\setminus U_1=\{3\},\ X\setminus U_2=\{1\}$、その交わりは $\varnothing$ ── 一致する。Boolean algebra の **反自己同型** が meet と join を入れ替える、これがド・モルガンの本質だ。

## 6. 写像 $f:X\to Y$ ── 量化子は随伴である

写像 $f:X\to Y$ があると、冪集合の間に三つの関手が現れる。**逆像** $f^{-1}:\mathcal{P}(Y)\to\mathcal{P}(X)$($B\mapsto\{x\mid f(x)\in B\}$)は補集合と素直に可換する($f^{-1}(Y\setminus B)=X\setminus f^{-1}(B)$)。**直像** $f_!(S)=\{f(x)\mid x\in S\}$ は存在量化に対応。補集合で挟むと **全称像** $\forall_f(S):=\{y\mid f^{-1}(y)\subseteq S\}=Y\setminus f_!(X\setminus S)$ が出る。そしてこれらは随伴列をなす:

$$\boxed{f_!\dashv f^{-1}\dashv\forall_f}\qquad(f_!=\exists,\ f^{-1}=\text{代入},\ \forall_f=\forall).$$

写像に沿った関手の随伴列が、論理の量化子構造をそのまま実現している(Lawvere)。

<figure>
<svg viewBox="0 0 440 150" width="100%" style="max-width:440px;display:block;margin:8px auto" role="img" aria-label="量化子の随伴列">
  <g font-family="serif" font-size="12" fill="#2b2118">
    <rect x="40" y="56" width="96" height="40" rx="4" fill="#eef5fa" stroke="#2f5d7c"/><text x="88" y="80" text-anchor="middle">P(X)</text>
    <rect x="304" y="56" width="96" height="40" rx="4" fill="#eef1ea" stroke="#5a6e4a"/><text x="352" y="80" text-anchor="middle">P(Y)</text>
    <path d="M136,64 C200,40 256,40 304,64" fill="none" stroke="#5a4f3f" stroke-width="1.3"/><text x="220" y="42" text-anchor="middle" font-size="10" fill="#5a4f3f">f₋ = ∃</text>
    <path d="M304,76 C256,62 200,62 136,76" fill="none" stroke="#5a4f3f" stroke-width="1.3"/><text x="220" y="74" text-anchor="middle" font-size="10" fill="#5a4f3f">f⁻¹ = 代入</text>
    <path d="M136,90 C200,116 256,116 304,90" fill="none" stroke="#5a4f3f" stroke-width="1.3"/><text x="220" y="116" text-anchor="middle" font-size="10" fill="#5a4f3f">∀_f = ∀</text>
    <text x="220" y="138" text-anchor="middle" font-size="10.5" fill="#8a7f6c">f₋ ⊣ f⁻¹ ⊣ ∀_f(Lawvere:量化子は随伴)</text>
  </g>
</svg>
<figcaption><b>図2 ─ 量化子は随伴.</b> 写像 $f$ に沿って、直像(存在 $\exists$)・逆像(代入)・全称像(全称 $\forall$)が随伴列 $f_!\dashv f^{-1}\dashv\forall_f$ をなす。$\forall_f(S)=Y\setminus f_!(X\setminus S)$ は、$\forall x\,P\iff\neg\exists x\,\neg P$ という量化子のド・モルガン双対そのもの。<i>(概念図)</i></figcaption>
</figure>

**手で確かめる.** $f:\{1,2,3\}\to\{a,b\}$、$f(1)=f(2)=a,\ f(3)=b$。$S=\{1,3\}$ とすると、$f_!(X\setminus S)=f_!(\{2\})=\{a\}$、ゆえに $\forall_f(S)=Y\setminus\{a\}=\{b\}$。直接 $\forall_f(S)=\{y\mid f^{-1}(y)\subseteq S\}$ を見ても、$f^{-1}(a)=\{1,2\}\not\subseteq\{1,3\}$、$f^{-1}(b)=\{3\}\subseteq\{1,3\}$ ── やはり $\{b\}$。補集合を通した $\forall$ と $\exists$ の双対が、数で合う。

## 7. 否定形 ── Boolean を離れると、ド・モルガンは半分崩れる

ここまでの対称性は **補集合が対合($\neg\neg U=U$)である**ことに乗っていた。これは $\mathcal{P}(X)$ が **Boolean(可補)束** だから成り立つ。だが、補集合を一般化した **Heyting 代数**(直観主義論理・locale=点なし位相の束)では、否定 $\neg U$(= $U$ と交わらない最大の元)は一般に **対合ではない**:$\neg\neg U\neq U$。

例:実数直線 $\mathbb R$ の開集合のなす frame で、$U=\mathbb R\setminus\{0\}$ を取ると $\neg U=\mathrm{int}\{0\}=\varnothing$、$\neg\neg U=\neg\varnothing=\mathbb R\neq U$。このとき、ド・モルガンの片方 $\neg(U\cup V)=\neg U\cap\neg V$ は任意の Heyting 代数で成り立つが、**もう片方 $\neg(U\cap V)=\neg U\cup\neg V$ は一般に破れる**(不等号 $\supseteq$ にしかならない)。古典的なド・モルガン(両方)が成り立つのは、束が Boolean=可補のときに限る。

これは locale 理論・直観主義論理が古典論理と分かれる、まさにその一点だ。$\mathcal{P}(X)$ という最も素直な Boolean 束では補集合が完璧な対称性を与えるが、開集合の frame のように **可補でない** Heyting 代数へ出ると、対称性の半分が落ちる(別記事「点ではなく、開集合の代数で登る」── 空間を開集合の代数として見ると、その代数は一般に Boolean でなく Heyting だ)。ド・モルガンの「美しさ」は、Boolean という強い仮定の上に乗っていた。

## 8. 結論

ド・モルガンの法則は、四つの高さで読める。素朴な集合の恒等式 / Boolean 代数の反自己同型が meet と join を交換 / 圏論的には補集合が反変同値で極限と余極限を交換 / 写像が加わると $\forall_f(S)=Y\setminus f_!(X\setminus S)$ という量化子のド・モルガン双対。すべては一文に圧縮できる:

> **ド・モルガンの法則とは、冪集合を Boolean 代数あるいは poset category と見たとき、補集合という反変同値が join と meet(余極限と極限)を交換することの影である。**

そして §7 が見せたように、その対称性は Boolean という土台に乗っている。土台を Heyting(locale)に替えると、補集合は対合でなくなり、ド・モルガンは半分だけ生き残る。小さく見える恒等式の下に、圏論的双対性・Lawvere の量化子随伴・そして古典/直観主義の分岐まで、一枚岩でつながっている。

---

## 査読・限界(解説モード)

- **依拠する標準事実**:poset category の極限=meet・余極限=join、補集合の反変同値性($c\circ c=\mathrm{id}$)、随伴の極限保存則、Lawvere の「量化子は随伴」($f_!\dashv f^{-1}\dashv\forall_f$)、Heyting 代数で $\neg$ が一般に対合でないこと、ド・モルガンの片方が Heyting で破れること。標準的な圏論・束論。
- **§5・§6 の計算**:$X=\{1,2,3\}$ でのド・モルガン、$f:\{1,2,3\}\to\{a,b\}$ での $\forall_f(\{1,3\})=\{b\}=Y\setminus f_!(\{2\})$。検算済み。
- **境界(否定形)**:古典ド・モルガン(両法則＋$\neg\neg=\mathrm{id}$)は Boolean 束に限る。Heyting 代数(直観主義・locale)では $\neg(U\cup V)=\neg U\cap\neg V$ は残るが $\neg(U\cap V)=\neg U\cup\neg V$ は一般に破れる。
- 既知の理論の整理であり、新規主張を含まない。
