---
title: "岩澤理論と Selmer 群 — p 進 L 関数と BSD 予想の橋渡し"
date: 2026-05-23
status: 墓場
audience: 楕円曲線・類体論の基礎を一度通った人向け
prerequisite: 楕円曲線 (Silverman 第1部)、ガロワコホモロジー、円分体の基礎
---

## 1. 動機 — 古典 L 関数と数論的不変量の橋渡し

L 関数の特殊値が数論的不変量を符号化する、という主題は数論幾何の中心問題群を貫いている:

- **類数公式** (Dedekind, 1894): 数体 K のデデキント zeta 関数 ζ_K(s) の s = 0 での挙動が、K の類数 h_K と単数群の regulator R_K を符号化
- **BSD 予想** (Birch, Swinnerton-Dyer, 1965): 楕円曲線 E/ℚ の L 関数 L(E, s) の s = 1 での挙動が Mordell-Weil 群 E(ℚ) のランクと Tate-Shafarevich 群 Ш(E/ℚ) を符号化

両者ともに、 **解析的な対象(L 関数)** と **代数的な対象(類群・Mordell-Weil 群)** を結びつけている。岩澤理論はこの橋渡しを p 進的に体系化する枠組みである。

岩澤健吉 (1924-1998) が 1950 年代後半から開発したこの理論は

- 古典的な L 関数を p 進的に補間する **p 進 L 関数** を構成
- 円分塔上の Galois 加群を **岩澤代数 Λ = ℤ_p[[T]]** 上の加群として体系化
- 両者を結びつける **岩澤主予想** を定式化

という三つの柱で構成される。

---

## 2. 円分塔と岩澤代数

### 2.1 円分 ℤ_p 塔

数体 K (本稿では主に K = ℚ を扱う)に対し、円分塔

$$ K_\infty := \bigcup_{n \geq 0} K(\zeta_{p^{n+1}}) $$

(K_n := K(ζ_{p^{n+1}}))を考える。Gal(K_n/K) は (ℤ/p^{n+1})^× の(部分)群と同型で、p > 2 のとき

$$ \operatorname{Gal}(K(\zeta_{p^\infty})/K) \cong \mathbb{Z}_p^\times \cong \mathbb{Z}/(p-1) \times \mathbb{Z}_p $$

と分解する。

純粋に p 進的な情報を取り出すには、torsion 部分 ℤ/(p-1) を割り捨て:

$$ K_\infty^{(p)} := K_\infty^{\Delta}, \quad \Delta := \operatorname{Gal}(K(\zeta_p)/K) \cong (\mathbb{Z}/p)^\times $$

の不変体を取る。これを **円分 ℤ_p 拡大** という。Gal(K_∞^{(p)}/K) ≅ ℤ_p (位相同型)。

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

これにより Λ 加群の構造定理が古典的(有限生成 Λ-加群は torsion 部分と free 部分に分かれ、torsion 部分は ⊕ Λ/(p^{μ_i}) ⊕ ⊕ Λ/(f_i^{n_i}) と分解)。岩澤理論はこの分解と L 関数を結びつける。

### 2.4 円分指標

Γ 上の岩澤代数を扱うとき、円分指標

$$ \chi_{cyc} \colon \Gamma \to 1 + p \mathbb{Z}_p \subset \mathbb{Z}_p^\times $$

(γ ↦ χ_{cyc}(γ) で γ・ζ_{p^n} = ζ_{p^n}^{χ_{cyc}(γ)} を満たす)が canonical に存在する。これは Γ ≅ 1 + pℤ_p の標準的な同型を与え、岩澤理論の指標の基準点となる。

---

## 3. 岩澤の構造定理

### 3.1 設定

K = ℚ, K_∞^{(p)} = ℚ の円分 ℤ_p 拡大。各 K_n のイデアル類群を A_n とし、その p 部分を A_n^{(p)} とする。これらは Galois 群 Γ = ℤ_p の作用を受ける。

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

> K = ℚ の円分 ℤ_p 拡大では μ = 0。

これによって ℚ 上では λ-不変量と ν のみが本質的なパラメータとなり、岩澤主予想の精密化が可能になる。

---

## 4. p 進 L 関数

### 4.1 Kubota-Leopoldt の p 進 zeta 関数

Kubota-Leopoldt (1964) は古典的なリーマン zeta 関数 ζ(s) の負の偶数での値

$$ \zeta(1-2k) = -\frac{B_{2k}}{2k} \quad (k \geq 1) $$

(B_{2k} は Bernoulli 数)を、p 進的に補間する p 進 L 関数 L_p(s, χ) を構成した。

性質:

- L_p(s, χ): s ∈ ℤ_p 上で連続(s = 1 を除く)
- χ が偶指標で k ≥ 1 のとき: L_p(1 - k, χ) = -(1 - χ(p) p^{k-1}) B_{k, χ} / k(Euler 因子付き)
- これは古典的 L 関数の特殊値を p 進的に補間したもの

### 4.2 Mazur の岩澤代数解釈

Mazur は Kubota-Leopoldt L_p(s, χ) を岩澤代数 Λ の元として再解釈した:

> L_p(χ) ∈ Λ = ℤ_p[[T]] を、各 s = 1 - k での値が古典的 L 関数の特殊値になるような幂級数として canonical に与えられる。

これによって p 進 L 関数は「岩澤代数の中の元」として位置付けられる。

### 4.3 Mazur-Wiles の補間性

p 進 L 関数 L_p ∈ Λ は、s ∈ ℤ_p に値を取る連続関数として、対応する古典的 L 関数の値を p 進的に補間する:

$$ L_p(\chi_{cyc}^{1-k}) = L(\chi^{-1}, 1 - k) \cdot (\text{Euler factor at p}). $$

ここで χ_{cyc}^{1-k} は円分指標の (1-k) 乗を岩澤代数 Λ に持ち込んだもの。

---

## 5. 岩澤の主予想

### 5.1 主予想 (statement)

**岩澤の主予想** (Mazur-Wiles 1984、Wiles 1990 で完成):

> 岩澤加群の特性イデアルと p 進 L 関数が等しい:
> $$ \text{char}_\Lambda(X_\infty) = (L_p). $$

すなわち、解析側(p 進 L 関数 L_p ∈ Λ)と代数側(岩澤加群 X_∞ の characteristic ideal)が完全に一致する。

これは

- **解析的**: 古典的 L 関数の特殊値を p 進的に補間したもの
- **代数的**: イデアル類群の射影極限の Λ-加群構造

の同一性を主張する深い予想で、Mazur-Wiles 1984 が ℚ の円分塔について証明、Wiles 1990 が任意の totally real number field に拡張、Skinner-Urban 2014 が GL_2 over ℚ の場合(楕円曲線方向)を証明した。

### 5.2 楕円曲線方向の岩澤主予想

楕円曲線 E/ℚ に対する岩澤主予想は次のように述べられる:

E/ℚ が good ordinary reduction at p を持つとし、

- 解析側: p 進 L 関数 L_p(E, T) ∈ Λ(Mazur-Swinnerton-Dyer 1974 の構成)
- 代数側: Selmer 群の双対の射影極限 X_∞(E) := lim_n Sel_{p^∞}(E/K_n)^∨

これに対し

$$ \text{char}_\Lambda(X_\infty(E)) = (L_p(E)). $$

Skinner-Urban (2014) はこの予想を、E/ℚ が rank ≥ 2 の場合の多くの条件下で証明し、BSD 予想の多くの場合への進展を与えた。

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

Selmer 群の corank (= ℤ_p 上の自由部分の階数)

$$ \operatorname{corank}_{\mathbb{Z}_p} \operatorname{Sel}_{p^\infty}(E/K) = \operatorname{rank}(E(K)) + \operatorname{corank} \Sha(E/K)[p^\infty]. $$

Tate-Shafarevich 群が有限(BSD の弱予想)と仮定すれば、corank = rank。

これより BSD 予想は次の同値な定式:

> rank E(K) = ord_{s=1} L(E, s) = corank Sel_{p^∞}(E/K) (有限性仮定下).

岩澤主予想は L(E, s) を p 進的に補間した L_p(E) ∈ Λ の零位を扱うので、これと Selmer 群の岩澤加群構造を結びつけることで BSD の p 進版に向かう。

### 6.4 BSD の p 進版

E/ℚ に対する BSD の p 進版(p-adic BSD conjecture):

$$ \operatorname{ord}_{T=0} L_p(E, T) = \operatorname{rank} E(\mathbb{Q}) + \mathbb{1}_{\text{p-adic exceptional}}. $$

ここで右辺の補正項は p における特殊な状況(exceptional zero)で生じる。

これは Mazur-Tate-Teitelbaum (1986) の予想で、特殊な状況(p-adic L 関数の Mazur-Tate-Teitelbaum 予想)の精密化を含む。

---

## 7. Coates-Wiles 定理と Euler system

### 7.1 Coates-Wiles 定理

最初の BSD への部分的進展:

**Coates-Wiles (1977):** E/ℚ が CM by 𝒪_F (虚二次体) を持ち、L(E, 1) ≠ 0 ならば、E(ℚ) は有限群。

すなわち **analytic rank 0 ⇒ Mordell-Weil rank 0** (CM 楕円曲線の場合)。これは BSD の最初の証明例である。

### 7.2 証明の概略

Coates-Wiles の証明は CM の特殊性(対応する Hecke 指標 ψ_E)と岩澤理論を組み合わせる:

1. CM の場合、L(E, s) は二つの Hecke L 関数 L(ψ, s) L(\bar ψ, s) に分解
2. ψ の岩澤 L 関数 L_p(ψ) を構成し、これと Selmer 群を結びつける
3. **Euler system** (Coleman 1979, Kato 1989-, Kolyvagin 1989 で発展) を構成し、Selmer 群を bound する
4. これにより L(E, 1) ≠ 0 ⇒ Selmer 群が有限、ゆえに E(ℚ) も有限

Euler system は「L 関数の特殊値情報を運ぶコホモロジー類の整合系列」で、岩澤理論の現代的中核技術。

### 7.3 Gross-Zagier から Kolyvagin へ

- **Gross-Zagier (1986):** Heegner 点の高さと L'(E, 1) の関係(rank 1 への展開)
- **Kolyvagin (1989):** Euler system による Heegner 点を用いた Selmer 群の bound

これにより BSD の analytic rank ≤ 1 の場合に大幅な進展。

### 7.4 現代: Skinner-Urban とその後

**Skinner-Urban (2014):** Eisenstein イデアル法を用いて GL_2 over ℚ の岩澤主予想を証明、ordinary な多くの楕円曲線について両側 (analytic rank ≤ 1) を確立。

最近の進展(Wan, Kato, Liu など)により、BSD は p 進的にはかなり精密に理解されつつある。古典的(complex)BSD の完全証明は依然として未解決。

---

## 8. まとめ

1. 円分 ℤ_p 塔 K_∞^{(p)} 上の Galois 加群を、岩澤代数 Λ = ℤ_p[[T]] 上の加群として体系化
2. 岩澤の構造定理(1959): 類数の p 部分が漸近的に μ p^n + λ n + ν と振る舞う
3. Kubota-Leopoldt の p 進 L 関数 L_p ∈ Λ が、古典 L 関数の特殊値を p 進的に補間
4. **岩澤主予想**: char_Λ(X_∞) = (L_p)、すなわち解析と代数の同一性
5. 楕円曲線方向: char_Λ(X_∞(E)) = (L_p(E)) (Skinner-Urban 2014)
6. Selmer 群が Mordell-Weil 群と Tate-Shafarevich 群を符号化、BSD 予想と直結
7. Coates-Wiles 1977 が CM の場合の analytic rank 0 ⇒ algebraic rank 0 を証明、Euler system 技術の濫觴
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
- Coates, Schmidt, *Iwasawa L-functions for elliptic curves with complex multiplication* (J. Reine Angew. Math. 1987)
