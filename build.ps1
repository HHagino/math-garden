# build.ps1 — 公開サイトのビルドスクリプト
# 墓場/ から「許可リスト($public)」に載ったファイルだけを 記事/ にコピーして quarto render する。
# 許可リスト方式: ここに名前を書かない限り、墓場/ に何を足しても絶対に公開されない。
#
# 使い方: 研究ノート/公開サイト/ で  pwsh ./build.ps1   （★ 2026-11-22〜 ふだんは pwsh ./暗号化して組む.ps1 から呼ぶ）
#   -SkipByHead … $publicByHead（頭の語で書いた記事）を入れずに組む（直している最中の記事を除いて試すとき）
#
# 公開判断のメモ:
#   - $held = 第一論文(filtration-galois)の核心に近い or 政治社会フレーム。公開前に本人確認。
#   - .html の完成教科書群は v1 では保留(フェーズ2で個別判断)。
#
# ★ 2026-11-22（萩野の決め）：庭はパスワード付き（StaticCrypt）で再開する。
#   出力は docs/ ではなく _plain/（git の外）。暗号化して docs/ に置くのは 暗号化して組む.ps1。
#   記事のソース（記事/・教科書/・この庭の作り方.md）は公開リポジトリに入れない（.gitignore）。

param([switch]$SkipByHead)

$ErrorActionPreference = 'Stop'
$src  = Join-Path $PSScriptRoot '..\墓場'
$dst  = Join-Path $PSScriptRoot '記事'

# --- 公開許可リスト(これだけが世に出る) ---
$public = @(
  # 数論・ガロア理論
  'galois-as-linear-algebra-eigenspace.md',
  'galois-quintic-solvable-classification.md',
  'solvable-group-radical-solvability-galois.md',
  '軌道固定群はG集合版の準同型定理_2026-06-02.md',
  'cm-elliptic-curves-kronecker-jugendtraum.md',
  'finite-infinite-primes-dirichlet-unit-theorem.md',
  'ideal-contravariance-hilbert-class-field.md',
  'hasse-principle-hilbert-symbol-rational-points.md',
  'l-adic-vs-p-adic-galois-representation.md',
  'tate-module-and-etale-cohomology.md',
  'perfectoid-tilting-motivation.md',
  'iwasawa-theory-selmer-introduction.md',
  'witt-vectors-artin-schreier-witt.md',
  'division-algebra-1248-projective-cohomology.md',
  'pythagoras-sqrt2-p-adic-mod-8.md',
  'truncated-multiple-zeta-sum-hoffman-duality.md',
  'jacobian-variety-divisor-of-points.md',
  'dedekind-e-extension-f-norm.md',
  # 幾何・トポロジー・物理
  'noether-theorem-finite-to-infinitesimal.md',
  'noether-1918-general-relativity-energy-problem.md',
  'laplace-beltrami-hodge-global-device.md',
  'spherical-laplacian-from-riemann-metric.md',
  'manifold-to-orbifold-symmetry-as-structure.md',
  'hyperbolic-circle-apollonius-cayley.md',
  'cylindrical-shell-to-aharonov-bohm.md',
  'poisson-bracket-jacobian-phase-space.md',
  'relativity-algebraic-rta-clifford-hurwitz.md',
  'special-relativity-as-completion-of-electromagnetism.md',
  'kinoshita-conjecture-irreducible-rp2-s4.md',
  '観測量は変換の生成子_2026-06-02.md',
  '縮約密度行列_部分トレースと同じか_2026-06-02.md',
  # 確率・情報・解析
  'nielsen-taxonomy-distances-divergences-map.md',
  'mle-as-orbit-closure-derksen-makam.md',
  'kpz-universality-class-introduction.md',
  'elo-rating-as-stochastic-gradient-logistic.md',
  'strichartz-confluence-of-modern-analysis.md',
  # 代数・圏論・基礎
  'linear-algebra-as-k-theory-of-point.md',
  'identity-map-as-tensor-coevaluation.md',
  'de-morgan-as-categorical-complement-duality.md',
  'epic-surjection-cover-distinction.md',
  'simultaneous-diagonalization-commuting-matrices.md',
  # （鶴亀算の K 理論は 2026-10-26 に $held へ移した＝萩野「41は外して」・冗談の読み物）
  '開集合の代数で登る_Rdiscと Zariski étale_2026-06-02.md',
  '離散直線はRnに埋め込めない_2026-06-02.md',
  '何を解と呼ぶのか_2026-06-02.md',
  '素数の足し算は人類に向いていない_2026-06-02.md',
  'math-history-meaning-catches-up-later.md',

  # --- 2026-08-15 追加(第2便) ---
  # 数論・ガロア理論
  '無限次Galois対応は位相が決める_2026-06-19.md',
  'なぜZariskiでは点が数えられないか_Weil予想とGrothendieck位相_2026-06-19.md',
  # 幾何・トポロジー
  '弧状連結単連結可縮_不変量は何を見て何を見落とすか_2026-06-19.md',
  # 作用素環・作用素空間
  '実構造は非可換でmodular共役Jになる_2026-06-20.md',
  '作用素空間_行列ノルムの塔が入り方を覚えている_2026-07-09.md',
  # 表現論(背骨1と背骨4の親記事)
  '有限群のフーリエはPeter-Weylである_指標表はどこから来るのか_2026-08-15.md',
  'Poisson和公式は格子で割ったPeter-Weylである_関数等式はどこから来るのか_2026-08-15.md',
  'Euler因子は局所Mellin変換である_ガンマ因子だけ形が違って見える理由_2026-08-15.md',
  # （LAOX 三部作は 2026-10-25 に $held へ移した＝萩野「冗談半分で出した記事…墓場向けのジョーク・公開しない」）

  # --- 2026-10-14 追加(第3便・本人の Yes 10/14。$held から移した) ---
  # 確率・情報・解析
  '伊藤補正は幾何ではない_Fisher弧長とDirichlet周期_2026-08-03.md',
  # 数論・算術幾何(既知の Arakelov 高さ公式の解説)
  '高さは単体上の平均エントロピーである_調和数が二度出る_2026-08-03.md',
  # グラフ・ゼータ・ランダムウォーク(前後編。片方だけ出さない)
  'Ihara三項式は木の初到達母関数である_2026-08-11.md',
  'ゼータは記憶から生まれる_ランダムウォークのゼータはGreen核に潰れる_2026-08-11.md',

  # --- 2026-11-22 追加(第4便・リーマン予想の棚・萩野 11/22 の決め＝パスワード付きで再開するときに載せる) ---
  #     （コンヌ・一元体・ガウス和・ヴェイユ表現の4本は下の $publicByHead に頭の語で書いた）
  'リーマン予想の証明を見つけたという主張を機械で確かめられる所と確かめられていない所に読み分ける_Lean形式証明の公開と検証の状況_2026-11-21時点.md',
  '素数を数える階段ψxはゼータの零点ごとの波を引いた形_零点10組と200組で階段に近づき跳びの所に揺れが残り_実部1÷2なら誤差は√x×log2乗の大きさ_2026-11-21.md',
  '重みつきの素数の和からXlogX−(1+γ)Xを引くとlog2πと絶対収束する零点の和が残る_X=10の6乗で11.040を零点100個で11.045_RHなら零点の和は√Xの0.0462倍以下_2026-11-21.md',
  '約数の和σnをeのγ乗×n×loglognと比べると5040では1.0056倍で上回り10080では0.9858倍_5040より大きいすべてのnで下回ることはリーマン予想と同値_ロバン1984_2026-11-21.md',
  'ゲナン＝ヴェイユの明示公式は零点の和を極とガンマの項と素数の和で書く等式_幅8のガウスで零点側0.0902823216と右辺が40桁で一致し素数側は0.00101_2026-11-21.md',
  '李の係数λnは零点が臨界線の上なら0以上の項の和でヴェイユの正値性を試験関数の列で見たもの_零点4520個の和とガンマと素数の側の式がn≤500で一致しλ1は0.0230957_2026-11-21.md',
  '整数には0でない微分が無く_代わりのフェルマー商δ(a)=(a-a5)÷5は積の規則を5δ(a)δ(b)の項だけ外し_25で割れるのはaとδ(a)がともに5で割れるとき_0から1万の全数で確かめた_2026-11-21.md',
  '拡大体の塔で定数を消す_すべてのnでずれがCかけるqのn÷2乗以下なら分子の逆数根は√q以下_F5のy2=x3-xは1.97以下で偽の分子1-5t+5t2は黄金比のn乗で伸びる_2026-11-21.md',
  'Stepanovの方法は点で何重にも消える多項式の次数で点を数える_F101のy2=x3+x+1では次数621の多項式が52点すべてで8重に消え_ずれは55以下_2026-11-21.md',
  'クルースターマン和はaとbが両方0でなければ2√pを超えない_p≤400の全素数で最大は2√pの0.9974倍_bを止めてaを動かした2乗の和はp2-p-1でp=397では157211_2026-11-21.md',
  '判別式−23の3つの形が表す個数の和は2Σχ(d)で差の半分はη(z)η(23z)の係数_n≤10の6乗で確かめた種の平均_素数をどの形が表すかはx3−x−1のmodpの根の数で決まる_2026-11-21.md',
  'ボストの傾きの不等式の芯は0でない整数ベクトルの長さは1以上_格子(1,0)(0.3,0.2)の傾き0.805_最短0.3606が張る部分格子は1.020_座標を読む写像のlog1.654を超えない_2026-11-21.md',
  '曲線と整数の対応表_Stepanovの五つの部品のうち重複度を安く出すp乗と微分だけが整数に無い_F49の楕円曲線では未知数45に条件44から点54個で消える関数が出る_2026-11-21.md',
  'リーマン予想への試み29件の年表_起点1と解析20と幾何6と非可換幾何2の道に分けこの年表でリーマン予想の形まで証明済みは有限体の上の類比だけ_歴史のハブ_2026-11-21.md',
  'ゼータの零点は臨界線の上に無限個ある_ハーディ1914_回して実数にしたZtは0から100で符号が29回変わり_積分の食い違いで示す道と原論文のテータと2p回微分の道_2026-11-21.md',
  'ド・ブラン＝ニューマンの定数Λ_熱の流れでtを下げると零点の対がぶつかり第9と第10はt＝−1.878で_リーマン予想はΛ≤0と同値でロジャーズ＝タオのΛ≥0の後はΛ＝0と同値_2026-11-21.md',
  'ナイマンバーリングの判定法_1÷kxの小数部分をk≤Nで重ねて定数1に近づけると距離の2乗はN1で0.858でN3000で0.00561_logN倍は0.044から0.048_0まで近づくことがリーマン予想と同値_2026-11-21.md',
  'Spec_Zの点は素イデアルpと0_整数nは点pでnをpで割った余りという値をとり12は点2と点3で0になる_1から1000の全部で0になる点は素因数に一致し重さとlog_pの積の和はlog_nになる_2026-11-21.md',
  '幾何の言葉は全体を動かす群から点の近くを見る環へ移った_クラインからグロタンディークまで_SpecZのD6の関数は6分の1を足した環で6を分母に許す局所化はD6への制限_2026-11-22.md',
  '有限体の滑らかな偶数次元の二次曲面の点の数は射影空間の点の数から±qのn÷2乗だけずれ_符号は中間コホモロジーが運ぶ_隣どうしの積の和はF5で806点_指数和は125_2026-11-22.md',
  '臨界線の上の零点の割合_セルバーグ1942は正_レヴィンソン1974は3分の1超_コンリー1989は5分の2超_数値の全部と定理の下限は別_2026-11-22.md',
  '3進法で数字2を使わない数は3つ並んだ等差数列を含まない_3のk乗未満に2のk乗個でk=8は6561個のうち256個_繰り上がらないのでx+z=2yならx=z_割合は2÷3のk乗で0に行く_2026-11-22.md',
  '3項の等差数列を含まない集合_底2d-1で各桁d-1以下かつ桁の2乗和が一定の数_10の6乗未満では3進の0と1だけの8192個が球面の1716個に勝ち10の16乗で1.03倍と上回る_2026-11-22.md',

  # --- 2026-11-22 追加(第5便・2周目・萩野 11/22「2周目もそのまま進めて」) ---
  #     公開版で外れていたリンクの先のうち、別の目の記録の「確実」が全部当たっていると 1 本ずつ確かめた 36 本
  #     （初めは 37 本。標数とは何か を後で外した）と、そのあと候補の表の上から確かめた分（下の「候補の表から」）。
  #     確かめの記録＝研究ノートの 庭のコース_道具/公開の2周目_確かめた記録_2026-11-22.md（題が入るので公開リポジトリには入れない）
  # ヴェイユ予想への道
  'ヴェイユ予想の4つの主張を道の章に1つずつ当てる_分母は1-tと1-qtでH0とH2_分子はH1_関数等式はポアンカレ双対_根の絶対値は重み_係数がベッティ数を写さない例がある_2026-11-14.md',
  '曲線のリーマン予想は楕円曲線ではハッセの不等式と同じ_1-at+qt2の根の絶対値が1÷√qになるのはa2が4q以下のときだけ_F5のy2=x3-xでは1+2t+5t2の根が絶対値1÷√5_2026-11-14.md',
  '有限体上のグラスマン多様体Gr24の点の数は1+q+2q2+q3+q4で係数1_1_2_1_1は複素Gr24のベッティ数_q2で35_q3で130_q1の6はオイラー標数_6個のシューベルト胞体が両方を数える_2026-11-14.md',
  '種数2の曲線ではゼータの分子が4次になりN1とN2の2つで決まる_F5のy2=x5+x+1は6点と46点から分子が1+5t2の2乗で根は全部絶対値1÷√5_t=1の値36はヤコビ多様体の点の数_2026-11-14.md',
  'ℓ進のテイト加群をFp上の楕円曲線で見る_点の数はp+1からフロベニウスの跡を引いた数_2026-10-30.md',
  'ゼータ関数の関数等式_tを1÷qtに替えるとZはqの1-g乗かけるtの2-2g乗倍になる_楕円曲線では分子のt2の係数がqなことだけから変換後のZが元のZに戻る_2026-11-14.md',
  '楕円曲線のゼータ関数は点の数N1ひとつで決まる_F5のy2=x3-xは8点からF25とF125とF625の32と104と640点を予言し数えた値と一致_2026-11-14.md',
  '楕円曲線の点を数える_y2=x3+Ax+Bの点はxごとに1+ルジャンドル記号個でN=p+1+記号の和_いつも差の絶対値は2√p以下_13以下の素数の全部の曲線で確かめる_2026-11-14.md',
  '有限体の上で点を数えてexpの和に束ねると有理関数になる_射影直線はN_nがq^n+1で1-t分の1と1-qt分の1の積_射影平面と円錐曲線も同じ型_2026-11-14.md',
  '有限体上の多項式環のゼータはモニック多項式を次数ごとに数えるだけで1-q^1-s分の1になる_既約モニックの数はEuler積とネックレス公式から出る_2026-11-14.md',
  '猫写像の行列は測地線の軸を1本決め長さは2arccosh1.5=4logφ_両端はφと−1_φで軸はiと1+iを通り曲面の上では半分の輪の往復_周期点は1_5_16_45_121_320_2026-11-14.md',
  # 数論・p 進・格子
  '格子のテータ級数は長さの2乗がnの点の個数の母関数でZ2では4(d1-d3)_六角格子は6Σχ-3_E8は240σ3と閉じ_変換則は双対格子のPoisson和公式から出る_2026-11-17.md',
  '素数はx以下にxをlogxで割った個数ほどある_10の8乗までで5761455個で比は1.06でゆっくりしか1に近づかず差は広がり続ける_2026-11-08.md',
  'ヘンゼルの補題_modpの解をmodpのn乗へ持ち上げる_2026-10-30.md',
  '999は−1_p進数の足し算は繰り上がりが左へ続く_2026-10-30.md',
  'オストロフスキーの定理_有理数の上の距離は実数とp進しかない_2026-10-30.md',
  'QpのHaar測度は球の大きさをpのマイナスn乗と置けば作れる_かけ算でaの大きさ倍になりZp×の大きさ1−1÷pで割るとゼータのp因子が出る_同じ数をp進数と読むと測度にならない_2026-11-20.md',
  '2次元の格子はガウスの簡約で最短のベクトルが出る_短いほうの整数倍を引き続けると最短と第2最短の基底になり3次元では最短が出るとは限らない_2026-11-18.md',
  '量子計算機は何を壊すか_ショアのアルゴリズムは周期を探す_因数分解を周期探しに直すのも番号から周期を読むのも古典で量子計算機は周期の山から番号を1つ引く_2026-10-31.md',
  # 代数（群・環・局所化）
  '群の準同型定理は核で割ると像になる_正規部分群は核になれる部分群_2026-10-30.md',
  # （標数とは何か＝B2 は 11/22 12:45 に外した：節 10「本線との関係」が研究計画の芯の見込み（Q(√5) だけが外れる）を書いている＝保型形式・h0 と同じ理由で萩野の Yes が先）
  '素イデアルは剰余環が整域のイデアルで極大イデアルは剰余環が体のイデアル_極大なら素だがZxの(x)は素で極大でなく(x,2)が極大_Z6の(6)は素でない_2026-11-13.md',
  '局所化は分母に許すものを選ぶ操作_Z_(p)はpの倍数を分母にできない分数の環で極大イデアルがただ一つ_0を分母に許すと零環でZ6は2を逆にすると3元の環_2026-11-13.md',
  '局所化は加群にも使えてその点の近くだけを見る操作_Z12を2の近くで見るとZ4で3の近くで見るとZ3で5の近くでは0_全部の点の近くで0に見える元は0しかない_2026-11-18.md',
  'ネーター環ではイデアルが全部有限生成で無限個の式の連立も有限個で足りべき和はp1p2p3で止まるが部分環Q+xQxyでは鎖が止まらない_2026-11-18.md',
  'ヒルベルト関数は点の集合の上で消える多項式を次数dごとに数えた残りでN点ならdがN-1以上でNになり9点では配置で分かれる_一般1_3_6_9_格子1_3_6_8_9_2026-11-17.md',
  # 位相・解析・測度
  '「すべての」と「ある」の順番を入れ替えると別の主張になる_ε-δの前の量化子の練習_2026-10-30.md',
  '位相は近さを開集合で決める約束_3点の集合の上には29通りで同じ形を同一視すると9通り_連続は開集合の逆像が開集合で距離があればε-δと同じ_2026-11-02.md',
  'ホモロジーは閉じているのに境界でないものを数える_中空の三角形では輪が一つ残り面を塗ると消える_2026-10-30.md',
  'べき級数の収束半径は中心から複素数まで含めて一番近い特異点までの距離_1÷(1+x2)の級数はx=1で発散し原因は実軸になく±iにある_2026-11-13.md',
  '1÷(eのx乗-1)を和に開くと積分はガンマ関数とゼータ関数の積になる_sが1より大きいときだけ収束しs2とs4で6分のπ2乗と15分のπ4乗s1では発散_2026-11-12.md',
  '長さ0の集合_有理数全体は長さ0でカントール集合は数えられないのに長さ0_段n後の長さは3分の2のn乗_除く長さを細くすると長さ1÷2が残る_2026-11-15.md',
  # 確率・情報・統計力学
  'アメナブル群のエルゴード定理_フェルナー列が平均の窓になる_2026-10-30.md',
  '双対平坦構造は対数分配関数とそのルジャンドル変換の組が決めKL情報量はその隙間_熱力学では自由エネルギーの余り_2026-11-01.md',
  '分配関数を逆温度でメリン変換するとゼータが出る_高温の展開1÷x−1÷2+x÷12の係数はs=1と0と−1の極の留数でζ(0)=−1÷2とζ(−1)=−1÷12になる_学習では低温の冪が極になる_2026-11-21.md',
  '無限次元の正規分布にはルベーグ測度と密度の形が無く確率過程量子化は2次元から止まった姿が関数に収まらない_ウィーナー測度の後半_2026-11-03.md',
  'ゼータ分布は素数で割れることが独立でオイラー積はその別の顔_素因数の個数の揺らぎはエルデシュカッツの定理で正規分布_2026-11-03.md',

  # --- 同じ第5便の続き（候補の表から・11/22 12:34〜 回線断のあとを引き継いだ担当）---
  #     庭のコース_道具/公開の候補_確証つき_2026-11-22.tsv の「候補」を表の順に上から見て、別の目の記録の「確実」が
  #     全部当たっていると記事の現物で 1 本ずつ確かめた 25 本（表のファイルの L2〜L29 の範囲。足さなかった AK01 の理由は記録に）。
  # 解析・確率・情報（候補の表から）
  'スターリングの公式_粗い式では10の階乗が約8倍ずれ半分log2πnを足すと誤差は12n分の1未満_定数√2πはウォリスの積から_2026-11-08.md',
  'ラグランジュの未定乗数法_平均4.5のサイコロでエントロピー最大の分布は確率が1.449のk乗に比例_乗数βは最大値の傾き_2026-11-08.md',
  'KL情報量は有限個の区間に分けて測ったKLの上限_ゲルファント＝ヤグロム＝ペレスの定理で平均が1ずれた正規分布を2のk乗等分すると下から1_2に近づき分け方を粗くすると減る_2026-11-18.md',
  '観測を丸めて失うフィッシャー情報量はスコアの条件つき分散の平均で丸めの幅の連続関数_正規分布では損失がh2乗を12で割った値に近づき符号だけ見ると2_π_2026-11-18.md',
  '確率には素因数分解の一意性に当たるものが無い_4点の一様分布は独立な2値の分割の組に3通りに割れ_素数ごとに独立に分かれるのはゼータ分布が素数から作られているから_2026-11-18.md',
  'キュリー＝ワイス模型の自由エネルギーは臨界温度でC1だがC2でない_逆温度が1を越えると2階微分が0から3÷2へ跳ね_n2000の厳密な和でも臨界の幅1÷√nの外で段差が見える_2026-11-18.md',
  '平方数の逆数の和は6分のπ2乗_4つの道具が別々の理由で着く_難所はフーリエ級数では完全性_留数定理では輪の上の評価_二重積分では角の広義積分_sinの無限積では積の公式_2026-11-13.md',
  'ガウス積分を4通りで解く_極座標とベータ関数と積分記号下の微分とウォリスの挟み撃ちは別々の難所を引き受け_πは4つとも角度を足す積分から入る_2026-11-13.md',
  '1÷(1+x2)の全直線の積分πは4通りで解けて入り口が別々_arctanは角度の全幅と留数は2πiと区間0から1の級数は剰余の評価_同じπに4つの道具が着く_2026-11-13.md',
  # 数論・群（候補の表から）
  'p進の単数aの冪はnをp−1で割った余りごとに分けるとp進で連続_9÷8の冪を5進で見ると余りが同じなら差の付値は指数の差の付値より1大きく違えば近づかない_2026-11-18.md',
  '2進の塔を崩さない入れ替えの群は反復リース積_段2で位数8の二面体群_段3で128_段4で32768_オドメーターの生む巡回群はその中の1つの選び方_2026-11-18.md',
  # アルゴリズム・暗号（候補の表から）
  '比べるだけで並べ替えるなら最悪でlog2n!の切り上げ回は比べる_n1000では8530回でn_log2_nだけの9966は17パーセント多すぎ_2026-11-20.md',
  'ディフィー＝ヘルマン鍵共有_累乗は速く指数に戻すのは遅い_公開の場で秘密の数をそろえる_2026-10-30.md',
  'シーザー暗号からワンタイムパッドへ_鍵が平文と同じ長さで一度きりなら暗号文は平文について何も教えない_2026-10-30.md',
  'ハッシュ関数と誕生日のパラドックス_衝突は出力の種類の平方根ほどの回数で見つかる_2026-10-30.md',
  '楕円曲線暗号の入口_群の言葉なしで点を足す_弦と接線の足し算はmodpでも閉じる_2026-10-30.md',
  '共通鍵暗号は置換と混ぜ合わせ_AESの一回分を4×4のバイトで追う_2026-10-30.md',
  '離散対数を解く速さ_総当たりと小さい歩幅大きい歩幅_2026-10-30.md',
  '格子暗号の入口_誤りを足した連立一次方程式LWEを2次元で見る_2026-10-30.md',
  # 地球・波・物理（候補の表から）
  '雲ができた空気は1km上がるごとに約4〜6.5Kしか冷えない_湿潤断熱減率は凝結の熱で決まり雲底は気温と露点の差1Kにつき約125m_雨を降らせて山を越えた20℃の風は風下で26.7℃_2026-11-19.md',
  '温室効果は気温が上ほど低いから効く_宇宙へ出る放射の温度255Kは約5kmの気温で地表との差は気温の減り方掛ける高さ_一様なら0_層1枚で303K_二酸化炭素2倍の3.7W_m2は応答なしで約1K_2026-11-19.md',
  'ダランベルシアンは時間の2階微分をc2で割ったものから空間の2階微分を引いた演算子_x2+t2は解で右へ進む波と左へ進む波の平均でx2−t2は当てると−4_2026-11-14.md',
  'キルヒホッフの公式_3次元の波の値は半径ctの球面の上の初期値の平均で決まり球の内側は効かない_半径1の球を叩くと中心はt1で0に戻り距離3の点は2から4の間だけ揺れる_2026-11-18.md',
  '積雲1つ一辺1kmの箱に含まれる水は約500トン_雲の水は1立方メートルあたり約0.5gで空気の2000分の1_半径10μmの雲粒は約1.2cm_sでしか落ちず上昇気流1m_sに負ける_2026-11-19.md',
  '水の波の速さはgと長さ1つで決まる_深い水では波長で周期10秒のうねりは156mで15_6m_s_浅い水では深さで水深4000mの津波は198m_s_波長1_7cmより短いと表面張力が効いて最小は23cm_s_2026-11-19.md'
)

# --- 頭の語で書く許可（2026-11-22）：直している最中で、題（＝ファイル名）が変わりうる記事 ---
#     墓場/ の .md で、名前がこの語で始まるものが「ちょうど1本」のときだけ $public に足す。0 本・2 本以上なら止まる。
#     題が決まったら、上の $public に名前ごと移して、ここから消してよい。
$publicByHead = @(
  'コンヌの跡公式は',
  '一元体の上の幾何は',
  'ガウス和の2乗は±p',
  'SL2(Fp)のヴェイユ表現は'
)

# --- 保留中(本人確認後に $public へ移す) ---
$held = @(
  'nakayama-and-basu-reflects-zero-parallel.md',       # 第一論文の核心(Basu=中山0次)に近い
  'probability-space-stone-reading-galois-tower.md',   # 同上(filtration↔Galois)
  'dei-markov-kernel-mathematical-perfume.md',         # DEI フレーム(実名公開で政治色)
  'moral-hazard-as-welfare-dissipation-observation-kernel.md',  # モラルハザード/厚生フレーム

  # --- 2026-08-15 追加。理由は「次の一本(トラック2)の候補そのもの」 ---
  # ⚠️ paper1 は「正しく新しい」が 0 件でトラック1(Expositiones)へ回した。
  #    トラック2 = 次の一本が研究の本体。その探索の中身を先に公開するかは戦略判断。
  #    【10/14】伊藤補正・高さ・Ihara・ゼータの4本は本人の Yes で $public へ移した（未公開の線への言及は削ってある）。
  '非可換性は情報を覚えているか_遠アーベル幾何と局所体の反例_2026-08-10.md', # Galois 側の核心に寄る
  '補集合は複素共役ではない_確率のStone読みの三つのZ2_2026-06-19.md',  # 「Stone 読み」= filtration↔Galois の語彙
  'Basuの定理はscore空間の直交分解_0次vanishingの起動例_2026-06-20.md',  # Basu = 第一論文の核心

  # --- 2026-10-25 萩野「冗談半分で出した記事が大真面目に入ってて、さすがに要らない公開しない、墓場向けのジョーク」 ---
  #     ★ 公開しない（$public に戻さない）。墓場の原稿は残す。
  'LAOX性とは何か何でないか_隣接概念との微差_2026-06-19.md',
  'LAOX曲線_局所在庫あり大域在庫なし_2026-06-19.md',
  'LAOX多様体_次元を上げると障害が増える_2026-06-19.md',

  # --- 2026-10-26 萩野「41は外して」（一覧の説明文の表で担当が「冗談の読み物」と書いた記事）---
  #     ★ 公開しない（$public に戻さない）。墓場の原稿は残す。
  'tsurukame-k-theory-special-class-math.md'
)

# 【10/13】確実な数学の誤りが見つかった13本は、直しが済むまで公開から外す（検算記録/庭_*_2026-10-12.md）。
#   直して検算が済んだ記事から、この $fixHold の一覧を消す（全部消えたら、この節ごと消してよい）。
$fixHold = @(
  # （10/13 朝：全部直して公開に戻した）
  # 10/13 13:1x に truncated-multiple-zeta を外した（中心例が定義した和で発散）→ 14:2x 組A が直し（d12e8a6）、本体が star 版の合同式を31組で検算して戻した。今は無し
)
# 頭の語の解決（ちょうど1本でなければ止まる）。-SkipByHead のときは足さない（直している最中の記事を除いて試す）。
$byHeadResolved = @()
if ($SkipByHead) {
  Write-Host "頭の語の $($publicByHead.Count) 本は入れずに組む（-SkipByHead）" -ForegroundColor Yellow
} else {
  $mdNames = @(Get-ChildItem -LiteralPath $src -File | Where-Object { $_.Name.EndsWith('.md', [StringComparison]::Ordinal) } | ForEach-Object { $_.Name })
  foreach ($h in $publicByHead) {
    $hit = @($mdNames | Where-Object { $_.StartsWith($h, [StringComparison]::Ordinal) })
    if ($hit.Count -ne 1) { throw "頭の語「$h」に当たる 墓場/*.md が $($hit.Count) 本（ちょうど1本のときだけ組む）: $($hit -join ' / ')" }
    if ($public -contains $hit[0]) { throw "頭の語「$h」の記事は、もう `$public に名前で入っている（二重）: $($hit[0])" }
    $byHeadResolved += $hit[0]
  }
  $public = @($public) + $byHeadResolved
  Write-Host "頭の語で $($byHeadResolved.Count) 本を足した" -ForegroundColor Green
}

$public = @($public | Where-Object { $fixHold -notcontains $_ })
$held   = @($held) + $fixHold

# --- 公開対象外(記事ではない) ---
# デザイン規則2本・庭のマップ・引継ぎメモ2本・algebraic-gr-READING-BEFORE-REOPEN
# --- 凍結中(アラケロフ影プログラム。趣味として凍結) ---
# algebraic-gr-map-clifford-holonomy-h1.md / algebraic-gr-minimality-postulate-proposal.md

# 記事/ をクリーンに作り直す
if (Test-Path $dst) { Remove-Item $dst -Recurse -Force }
New-Item -ItemType Directory -Path $dst | Out-Null

$copied = 0
$missing = @()
foreach ($f in $public) {
  $p = Join-Path $src $f
  if (Test-Path -LiteralPath $p) { Copy-Item -LiteralPath $p -Destination (Join-Path $dst $f); $copied++ }
  else { Write-Warning "許可リストにあるが存在しない: $f"; $missing += $f }
}
Write-Host "コピー: $copied / $($public.Count) 本" -ForegroundColor Green
# 2026-11-22：足りないまま組むと、その記事へのリンクが黙って外れる＝止める（前は警告だけで先へ進んだ）
if ($missing.Count) { throw "許可リストにあるのに 墓場/ に無い記事が $($missing.Count) 本（題が変わった？）。直してから組む。" }
Write-Host "保留中(非公開): $($held.Count) 本" -ForegroundColor Yellow

# --- 写しの frontmatter の draft: true を外す（2026-11-22）---
# ⚠️ Quarto は draft: true の頁を「空の頁」にし、一覧からも外す（draft-mode の既定）。
#   2026-11-22 の初回の組み立てで、棚の記事 18 本が 90 バイトの空の頁になった（原稿の frontmatter が draft: true）。
#   許可リストに入れた＝出すと決めた記事なので、写しだけ draft の行を外す（墓場の原稿の draft・status は変えない）。
$script:undrafted = New-Object System.Collections.Generic.List[string]
foreach ($file in Get-ChildItem $dst -Filter *.md) {
  $lines = @(Get-Content -LiteralPath $file.FullName)
  if ($lines.Count -lt 2 -or $lines[0] -notmatch '^---\s*$') { continue }
  $end = -1
  for ($i = 1; $i -lt $lines.Count; $i++) { if ($lines[$i] -match '^---\s*$') { $end = $i; break } }
  if ($end -lt 0) { continue }
  $idx = @(for ($i = 1; $i -lt $end; $i++) { if ($lines[$i] -match '^draft:\s*(true|yes)\s*$') { $i } })
  if (-not $idx.Count) { continue }
  $keep = for ($i = 0; $i -lt $lines.Count; $i++) { if ($idx -notcontains $i) { $lines[$i] } }
  Set-Content -LiteralPath $file.FullName -Value $keep -Encoding utf8
  $script:undrafted.Add($file.Name)
}
Write-Host "draft: true を写しから外した: $($script:undrafted.Count) 本（原稿は draft のまま）" -ForegroundColor Yellow

# --- サニタイズ0: 保留中（$held）の記事へのリンクは、題ごと「（未公開の記事）」に置き換える ---
# ⚠️ 2026-10-21 Fable の関所：下のサニタイズはリンクを外して【題を平文で残す】ので、
#   公開中の「実構造は非可換でmodular共役Jになる」の本文に保留中の2本の題が出ていた（8月から）。
#   萩野「推しは全部 Yes」（10/21 夜）＝公開の写しだけ置き換える（墓場の原稿は変えない）。
$heldSet = @{}; foreach ($f in $held) { $heldSet[$f] = $true }
# ★ 2026-11-22：リンク先の括弧に対応した（棚の記事は名前に (1+γ)・δ(a)・SL2(Fp) などの括弧を含む）。
#   前の [^)]+ は最初の ) で切れて、リンク先を取り違え、残りの名前が本文に生で残っていた。
#   <...> の形と、1 段の対の括弧を受ける。%xx はほどいてから許可リストと比べる。
$linkDest = '(?<u><[^>\n]*>|(?:[^()\n]|\([^()\n]*\))+)'
$heldRe = [regex]('「?\[(?<t>[^\]]+)\]\(' + $linkDest + '\)」?')
$script:heldHit = 0
# 外したリンクの記録（git の外・_組み立ての記録/）。題が入るので公開リポジトリには入れない。
$logDir = Join-Path $PSScriptRoot '_組み立ての記録'
if (-not (Test-Path -LiteralPath $logDir)) { New-Item -ItemType Directory -Path $logDir | Out-Null }
$script:linkLog = New-Object System.Collections.Generic.List[string]
$script:linkLog.Add("種類`t記事`tリンクの文字`tリンク先`t行ごと落とした")
function Get-LinkTarget([string]$raw) {
  $u = $raw.Trim()
  $u = $u -replace '^<','' -replace '>$',''      # <...> 形式
  $u = $u -replace '^\./',''                      # 先頭 ./
  $u = ($u -split '#')[0]                          # アンカー除去
  try { $u = [uri]::UnescapeDataString($u) } catch { }
  return $u
}
foreach ($file in Get-ChildItem $dst -Filter *.md) {
  $script:curFile = $file.Name
  $text = Get-Content -LiteralPath $file.FullName -Raw
  $new = $heldRe.Replace($text, {
    param($m)
    $u = Get-LinkTarget $m.Groups['u'].Value
    if ($heldSet.ContainsKey($u)) {
      $script:heldHit++
      $script:linkLog.Add("保留へ`t$($script:curFile)`t$($m.Groups['t'].Value)`t$u`t（未公開の記事）に置換")
      return '（未公開の記事）'
    }
    return $m.Value
  })
  if ($new -ne $text) { Set-Content -LiteralPath $file.FullName -Value $new -NoNewline -Encoding utf8 }
}
Write-Host "サニタイズ0: 保留中の記事へのリンク $script:heldHit か所を（未公開の記事）に" -ForegroundColor Cyan

# --- サニタイズ: 許可リスト外ファイルへの内部リンクを無害化 ---
# 公開セット(basename)を作る。リンク先がここに無い .md は「未公開」。
$pubSet = @{}; foreach ($f in $public) { $pubSet[$f] = $true }
$linkRe = [regex]('\[(?<t>[^\]]+)\]\(' + $linkDest + '\)')
$sanitized = 0
$script:unlinked = 0; $script:droppedLines = 0
foreach ($file in Get-ChildItem $dst -Filter *.md) {
  $script:curFile = $file.Name
  $lines = Get-Content -LiteralPath $file.FullName
  $out = New-Object System.Collections.Generic.List[string]
  $touched = $false
  foreach ($line in $lines) {
    # YAML の related: 行(内部相互参照メタ)は丸ごと落とす
    if ($line -match '^related:\s') { $touched = $true; continue }
    $script:dropLine = $false
    $script:lineHits = New-Object System.Collections.Generic.List[string]
    $new = $linkRe.Replace($line, {
      param($m)
      $u = Get-LinkTarget $m.Groups['u'].Value
      # ★ 外部リンク・アンカー・絶対パスは触らない（2026-09-13 追加）
      #   ⚠️ これが無いと、記事中の【出典リンクが全部剥がれる】。
      #      公開中の57本が外部リンク0本になっていた（LAOX曲線は原稿13本→写し0本）。
      if ($u -match '^(https?://|mailto:|/)' -or $u -eq '') { return $m.Value }
      # ★ 2026-11-22：記事・ページのファイル（.md・.qmd・.html）を指すものだけ触る。
      #   数式の中の [e_p(bx^2)\bigr](\xi) のような「[…](…)」をリンクと読んで外し、式を壊していた（ガウス和の記事）。
      if ($u -notmatch '\.(md|qmd|html?)$') { return $m.Value }
      if ($pubSet.ContainsKey($u)) { return $m.Value } # 公開先 → そのまま
      # 未公開先 → リンク解除。テキストがファイル名なら行ごと落とす印
      $script:txt = $m.Groups['t'].Value
      $cleanTxt = ($txt -replace '`','').Trim()
      if ($cleanTxt -match '\.md$') { $script:dropLine = $true }
      $script:unlinked++
      $script:lineHits.Add("$($m.Groups['t'].Value)`t$u")
      return $txt
    })
    if ($new -ne $line) { $touched = $true }
    foreach ($h in $script:lineHits) { $script:linkLog.Add("外した`t$($script:curFile)`t$h`t$(if ($script:dropLine) { '行ごと' } else { '' })") }
    if ($script:dropLine) { $script:droppedLines++; continue }
    $out.Add($new)
  }
  if ($touched) {
    Set-Content -LiteralPath $file.FullName -Value $out -Encoding utf8
    $sanitized++
  }
}
Write-Host "サニタイズ: $sanitized 本の内部リンクを調整（未公開先のリンクを外した $script:unlinked か所・うち行ごと落とした行 $script:droppedLines）" -ForegroundColor Cyan

# --- サニタイズ2: [[二重括弧]] の内部リンク記法 ---
# ⚠️ 2026-09-16 発見：サニタイザは [text](url) しか見ておらず、[[name]] が素通りしていた。
#   ★ 公開中の記事に [[probability-space-stone-reading-galois-tower]] が生で出ていた。
#     これは $held（第一論文の核心に近いので非公開）の記事名。★ 存在とタイトルが漏れていた。
# ⚠️ ★ 数式を壊さないこと。[[T]] [[\Gamma]] [[X, Y]] [[t]] は交換子・生成元の記法で、
#   本文に 10 箇所ある。★ 一括置換すると記事が壊れる。
#   ⟹ ★ **既知の記事名（public か held）に一致したものだけ**を触る。
$known = @{}
foreach ($f in $public) { $known[[IO.Path]::GetFileNameWithoutExtension($f)] = 'public' }
foreach ($f in $held)   { $known[[IO.Path]::GetFileNameWithoutExtension($f)] = 'held' }
# ★ 前後の括弧ごと拾う。未公開を消したとき、空の () が残るのを防ぐ（2026-09-16 に実際に残った）
$wikiRe = [regex]'(?<open>[(（])?\[\[(?<n>[^\]\[]+)\]\](?<close>[)）])?'
$wiki = 0; $wikiHeld = 0
foreach ($file in Get-ChildItem $dst -Filter *.md) {
  $script:curFile = $file.Name
  $text = Get-Content -LiteralPath $file.FullName -Raw
  $new = $wikiRe.Replace($text, {
    param($m)
    $n = $m.Groups['n'].Value.Trim()
    if (-not $known.ContainsKey($n)) { return $m.Value }   # ★ 数式など、記事名でないものは触らない
    $script:wiki++
    $o = $m.Groups['open'].Value; $cl = $m.Groups['close'].Value
    if ($known[$n] -eq 'public') { return "$o[$n]($n.md)$cl" }  # 公開先 → 本物のリンクにする
    $script:wikiHeld++
    $script:linkLog.Add("二重括弧を消した`t$($script:curFile)`t`t$n`t括弧ごと")
    return ''                                              # 未公開 → ★ 括弧ごと消す
  })
  if ($new -ne $text) { Set-Content -LiteralPath $file.FullName -Value $new -NoNewline -Encoding utf8 }
}
Write-Host "サニタイズ2: [[...]] を $wiki 箇所処理（うち未公開ゆえ削除 $wikiHeld 箇所）" -ForegroundColor Cyan

$logFile = Join-Path $logDir '外したリンク.tsv'
Set-Content -LiteralPath $logFile -Value $script:linkLog -Encoding utf8
Write-Host "外したリンクの一覧: _組み立ての記録/外したリンク.tsv（$($script:linkLog.Count - 1) 行）" -ForegroundColor Cyan
Set-Content -LiteralPath (Join-Path $logDir 'draftを外した記事.txt') -Value $script:undrafted -Encoding utf8

# レンダリング（出力は _quarto.yml の output-dir＝_plain/。暗号化の前の平文なので git に入れない）
Push-Location $PSScriptRoot
try {
  & quarto render
  if ($LASTEXITCODE -ne 0) { throw "quarto render が失敗した（終了コード $LASTEXITCODE）" }
} finally { Pop-Location }
Write-Host "完了: _plain/ に出力（暗号化の前の平文。docs/ には 暗号化して組む.ps1 が暗号化して置く）" -ForegroundColor Green
