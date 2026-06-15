---
title: 可換な対角化可能行列は同時対角化できる ── 固有空間の入れ子で見る証明
date: 2026-05-20
updated: 2026-06-02
tags: [線形代数, 同時対角化, 可換行列, 対角化可能性, 固有空間, 最小多項式, 表現論入口, CSCO]
status: done
level: 数学解説(線形代数を一度学んだ読者向け)
related:
---

# 可換な対角化可能行列は同時対角化できる ── 固有空間の入れ子で見る証明

## 1. 導入:この事実は何を言っているのか

手元の数学ノートに、次の事実の証明スケッチが書き込まれていた。

> $A, B \in M_n(\mathbb{C})$ が可換($AB = BA$)で、両方とも対角化可能なら、同じ基底で同時に対角化できる。

つまり、$A$ と $B$ を同時に対角行列にする共通の基底変換 $P \in \mathrm{GL}_n(\mathbb{C})$ が存在する。「両方が対角化可能」だけでは足りない ── 同時対角化には可換性 $AB = BA$ が要る。この記事では、その議論を「構造が見える証明」として再構成し、具体行列で手を動かし、なぜ可換性が鍵なのかを最後まで見る。

## 2. 定理

**定理.** $A, B \in M_n(\mathbb{C})$ がともに対角化可能で $AB = BA$ をみたすとき、ある $P \in \mathrm{GL}_n(\mathbb{C})$ が存在して $P^{-1}AP$ と $P^{-1}BP$ の両方が対角行列になる。同じことだが、$A$ と $B$ の共通固有ベクトルからなる基底 $\{v_1, \ldots, v_n\}$ が取れる。

## 3. まず $A$ の固有空間で分解する

$A$ の相異なる固有値を $\lambda_1, \ldots, \lambda_k$、固有空間を $V_i = \{v \mid A v = \lambda_i v\}$ とする。$A$ が対角化可能なので

$$\mathbb{C}^n = V_1 \oplus V_2 \oplus \cdots \oplus V_k.$$

各 $V_i$ 上で $A$ はスカラー倍 $\lambda_i \cdot \mathrm{id}_{V_i}$ として働く。これが第一段階だ。

## 4. 可換性が意味すること:$B$ は $A$ の固有空間を保つ

ここで $AB = BA$ が効く。$v \in V_i$($Av = \lambda_i v$)とすると、

$$A(Bv) = B(Av) = B(\lambda_i v) = \lambda_i (Bv).$$

つまり $Bv$ もまた固有値 $\lambda_i$ の $A$-固有ベクトルで、$B(V_i) \subseteq V_i$。**$B$ は $A$ の各固有空間を不変に保つ。** これが可換性の幾何的意味であり、同時対角化の鍵だ。おかげで $B$ を $\mathbb{C}^n$ 全体で一気に扱う必要はなく、各 $A$-固有空間ごとに切り分けられる。

## 5. 各固有空間の中で $B$ を対角化する

各 $V_i$ への制限 $B|_{V_i}$ を考える(第4節のおかげで意味を持つ)。**$B|_{V_i}$ も対角化可能だ。** 理由:$B$ が対角化可能 $\iff$ 最小多項式 $m_B$ が相異なる一次式の積に分解($\mathbb C$ 上)。$B|_{V_i}$ の最小多項式は $m_B$ を割るので、やはり相異なる一次式の積に分解し、対角化可能。よって各 $V_i$ をさらに $B|_{V_i}$ の固有空間に分けられる:

$$V_i = W_{i,1} \oplus \cdots \oplus W_{i, m_i}, \qquad W_{i,j} = \{v \in V_i \mid B v = \mu_{i,j} v\}.$$

## 6. 共通固有ベクトル基底の完成

各 $W_{i,j}$ から基底を取り全部集めると、$\mathbb{C}^n$ の基底ができる。各 $v \in W_{i,j}$ は

$$A v = \lambda_i v, \qquad B v = \mu_{i,j} v$$

を *同時に* 満たす ── $A$ と $B$ の共通固有ベクトルだ。この基底で両方が対角行列になり、定理が示せた。$\blacksquare$

## 7. 手で動かす ── 3×3 で確かめる

抽象論を一度、数で踏む。

$$A=\begin{pmatrix}2&0&0\\0&2&0\\0&0&5\end{pmatrix},\qquad B=\begin{pmatrix}0&1&0\\1&0&0\\0&0&7\end{pmatrix}.$$

まず $AB=BA$ を確認(両方 $\begin{psmallmatrix}0&2&0\\2&0&0\\0&0&35\end{psmallmatrix}$ になる)。$A$ は固有値 $2$(重複度 $2$)と $5$ を持ち、固有空間は $V_1=\mathrm{span}(e_1,e_2)$、$V_2=\mathrm{span}(e_3)$。$A$ だけでは $V_1$ の中の向きは決まらない(縮退している)。

ここで $B$ が $V_1$ を割る。$B|_{V_1}=\begin{psmallmatrix}0&1\\1&0\end{psmallmatrix}$ の固有値は $\pm1$、固有ベクトルは $(1,1)$ と $(1,-1)$。$V_2$ では $B$ は $7$ 倍。共通固有基底は

$$v_1=(1,1,0),\ v_2=(1,-1,0),\ v_3=(0,0,1),$$

それぞれ $(A,B)$ の固有値が $(2,1),\ (2,-1),\ (5,7)$。**$A$ が潰せなかった縮退を $B$ が割って、二つの量で各ベクトルに番地がつく。** これが同時対角化だ。

<figure>
<svg viewBox="0 0 470 176" width="100%" style="max-width:470px;display:block;margin:8px auto" role="img" aria-label="二段の固有空間細分">
  <defs><marker id="sd1" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#5a4f3f"/></marker></defs>
  <g font-family="serif" font-size="10.5" fill="#2b2118">
    <!-- step 0 -->
    <rect x="20" y="40" width="120" height="30" fill="#f7f2e6" stroke="#6b5d44"/><text x="80" y="60" text-anchor="middle">ℂ³</text>
    <text x="80" y="30" text-anchor="middle" font-size="9.5" fill="#8a7f6c">出発</text>
    <line x1="142" y1="55" x2="166" y2="55" stroke="#5a4f3f" stroke-width="1.3" marker-end="url(#sd1)"/>
    <text x="154" y="46" text-anchor="middle" font-size="8.5" fill="#8a7f6c">A で分解</text>
    <!-- step 1: A eigenspaces -->
    <rect x="168" y="40" width="80" height="30" fill="#eef5fa" stroke="#2f5d7c"/><text x="208" y="60" text-anchor="middle">V₁ (A=2)</text>
    <rect x="168" y="78" width="80" height="26" fill="#eef5fa" stroke="#2f5d7c"/><text x="208" y="95" text-anchor="middle">V₂ (A=5)</text>
    <line x1="250" y1="55" x2="274" y2="55" stroke="#5a4f3f" stroke-width="1.3" marker-end="url(#sd1)"/>
    <text x="262" y="46" text-anchor="middle" font-size="8.5" fill="#8a7f6c">B で細分</text>
    <!-- step 2: B refines V1 -->
    <rect x="276" y="34" width="120" height="22" fill="#eef1ea" stroke="#5a6e4a"/><text x="336" y="49" text-anchor="middle">W₁₁: A=2, B=1 → (1,1,0)</text>
    <rect x="276" y="58" width="120" height="22" fill="#eef1ea" stroke="#5a6e4a"/><text x="336" y="73" text-anchor="middle">W₁₂: A=2, B=−1 → (1,−1,0)</text>
    <rect x="276" y="82" width="120" height="22" fill="#eef1ea" stroke="#5a6e4a"/><text x="336" y="97" text-anchor="middle">V₂: A=5, B=7 → (0,0,1)</text>
  </g>
  <text x="235" y="138" text-anchor="middle" font-family="serif" font-size="10.5" fill="#8a7f6c">A の縮退(V₁)を B が割り、二量(A,B)で各ベクトルに番地がつく</text>
</svg>
<figcaption><b>図1 ─ 二段の固有空間細分.</b> まず $A$ の固有値で $\mathbb C^3$ を $V_1,V_2$ に割る。可換性ゆえ $B$ は各 $V_i$ を保つので、その内部で $B$ をさらに対角化できる。$A$ が潰せない縮退 $V_1$ を $B$ が $(1,1,0),(1,-1,0)$ に割る ── これが同時対角化の機構。<i>(概念図)</i></figcaption>
</figure>

## 8. 二つの条件はどちらも要る ── 否定形

**対角化可能性が欠けると:** $A$ や $B$ がジョルダンブロックを持つと固有空間が空間を埋めず、同時対角化はできない。可換なら *同時上三角化* までは行けるが、対角化は無理だ。

**可換性が欠けると:** §4 の計算が崩れ、$B$ が $A$-固有空間を保たない。具体的に、Pauli 行列

$$\sigma_x=\begin{pmatrix}0&1\\1&0\end{pmatrix},\qquad \sigma_z=\begin{pmatrix}1&0\\0&-1\end{pmatrix}$$

を見る。両方とも対角化可能(固有値 $\pm1$)だが、$\sigma_x\sigma_z=\begin{psmallmatrix}0&-1\\1&0\end{psmallmatrix}\neq\sigma_z\sigma_x=\begin{psmallmatrix}0&1\\-1&0\end{psmallmatrix}$ で **非可換**。$\sigma_z$ の固有ベクトルは $e_1,e_2$ だが、$\sigma_x e_1=e_2\notin\mathrm{span}(e_1)$ ── $\sigma_x$ は $\sigma_z$ の固有空間を保たない。実際、両者に共通の固有ベクトルは存在しない。同時対角化は不可能だ。

<figure>
<svg viewBox="0 0 460 168" width="100%" style="max-width:460px;display:block;margin:8px auto" role="img" aria-label="可換は固有空間を保つ、非可換は保たない">
  <defs>
    <marker id="sd2" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#5a6e4a"/></marker>
    <marker id="sd3" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#b1342a"/></marker>
  </defs>
  <g font-family="serif" font-size="11" fill="#2b2118">
    <text x="116" y="20" text-anchor="middle" font-size="11" fill="#5a6e4a">可換:B は V_i を保つ</text>
    <rect x="56" y="34" width="120" height="80" fill="#eef1ea" stroke="#5a6e4a" stroke-width="1.4"/>
    <text x="116" y="50" text-anchor="middle" font-size="10" fill="#8a7f6c">A-固有空間 Vᵢ</text>
    <circle cx="90" cy="84" r="3" fill="#2b2118"/><text x="80" y="80" font-size="9">v</text>
    <line x1="90" y1="84" x2="150" y2="84" stroke="#5a6e4a" stroke-width="1.6" marker-end="url(#sd2)"/>
    <text x="130" y="104" text-anchor="middle" font-size="9" fill="#5a6e4a">Bv も Vᵢ 内</text>
    <line x1="230" y1="14" x2="230" y2="150" stroke="#b9ac95" stroke-width="1" stroke-dasharray="3 3"/>
    <text x="344" y="20" text-anchor="middle" font-size="11" fill="#b1342a">非可換(σₓ,σ_z):保たない</text>
    <rect x="284" y="34" width="120" height="80" fill="#f6e7e3" stroke="#b1342a" stroke-width="1.4"/>
    <text x="344" y="50" text-anchor="middle" font-size="10" fill="#8a7f6c">σ_z-固有空間 span(e₁)</text>
    <circle cx="312" cy="88" r="3" fill="#2b2118"/><text x="304" y="84" font-size="9">e₁</text>
    <line x1="312" y1="88" x2="312" y2="128" stroke="#b1342a" stroke-width="1.6" marker-end="url(#sd3)"/>
    <text x="356" y="124" text-anchor="middle" font-size="9" fill="#b1342a">σₓe₁=e₂ は外へ</text>
  </g>
</svg>
<figcaption><b>図2 ─ 否定形:可換性がないと崩れる.</b> 可換なら $B$ は $A$ の固有空間を内側に保ち、その中で対角化できる。非可換($\sigma_x,\sigma_z$)だと $\sigma_x$ が $\sigma_z$ の固有空間を外へ送り、共通固有ベクトルが存在しない ── 両方とも対角化可能でも、同時対角化はできない。<i>(概念図)</i></figcaption>
</figure>

## 9. まとめ:同時対角化の本質、そしてどこに効くか

> **可換性によって一方の固有空間分解を他方が尊重するため、その内部でさらに対角化できる。これが同時対角化の仕組みである。**

「両方とも対角化可能」だけでは足りず、可換性が第一の対角化を第二が壊さないことを保証する。鍵は一点 ── 可換性が誘導する固有空間の不変性。

この「片方の構造を保つ条件があれば、その内部でさらに分解できる」という議論は、線形代数を超えて至るところに現れる。

> **横断メモ(庭の結節点).**
> - **量子力学**:可換な観測量だけが同時に確定値を持てる(同時固有基底)。$[L_x,L_y]=i\hbar L_z\neq0$ ゆえ角運動量の三成分は同時対角化できず、$H,L^2,L_z$ のような**可換観測量の完全系(CSCO)**を選ぶ ── §8 の Pauli の話は、まさにスピン $S_x,S_z$ を同時測定できないことだ(別記事「生成子が見えると量子力学はわかる」)。
> - **Galois 理論**:アーベル(可換)Galois 群の元 $\sigma$ たちは同時対角化でき、拡大体が指標ごとの $1$ 次元固有空間に割れる。非可換だと $2$ 次元以上の既約ブロックが残る ── この定理の Galois 版が、別記事「Galois 理論を線形代数として見る」§6–§7 そのもの。
>
> 可換性が同時対角化を許し、非可換性がそれを阻む ── この一つの線形代数の事実が、量子力学の同時測定可能性と、Galois 群がアーベルか否かを、同じ顔で説明している。

---

## 査読・限界(解説モード)

- **依拠する標準事実**:対角化可能 $\iff$ 最小多項式が相異なる一次式の積に分解($\mathbb C$ 上)、制限の最小多項式が全体の最小多項式を割ること、直和分解。標準的な線形代数。
- **境界**:(i) 対角化可能性が欠けると同時対角化不可、可換性下でも同時上三角化まで。(ii) 可換性が欠けると共通固有基底が一般に存在しない(§8 の Pauli 行列が具体反例)。
- 本記事は既知の定理の再構成(構造の見える証明＋具体例)であり、新規主張を含まない。
