---
title: 行列式に見えたもの ── ポアソン括弧とヤコビアン、そして位相空間の幾何
date: 2026-05-20
updated: 2026-06-02
tags: [ポアソン括弧, ヤコビアン, 解析力学, ハミルトン力学, 正準座標, シンプレクティック構造, 量子化, 保存量, Groenewold-van Hove]
status: done
level: 数学解説(大学初年級の微積分・線形代数を知っている読者向け)
---

# 行列式に見えたもの ── ポアソン括弧とヤコビアン、そして位相空間の幾何

## 1. 導入:手書きの式に出会う

ノートに、こんな手書きの式が書かれている。

$$[F, G]= \frac{\partial F}{\partial q} \frac{\partial G}{\partial p} - \frac{\partial G}{\partial q} \frac{\partial F}{\partial p}= \begin{vmatrix} F_q & F_p \\ G_q & G_p \end{vmatrix}= \frac{\partial(F, G)}{\partial(q, p)}.$$

行列式と、ヤコビアン記法と、なんらかの括弧。三つが等号で結ばれている。一見すると $2$ 変数関数 $F(q,p), G(q,p)$ の多変数微積分の式だが、それだけではない。解析力学では **ポアソン括弧** と呼ばれ、ハミルトン力学の心臓部にある(物理では $[\,,\,]$ を量子の交換子に予約するため $\{F,G\}$ と書く。本記事も $\{F,G\}$ を使う)。一枚の式から「これはただの行列式ではなかった」と気づく流れを追う。

## 2–3. まず多変数微積分として:行列式とヤコビアン

第一行は $2\times2$ 行列式の展開そのものだ:$\begin{vmatrix}F_q&F_p\\G_q&G_p\end{vmatrix}=F_qG_p-F_pG_q$。そしてこれは写像 $(q,p)\mapsto(F,G)$ の **ヤコビアン行列式** $\det J=\frac{\partial(F,G)}{\partial(q,p)}$ で、変数変換の **面積要素の倍率** を測る:$dF\,dG=\left|\frac{\partial(F,G)}{\partial(q,p)}\right|dq\,dp$。ここまで物理は一切入っていない、純粋な多変数微積分だ。

## 4. 解析力学ではポアソン括弧と呼ばれる

ところが $q$ を **位置**、$p$ を **運動量** とみなすと、$(q,p)$ はハミルトン力学の **位相空間** の正準座標になり、同じ式

$$\{F, G\} := \frac{\partial F}{\partial q} \frac{\partial G}{\partial p} - \frac{\partial F}{\partial p} \frac{\partial G}{\partial q}$$

が **ポアソン括弧** と呼ばれる。同じ行列式を、ヤコビアン(面積比)としても、物理量どうしの括弧積としても読んでいる。

<figure>
<svg viewBox="0 0 470 160" width="100%" style="max-width:470px;display:block;margin:8px auto" role="img" aria-label="一つの式の三つの読み方">
  <defs><marker id="pb1" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#5a4f3f"/></marker></defs>
  <rect x="170" y="62" width="130" height="36" rx="4" fill="#f0e3c4" stroke="#c89b3c" stroke-width="1.4"/>
  <text x="235" y="85" text-anchor="middle" font-family="serif" font-size="12" fill="#2b2118">F_q G_p − F_p G_q</text>
  <line x1="180" y1="62" x2="110" y2="34" stroke="#5a4f3f" stroke-width="1.3" marker-end="url(#pb1)"/>
  <line x1="235" y1="98" x2="235" y2="128" stroke="#5a4f3f" stroke-width="1.3" marker-end="url(#pb1)"/>
  <line x1="290" y1="62" x2="362" y2="34" stroke="#5a4f3f" stroke-width="1.3" marker-end="url(#pb1)"/>
  <g font-family="serif" font-size="10.5" fill="#2b2118">
    <rect x="20" y="14" width="120" height="24" fill="#eef5fa" stroke="#2f5d7c"/><text x="80" y="30" text-anchor="middle">2×2 行列式</text>
    <rect x="150" y="128" width="170" height="24" fill="#eef5fa" stroke="#2f5d7c"/><text x="235" y="144" text-anchor="middle">ヤコビアン(面積比)</text>
    <rect x="332" y="14" width="128" height="24" fill="#eef1ea" stroke="#5a6e4a"/><text x="396" y="30" text-anchor="middle">ポアソン括弧 {F,G}</text>
  </g>
</svg>
<figcaption><b>図1 ─ 一つの式、三つの読み方.</b> 同じ $F_qG_p-F_pG_q$ が、$2\times2$ 行列式・ヤコビアン(変数変換の面積比 $dF\,dG=|\det J|\,dq\,dp$)・ポアソン括弧(位相空間の物理量の括弧積)の三つに読める。物理を入れた瞬間に、面積比が力学の心臓に化ける。<i>(概念図)</i></figcaption>
</figure>

## 5–6. $\{q,p\}=1$ と、そこに圧縮されているもの

$F=q,G=p$ を入れると $\{q,p\}=q_qp_p-q_pp_q=1$、同様に $\{p,q\}=-1,\ \{q,q\}=\{p,p\}=0$。$\{q,p\}=1$ は $q,p$ が **正準共役** である表明だ。この小さな等式に、(i) シンプレクティック $2$-形式 $\omega=dq\wedge dp$ が $q,p$ 方向の符号付き面積を $+1$ で測ること、(ii) この構造を保つ変換=**正準変換**、(iii) 量子化で交換関係 $[\hat q,\hat p]=i\hbar$ へ昇格する種、がすべて圧縮されている。

## 7. ハミルトニアンによる時間発展

ポアソン括弧の最有名の使い方は時間発展だ。ハミルトニアン $H$ に対し、任意の物理量 $F$ は

$$\boxed{\frac{dF}{dt}=\{F,H\}+\frac{\partial F}{\partial t}.}$$

$\partial F/\partial t=0$ なら $\dot F=\{F,H\}$。$F=q$ で $\dot q=\{q,H\}=\partial H/\partial p$、$F=p$ で $\dot p=\{p,H\}=-\partial H/\partial q$ ── ハミルトン方程式が再現される。ポアソン括弧は「**$H$ が物理量をどう動かすか**」を表す。

## 8. 保存量・対称性 ── ネーターのハミルトン版

$\dot F=\{F,H\}$ から直ちに:**$\{F,H\}=0$(かつ $\partial F/\partial t=0$)なら $F$ は保存量**。$H$ とのポアソン括弧がゼロな量が、時間によらず一定だ。

手で一つ:自由粒子 $H=\frac{p^2}{2m}$ では $\{p,H\}=\frac{\partial p}{\partial q}\frac{\partial H}{\partial p}-\frac{\partial p}{\partial p}\frac{\partial H}{\partial q}=0$ ── 運動量保存。中心力 $H=\frac{p_x^2+p_y^2}{2m}+V(r)$ では角運動量 $L=xp_y-yp_x$ が $\{L,H\}=0$ をみたし保存する(回転対称性の帰結)。これは **ネーターの定理「対称性 → 保存量」のハミルトン版** だ(別記事「ネーターの定理の δL=dg/dt」では同じ対応をラグランジアン側で見た)。ハミルトン側では、保存量と対称性の関係がポアソン括弧の作る Lie 代数の中でクリーンに書ける:反対称性 $\{F,G\}=-\{G,F\}$、双線形性、ライプニッツ則 $\{FG,H\}=F\{G,H\}+\{F,H\}G$、ヤコビ恒等式 $\{F,\{G,H\}\}+\{G,\{H,F\}\}+\{H,\{F,G\}\}=0$。位相空間上の関数は、ポアソン括弧を Lie 括弧とする無限次元 Lie 代数をなす。

## 9. 量子力学の交換子との関係 ── そして、その対応の限界

量子力学では物理量は演算子になり、交換子 $[\hat A,\hat B]:=\hat A\hat B-\hat B\hat A$ が定義され、正準共役な位置・運動量は $[\hat q,\hat p]=i\hbar$ をみたす。古典のポアソン括弧と量子の交換子は、半古典的には

$$\{F,G\}_{\text{Poisson}} \;\longleftrightarrow\; \frac{1}{i\hbar}[\hat F,\hat G]_{\text{commutator}}$$

で対応する。量子化とは(おおまかには)ポアソン括弧を $i\hbar$ 倍の交換子に置き換える操作 ── 正準量子化の素朴な表現だ。

<figure>
<svg viewBox="0 0 470 168" width="100%" style="max-width:470px;display:block;margin:8px auto" role="img" aria-label="ポアソン括弧と交換子の対応とその限界">
  <defs><marker id="pb2" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#5a4f3f"/></marker></defs>
  <g font-family="serif" font-size="11" fill="#2b2118">
    <text x="118" y="22" text-anchor="middle" font-size="11" fill="#2f5d7c">古典(ポアソン括弧)</text>
    <rect x="40" y="32" width="156" height="26" fill="#eef5fa" stroke="#2f5d7c"/><text x="118" y="49" text-anchor="middle">{q,p} = 1</text>
    <rect x="40" y="64" width="156" height="26" fill="#eef5fa" stroke="#2f5d7c"/><text x="118" y="81" text-anchor="middle">{F,G}</text>
    <text x="352" y="22" text-anchor="middle" font-size="11" fill="#5a6e4a">量子(交換子)</text>
    <rect x="274" y="32" width="156" height="26" fill="#eef1ea" stroke="#5a6e4a"/><text x="352" y="49" text-anchor="middle">[q̂,p̂] = iℏ</text>
    <rect x="274" y="64" width="156" height="26" fill="#eef1ea" stroke="#5a6e4a"/><text x="352" y="81" text-anchor="middle">[F̂,Ĝ] / (iℏ)</text>
    <line x1="196" y1="45" x2="272" y2="45" stroke="#5a4f3f" stroke-width="1.3" marker-end="url(#pb2)"/>
    <line x1="196" y1="77" x2="272" y2="77" stroke="#5a4f3f" stroke-width="1.3" marker-end="url(#pb2)"/>
    <text x="235" y="40" text-anchor="middle" font-size="9" fill="#8a7f6c">量子化</text>
    <!-- GvH caveat -->
    <rect x="40" y="110" width="390" height="40" rx="4" fill="#f6e7e3" stroke="#b1342a" stroke-width="1.3"/>
    <text x="235" y="127" text-anchor="middle" font-size="10" fill="#b1342a">完全な対応は不可能(Groenewold–van Hove の no-go)</text>
    <text x="235" y="142" text-anchor="middle" font-size="9.5" fill="#8a7f6c">線形・二次までは整合、次数3以上(q³,p³…)で順序の曖昧さが破る</text>
  </g>
</svg>
<figcaption><b>図2 ─ 対応と、その限界.</b> $\{q,p\}=1\to[\hat q,\hat p]=i\hbar$、$\{F,G\}\to[\hat F,\hat G]/(i\hbar)$ は低次では整合するが、**全観測量で成り立つ完全な量子化写像は存在しない**(Groenewold–van Hove)。次数 $3$ 以上の多項式で順序の曖昧さが対応を破る。素朴な正準量子化は「先頭次数の橋」であって厳密な関手ではない。<i>(概念図)</i></figcaption>
</figure>

**ただし、この対応は厳密な等式ではない。** Groenewold–van Hove の no-go 定理によれば、位相空間の多項式観測量すべてを、ポアソン括弧を $\frac{1}{i\hbar}$ 倍の交換子へ忠実に写し、かつ $q,p$ の標準的量子化と整合する量子化写像は **存在しない**。整合するのは線形・二次まで(本記事の $\{q,p\}=1\to[\hat q,\hat p]=i\hbar$ はその範囲)で、$q^3,p^3$ のような次数 $3$ 以上では演算子の順序の曖昧さが現れ、対応が破れる。素朴な正準量子化は「先頭次数で正しい橋」であって、厳密な Lie 代数の同型ではない。

記法注意:古典は $\{F,G\}$(波括弧)、量子は $[\hat A,\hat B]$(角括弧)。冒頭ノートの $[F,G]$ は古典のポアソン括弧の意図で、衝突しやすいので文脈で必ず確認する。

## 10. まとめ:一つの行列式が位相空間の幾何を語る

最初の手書きの式は二つの読みを許す ── 多変数微積分としてのヤコビアン(面積比)と、解析力学としてのポアソン括弧。そこに $\{q,p\}=1$(正準共役性)、$\dot F=\{F,H\}$(時間発展)、$\{F,H\}=0\Rightarrow F$ 保存(保存量・対称性)、$\{F,G\}\leftrightarrow[\hat F,\hat G]/(i\hbar)$(量子化、ただし低次のみ)が重なる。ひとつの $2\times2$ 行列式の中に、ヤコビアン・面積要素・正準座標・ハミルトン力学・保存則・量子化の入口が同時に折り畳まれていた ── 地味な微分計算に見えた式が、位相空間の幾何そのものを語っていた。

> **横断メモ(物理クラスタの結節点).** $\dot F=\{F,H\}$ は、量子の $\dot F=\frac{1}{i\hbar}[\hat F,\hat H]$ の古典版で、$H$ が時間発展の生成子であること(別記事「生成子が見えると量子力学はわかる」)を位相空間で書いたものだ。$\{F,H\}=0$(保存)は量子の $[\hat F,\hat H]=0$(保存・同時測定可能)に対応する。そして対称性 → 保存量の話は、ラグランジアン側ではネーターの定理(別記事「ネーターの定理の δL=dg/dt」)になる。生成子・ネーター・ポアソン括弧は、**「連続対称性 ↔ 保存量」を、ヒルベルト空間・配位空間・位相空間の三つの舞台で書いた同じ一つの定理**だ。

---

## 査読・限界(解説モード)

- **依拠する標準事実**:ポアソン括弧の定義とヤコビアン表示、$\{q,p\}=1$、ハミルトン方程式 $\dot F=\{F,H\}$、保存則 $\{F,H\}=0$、ポアソン括弧の Lie 代数性質(反対称・双線形・ライプニッツ・ヤコビ)、正準量子化の $\{,\}\leftrightarrow\frac{1}{i\hbar}[,]$ 対応。標準的な解析力学・量子力学。
- **境界(否定形)**:量子化対応は低次(線形・二次)で整合するが、**Groenewold–van Hove の no-go 定理**により、全多項式観測量を保つ完全な量子化写像は存在しない(次数 $3$ 以上で順序の曖昧さ)。「ポアソン括弧 → 交換子」は厳密な同型でなく先頭次数の対応である。
- 既知の理論の解説であり、新規主張を含まない。
