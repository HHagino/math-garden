---
title: "岩澤理論と Selmer 群 — p 進 L 関数と BSD 予想の橋渡し"
date: 2026-05-23
status: 墓場
audience: 楕円曲線・類体論の基礎を一度通った人向け
prerequisite: 楕円曲線 (Silverman 第1部)、ガロワコホモロジー、円分体の基礎
---

## 1. 動機 — 古典 L 関数と数論的不変量の橋渡し

L 関数の特殊値が数論的不変量を符号化する、という主題は数論幾何の中心問題群を貫いている:

- **類数公式** (Dirichlet 1839 が二次形式で示し、Dedekind が一般の数体へ拡張): 数体 K のデデキント zeta 関数 ζ_K(s) の s = 0 での挙動が、K の類数 h_K と単数群の regulator R_K を符号化
- **BSD 予想** (Birch, Swinnerton-Dyer, 1965): 楕円曲線 E/ℚ の L 関数 L(E, s) の s = 1 での挙動が Mordell-Weil 群 E(ℚ) のランクと Tate-Shafarevich 群 Ш(E/ℚ) を符号化

両者ともに、 **解析的な対象(L 関数)** と **代数的な対象(類群・Mordell-Weil 群)** を結びつけている。岩澤理論はこの橋渡しを p 進的に体系化する枠組みである。

岩澤健吉 (1917-1998) が 1950 年代後半から開発したこの理論は

- 古典的な L 関数を p 進的に補間する **p 進 L 関数** を構成
- 円分塔上の Galois 加群を **岩澤代数 Λ = ℤ_p[[T]]** 上の加群として体系化
- 両者を結びつける **岩澤主予想** を定式化

という三つの柱で構成される。

---

## 2. 円分塔と岩澤代数

### 2.1 円分 ℤ_p 塔

数体 K (本稿では主に K = ℚ を扱う)に対し、円分塔

$$ K_\infty := \bigcup_{n \geq 0} K(\zeta_{p^{n+1}}) $$

(K_n := K(ζ_{p^{n+1}}))を考える。Gal(K_n/K) は (ℤ/p^{n+1})^× の部分群と同型で(K = ℚ なら全体)、p > 2 のとき

$$ \operatorname{Gal}(K(\zeta_{p^\infty})/K) \hookrightarrow \mathbb{Z}_p^\times \cong \mathbb{Z}/(p-1) \times \mathbb{Z}_p $$

と分解する(K = ℚ なら最初の ↪ は同型。一般の K では像は開部分群で、たとえば K = ℚ(ζ_p) なら像は 1 + pℤ_p)。

純粋に p 進的な情報を取り出すには、torsion 部分 ℤ/(p-1) を割り捨て:

$$ K_\infty^{(p)} := K_\infty^{\Delta}, \quad \Delta := \operatorname{Gal}(K(\zeta_p)/K) \hookrightarrow (\mathbb{Z}/p)^\times $$

の不変体を取る(Δ は Gal(K_∞/K) の有限な torsion 部分と同一視する。K = ℚ なら Δ ≅ (ℤ/p)^×、K = ℚ(ζ_p) なら Δ = 1)。これを **円分 ℤ_p 拡大** という。Gal(K_∞^{(p)}/K) ≅ ℤ_p (位相同型。一般の K でも、像の pro-p 部分は 1 + pℤ_p の開部分群なので ℤ_p と同型)。

このため、岩澤理論の典型的な舞台は

$$ \Gamma := \operatorname{Gal}(K_\infty^{(p)} / K) \cong \mathbb{Z}_p $$

である。

### 2.2 岩澤代数

Γ ≅ ℤ_p の完備群環

$$ \Lambda := \mathbb{Z}_p[[\Gamma]] := \varprojlim_n \mathbb{Z}_p[\Gamma/\Gamma^{p^n}] $$

を **岩澤代数** という。Γ の位相生成元 γ を一つ固定すると

$$ \Lambda \cong \mathbb{Z}_p[[T]] \quad (\gamma - 1 \leftrightarrow T) $$

と同型。すなわち岩澤代数は変数 T を持つ p 進形式幂級数環である。

### 2.3 Λ の構造

岩澤代数 Λ は次の重要な性質を持つ:

- **完備局所環** (maximal ideal は (p, T))
- **二次元正則局所環** (depth = Krull dim = 2)
- **準局所 UFD** (因子分解が一意的、Weierstrass 予備定理が成立)

Weierstrass 予備定理:

> 任意の 0 ≠ f ∈ Λ は f = p^μ · u · g と一意分解できる(u は単位、g は distinguished polynomial、μ ≥ 0)。

これにより Λ 加群の構造定理が古典的(有限生成 Λ-加群 M は、擬同型(有限な核と余核を持つ準同型)を除いて Λ^r ⊕ ⊕ Λ/(p^{μ_i}) ⊕ ⊕ Λ/(f_j^{n_j}) の形になる。直和分解そのものは成り立たない:たとえばイデアル (p, T) ⊂ Λ は階数 1 の torsion-free 加群だが自由ではない)。岩澤理論はこの分解と L 関数を結びつける。

### 2.4 円分指標

Γ 上の岩澤代数を扱うとき、円分指標

$$ \chi_{cyc} \colon \Gamma \to 1 + p \mathbb{Z}_p \subset \mathbb{Z}_p^\times $$

(γ ↦ χ_{cyc}(γ) で γ・ζ_{p^n} = ζ_{p^n}^{χ_{cyc}(γ)} を満たす)が canonical に存在する。これは Γ ≅ 1 + pℤ_p の標準的な同型を与え、岩澤理論の指標の基準点となる。

---

## 3. 岩澤の構造定理

### 3.1 設定

基礎体 ℚ の上に、§2.1 の塔 K_n = ℚ(ζ_{p^{n+1}}) (ζ_p まで含めた円分体の塔。これは K = ℚ(ζ_p) の円分 ℤ_p 拡大の層でもある)を取る。各 K_n のイデアル類群を A_n とし、その p 部分を A_n^{(p)} とする。これらは Galois 群 Γ ≅ ℤ_p と Δ = Gal(ℚ(ζ_p)/ℚ) の作用を受ける。ℚ 自身の円分 ℤ_p 拡大の層を取ると、岩澤の定理(p ただ一つが完全分岐する ℤ_p 拡大では p | h(K_n) ⟺ p | h(K))により各層で p ∤ h となり、以下の X_∞ は 0 になって主張が空になる。

射影極限

$$ X_\infty := \varprojlim_n A_n^{(p)} $$

(ノルム写像で射影極限を取る)を考える。これは岩澤代数 Λ 上の有限生成 torsion 加群である(Iwasawa-Serre)。

### 3.2 岩澤の構造定理

**岩澤 1959 (Theorem):**

X_∞ は有限生成 Λ-torsion 加群で、特性多項式 (characteristic ideal) を

$$ \text{char}_\Lambda(X_\infty) = (p^{\mu}) \cdot (f(T)) $$

と書くとき、各 K_n の類数 |A_n^{(p)}| は次の漸近公式を満たす:

$$ \operatorname{ord}_p(|A_n^{(p)}|) = \mu p^n + \lambda n + \nu \quad (n \gg 0) $$

ここで μ は p のべき部分、λ = deg f は **岩澤 λ 不変量**、ν は constant。

これは類数の p 部分が円分塔の各段で「ほぼ線型に」増えることを示す驚くべき主張で、岩澤理論の出発点。

### 3.3 Ferrero-Washington 定理

Ferrero-Washington (1979) はさらに次を示した:

> ℚ(ζ_p) (より一般に任意の abelian 数体)の円分 ℤ_p 拡大では μ = 0。

これによってこの塔では λ-不変量と ν のみが本質的なパラメータとなり、岩澤主予想の精密化が可能になる。

---

## 4. p 進 L 関数

### 4.1 Kubota-Leopoldt の p 進 zeta 関数

Kubota-Leopoldt (1964) は古典的なリーマン zeta 関数 ζ(s) の負の奇数での値

$$ \zeta(1-2k) = -\frac{B_{2k}}{2k} \quad (k \geq 1) $$

(B_{2k} は Bernoulli 数)を、p 進的に補間する p 進 L 関数 L_p(s, χ) を構成した。

性質:

- L_p(s, χ): s ∈ ℤ_p 上で連続(s = 1 を除く)
- χ が偶指標で k ≥ 1 のとき: L_p(1 - k, χ) = -(1 - χω^{-k}(p) p^{k-1}) B_{k, χω^{-k}} / k(ω は Teichmüller 指標。Euler 因子付き)
- これは古典的 L 関数の特殊値を p 進的に補間したもの

### 4.2 岩澤代数の元としての p 進 L 関数

岩澤 (1969, "On p-adic L-functions", Ann. of Math. 89) は Kubota-Leopoldt L_p(s, χ) (χ ≠ 1) を岩澤代数 Λ の元として表した(Mazur はのちに同じものを p 進測度で構成し直した):

> L_p(χ) ∈ Λ_χ = 𝒪_χ[[T]](𝒪_χ は χ の値を ℤ_p に添加した環。§5 で使う χ = ω^j のように値が ℤ_p に入るなら Λ = ℤ_p[[T]] そのもの)を、各 s = 1 - k での値が古典的 L 関数の特殊値になるような幂級数として canonical に与えられる(χ = 1 のときは s = 1 に極があり、Λ の元ではなく分母 T − (κ − 1) を持つ)。

これによって p 進 L 関数は「岩澤代数の中の元」として位置付けられる。

### 4.3 補間性

p 進 L 関数 L_p ∈ Λ は、s ∈ ℤ_p に値を取る連続関数として、対応する古典的 L 関数の値を p 進的に補間する:

$$ L_p(\chi_{cyc}^{1-k}) = L(\chi\omega^{-k}, 1 - k) \cdot (\text{Euler factor at p}). $$

ここで χ_{cyc}^{1-k} は円分指標の (1-k) 乗を岩澤代数 Λ に持ち込んだもの。右辺の指標は §4.1 と同じく Teichmüller 指標 ω で捻った χω^{-k} で、k によって変わる(捻らずに k によらない指標の値を並べると、偶指標では 3 以上の奇数の k で 0、偶数の k で 0 でなくなり、k について p 進的に連続な関数にならない)。

---

## 5. 岩澤の主予想

### 5.1 主予想 (statement)

**岩澤の主予想** (Mazur-Wiles 1984、Wiles 1990 で完成):

> 岩澤加群の特性イデアルと p 進 L 関数が、Δ の奇指標成分ごとに等しい(i は奇数で i ≢ 1 (mod p−1)〔i ≡ 1 では右辺の L_p が極を持ち、左辺の成分は 0〕、ω は Teichmüller 指標、右辺は Kubota-Leopoldt の L_p(s, ω^{1-i}) を Λ の元として見たもの):
> $$ \text{char}_\Lambda(X_\infty^{(\omega^i)}) = (L_p(\omega^{1-i})). $$

すなわち、解析側(p 進 L 関数 L_p ∈ Λ)と代数側(岩澤加群 X_∞ の characteristic ideal)が完全に一致する。

これは

- **解析的**: 古典的 L 関数の特殊値を p 進的に補間したもの
- **代数的**: イデアル類群の射影極限の Λ-加群構造

の同一性を主張する深い予想で、Mazur-Wiles 1984 が ℚ の円分塔について証明、Wiles 1990 が任意の totally real number field に拡張、Skinner-Urban 2014 が GL_2 over ℚ の場合(楕円曲線方向)を一定の条件下で証明した(§5.2)。

### 5.2 楕円曲線方向の岩澤主予想

楕円曲線 E/ℚ に対する岩澤主予想は次のように述べられる:

E/ℚ が good ordinary reduction at p を持つとし、

- 解析側: p 進 L 関数 L_p(E, T) ∈ Λ(Mazur-Swinnerton-Dyer 1974 の構成)
- 代数側: ℚ の円分 ℤ_p 拡大 ℚ_∞ := K_∞^{(p)}(§2.1 で K = ℚ。第 n 層 ℚ_n は [ℚ_n : ℚ] = p^n)上の Selmer 群の双対 X_∞(E) := Sel_{p^∞}(E/ℚ_∞)^∨ = lim_n Sel_{p^∞}(E/ℚ_n)^∨。§3 の塔 ℚ(ζ_{p^{n+1}}) で取ると Δ の全指標の成分(L_p(E) を Δ の指標でねじったものに対応する)を含む大きな加群になり、ひとつの L_p(E) とは比べられない(Skinner–Urban も ℚ_∞ で定式化する)

これに対し

$$ \text{char}_\Lambda(X_\infty(E)) = (L_p(E)). $$

Skinner-Urban (2014) はこの予想を、p で good ordinary など一定の条件下で(Kato による片側の割り切りと合わせて)証明し、帰結として「E(ℚ) と Ш(E/ℚ)[p^∞] が有限なら L(E, 1) ≠ 0」(rank 0 の場合の BSD の逆向き)を得た。

---

## 6. Selmer 群と BSD 予想

### 6.1 Selmer 群の定義

楕円曲線 E/K に対し、Selmer 群

$$ \operatorname{Sel}_{p^\infty}(E/K) := \ker\left( H^1(G_K, E[p^\infty]) \to \prod_v H^1(G_{K_v}, E[p^\infty]) / \operatorname{image of } E(K_v) \right) $$

を定義する。これは「各局所点 v での "局所的に rational points から来る" 1 次コホモロジー類」の集合。

### 6.2 主要完全列

Selmer 群を、E の Mordell-Weil 群と Tate-Shafarevich 群に結びつける完全列:

$$ 0 \to E(K) \otimes \mathbb{Q}_p / \mathbb{Z}_p \to \operatorname{Sel}_{p^\infty}(E/K) \to \Sha(E/K)[p^\infty] \to 0. $$

このため Selmer 群は

- Mordell-Weil 群 E(K) の rank 情報
- Tate-Shafarevich 群 Ш(E/K) の p 部分

を符号化している。

### 6.3 corank と BSD

Selmer 群の corank (= Pontryagin 双対の ℤ_p 上の階数。Sel_{p^∞}(E/K) ≅ (ℚ_p/ℤ_p)^r ⊕ (有限群) と書いたときの r)

$$ \operatorname{corank}_{\mathbb{Z}_p} \operatorname{Sel}_{p^\infty}(E/K) = \operatorname{rank}(E(K)) + \operatorname{corank} \Sha(E/K)[p^\infty]. $$

Tate-Shafarevich 群が有限(Shafarevich–Tate 予想。BSD とは別の予想)と仮定すれば、corank = rank。

これより BSD 予想は次の同値な定式:

> rank E(K) = ord_{s=1} L(E, s) = corank Sel_{p^∞}(E/K) (有限性仮定下).

岩澤主予想は L(E, s) を p 進的に補間した L_p(E) ∈ Λ の零位を扱うので、これと Selmer 群の岩澤加群構造を結びつけることで BSD の p 進版に向かう。

### 6.4 BSD の p 進版

p で good ordinary か乗法的還元を持つ E/ℚ に対する BSD の p 進版(p-adic BSD conjecture):

$$ \operatorname{ord}_{T=0} L_p(E, T) = \operatorname{rank} E(\mathbb{Q}) + \mathbb{1}_{\text{p-adic exceptional}}. $$

ここで右辺の補正項は、E が p で分裂乗法的還元を持つときだけ 1 になる(補間因子が s = 1 で消えて L_p に余分な零点ができる。exceptional zero)。good ordinary なら補正項は 0。

これは Mazur-Tate-Teitelbaum (1986) の予想で、先頭係数を p 進 regulator(p 進高さ対の判別式)で表す式も含む(分裂乗法的還元のときは L 不変量の因子が加わる)。good ordinary の場合、主予想が成り立てば、零位がちょうど rank に等しいことは p 進高さ対の非退化性(Schneider の予想)と Ш(E/ℚ)[p^∞] の有限性に当たる。

---

## 7. Coates-Wiles 定理と Euler system

### 7.1 Coates-Wiles 定理

最初の BSD への部分的進展:

**Coates-Wiles (1977):** E/ℚ が CM by 𝒪_F (虚二次体) を持ち、L(E, 1) ≠ 0 ならば、E(ℚ) は有限群。

すなわち **analytic rank 0 ⇒ Mordell-Weil rank 0** (CM 楕円曲線の場合)。これは BSD の最初の証明例である。

### 7.2 証明の概略

Coates-Wiles の証明は CM の特殊性(対応する Hecke 指標 ψ_E)と岩澤理論を組み合わせる:

1. CM の場合、L(E/ℚ, s) は虚二次体 F の Hecke 指標 ψ の L 関数 L(ψ, s) に一致する(二つの Hecke L 関数の積 L(ψ, s) L(\bar ψ, s) になるのは、F 上に持ち上げた L(E/F, s) のほう)
2. ψ の岩澤 L 関数 L_p(ψ) を構成し、これと Selmer 群を結びつける
3. 楕円単数と明示的相互法則(Coates-Wiles 準同型)を用いて Selmer 群を bound する(のちに Rubin がこの議論を **Euler system** (Kolyvagin 1988-90 が導入、Kato が 1990 年代に modular な場合へ拡張) の枠で捉え直した)
4. これにより L(E, 1) ≠ 0 ⇒ Selmer 群が有限、ゆえに E(ℚ) も有限

Euler system は「L 関数の特殊値情報を運ぶコホモロジー類の整合系列」で、岩澤理論の現代的中核技術。

### 7.3 Gross-Zagier から Kolyvagin へ

- **Gross-Zagier (1986):** Heegner 点の高さと L'(E, 1) の関係(rank 1 への展開)
- **Kolyvagin (1989):** Euler system による Heegner 点を用いた Selmer 群の bound

これにより BSD の analytic rank ≤ 1 の場合に大幅な進展。

### 7.4 現代: Skinner-Urban とその後

**Skinner-Urban (2014):** Eisenstein イデアル法を用いて GL_2 over ℚ の岩澤主予想を証明、ordinary な多くの楕円曲線について主予想の両側の割り切り(Kato の片側と合わせて)を確立。

最近の進展(Wan, Kato, Liu など)により、BSD は p 進的にはかなり精密に理解されつつある。古典的(complex)BSD の完全証明は依然として未解決。

---

## 8. まとめ

1. 円分 ℤ_p 塔 K_∞^{(p)} 上の Galois 加群を、岩澤代数 Λ = ℤ_p[[T]] 上の加群として体系化
2. 岩澤の構造定理(1959): 類数の p 部分が漸近的に μ p^n + λ n + ν と振る舞う
3. Kubota-Leopoldt の p 進 L 関数 L_p ∈ Λ が、古典 L 関数の特殊値を p 進的に補間
4. **岩澤主予想**: char_Λ(X_∞^{(ω^i)}) = (L_p(ω^{1-i}))(奇数 i ≢ 1 (mod p−1) の成分ごと)、すなわち解析と代数の同一性
5. 楕円曲線方向: char_Λ(X_∞(E)) = (L_p(E)) (Skinner-Urban 2014、p で good ordinary などの条件下)
6. Selmer 群が Mordell-Weil 群と Tate-Shafarevich 群を符号化、BSD 予想と直結
7. Coates-Wiles 1977 が CM の場合の analytic rank 0 ⇒ algebraic rank 0 を証明、のちの Euler system 技術の先駆(名称は Kolyvagin 以後)
8. 現代: Skinner-Urban, Kato, Wan などにより BSD への進展が続く

岩澤理論は L 関数論と Galois 加群論の統一を p 進的に実現する深い枠組みで、現代数論幾何の中心トピックの一つである。

---

## 参考文献

#### 入門

- Washington, *Introduction to Cyclotomic Fields* (Springer GTM 83) — 円分体と岩澤理論の標準的入門
- Coates-Sujatha, *Cyclotomic Fields and Zeta Values* — Coates-Wiles, BSD 接続の入門

#### 標準

- Iwasawa, *Lectures on p-adic L-functions* (Princeton 1972) — 原典
- Greenberg, *Iwasawa Theory for Elliptic Curves* (CIME LNM 1716, 1999)
- Lang, *Cyclotomic Fields I, II* (Springer)

#### 専門

- Mazur-Wiles, *Class fields of abelian extensions of ℚ* (Invent. Math. 1984) — 岩澤主予想の最初の証明
- Wiles, *The Iwasawa conjecture for totally real fields* (Ann. Math. 1990)
- Skinner-Urban, *The Iwasawa main conjectures for GL_2* (Invent. Math. 2014)
- Kato, *p-adic Hodge theory and values of zeta functions of modular forms* (Astérisque 2004)
- Coates, Schmidt, *Iwasawa theory for the symmetric square of an elliptic curve* (J. Reine Angew. Math. 375/376 (1987), 104–156)
