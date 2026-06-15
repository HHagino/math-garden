---
title: ネーターの定理の δL=dg/dt を、有限変換の境界項を微分した微小版として理解する
date: 2026-05-20
updated: 2026-06-02
tags: [ネーター定理, 解析力学, 変分原理, 対称性, 保存量, 1パラメータ変換, ラグランジアン, 全微分, 境界項, ガリレイ変換]
status: done
level: 数学解説(解析力学を学んでいる読者向け)
related:
---

# ネーターの定理の $\delta L = dg/dt$ を、有限変換の境界項を微分した微小版として理解する

## 導入:なぜ $L(\text{後}) - L(\text{前}) = dG/dt$ が奇妙に見えるのか

ネーターの定理を学ぶと、たいてい次の条件が出てくる:ラグランジアン $L$ は変換によって全微分だけ変わってもよい ── ある $G$ があって $L(\text{変換後})-L(\text{変換前})=\dfrac{dG}{dt}$。そして微小版として $\delta L=\dfrac{dg}{dt}$ が現れる。

ここでふと違和感を持つ。「$G$ 自身も変換前後で違うはずだから、本当は $\dfrac{dG}{dt}(\text{前}\to\text{後})-\dfrac{dG}{dt}(\text{前}\to\text{前})$ を、微小変換のパラメータで割って微分する話では?」── この直観はかなり正しい。本記事では有限変換から微小変換へ降りる過程として $\delta L=dg/dt$ を読み直し、最後に保存量を具体的な $L$ で計算する。

## 1. ラグランジアンは厳密に不変でなくてよい

作用は $S[q]=\int_{t_1}^{t_2}L\,dt$ なので、$L$ に全微分が加わっても $\int_{t_1}^{t_2}\frac{dG}{dt}dt=G(t_2)-G(t_1)$ となり、寄与は端点項のみ。端点固定の変分では運動方程式が変わらない。だから要求すべきは **作用の不変性(端点項を除いた不変性)** であって、$L$ そのものの厳密な不変性ではない。ある $G$ があって $L(\text{後})-L(\text{前})=\dfrac{dG}{dt}$ が成り立てば十分だ。この $G$ が、後で保存量に効いてくる。

## 2. 有限変換を 1 パラメータ族として見る

変換をパラメータ $s$ で書く:$q(t)\mapsto q_s(t)$、$q_0(t)=q(t)$。$s=0$ が恒等変換、$s$ を動かすと変換が連続的に進む。ラグランジアンも $L_s(t)=L(q_s,\dot q_s,t)$ となり、全微分条件は有限の $s$ で

$$L_s - L_0 = \frac{d}{dt}(G_s - G_0)$$

と書ける。恒等変換で $G_0=0$(または定数)に取れば、実質 $L_s-L_0=\dfrac{dG_s}{dt}$ ── 冒頭の素朴な書き方の正確版だ。

<figure>
<svg viewBox="0 0 460 192" width="100%" style="max-width:460px;display:block;margin:8px auto" role="img" aria-label="1パラメータ変換族を s=0 で微分する">
  <defs><marker id="nt1" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#b1342a"/></marker></defs>
  <line x1="36" y1="160" x2="430" y2="160" stroke="#6b5d44" stroke-width="1.2"/>
  <text x="434" y="164" font-family="serif" font-size="11" fill="#5a4f3f">t</text>
  <!-- family of paths q_s -->
  <path d="M60,150 C160,120 280,110 410,70" fill="none" stroke="#b9ac95" stroke-width="1.4"/>
  <path d="M60,150 C160,108 280,92 410,52" fill="none" stroke="#2f5d7c" stroke-width="2.4"/>
  <path d="M60,150 C160,96 280,74 410,34" fill="none" stroke="#b9ac95" stroke-width="1.4"/>
  <text x="416" y="52" font-family="serif" font-size="10.5" fill="#2f5d7c">q₀=q (s=0)</text>
  <text x="416" y="34" font-family="serif" font-size="9.5" fill="#8a7f6c">q_s</text>
  <text x="416" y="74" font-family="serif" font-size="9.5" fill="#8a7f6c">q_s</text>
  <!-- vertical arrow = ds derivative -->
  <line x1="250" y1="100" x2="250" y2="68" stroke="#b1342a" stroke-width="1.6" marker-end="url(#nt1)"/>
  <text x="256" y="86" font-family="serif" font-size="10" fill="#b1342a">∂/∂s|₀ = δq</text>
  <text x="150" y="184" text-anchor="middle" font-family="serif" font-size="10" fill="#8a7f6c">s で微分(s=0)すると δq, δL, g が出る</text>
</svg>
<figcaption><b>図1 ─ 有限変換を $s=0$ で微分する.</b> 変換は経路の $1$ パラメータ族 $q_s(t)$。$s=0$ の経路が変換前。パラメータ方向の微分 $\partial/\partial s|_0$ が、微小変位 $\delta q$、ラグランジアンの微小変化 $\delta L$、微小境界関数 $g$ を生む。<i>(概念図)</i></figcaption>
</figure>

## 3.「前 → 後」minus「前 → 前」の正体

「$L(\text{後})-L(\text{前})=dG/dt$」をより丁寧に読むと、「前→後」は有限変換($s\neq0$、$G_s$)、「前→前」は恒等変換($s=0$、$G_0$)。だから冒頭の直観 $\frac{dG}{dt}(\text{前}\to\text{後})-\frac{dG}{dt}(\text{前}\to\text{前})$ は、正確には $\frac{d}{dt}(G_s-G_0)$ で、$G_0=0$ なら $\frac{dG_s}{dt}$ そのものだ。教科書は暗黙に $G_0=0$ と正規化している。

## 4. パラメータで割って微分すると $\delta L=dg/dt$

微小変換へ降りる。両辺を $s$ で割って $s\to0$:

$$\delta L := \left.\frac{dL_s}{ds}\right|_{0}, \qquad \frac{dg}{dt} := \frac{d}{dt}\left(\left.\frac{dG_s}{ds}\right|_{0}\right),\qquad g:=\left.\frac{dG_s}{ds}\right|_{0}.$$

よって $\boxed{\delta L=\dfrac{dg}{dt}}$。$g$ は有限変換の境界関数 $G_s$ をパラメータ方向に微分した微小版だ。一文で言えば:**$\delta L=dg/dt$ は「有限変換で $L$ が全微分だけ変わる」条件を、変換パラメータ方向に微分した微小版である。**

## 5. ネーターの保存量

$\delta L=dg/dt$ を Euler–Lagrange 方程式 $\frac{\partial L}{\partial q}-\frac{d}{dt}\frac{\partial L}{\partial\dot q}=0$ と組むと

$$\frac{d}{dt}\left(\frac{\partial L}{\partial\dot q}\,\delta q - g\right)=0,\qquad\text{すなわち}\quad \boxed{Q:=\frac{\partial L}{\partial\dot q}\,\delta q - g}$$

が運動方程式の解の上で保存する($\delta q:=\frac{dq_s}{ds}|_0$ は対称性のベクトル場)。**$g$ は保存量から差し引かれる境界補正項として、ここで初めて意味を持つ。**

<figure>
<svg viewBox="0 0 470 132" width="100%" style="max-width:470px;display:block;margin:8px auto" role="img" aria-label="対称性と運動方程式から保存量へ">
  <defs><marker id="nt2" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto"><path d="M0 0 L6 3 L0 6 z" fill="#5a4f3f"/></marker></defs>
  <g font-family="serif" font-size="10.5" fill="#2b2118">
    <rect x="16" y="22" width="150" height="30" rx="4" fill="#eef1ea" stroke="#5a6e4a"/><text x="91" y="41" text-anchor="middle">対称性:δL = dg/dt</text>
    <rect x="16" y="78" width="150" height="30" rx="4" fill="#eef5fa" stroke="#2f5d7c"/><text x="91" y="97" text-anchor="middle">Euler–Lagrange 方程式</text>
    <line x1="166" y1="37" x2="240" y2="58" stroke="#5a4f3f" stroke-width="1.4" marker-end="url(#nt2)"/>
    <line x1="166" y1="93" x2="240" y2="72" stroke="#5a4f3f" stroke-width="1.4" marker-end="url(#nt2)"/>
    <rect x="244" y="50" width="210" height="30" rx="4" fill="#f0e3c4" stroke="#c89b3c"/><text x="349" y="69" text-anchor="middle">d/dt ( ∂L/∂q̇ · δq − g ) = 0</text>
    <text x="349" y="98" text-anchor="middle" font-size="9.5" fill="#8a7f6c">保存量 Q = ∂L/∂q̇ · δq − g</text>
  </g>
</svg>
<figcaption><b>図2 ─ 対称性 × 運動方程式 → 保存量.</b> 微小対称性 $\delta L=dg/dt$ と Euler–Lagrange 方程式を組み合わせると、$Q=\frac{\partial L}{\partial\dot q}\delta q-g$ が保存する。境界補正 $g$ がここで効く。<i>(概念図)</i></figcaption>
</figure>

## 6. 手で動かす ── 自由粒子で $g=0$ と $g\neq0$ を見る

自由粒子 $L=\tfrac12 m\dot q^2$ で、二つの対称性を実際に回す。

**(a) 空間並進(g=0).** $q_s=q+s$、$\delta q=1$。$\dot q_s=\dot q$ なので $L_s=L_0$、$\delta L=0$、よって $g=0$。保存量は

$$Q=\frac{\partial L}{\partial\dot q}\cdot1-0=m\dot q\quad(\text{運動量}).$$

並進対称 → 運動量保存。境界項は要らない。

**(b) ガリレイ・ブースト(g≠0).** $q_s=q+s\,t$、$\delta q=t$。$\dot q_s=\dot q+s$ なので

$$L_s=\tfrac12 m(\dot q+s)^2=\tfrac12 m\dot q^2+m\dot q\,s+\tfrac12 m s^2,\qquad \delta L=\left.\frac{dL_s}{ds}\right|_0=m\dot q.$$

$L$ は不変ではない($\delta L\neq0$)。だが $m\dot q=\dfrac{d}{dt}(mq)$ なので、これは全微分 ── $g=mq$ と取れて $\delta L=dg/dt$ が成り立つ(まさに準対称性)。保存量は

$$Q=\frac{\partial L}{\partial\dot q}\,\delta q-g=m\dot q\cdot t-mq=m(\dot q\,t-q).$$

検算:$\dot Q=m(\ddot q\,t+\dot q-\dot q)=m\ddot q\,t=0$(自由粒子 $\ddot q=0$)。保存する。$Q=-m\bigl(q-\dot q\,t\bigr)$ は質量×初期位置にあたり、重心が等速直線運動することの保存則だ。**もし $g$ を落としていたら $m\dot q\,t$ だけが残り、保存しない。$g=mq$ こそが保存量を閉じさせている。** これが、本記事が $g$ にこだわった理由である。

## 7. 否定形と注意

**時間も変換する場合。** ここまでは $q$ だけの変換。時間並進・Lorentz 変換など $t$ 自体が変わる場合は $L$ でなく $L\,dt$ の変化を見る必要があり、$\delta(L\,dt)=(\delta L)dt+L(\delta\,dt)$ の第二項が追加される(時間並進ならハミルトニアン $H$ が保存量として出る)。

**Noether が効かない場合(否定形).** ネーターの定理は **変分原理(ラグランジアン)を持つ系**でのみ働く。摩擦・散逸のある系は一般にラグランジアンを持たず、時間並進対称性に対応するエネルギー保存が崩れる ── 対称性があっても、それを保存量に翻訳する変分の足場がなければ Noether は回らない。また「$\delta L$ がどんな $g$ を取っても全微分にならない」変換は、そもそも(準)対称性ではなく、保存量を生まない。

## まとめ

冒頭の素朴な直観 ──「$dG/dt(\text{前}\to\text{後})-dG/dt(\text{前}\to\text{前})$ を $s$ で割って微分」── はほぼ正しかった。正確には、有限変換の条件 $L_s-L_0=\frac{d}{dt}(G_s-G_0)$ を $s$ 方向に微分して $\delta L=dg/dt$ が出る($g=\frac{dG_s}{ds}|_0$)。あとは Euler–Lagrange と組んで $Q=\frac{\partial L}{\partial\dot q}\delta q-g$ を構成する ── それがネーターの定理本体だ。自由粒子のガリレイ・ブースト($g=mq$)が、境界項 $g$ の働きを一番はっきり見せてくれる。

> **横断メモ.** この「連続対称性 → 保存量」は、量子力学では「$H$ と可換な観測量(生成子)が保存する」として現れる(別記事「生成子が見えると量子力学はわかる」§5)。Noether はその**古典・ラグランジアン側の相方**だ。さらに、対称性を生成子(無限小変換)に落とす操作そのものは、有限変換 $U(s)=e^{-isG/\hbar}$ を $s=0$ で微分して $G$ を取り出す手つきと同じ ── 本記事の「有限変換を $s$ で微分して微小版を得る」は、生成子を取り出す所作の解析力学版である。次の一歩(位相空間での括弧)は別記事「ポアソン括弧」へ。

---

## 査読・限界(解説モード)

- **依拠する標準事実**:端点固定変分で全微分項が運動方程式に効かないこと、Euler–Lagrange 方程式、Noether の第一定理($\delta L=dg/dt$ から $Q=\frac{\partial L}{\partial\dot q}\delta q-g$ の保存)。標準的な解析力学。
- **§6 の計算**:自由粒子 $L=\frac12 m\dot q^2$ で、空間並進 → $Q=m\dot q$(運動量、$g=0$)、ガリレイ・ブースト → $Q=m(\dot q t-q)$($g=mq\neq0$、$\dot Q=m\ddot q t=0$)。検算済み。
- **境界(否定形)**:時間変換を含む完全形は $L\,dt$ の変化が要る(§7)。Noether は変分原理を持つ系に限り、散逸系では一般に成り立たない。
- 既知の定理の導出の読み直しであり、新規主張を含まない。
