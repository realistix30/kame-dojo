-- JLPT Questions Import
-- Generated from official JLPT sample questions
-- Run in stages: add N4/N3/N2/N1 rows below as extracted

BEGIN;

INSERT INTO questions (level, category, type, question, options, answer, words, explanation) VALUES

-- ============================================================
-- N5 KANJI (文字・語彙 問題1 — kanji reading)
-- ============================================================
('n5','kanji','multiple_choice','あしたは 雨 ですか。','["ゆき","はれ","くもり","あめ"]'::jsonb,3,NULL,'雨(あめ)=rain'),
('n5','kanji','multiple_choice','きょうしつで 書いて ください。','["かいて","きいて","はいて","ひいて"]'::jsonb,0,NULL,'書く(かく)=to write'),
('n5','kanji','multiple_choice','しゃしんは はこの 中に あります。','["そば","そと","なか","よこ"]'::jsonb,2,NULL,'中(なか)=inside'),
('n5','kanji','multiple_choice','この いすは 小さいです。','["ちいさい","ちさい","しいさい","しさい"]'::jsonb,0,NULL,'小さい(ちいさい)=small'),
('n5','kanji','multiple_choice','あしたは 火よう日です。','["どようび","すいようび","かようび","にちようび"]'::jsonb,2,NULL,'火曜日(かようび)=Tuesday'),
('n5','kanji','multiple_choice','きれいな 空ですね。','["いえ","うみ","にわ","そら"]'::jsonb,3,NULL,'空(そら)=sky'),
('n5','kanji','multiple_choice','せいとは 百人 います。','["ひゃくにん","びゃくにん","ひゃくじん","びゃくじん"]'::jsonb,0,NULL,'百人(ひゃくにん)=100 people'),
('n5','kanji','multiple_choice','魚が たくさん いますよ。','["ねこ","とり","いぬ","さかな"]'::jsonb,3,NULL,'魚(さかな)=fish'),
('n5','kanji','multiple_choice','パンを 半分 ともだちに あげました。','["はんふん","はんぶん","ほんぶん","ほんふん"]'::jsonb,1,NULL,'半分(はんぶん)=half'),
('n5','kanji','multiple_choice','ぎんこうと スーパーの 間に ほそい みちが あります。','["あいた","となり","あいだ","どなり"]'::jsonb,2,NULL,'間(あいだ)=between'),
('n5','kanji','multiple_choice','たまごを 三つ とって ください。','["いつつ","みっつ","さんつ","ごつ"]'::jsonb,1,NULL,'三つ(みっつ)=three things'),
('n5','kanji','multiple_choice','きょうは 元気が いいですね。','["けんき","げんき","でんき","てんき"]'::jsonb,1,NULL,'元気(げんき)=health/energy'),

-- ============================================================
-- N5 KANJI (文字・語彙 問題2 — hiragana to kanji)
-- ============================================================
('n5','kanji','multiple_choice','この わいしゃつを ください。','["ウイシャソ","ウイシャツ","ワイシャソ","ワイシャツ"]'::jsonb,3,NULL,'わいしゃつ=ワイシャツ (dress shirt)'),
('n5','kanji','multiple_choice','わたしの くには かわが おおいです。','["花","山","川","木"]'::jsonb,2,NULL,'かわ=川 (river)'),
('n5','kanji','multiple_choice','ヤンさんの がっこうは どこですか。','["宇校","学校","宇枚","学枚"]'::jsonb,1,NULL,'がっこう=学校 (school)'),
('n5','kanji','multiple_choice','この ざっしを みて ください。','["見て","買て","貝て","目て"]'::jsonb,0,NULL,'みる=見る (to look/see)'),
('n5','kanji','multiple_choice','この カメラは たかいですね。','["高い","安い","古い","新い"]'::jsonb,0,NULL,'たかい=高い (expensive)'),
('n5','kanji','multiple_choice','きのうは かいしゃを やすみました。','["公仕","公社","会仕","会社"]'::jsonb,3,NULL,'かいしゃ=会社 (company)'),
('n5','kanji','multiple_choice','まだ いわないで ください。','["行わないで","立わないで","言わないで","食わないで"]'::jsonb,2,NULL,'いう=言う (to say)'),
('n5','kanji','multiple_choice','らいげつ けっこんします。','["今月","来月","来週","今週"]'::jsonb,1,NULL,'らいげつ=来月 (next month)'),

-- ============================================================
-- N5 VOCABULARY (文字・語彙 問題3 — fill-in-blank)
-- ============================================================
('n5','vocabulary','multiple_choice','わたしの へやは この アパートの 2（　）です。','["ほん","さつ","だい","かい"]'::jsonb,3,NULL,'かい=階 (floor of a building)'),
('n5','vocabulary','multiple_choice','その ナイフで りんごを（　）ください。','["おきて","つけて","しめて","きって"]'::jsonb,3,NULL,'きる=切る (to cut)'),
('n5','vocabulary','multiple_choice','（　）を わすれましたから、じかんが わかりません。','["じしょ","ちず","とけい","さいふ"]'::jsonb,2,NULL,'とけい=時計 (watch/clock)'),
('n5','vocabulary','multiple_choice','わたしの うちは えきに ちかいですから、（　）です。','["べんり","じょうぶ","いっぱい","へた"]'::jsonb,0,NULL,'べんり=便利 (convenient)'),
('n5','vocabulary','multiple_choice','なつやすみは まいにち（　）で およぎました。','["レストラン","プール","エレベーター","ビル"]'::jsonb,1,NULL,'プール=pool (swimming pool)'),
('n5','vocabulary','multiple_choice','しらない ことばが ありましたから、せんせいに（　）しました。','["しつもん","べんきょう","れんしゅう","じゅぎょう"]'::jsonb,0,NULL,'しつもん=質問 (question)'),
('n5','vocabulary','multiple_choice','この へやは あついですから、（　）を あけましょう。','["おふろ","まど","エアコン","テーブル"]'::jsonb,1,NULL,'まど=窓 (window)'),
('n5','vocabulary','multiple_choice','きのうは がっこうで たくさん かんじを（　）。','["うりました","もちました","おぼえました","こまりました"]'::jsonb,2,NULL,'おぼえる=覚える (to memorize)'),
('n5','vocabulary','multiple_choice','この コーヒーは さとうを たくさん いれましたから（　）です。','["わかい","くろい","まるい","あまい"]'::jsonb,3,NULL,'あまい=甘い (sweet)'),
('n5','vocabulary','multiple_choice','つよい かぜが（　）います。','["ふいて","いそいで","とんで","はしって"]'::jsonb,0,NULL,'ふく=吹く (to blow)'),

-- ============================================================
-- N5 VOCABULARY (文字・語彙 問題4 — paraphrase)
-- ============================================================
('n5','vocabulary','multiple_choice','これは りょうしんの しゃしんです。','["そふとそぼのしゃしんです","ちちとははのしゃしんです","あにとおとうとのしゃしんです","あねといもうとのしゃしんです"]'::jsonb,1,NULL,'りょうしん=両親=parents (father and mother)'),
('n5','vocabulary','multiple_choice','この ダンスは やさしいです。','["かんたんです","たいへんです","たのしいです","つまらないです"]'::jsonb,0,NULL,'やさしい≒かんたん (easy/simple)'),
('n5','vocabulary','multiple_choice','ふくを せんたくしました。','["ぬぎました","わたしました","あらいました","きました"]'::jsonb,2,NULL,'せんたくする=洗濯する (to do laundry/wash)'),
('n5','vocabulary','multiple_choice','この へやは くらいですね。','["あかるいですね","あかるくないですね","しずかじゃないですね","しずかですね"]'::jsonb,1,NULL,'くらい=暗い (dark) ↔ あかるくない'),
('n5','vocabulary','multiple_choice','リーさんは もりさんに ペンを かしました。','["リーさんはもりさんにペンをもらいました","もりさんはリーさんにペンをもらいました","リーさんはもりさんにペンをかりました","もりさんはリーさんにペンをかりました"]'::jsonb,3,NULL,'かす=貸す (lend); もりさんがかりた (Mori borrowed)'),

-- ============================================================
-- N5 GRAMMAR (文法 問題1 — particle/grammar fill-in)
-- ============================================================
('n5','grammar','multiple_choice','私は あしたの ひこうき（　）国へ 帰ります。','["に","で","か","を"]'::jsonb,1,NULL,'で marks means of transport: ひこうきで'),
('n5','grammar','multiple_choice','先週 デパートで かばん（　）くつなどを 買いました。','["は","も","へ","や"]'::jsonb,3,NULL,'や connects nouns in a non-exhaustive list'),
('n5','grammar','multiple_choice','私は 毎朝 7時ごろ 家（　）出ます。','["を","と","が","で"]'::jsonb,0,NULL,'を marks the place departed: 家を出る'),
('n5','grammar','multiple_choice','きのう スーパーで 田中さん（　）会いました。','["を","の","で","に"]'::jsonb,3,NULL,'に marks person met: 田中さんに会う'),
('n5','grammar','multiple_choice','私の うちの ほんだなは、きょねん 父（　）作りました。','["や","が","を","で"]'::jsonb,1,NULL,'が marks the subject who acted'),
('n5','grammar','multiple_choice','今日 やおやで りんごを 買いました。五つ（　）300円でした。','["に","と","で","や"]'::jsonb,2,NULL,'で marks total cost: 五つで300円'),
('n5','grammar','multiple_choice','きのう（　）少し 寒かったですが、今日（　）寒くないです。','["は/は","に/に","も/も","を/を"]'::jsonb,0,NULL,'は marks topic contrast between two time periods'),
('n5','grammar','multiple_choice','南町は、海が きれい（　）、静かです。','["も","や","で","と"]'::jsonb,2,NULL,'で connects two な-adjective predicates'),
('n5','grammar','multiple_choice','前川「林さん、（　）に ある カメラは 林さんのですか。」林「いいえ。田中さんのですよ。」','["そこ","どこ","その","どの"]'::jsonb,0,NULL,'そこ=there (near the listener)'),
('n5','grammar','multiple_choice','A「先週 はじめて スキーを しました。」B「そうですか。（　）でしたか。」A「とても 楽しかったです。」','["いくつ","いかが","どなた","どちら"]'::jsonb,1,NULL,'いかが=how was it? (polite)'),
('n5','grammar','multiple_choice','森「ケンさん、大学の じゅぎょうは 始まりましたか。」ケン「いいえ、（　）です。来週 始まります。」','["よく","もう","ちょっと","まだ"]'::jsonb,3,NULL,'まだ=not yet'),
('n5','grammar','multiple_choice','いしゃ「今日から 一週間 薬を 飲んで、来週の 月曜日に（　）来て ください。」','["たくさん","あまり","また","だんだん"]'::jsonb,2,NULL,'また=again: また来てください'),
('n5','grammar','multiple_choice','父は 毎朝 コーヒーを（　）ながら 新聞を 読みます。','["飲む","飲み","飲んで","飲んだ"]'::jsonb,1,NULL,'～ながら uses verb stem: 飲みながら'),
('n5','grammar','multiple_choice','私は 小さいとき、なっとうが 好き（　）でした。','["ない","じゃない","ありません","じゃありません"]'::jsonb,3,NULL,'好きじゃありませんでした = polite negative past of な-adj'),
('n5','grammar','multiple_choice','山下「すみません、いちごの ケーキを 二つ（　）。」','["ありますか","どうぞ","ください","ほしいですか"]'::jsonb,2,NULL,'～をください = please give me'),
('n5','grammar','multiple_choice','リー「日曜日に、私の 家で アンさんと べんきょうを します。キムさんも（　）。」キム「あ、行きたいです。」','["来ませんか","来ていますか","来ませんでしたか","来ていましたか"]'::jsonb,0,NULL,'～ませんか = invitation: won''t you come?'),

-- ============================================================
-- N5 GRAMMAR (文法 問題2 — word ordering)
-- ============================================================
('n5','grammar','reorder','（タクシーの中で）「すみません、つぎの ___★___ まがってください。」','[]'::jsonb,NULL,'["しんごう","を","右に","まがって"]'::jsonb,'Correct order: しんごうを右にまがってください'),
('n5','grammar','reorder','私は日曜日に兄 ___★___ 出かけました。','[]'::jsonb,NULL,'["の","と","子ども","いっしょに"]'::jsonb,'Correct order: 兄の子どもといっしょに'),
('n5','grammar','reorder','きのう買ったおかしは ___★___ でした。','[]'::jsonb,NULL,'["色","きれい","が","まるくて"]'::jsonb,'Correct order: まるくて色がきれい'),
('n5','grammar','reorder','駅の ___★___ でざっしを買いました。','[]'::jsonb,NULL,'["に","ある","近く","本屋"]'::jsonb,'Correct order: 近くにある本屋'),
('n5','grammar','reorder','先週 ___★___ のこうちゃはとてもおいしかったです。','[]'::jsonb,NULL,'["もらった","ともだち","外国","に"]'::jsonb,'Correct order: ともだちに外国からもらった'),

-- ============================================================
-- N5 GRAMMAR (読解 問題3 — passage fill-in)
-- ============================================================
('n5','grammar','multiple_choice','私の国では いろいろな 店に あります。（　）、日本では 売っている 店を 知りません。','["だから","でも","いつも","もっと"]'::jsonb,1,NULL,'でも=but/however (contrast)'),
('n5','grammar','multiple_choice','みなさんは 何の ジュースが 好きですか。好きな ジュースを（　）。','["教えてください","教えたいです","教えますよ","教えています"]'::jsonb,0,NULL,'教えてください = please tell me'),
('n5','grammar','multiple_choice','先週の土曜日はいい天気でした。昼に買い物をしてから、きっさてんに（　）。','["入るからです","入ったからです","入ります","入りました"]'::jsonb,3,NULL,'入りました = past tense, entered the café'),
('n5','grammar','multiple_choice','「はな」（　）コーヒーは安かったです。','["から","と","の","より"]'::jsonb,2,NULL,'の is possessive: 「はな」のコーヒー'),
('n5','grammar','multiple_choice','来週も「はな」にコーヒーを（　）。','["飲んで行きます","飲んで来ます","飲みに行きます","飲みに来ます"]'::jsonb,2,NULL,'飲みに行きます = go there to drink (purpose)');

-- ============================================================
-- N4 KANJI (文字・語彙 問題1 — kanji reading)
-- ============================================================
('n4','kanji','multiple_choice','今日は とても 楽しかったですね。','["いそがしかった","すずしかった","たのしかった","かなしかった"]'::jsonb,2,NULL,'楽しい(たのしい)=fun/enjoyable'),
('n4','kanji','multiple_choice','わたしは この 味が すきです。','["かたち","いろ","におい","あじ"]'::jsonb,3,NULL,'味(あじ)=taste/flavor'),
('n4','kanji','multiple_choice','この あたりは ちょっと 不便ですね。','["ふべん","ぶべん","ふへん","ぶへん"]'::jsonb,0,NULL,'不便(ふべん)=inconvenient'),
('n4','kanji','multiple_choice','やさいを 切って ください。','["とって","きって","あらって","もって"]'::jsonb,1,NULL,'切る(きる)=to cut'),
('n4','kanji','multiple_choice','はやしさん以外は みんな 来ました。','["にそと","にがい","いそと","いがい"]'::jsonb,3,NULL,'以外(いがい)=except/other than'),
('n4','kanji','multiple_choice','まどから ずっと 雲を 見て いました。','["ほし","ゆき","くも","そら"]'::jsonb,2,NULL,'雲(くも)=cloud'),
('n4','kanji','multiple_choice','その 電車は 急行ですよ。','["きゅこ","きゅこう","きゅうこ","きゅうこう"]'::jsonb,3,NULL,'急行(きゅうこう)=express train'),
('n4','kanji','multiple_choice','これは 写さないで ください。','["おさないで","うつさないで","けさないで","おとさないで"]'::jsonb,1,NULL,'写す(うつす)=to copy/transcribe'),
('n4','kanji','multiple_choice','その いけんには 反対です。','["はんたい","ほんたい","はんだい","ほんだい"]'::jsonb,0,NULL,'反対(はんたい)=opposition/opposite'),

-- ============================================================
-- N4 KANJI (文字・語彙 問題2 — hiragana to kanji)
-- ============================================================
('n4','kanji','multiple_choice','くろい くつしたが ほしいです。','["白い","黒い","赤い","青い"]'::jsonb,1,NULL,'くろい=黒い (black)'),
('n4','kanji','multiple_choice','なつやすみの けいかくは まだ きまって いません。','["計書","訂画","計画","訂書"]'::jsonb,2,NULL,'けいかく=計画 (plan)'),
('n4','kanji','multiple_choice','わたしは いしゃに なりたいです。','["匠員","医員","匠者","医者"]'::jsonb,3,NULL,'いしゃ=医者 (doctor)'),
('n4','kanji','multiple_choice','あしたの よる かぞくと 出かけます。','["夜","昼","夕","朝"]'::jsonb,0,NULL,'よる=夜 (night/evening)'),
('n4','kanji','multiple_choice','かさを かして ください。','["貨して","資して","貸して","質して"]'::jsonb,2,NULL,'かす=貸す (to lend)'),
('n4','kanji','multiple_choice','あしたは サッカーの しあいが あります。','["誡会","誡合","試会","試合"]'::jsonb,3,NULL,'しあい=試合 (match/game)'),

-- ============================================================
-- N4 VOCABULARY (文字・語彙 問題3 — fill-in-blank)
-- ============================================================
('n4','vocabulary','multiple_choice','さとうさんが けがを したと 聞いて、みんな（　）しました。','["しんぱい","けいけん","しつれい","おじぎ"]'::jsonb,0,NULL,'しんぱい=心配 (worry/concern)'),
('n4','vocabulary','multiple_choice','わたしには、しょうらい かしゅに なると いう（　）が あります。','["けしき","ゆめ","おもいで","せわ"]'::jsonb,1,NULL,'ゆめ=夢 (dream)'),
('n4','vocabulary','multiple_choice','リーさんも こんどの パーティーに（　）来て くださいね。','["ひじょうに","ぜひ","じゅうぶん","いつも"]'::jsonb,1,NULL,'ぜひ=by all means/please do'),
('n4','vocabulary','multiple_choice','これから きかいの つかいかたを（　）しますから、よく 聞いて ください。','["じゅんび","りよう","せつめい","せいさん"]'::jsonb,2,NULL,'せつめい=説明 (explanation)'),
('n4','vocabulary','multiple_choice','はが わるいので、（　）ものは 食べられません。','["きびしい","かたい","はやい","ふかい"]'::jsonb,1,NULL,'かたい=硬い (hard/tough)'),
('n4','vocabulary','multiple_choice','もりさんを デートに（　）が、行けないと 言われました。','["さそいました","つたえました","あんないしました","しょうかいしました"]'::jsonb,0,NULL,'さそう=誘う (to invite)'),
('n4','vocabulary','multiple_choice','わたしの むすこは、1年で 5（　）くらい せが 高く なりました。','["グラム","ばん","けん","センチ"]'::jsonb,3,NULL,'センチ=センチメートル (centimeter)'),
('n4','vocabulary','multiple_choice','お店で 3だいの パソコンを（　）、いちばん かるい パソコンを えらびました。','["かたづけて","かぞえて","くらべて","はらって"]'::jsonb,2,NULL,'くらべる=比べる (to compare)'),
('n4','vocabulary','multiple_choice','たなかさんの いえの 電気が ついて いませんね。たなかさんは（　）の ようです。','["うそ","じゆう","ちゅうし","るす"]'::jsonb,3,NULL,'るす=留守 (away from home)'),
('n4','vocabulary','multiple_choice','へやの かぎを さがして いますが、まだ（　）。','["見つかりません","つかまえません","しりません","さわりません"]'::jsonb,0,NULL,'見つかる=to be found/located'),

-- ============================================================
-- N4 VOCABULARY (文字・語彙 問題4 — paraphrase)
-- ============================================================
('n4','vocabulary','multiple_choice','おとうとは あの きっさてんで アルバイトを して います。','["おとうとはあのきっさてんでまっています","おとうとはあのきっさてんではたらいています","おとうとはあのきっさてんでコーヒーを飲んでいます","おとうとはあのきっさてんで友だちと話しています"]'::jsonb,1,NULL,'アルバイト=part-time job; はたらく=to work'),
('n4','vocabulary','multiple_choice','わたしは すいえいが すきです。','["わたしははしるのがすきです","わたしはおよぐのがすきです","わたしはごはんを食べるのがすきです","わたしは本を読むのがすきです"]'::jsonb,1,NULL,'すいえい=水泳=swimming; およぐ=to swim'),
('n4','vocabulary','multiple_choice','それを 聞いて びっくりしました。','["わらいました","こまりました","おこりました","おどろきました"]'::jsonb,3,NULL,'びっくりする≒おどろく (to be surprised)'),
('n4','vocabulary','multiple_choice','あの 人は うつくしいですね。','["きれいですね","元気ですね","おもしろいですね","わかいですね"]'::jsonb,0,NULL,'うつくしい≒きれい (beautiful)'),
('n4','vocabulary','multiple_choice','この 国は こめを ゆにゅうして います。','["ほかの国にうっています","ほかの国からもらっています","ほかの国から買っています","ほかの国にあげています"]'::jsonb,2,NULL,'ゆにゅう=輸入=import; 買ってくる (buy from abroad)'),

-- ============================================================
-- N4 VOCABULARY (文字・語彙 問題5 — word usage)
-- ============================================================
('n4','vocabulary','multiple_choice','「さいきん」の つかいかたで いちばん いい ものは どれですか。','["さいきんりょうりができたのでいっしょに食べましょう","さいきんしゅくだいを出してください","きむらさんはさいきんけっこんしたそうです","さいきん電車が来ますからいそいでえきに行きましょう"]'::jsonb,2,NULL,'さいきん=最近 (recently) — used for recent events/changes'),
('n4','vocabulary','multiple_choice','「おと」の つかいかたで いちばん いい ものは どれですか。','["ラジオのおとが大きいのでもう少し小さくしてください","日本語のおとがじょうずになりたいので毎日たくさん話します","店の人に大きなおとで名前をよばれました","すずきさんがギターでゆうめいなおとをひいてくれました"]'::jsonb,0,NULL,'おと=音 (sound/volume) — correct with ラジオの音が大きい'),
('n4','vocabulary','multiple_choice','「けんがく」の つかいかたで いちばん いい ものは どれですか。','["デパートに行ってけんがくします","わからないかんじはじしょでけんがくしてください","先生や友だちとこうじょうをけんがくしました","まいばんテレビでニュースをけんがくしています"]'::jsonb,2,NULL,'けんがく=見学 (field trip/tour of a facility)'),
('n4','vocabulary','multiple_choice','「かざる」の つかいかたで いちばん いい ものは どれですか。','["テストのおしらせをきょうしつにかざりました","おきゃくさんが来ますからへやに花をかざりましょう","天気がわるいのでせんたくものはうちの中にかざります","こっちのエアコンはとなりのへやのかべにかざってください"]'::jsonb,1,NULL,'かざる=飾る (to decorate) — 花を飾る is correct usage'),
('n4','vocabulary','multiple_choice','「こうじ」の つかいかたで いちばん いい ものは どれですか。','["はいしゃでこうじをしてもらいました","このセーターはこうじをしてずっときています","ほんだながこわれたのでこうじをしました","このみちはこうじをしているのでとおれません"]'::jsonb,3,NULL,'こうじ=工事 (construction work) — used for road/building work'),

-- ============================================================
-- N4 GRAMMAR (文法 問題1 — fill-in)
-- ============================================================
('n4','grammar','multiple_choice','きのうの しゅくだいは 少なかったので、（　）終わりました。','["20分","20分しか","20分で","20分を"]'::jsonb,2,NULL,'で marks duration/means: 20分で終わる (finished in 20 min)'),
('n4','grammar','multiple_choice','この ロボットは 人（　）会話することが できます。','["や","を","へ","と"]'::jsonb,3,NULL,'と marks conversational partner: 人と会話する'),
('n4','grammar','multiple_choice','弟は 小さいとき よく けがを して、両親（　）心配させました。','["で","を","の","や"]'::jsonb,1,NULL,'を marks causative object: 両親を心配させる'),
('n4','grammar','multiple_choice','ホテルの 朝ご飯の パンが とても おいしかったので、八つ（　）食べました。','["も","に","が","で"]'::jsonb,0,NULL,'も adds emphasis "as many as": 八つも食べた'),
('n4','grammar','multiple_choice','この 日本語の じしょは、150年前に 外国人（　）作られました。','["から","を","について","によって"]'::jsonb,3,NULL,'によって marks agent in passive: 外国人によって作られた'),
('n4','grammar','multiple_choice','A市の 運動場は（　）使えますが、予約が ひつようです。','["だれでも","だれを","だれに","だれが"]'::jsonb,0,NULL,'だれでも=anyone (inclusive): だれでも使える'),
('n4','grammar','multiple_choice','前田「リーさん、いつも（　）国の かぞくに れんらくしますか。」リー「メールを 書くことが 多いです。」','["どのぐらい","どの","どうやって","どういう"]'::jsonb,2,NULL,'どうやって=how/by what means'),
('n4','grammar','multiple_choice','娘は 先月 高校を 卒業しました。（　）大学の 入学式です。','["だんだん","あまり","だいたい","もうすぐ"]'::jsonb,3,NULL,'もうすぐ=soon/any time now'),
('n4','grammar','multiple_choice','今朝は 駅に 行く バスが（　）来なかったので、タクシーで 行きました。','["やっと","なかなか","きっと","いつか"]'::jsonb,1,NULL,'なかなか～ない=not easily/just wouldn''t come'),
('n4','grammar','multiple_choice','山下「南さん、あしたか あさって、カラオケに 行かない?」南「あ、いいね。あしたは 都合が 悪いけど、あさって（　）だいじょうぶだよ。」','["なのに","だから","でも","なら"]'::jsonb,3,NULL,'なら=if/as for: あさってならOK'),
('n4','grammar','multiple_choice','私は（　）間、スーパーで アルバイトを して いました。','["夏休みに","夏休みで","夏休みの","夏休み"]'::jsonb,2,NULL,'夏休みの間=during summer vacation (の間)'),
('n4','grammar','multiple_choice','先週 庭の 木の えだを 切りました。ぜんぶ（　）2時間 かかりました。','["切ったり","切るのに","切りに","切るかどうか"]'::jsonb,1,NULL,'～のに時間がかかる=it takes time to do ~'),
('n4','grammar','multiple_choice','木村「山田さん、あしたの 午後、サッカーの 練習に 行きますか。」山田「ええ、行きます。でも、午前中に 用事が あるので、（　）。」','["遅れないでください","遅れないほうがいいです","遅れるかもしれません","遅れてはいけません"]'::jsonb,2,NULL,'かもしれません=might/may (expressing uncertainty)'),
('n4','grammar','multiple_choice','（食堂で）森「空いて いる 席が ありませんね。」田中「ええ。あ、でも、あそこの 席が（　）よ。」森「本当ですね。空くまで、少し 待ちましょう。」','["空きそうです","空きました","空いています","空いたようです"]'::jsonb,0,NULL,'～そうです=looks like it will ~ (prediction from observation)'),
('n4','grammar','multiple_choice','（会議室で）林「上田さん、会議の じゅんびは 終わりましたか。てつだいましょうか。」上田「じゃあ、いすが 一つ 足りないので、となりの 会議室から（　）。」','["持ってこなくてもいいですか","持ってきてもらえますか","持ってこないといけませんか","持ってきていませんか"]'::jsonb,1,NULL,'～てもらえますか=polite request: could you please bring it?'),

-- ============================================================
-- N4 GRAMMAR (文法 問題2 — word ordering)
-- ============================================================
('n4','grammar','reorder','先月まで 花屋が あった ___★___ おいしいです。','[]'::jsonb,NULL,'["きっさてんは","場所に","できた","りんごのケーキが"]'::jsonb,'Correct: 先月まで花屋があったきっさてんは場所にできたりんごのケーキがおいしいです'),
('n4','grammar','reorder','きのうの 夜 家に 帰ってから、かぎを ___★___ 覚えて いません。','[]'::jsonb,NULL,'["どこ","置いた","に","か"]'::jsonb,'Correct: かぎをどこに置いたか覚えていません'),
('n4','grammar','reorder','私は ピアノを ___★___ 時間が ありません。','[]'::jsonb,NULL,'["ひくのが","好きですが","最近いそがしくて","ひく"]'::jsonb,'Correct: 私はピアノをひくのが好きですが最近いそがしくて時間がありません'),
('n4','grammar','reorder','私は 20さいの たんじょうびに そふが ___★___ います。','[]'::jsonb,NULL,'["大切に","くれた","使って","カメラを"]'::jsonb,'Correct: そふがくれたカメラを大切に使っています'),
('n4','grammar','reorder','リー「えっ、野球の 試合ですか。いいですね。___★___ です。」','[]'::jsonb,NULL,'["ぜひ行きたい","ことがない","見に行った","ので"]'::jsonb,'Correct: 見に行ったことがないのでぜひ行きたいです'),

-- ============================================================
-- N4 GRAMMAR (読解 問題3 — passage fill-in: 水泳)
-- ============================================================
('n4','grammar','multiple_choice','私のしゅみは水泳です。毎週プールで泳いでいます。（　）、半年前までは泳ぐことができませんでした。','["それに","だから","しかし","たとえば"]'::jsonb,2,NULL,'しかし=however (contrast between now and 6 months ago)'),
('n4','grammar','multiple_choice','ともだちは遠くまで泳いでいきました。けれども、私（　）泳げませんでした。','["は","なら","でも","より"]'::jsonb,0,NULL,'私は=as for me (topic marker showing contrast)'),
('n4','grammar','multiple_choice','水泳の上手なともだちに泳ぎ方を（　）。','["教えていました","教えてあげました","教えてくれました","教えてもらいました"]'::jsonb,3,NULL,'教えてもらいました=had someone teach me (receiving a favor)'),
('n4','grammar','multiple_choice','毎週ともだちと練習しました。それで少しずつ（　）。','["泳いでおきました","泳げるようになりました","泳いでしまいました","泳げることになりました"]'::jsonb,1,NULL,'～ようになる=to come to be able to (gradual change)'),
('n4','grammar','multiple_choice','次に海に行くまでにたくさん（　）。','["練習するためです","練習したようです","練習したいです","練習するそうです"]'::jsonb,2,NULL,'～たいです=want to do (expressing desire)'),

-- ============================================================
-- N3 KANJI (文字・語彙 問題1 — kanji reading)
-- ============================================================
('n3','kanji','multiple_choice','会場には大勢の観客がいた。','["けんぎゃく","かんぎゃく","けんきゃく","かんきゃく"]'::jsonb,3,NULL,'観客(かんきゃく)=audience/spectators'),
('n3','kanji','multiple_choice','田村さんが払ってくれました。','["くばって","はらって","かざって","ひろって"]'::jsonb,1,NULL,'払う(はらう)=to pay'),
('n3','kanji','multiple_choice','ホテルには３時ごろ到着します。','["とうちゃく","とうつく","とちゃく","とつく"]'::jsonb,0,NULL,'到着(とうちゃく)=arrival'),
('n3','kanji','multiple_choice','山下さんが説明を加えました。','["つたえました","おえました","くわえました","かえました"]'::jsonb,2,NULL,'加える(くわえる)=to add/supplement'),
('n3','kanji','multiple_choice','今から訓練を行います。','["くんれい","くんれん","ぐんれい","ぐんれん"]'::jsonb,1,NULL,'訓練(くんれん)=training/drill'),
('n3','kanji','multiple_choice','この豆はスープに使うといいですよ。','["こな","いも","かい","まめ"]'::jsonb,3,NULL,'豆(まめ)=bean'),
('n3','kanji','multiple_choice','社会には共通のルールがあります。','["きょうつ","こうつう","きょうつう","こうつ"]'::jsonb,2,NULL,'共通(きょうつう)=common/shared'),
('n3','kanji','multiple_choice','来年から税金が上がるそうだ。','["ぜいきん","ぜっきん","せいきん","せっきん"]'::jsonb,0,NULL,'税金(ぜいきん)=tax'),

-- ============================================================
-- N3 KANJI (文字・語彙 問題2 — hiragana to kanji)
-- ============================================================
('n3','kanji','multiple_choice','しばらく、きれいなな みを見ていた。','["池","湖","港","波"]'::jsonb,3,NULL,'なみ=波 (wave)'),
('n3','kanji','multiple_choice','もう少し はやく 歩きましょう。','["軽く","急く","速く","進く"]'::jsonb,2,NULL,'はやく=速く (quickly)'),
('n3','kanji','multiple_choice','わたしは今の生活に まんぞく している。','["満続","万続","満足","万足"]'::jsonb,2,NULL,'まんぞく=満足 (satisfaction)'),
('n3','kanji','multiple_choice','父は腕を くんで 何か考えていた。','["接んで","組んで","折んで","結んで"]'::jsonb,1,NULL,'くむ=組む (to fold/cross arms)'),
('n3','kanji','multiple_choice','この国は主に米を ゆしゅつ している。','["輸出","諭出","輪出","論出"]'::jsonb,0,NULL,'ゆしゅつ=輸出 (export)'),
('n3','kanji','multiple_choice','赤ちゃんが母親に抱かれて ねむっています 。','["寝って","宿って","眼って","眠って"]'::jsonb,3,NULL,'ねむる=眠る (to sleep)'),

-- ============================================================
-- N3 VOCABULARY (文字・語彙 問題3 — fill-in-blank)
-- ============================================================
('n3','vocabulary','multiple_choice','この紙は、ぬれても破れにくいという（　）があります。','["実力","特長","専門","主張"]'::jsonb,1,NULL,'特長(とくちょう)=special feature/advantage'),
('n3','vocabulary','multiple_choice','佐藤さんには、おとなしい（　）があるが、本当は活動的な人らしい。','["ヒント","タイトル","アイディア","イメージ"]'::jsonb,3,NULL,'イメージ=image/impression'),
('n3','vocabulary','multiple_choice','正月には親戚が集まって、みんなでテーブルを（　）、楽しく食事をした。','["囲み","通し","包み","越え"]'::jsonb,0,NULL,'囲む(かこむ)=to surround/gather around'),
('n3','vocabulary','multiple_choice','このレストランの料理はおいしくないので、店内はいつも（　）だ。','["ふらふら","ぐっすり","がらがら","うっかり"]'::jsonb,2,NULL,'がらがら=completely empty (store/place)'),
('n3','vocabulary','multiple_choice','高田さんが引っ越すという（　）を聞いたが、本当かどうか気になる。','["うわさ","宣伝","うそ","冗談"]'::jsonb,0,NULL,'うわさ=rumor/gossip'),
('n3','vocabulary','multiple_choice','父から借りた本をなくしてしまったので謝ったら、父はすぐに（　）くれた。','["従って","守って","許して","抑えて"]'::jsonb,2,NULL,'許す(ゆるす)=to forgive'),
('n3','vocabulary','multiple_choice','パソコンの前でずっと同じ（　）でいたので、体が痛くなった。','["様子","姿勢","印象","間隔"]'::jsonb,1,NULL,'姿勢(しせい)=posture'),
('n3','vocabulary','multiple_choice','申込書に間違いがないか、よく（　）から受付に出した。','["くりかえして","気にして","見つめて","たしかめて"]'::jsonb,3,NULL,'たしかめる=確かめる (to confirm/verify)'),
('n3','vocabulary','multiple_choice','わたしのふるさとは（　）が盛んで、米や野菜をたくさん作っています。','["自然","資源","作物","農業"]'::jsonb,3,NULL,'農業(のうぎょう)=agriculture/farming'),
('n3','vocabulary','multiple_choice','水に浮いていた木の葉が、しばらくすると水の中に（　）しまった。','["しずんで","ころんで","たおれて","おぼれて"]'::jsonb,0,NULL,'しずむ=沈む (to sink)'),
('n3','vocabulary','multiple_choice','この話は誰にも言わずに、ずっと（　）にしていた。','["裏側","内緒","後方","中身"]'::jsonb,1,NULL,'内緒(ないしょ)=secret'),

-- ============================================================
-- N3 VOCABULARY (文字・語彙 問題4 — paraphrase)
-- ============================================================
('n3','vocabulary','multiple_choice','水の表面がかがやいています。','["止まって","揺れて","汚れて","光って"]'::jsonb,3,NULL,'かがやく≒光る (to shine/glitter)'),
('n3','vocabulary','multiple_choice','その知らせを聞いたとき、わたしはとてもがっかりした。','["残念だと思った","うれしかった","驚いた","安心した"]'::jsonb,0,NULL,'がっかりする≒残念だと思う (to be disappointed)'),
('n3','vocabulary','multiple_choice','留学生活に不安は当然ありました。','["いろいろ","少し","もちろん","いつも"]'::jsonb,2,NULL,'当然(とうぜん)≒もちろん (of course/naturally)'),
('n3','vocabulary','multiple_choice','パーティーの料理があまりました。','["多すぎて残りました","少し足りませんでした","とてもおいしかったです","そんなにおいしくなかったです"]'::jsonb,0,NULL,'あまる=余る (to be left over/in excess)'),
('n3','vocabulary','multiple_choice','ここは横断禁止です。','["座ってはいけません","渡ってはいけません","走ってはいけません","入ってはいけません"]'::jsonb,1,NULL,'横断(おうだん)=crossing; 禁止=prohibited → 渡ってはいけません'),

-- ============================================================
-- N3 VOCABULARY (文字・語彙 問題5 — word usage)
-- ============================================================
('n3','vocabulary','multiple_choice','「急」の使い方として最もよいものはどれですか。','["この料理は電子レンジを使って急にできるので、とても簡単だ","あと10分で電車が出発してしまうので、急に駅に向かった","部屋から急に人が飛び出してきたので、ぶつかりそうになった","新しいゲームを買ったので、家に帰って急にやってみた"]'::jsonb,2,NULL,'急に=suddenly — correct: 部屋から急に人が飛び出してきた'),
('n3','vocabulary','multiple_choice','「沸騰」の使い方として最もよいものはどれですか。','["今日は朝からどんどん暑くなり、昼には気温が沸騰した","鍋のお湯が沸騰したら、とうふを入れて火を少し弱くしてください","昼ごろから具合が悪くなり、夕方熱が沸騰したので病院へ行った","このストーブは沸騰するのが早いので、すぐに部屋が暖かくなる"]'::jsonb,1,NULL,'沸騰(ふっとう)=boiling — correct: お湯が沸騰したら'),
('n3','vocabulary','multiple_choice','「まげる」の使い方として最もよいものはどれですか。','["今朝は寒かったので、マフラーを首にまげて出かけた","けがは良くなったが、腕を伸ばしたりまげたりすると、まだ少し痛む","一つのパンを半分にまげて、二人で分けて食べた","シャツをきちんとまげたら、たんすの引き出しにしまってください"]'::jsonb,1,NULL,'まげる=曲げる (to bend) — correct: 腕を伸ばしたりまげたりする'),
('n3','vocabulary','multiple_choice','「出張」の使い方として最もよいものはどれですか。','["営業のため、来週一週間、課長とアメリカに出張します","仕事を辞めたら、家族とゆっくり海外に出張したいと思う","わたしは毎朝９時に会社に出張し、残業はしないで家に帰る","あしたは子どもの運動会に出張するので、仕事を休みます"]'::jsonb,0,NULL,'出張(しゅっちょう)=business trip — correct: アメリカに出張します'),
('n3','vocabulary','multiple_choice','「慰める」の使い方として最もよいものはどれですか。','["祖母は古い物でも捨てないで、長い間慰めて使っている","試合を見ながら、優勝を願って一生懸命選手を慰めた","仕事で失敗してしまったが、友人が慰めてくれたので元気が出た","弟が希望の大学に合格したので、家族で外食をして慰めた"]'::jsonb,2,NULL,'慰める(なぐさめる)=to comfort — correct: 友人が慰めてくれた'),

-- ============================================================
-- N3 GRAMMAR (文法 問題1 — fill-in)
-- ============================================================
('n3','grammar','multiple_choice','彼は小説家（　）有名になったが、普段は小さな病院で働く医者だ。','["について","として","にしたがって","と比べて"]'::jsonb,1,NULL,'として=as (in the capacity of): 小説家として有名'),
('n3','grammar','multiple_choice','「もし自分を色で表す（　）、何色ですか。」と聞かれた。','["ことから","という点で","ように","としたら"]'::jsonb,3,NULL,'としたら=if (hypothetical): もし～としたら'),
('n3','grammar','multiple_choice','昨日の夜、寝る前に（　）ヨーグルトが食べたくなって、夜中なのにコンビニに買いに行ってしまった。','["どうか","せっかく","どうしても","きっと"]'::jsonb,2,NULL,'どうしても=no matter what/just had to — expresses strong urge'),
('n3','grammar','multiple_choice','このケーキは材料を混ぜて焼く（　）から、誰でも失敗せずにおいしく作れる。','["だけだ","ことだ","せいだ","ときだ"]'::jsonb,0,NULL,'～だけだ=all you have to do is ~ (simplicity)'),
('n3','grammar','multiple_choice','私の町では毎年８月最後の日曜日に夏祭りが（　）。','["行います","行わせます","行っています","行われます"]'::jsonb,3,NULL,'行われます=passive: is held/takes place (festival held by organizers)'),
('n3','grammar','multiple_choice','（靴屋で）「確認しますので、少々（　）。」','["お待ちしております","お待ちください","お待ちできます","お待ちしましょう"]'::jsonb,1,NULL,'お待ちください=polite imperative: please wait (correct keigo for staff→customer)'),
('n3','grammar','multiple_choice','「私、ABC銀行の中田と（　）が、山石さんをお願いします。」','["ございます","いたします","申します","申し上げます"]'::jsonb,2,NULL,'申します(もうします)=polite self-introduction: I am (humble form of 言う)'),
('n3','grammar','multiple_choice','息子が通う高校では、基本的には全員がお弁当を（　）。','["持っていったばかりだ","持っていくことになっている","持っていきたい","持っていくつもりだ"]'::jsonb,1,NULL,'～ことになっている=it is the rule/custom that ~ (established rule)'),
('n3','grammar','multiple_choice','昼寝をするのは気持ちがいいが、夜（　）困るので、いつも１５分ぐらいで起きる。','["寝なくて","寝られると思って","寝られないと","寝ると思うと"]'::jsonb,2,NULL,'寝られないと困る=it''s a problem if I can''t sleep (conditional concern)'),
('n3','grammar','multiple_choice','A市は、保育園を（　）利用できない人がいることが問題になっている。','["利用したくても","利用しそうになって","利用しているのに","利用できたら"]'::jsonb,0,NULL,'したくてもできない=want to but can''t (expressing frustrating inability)'),
('n3','grammar','multiple_choice','妻に「今夜行くレストランの予約をお願いできる？」と言われた夫は何と答えましたか。','["予約してね","予約しておくよ","予約しようよ","予約してあるね"]'::jsonb,1,NULL,'予約しておくよ=I''ll make the reservation (for future use: ～ておく)'),
('n3','grammar','multiple_choice','（畑で）子「このトマト、もう食べられる？」父「うん。そろそろ（　）ね。」','["食べやすいそうだ","食べていそうだ","食べたがるそうだ","食べてもよさそうだ"]'::jsonb,3,NULL,'食べてもよさそうだ=looks like it''s okay to eat (inference from appearance: ～そうだ)'),
('n3','grammar','multiple_choice','（改札で）中川「これ以上待つと私たちも間に合わないから、先に（　）。」','["行ってしまいましょうか","行ってしまうのでしょう","行ってしまいましたか","行ってしまっていました"]'::jsonb,0,NULL,'行ってしまいましょうか=shall we just go ahead? (volitional + てしまう suggesting decisiveness)'),

-- ============================================================
-- N3 GRAMMAR (文法 問題2 — word ordering)
-- ============================================================
('n3','grammar','reorder','この写真の鳥はとても珍しくて、この鳥の ___★___ そうだ。','[]'::jsonb,NULL,'["研究をしている","専門家でも","なかなか","見る機会がない"]'::jsonb,'Correct: この鳥の研究をしている専門家でもなかなか見る機会がないそうだ'),
('n3','grammar','reorder','春から大学生になる娘には、___★___ できない経験をいろいろしてほしい。','[]'::jsonb,NULL,'["勉強以外","にも","大学時代","にしか"]'::jsonb,'Correct: 娘には、勉強以外にも大学時代にしかできない経験をいろいろしてほしい'),
('n3','grammar','reorder','日曜日は ___★___ 私の好きな週末の過ごし方だ。','[]'::jsonb,NULL,'["どこにも出かけずに","家で過ごす","という","のが"]'::jsonb,'Correct: 日曜日はどこにも出かけずに家で過ごすというのが私の好きな週末の過ごし方だ'),
('n3','grammar','reorder','（レストランで）しばらくここで待てって ___★___。まだですか。','[]'::jsonb,NULL,'["言われた","から","待っているんです","けど"]'::jsonb,'Correct: 待てって言われたから待っているんですけど'),
('n3','grammar','reorder','歴史を ___★___ 進学を決めた。','[]'::jsonb,NULL,'["勉強すればするほど","もっと学びたい","と思うようになって","歴史学科への"]'::jsonb,'Correct: 歴史を勉強すればするほどもっと学びたいと思うようになって歴史学科への進学を決めた'),

-- ============================================================
-- N3 GRAMMAR (読解 問題3 — passage fill-in: 日本人の天気の話)
-- ============================================================
('n3','grammar','multiple_choice','あちこちで、多くの人があいさつに続けて天気の話をしているのを聞きました。（　）、私の国では天気の話をあまりしないので、なぜ天気の話をするのかわかりませんでした。','["そのうえ","つまり","けれども","すると"]'::jsonb,2,NULL,'けれども=however (contrast: heard it everywhere, but didn''t understand why)'),
('n3','grammar','multiple_choice','（ある冬の寒い朝、友達に会ったとき）「おはよう。」の後で自然に「寒いね。」と（　）。','["言われていました","言ってもらいました","言わせてみました","言ってしまいました"]'::jsonb,3,NULL,'言ってしまいました=said it spontaneously (～てしまう = ended up doing naturally)'),
('n3','grammar','multiple_choice','天気の話が天気に関係した話に（　）、おもしろいと思いました。','["広がって","広がるより","広がるように","広がったそうで"]'::jsonb,0,NULL,'広がって=spread/expanded (te-form: the topic expanded, and I found it interesting)'),
('n3','grammar','multiple_choice','そのため、多くの日本人が天気に関心を（　）。','["持ったはずがありません","持ちたがりません","持つのかもしれません","持とうとしません"]'::jsonb,2,NULL,'持つのかもしれません=may have interest in (inference/conjecture: かもしれない)'),
('n3','grammar','multiple_choice','（　）も天気の話をする人が多い理由の一つだと思います。','["どれ","これ","あれら","それら"]'::jsonb,1,NULL,'これ=this (refers to the ease of talking about weather, just stated — proximal reference)'),

-- ============================================================
-- N2 KANJI (問題1 — kanji reading)
-- ============================================================
('n2','kanji','multiple_choice','先生に貴重な資料を見せていただいた。','["きじゅう","きちょう","きっじゅう","きっちょう"]'::jsonb,1,NULL,'貴重(きちょう)=precious/valuable'),
('n2','kanji','multiple_choice','その話を聞いて、とても怪しいと思った。','["むなしい","くやしい","おかしい","あやしい"]'::jsonb,3,NULL,'怪しい(あやしい)=suspicious/strange'),
('n2','kanji','multiple_choice','佐藤さんは容姿も性格もいい。','["よし","ようし","ようす","よす"]'::jsonb,1,NULL,'容姿(ようし)=appearance/looks'),
('n2','kanji','multiple_choice','これは危険を伴う実験だ。','["はらう","あつかう","ともなう","すくう"]'::jsonb,2,NULL,'伴う(ともなう)=to accompany/entail'),
('n2','kanji','multiple_choice','以前は、海外で暮らしたいという願望が強かった。','["がんぼう","げんぼう","がんぼ","げんぼ"]'::jsonb,0,NULL,'願望(がんぼう)=desire/wish'),

-- ============================================================
-- N2 KANJI (問題2 — hiragana to kanji)
-- ============================================================
('n2','kanji','multiple_choice','友人を家にまねいた。','["伯いた","招いた","泊いた","召いた"]'::jsonb,1,NULL,'まねく=招く (to invite)'),
('n2','kanji','multiple_choice','この商品は安全性がほしょうされている。','["補証","保正","保証","補正"]'::jsonb,2,NULL,'ほしょう=保証 (guarantee/warranty)'),
('n2','kanji','multiple_choice','この企業では、さまざまなもよおしを行っている。','["携し","催し","推し","権し"]'::jsonb,1,NULL,'もよおし=催し (event/gathering)'),
('n2','kanji','multiple_choice','銀行に行って、お札をこうかに替えた。','["硬貨","固貨","硬価","固価"]'::jsonb,0,NULL,'こうか=硬貨 (coins/change)'),
('n2','kanji','multiple_choice','わが社の商品はここでせいぞうされている。','["製増","制増","制造","製造"]'::jsonb,3,NULL,'せいぞう=製造 (manufacturing/production)'),

-- ============================================================
-- N2 VOCABULARY (問題3 — word formation with suffix/prefix)
-- ============================================================
('n2','vocabulary','multiple_choice','男女の結婚（　）の違いについて調べた。','["観","識","念","察"]'::jsonb,0,NULL,'結婚観(けっこんかん)=views on marriage (～観=one''s view on)'),
('n2','vocabulary','multiple_choice','ここでは（　）水準の医療が受けられる。','["頂","上","高","特"]'::jsonb,2,NULL,'高水準(こうすいじゅん)=high standard (高～=high/superior)'),
('n2','vocabulary','multiple_choice','今日は大学の講義で日本（　）の経営について学んだ。','["状","類","式","則"]'::jsonb,2,NULL,'日本式(にほんしき)=Japanese style (～式=style/method)'),
('n2','vocabulary','multiple_choice','開封しても、（　）使用の物は返品可能です。','["外","否","前","未"]'::jsonb,3,NULL,'未使用(みしよう)=unused (未～=not yet)'),
('n2','vocabulary','multiple_choice','受験生なので、勉強（　）の毎日だ。','["漬け","浸し","溶け","満ち"]'::jsonb,0,NULL,'勉強漬け(べんきょうづけ)=immersed in studying (～漬け=soaked/consumed by)'),

-- ============================================================
-- N2 VOCABULARY (問題4 — contextual vocabulary fill-in)
-- ============================================================
('n2','vocabulary','multiple_choice','この大学では一般向けの講座を開き、社会に学習の場を（　）している。','["選出","提供","指示","寄付"]'::jsonb,1,NULL,'提供(ていきょう)=to provide/offer'),
('n2','vocabulary','multiple_choice','今年の夏は暑さが厳しく、仕事から家に帰ると疲れて（　）してしまう。','["ぐったり","しっかり","すっきり","ぎっしり"]'::jsonb,0,NULL,'ぐったり=exhausted/limp from fatigue'),
('n2','vocabulary','multiple_choice','学生時代の友人が私の名前を忘れていたので、とても（　）だった。','["アウト","ダウン","ショック","エラー"]'::jsonb,2,NULL,'ショック=shocked (emotional impact)'),
('n2','vocabulary','multiple_choice','通路に荷物を置いたら、通る人の（　）になりますよ。','["面倒","邪魔","被害","無理"]'::jsonb,1,NULL,'邪魔(じゃま)=obstruction/hindrance'),
('n2','vocabulary','multiple_choice','少し長めの上り坂だったが（　）ので、それほど疲れなかった。','["おとなしかった","ささやかだった","なだらかだった","よわよわしかった"]'::jsonb,2,NULL,'なだらかだ=gentle/gradual (slope)'),
('n2','vocabulary','multiple_choice','出席者は皆会議に積極的に参加し、意見を（　）交換し合った。','["活発に","円満に","機敏に","濃厚に"]'::jsonb,0,NULL,'活発に(かっぱつに)=actively/vigorously'),
('n2','vocabulary','multiple_choice','列に並んでいたら、私の前に強引に（　）きた人がいて、嫌な気分になった。','["当てはまって","付け加えて","行き着いて","割り込んで"]'::jsonb,3,NULL,'割り込む(わりこむ)=to cut in line/butt in'),

-- ============================================================
-- N2 VOCABULARY (問題5 — synonyms/paraphrase)
-- ============================================================
('n2','vocabulary','multiple_choice','高橋さんはとても愉快な人だ。','["面白い","おしゃれな","親切な","かわいい"]'::jsonb,0,NULL,'愉快(ゆかい)≒面白い (fun/amusing)'),
('n2','vocabulary','multiple_choice','それは確かにやむをえないことだと思う。','["もったいない","なさけない","つまらない","しかたない"]'::jsonb,3,NULL,'やむをえない≒しかたない (unavoidable/can''t be helped)'),
('n2','vocabulary','multiple_choice','少し息抜きしたほうがいいよ。','["待った","急いだ","休んだ","働いた"]'::jsonb,2,NULL,'息抜き(いきぬき)=taking a break (≒休む)'),
('n2','vocabulary','multiple_choice','今日はとてもついていた。','["気分が悪かった","運が悪かった","気分がよかった","運がよかった"]'::jsonb,3,NULL,'ついている=lucky (≒運がよい)'),
('n2','vocabulary','multiple_choice','私はつねに言葉遣いに気をつけている。','["当然","いつも","特に","できるだけ"]'::jsonb,1,NULL,'つねに=常に=always (≒いつも)'),

-- ============================================================
-- N2 VOCABULARY (問題6 — word usage)
-- ============================================================
('n2','vocabulary','multiple_choice','「延長」の使い方として最もよいものを選びなさい。','["悪天候で列車が運転をやめたため、旅行の出発が三日後に延長された","初めの設計では２階建てだったが、３階建ての家に延長することにした","予定の時間内に結論が出ず、会議が１時間延長されることになった","電車の中で居眠りをして、降りる駅を一駅延長してしまった"]'::jsonb,2,NULL,'延長(えんちょう)=extension/prolonging — correct: 会議が延長された'),
('n2','vocabulary','multiple_choice','「さびる」の使い方として最もよいものを選びなさい。','["暑いところに生ものをずっと置いておいたら、さびて臭くなった","昨夜は雨が相当降ったらしく、普段はきれいな川の水がさびて濁っている","鉢に植えた植物に水をやるのを忘れていたら、花がさびてしまった","この鉄の棒はずっと家の外に置いてあったので、さびて茶色くなっている"]'::jsonb,3,NULL,'さびる=錆びる (to rust) — correct: 鉄の棒がさびて茶色くなっている'),
('n2','vocabulary','multiple_choice','「目上」の使い方として最もよいものを選びなさい。','["勉強会に参加した社員がすべて目上だったので、新人の私はとても緊張した","この店で一番値段が高く目上の商品は、店の奥にある棚に並べられていた","高校時代、鈴木さんはとても優秀で、成績はいつも学年で目上だった","あの若さで金賞を受賞した伊藤さんは、本当に目上の人だと思う"]'::jsonb,0,NULL,'目上(めうえ)=superior/senior — correct: 社員がすべて目上だったので緊張した'),
('n2','vocabulary','multiple_choice','「大げさ」の使い方として最もよいものを選びなさい。','["息子の誕生日に料理を作りすぎてしまい、大げさに余ってしまった","天気予報によると、明日は今日より大げさに気温が下がるらしい","努力した結果、試験の成績が大げさに伸びて、先生に褒められた","あの人は小さなことを大げさに言うので、そのまま信じないほうがいい"]'::jsonb,3,NULL,'大げさ=exaggerated — correct: 小さなことを大げさに言う'),
('n2','vocabulary','multiple_choice','「反省」の使い方として最もよいものを選びなさい。','["発表の原稿を全部覚えたのに、緊張のせいでどんなに反省しても全く思い出せない","今回の企画では、私の準備不足で周りに迷惑をかけたことをとても反省しています","祖父はいつも若いころの思い出を懐かしそうに反省して私に話してくれる","この機械の使い方を忘れないように、もう一度最初から反省しておきましょう"]'::jsonb,1,NULL,'反省(はんせい)=reflecting on one''s mistakes — correct: 準備不足で迷惑をかけたことを反省'),

-- ============================================================
-- N2 GRAMMAR (問題7 — fill-in)
-- ============================================================
('n2','grammar','multiple_choice','卒業論文がなかなか書けなくて、一時は（　）かけたが、何とか今日無事に提出することができた。','["あきらめ","あきらめて","あきらめる","あきらめた"]'::jsonb,0,NULL,'あきらめかける=to be on the verge of giving up (V-stem + かける)'),
('n2','grammar','multiple_choice','子どものころ、母（　）作ったハンバーグが大好きで、よく作ってもらった。','["の","との","によって","にとって"]'::jsonb,0,NULL,'母の作ったハンバーグ=hamburger made by mother (の modifies 作った)'),
('n2','grammar','multiple_choice','多様な情報があふれる現代社会（　）、大切なのは、膨大な情報の中から、自分に必要な情報を選ぶ力である。','["に加えて","において","を基にして","を込めて"]'::jsonb,1,NULL,'において=in/within (formal location marker: 現代社会において)'),
('n2','grammar','multiple_choice','作文が得意な友達に「どうやったらうまくなれるの？」と聞いたら、「たくさん書けば（　）うまくなるよ。」と言われた。','["必ずしも","たとえ","そのうち","さっき"]'::jsonb,2,NULL,'そのうち=eventually/in time (gradual improvement)'),
('n2','grammar','multiple_choice','看護師の仕事は夜勤もあって大変だが、自分でこの仕事を選んだ（　）、がんばって続けたいと思う。','["以上","とたん","あげくに","かのようで"]'::jsonb,0,NULL,'～以上=since/given that ~ (implies commitment from one''s own choice)'),
('n2','grammar','multiple_choice','（内線電話で）木村「受付の木村ですが、X社の中川様が（　）。」','["伺いました","お目にかかりました","ございました","お越しになりました"]'::jsonb,3,NULL,'お越しになりました=has arrived (respectful: used when referring to a visitor)'),
('n2','grammar','multiple_choice','人は一生のうちどのくらい寝ているのでしょうか。仮に一日８時間寝て、80歳まで生きる（　）。すると、睡眠時間は約27年寝ている計算になります。','["となりました","とします","とされていました","と見られます"]'::jsonb,1,NULL,'とします=let''s say/suppose that (hypothetical calculation)'),
('n2','grammar','multiple_choice','夢を語る（　）誰でもできるが、実現させるのは簡単なことではない。','["だけでは","だけなら","ためしか","ためには"]'::jsonb,1,NULL,'だけなら=if it''s just a matter of ~ (contrast: easy to say, hard to do)'),
('n2','grammar','multiple_choice','（説明書で）エアコンを掃除するときは、安全上、必ずコンセントを（　）してください。','["抜いたことを","抜いたことが","抜いてからに","抜いてからは"]'::jsonb,2,NULL,'抜いてからにする=to make sure to do after pulling out (～てからにする=do A before B)'),
('n2','grammar','multiple_choice','私はスピーチが苦手なのに、今度友達の結婚パーティーでスピーチを（　）、困っている。','["しにくくて","してほしくて","させてみたくて","することになってしまって"]'::jsonb,3,NULL,'することになってしまって=ended up having to do (unexpectedly decided/obligated)'),
('n2','grammar','multiple_choice','せっかく、夕日がきれいなことで有名なA海岸に来たのに、急に雨が降り出した。どうも夕日は（　）。','["見えてもしかたない","見られないことだった","見られそうにない","見えないことがあった"]'::jsonb,2,NULL,'見られそうにない=doesn''t look like we can see it (negative inference: ～そうにない)'),
('n2','grammar','multiple_choice','山川「中村くん、毎日ジョギング（　）？」中村「うん、そうなんだよ。」','["しない","しててもいい","しちゃえば","してるんだって"]'::jsonb,3,NULL,'してるんだって=I heard you''re doing ~ (casual reported hearsay: ～んだって)'),

-- ============================================================
-- N2 GRAMMAR (問題8 — word ordering)
-- ============================================================
('n2','grammar','reorder','結婚生活を送る ___★___ 、相手への思いやりの気持ちを持つことだと思う。','[]'::jsonb,NULL,'["うえで","何が","大切か","といえば"]'::jsonb,'Correct: 結婚生活を送るうえで何が大切かといえば、相手への思いやりの気持ちを持つことだと思う'),
('n2','grammar','reorder','就職したときに ___★___ とうとう壊れたので、買い換えることにした。','[]'::jsonb,NULL,'["買って以来","ずっと","使っていた","かばんが"]'::jsonb,'Correct: 就職したときに買って以来ずっと使っていたかばんがとうとう壊れた'),
('n2','grammar','reorder','登っているときはこんなに ___★___ なぜかまた登りたくなる。','[]'::jsonb,NULL,'["苦しいことは","二度としたくないと","思うのに","山を下りて何日かすると"]'::jsonb,'Correct: こんなに苦しいことは二度としたくないと思うのに山を下りて何日かするとなぜかまた登りたくなる'),
('n2','grammar','reorder','彫刻家川村たけるが作る動物の彫刻作品は、形はシンプル ___★___ 生命力にあふれている。','[]'::jsonb,NULL,'["ながら","今にも","動き出し","そうな"]'::jsonb,'Correct: 形はシンプルながら今にも動き出しそうな生命力にあふれている'),
('n2','grammar','reorder','ビジネスで成功できる人とできない人との違いは、どんなに大変な状況でもあきらめずに ___★___ と思う。','[]'::jsonb,NULL,'["最後まで","取り組める","かどうか","にある"]'::jsonb,'Correct: あきらめずに最後まで取り組めるかどうかにあると思う'),

-- ============================================================
-- N2 GRAMMAR (問題9 — passage fill-in: 日本発のトイレマーク)
-- ============================================================
('n2','grammar','multiple_choice','世界のあちこちで使われているこのトイレマークが実は日本で生まれたものだということを（　）。','["ご存じなわけだ","ご存じだろうか","ご存じのようだ","ご存じだからだろう"]'::jsonb,1,NULL,'ご存じだろうか=do you know? (rhetorical question engaging reader)'),
('n2','grammar','multiple_choice','日本国内の案内板は「お手洗い」などと日本語で書かれているものがほとんどだった。（　）、それでは世界90数か国から来日する選手たちに理解してもらえない。','["それに","しかし","または","それどころか"]'::jsonb,1,NULL,'しかし=however (contrast: the signs were in Japanese, but that wouldn''t work for international athletes)'),
('n2','grammar','multiple_choice','案内板作成者たちは、あらゆる国の選手が理解できるよう、絵で表すことを考えた。（　）、トイレマークなのだ。','["作成者が理解したのは","日本で考えられたのが","ここに生み出したのは","こうして生まれたのが"]'::jsonb,3,NULL,'こうして生まれたのが=this is how (X) was born — links the preceding explanation to the result'),
('n2','grammar','multiple_choice','競技を表すマークは、この東京オリンピックで初めて全面的に導入され、高い評価を受けた。そして、その後のオリンピックでもデザインを変えながら毎回（　）。','["使用されている","使用した点だ","使用していける","使用したいものだ"]'::jsonb,0,NULL,'使用されている=is being used (passive present: continuing use across Olympics)'),
('n2','grammar','multiple_choice','それは、あらゆる人にわかりやすくという思いが世界に届いた（　）。','["結果として表れるかもしれない","結果のはずだった","結果に違いない","結果でなければならなかった"]'::jsonb,2,NULL,'結果に違いない=must be the result of ~ (strong conclusion: に違いない)'),

-- ============================================================
-- N1 KANJI (問題1 — kanji reading)
-- ============================================================
('n1','kanji','multiple_choice','社会活動に参加することで、人脈を広げることができた。','["じんみゃく","じんまく","にんみゃく","にんまく"]'::jsonb,0,NULL,'人脈(じんみゃく)=personal connections/network'),
('n1','kanji','multiple_choice','鈴木さんは指摘がいつも的確で、本当に賢い人だと思う。','["するどい","かしこい","すごい","えらい"]'::jsonb,1,NULL,'賢い(かしこい)=wise/clever'),
('n1','kanji','multiple_choice','文化の違いが食生活に顕著に現れている。','["げんちょ","けんしょ","けんちょ","げんしょ"]'::jsonb,2,NULL,'顕著(けんちょ)=remarkable/noticeable'),
('n1','kanji','multiple_choice','相談の内容は多岐にわたった。','["たき","たじ","たぎ","たし"]'::jsonb,0,NULL,'多岐(たき)=many branches/diverse aspects'),
('n1','kanji','multiple_choice','その風習は、今はもう廃れてしまった。','["くずれて","かすれて","つぶれて","すたれて"]'::jsonb,3,NULL,'廃れる(すたれる)=to fall into disuse'),
('n1','kanji','multiple_choice','家賃の相場は地域によって違う。','["あいば","そうば","あいじょう","そうじょう"]'::jsonb,1,NULL,'相場(そうば)=market price/going rate'),

-- ============================================================
-- N1 KANJI (問題2 — contextual vocabulary fill-in)
-- ============================================================
('n1','kanji','multiple_choice','私はこの土地で定職に就き、生活の（　）を築いた。','["根拠","基盤","根源","基地"]'::jsonb,1,NULL,'基盤(きばん)=foundation/base (solid basis for life)'),
('n1','kanji','multiple_choice','議論は難航すると思ったが、すぐに意見がまとまり、（　）結論が出た。','["すんなり","うっとり","ふんわり","こっそり"]'::jsonb,0,NULL,'すんなり=smoothly/without difficulty'),
('n1','kanji','multiple_choice','さっき駅前で佐藤さんを（　）んですが、今、海外にいるはずなのに変ですね。','["見合わせた","見過ごした","見かけた","見違えた"]'::jsonb,2,NULL,'見かける=to happen to see/catch sight of'),
('n1','kanji','multiple_choice','市長の責任ある行動が住民の不安を（　）し、行政に対する期待が一気に高まった。','["一掃","追放","削除","排出"]'::jsonb,0,NULL,'一掃(いっそう)=to sweep away/eliminate completely'),
('n1','kanji','multiple_choice','十分に煮た野菜は味が（　）柔らかく、とてもおいしかった。','["溶けて","染みて","潤って","沈んで"]'::jsonb,1,NULL,'染みる(しみる)=to soak in/permeate (flavor permeates the vegetable)'),
('n1','kanji','multiple_choice','このテーブルは私が子どものころから使っているので、（　）があって捨てられない。','["心情","好感","熱意","愛着"]'::jsonb,3,NULL,'愛着(あいちゃく)=attachment/affection toward a familiar object'),
('n1','kanji','multiple_choice','現社長は創立者から経営の（　）を学んだ。','["データベース","ベテラン","ライフワーク","ノウハウ"]'::jsonb,3,NULL,'ノウハウ=know-how (practical management knowledge)'),

-- ============================================================
-- N1 VOCABULARY (問題3 — synonyms/paraphrase)
-- ============================================================
('n1','vocabulary','multiple_choice','高橋さんにはかねがねお会いしたいと思っていました。','["直接","ぜひ","早く","以前から"]'::jsonb,3,NULL,'かねがね≒以前から (for a long time/all along)'),
('n1','vocabulary','multiple_choice','林さんはそれを故意に捨てたらしい。','["わざと","うっかり","いやいや","さっさと"]'::jsonb,0,NULL,'故意に(こいに)≒わざと (intentionally/on purpose)'),
('n1','vocabulary','multiple_choice','昨日、鈴木さんにおわびした。','["文句を言った","お礼を言った","断った","謝った"]'::jsonb,3,NULL,'おわびする≒謝る (to apologize/express regret)'),
('n1','vocabulary','multiple_choice','中村さんの言葉からは強い意気込みが伝わってくる。','["敬意","自信","意欲","信頼"]'::jsonb,2,NULL,'意気込み(いきごみ)≒意欲 (enthusiasm/drive/motivation)'),
('n1','vocabulary','multiple_choice','妹は少しおびえているようだった。','["焦って","怖がって","悩んで","悔やんで"]'::jsonb,1,NULL,'おびえる≒怖がる (to be frightened/scared)'),
('n1','vocabulary','multiple_choice','私はその一言に安堵した。','["すっとした","はっとした","ほっとした","かっとした"]'::jsonb,2,NULL,'安堵する(あんどする)≒ほっとする (to feel relieved)'),

-- ============================================================
-- N1 VOCABULARY (問題4 — word usage)
-- ============================================================
('n1','vocabulary','multiple_choice','「閑静」の使い方として最もよいものを選びなさい。','["そのレストランは繁華街から外れた閑静な場所にある","今日は朝から具合が悪かったので、会社を休んで家で閑静にしていた","用事が早く済み、閑静な時間ができたので、映画を見に行くことにした","日中はにぎやかな公園だが、夜になると急に閑静になる"]'::jsonb,0,NULL,'閑静(かんせい)=quiet and peaceful — correct: 繁華街から外れた閑静な場所'),
('n1','vocabulary','multiple_choice','「たやすい」の使い方として最もよいものを選びなさい。','["弟は寝坊したらしく、たやすい物だけ食べて、慌てて出かけていった","伊藤氏とは大学時代からの親友で、本音が言えるたやすい関係だ","せっかくの日曜日だから、ゆっくり休んでたやすく過ごそうと思う","この問題は想像以上に複雑で、たやすく解決できるものではなかった"]'::jsonb,3,NULL,'たやすい=easy/simple — correct: たやすく解決できるものではなかった'),
('n1','vocabulary','multiple_choice','「察する」の使い方として最もよいものを選びなさい。','["医師たちはチームを組み、意見を出し合って、最良の治療法を察した","気象予報士はテレビの天気予報で、来週の気温の変化を察し始めた","鈴木さんは、私が何も言わなくても、私の気持ちを察して慰めてくれた","外を歩いていたら急にいいアイディアを察したので、手帳にメモをした"]'::jsonb,2,NULL,'察する(さっする)=to sense/infer — correct: 気持ちを察して慰めてくれた'),
('n1','vocabulary','multiple_choice','「内訳」の使い方として最もよいものを選びなさい。','["来週の内訳を確認したが、予定がないのは木曜の夜だけだ","前回の出張費の内訳を見たら、交通費の割合が予想外に高かった","司会者は進行を間違えないように、式の内訳を何度も見直した","家族の健康のため、栄養の内訳を考えて食事を作っている"]'::jsonb,1,NULL,'内訳(うちわけ)=itemized breakdown — correct: 出張費の内訳（交通費の割合）'),
('n1','vocabulary','multiple_choice','「食い違う」の使い方として最もよいものを選びなさい。','["この事件は、複数の目撃者の話がそれぞれ食い違っており、不明な点が多い","金庫を開けようと思ったが、どの鍵も食い違って開けられなかった","何だか歩きにくいと思ったら、サンダルの左右が食い違っていた","調味料を変えたのか、この料理はいつもと味が食い違っているように感じる"]'::jsonb,0,NULL,'食い違う(くいちがう)=to be at odds/contradict — correct: 目撃者の話がそれぞれ食い違っており'),
('n1','vocabulary','multiple_choice','「過密」の使い方として最もよいものを選びなさい。','["雑誌で紹介されてから、この商品への過密な注文が続いているらしい","水質汚染に関して人々の抗議が過密になり、政府は対策を迫られている","今回の出張は過密なスケジュールで、ゆっくり食事する時間もなさそうだ","春になると、この池の周りには、色とりどりの花が過密に咲き乱れる"]'::jsonb,2,NULL,'過密(かみつ)=overcrowded/excessively dense — correct: 過密なスケジュール'),

-- ============================================================
-- N1 GRAMMAR (問題5 — fill-in)
-- ============================================================
('n1','grammar','multiple_choice','朝の満員電車。車内の混雑を（　）、私の目の前に座っている学生風の男は、平然とノートパソコンを広げて、作業に没頭していた。','["含めて","もとに","除いて","よそに"]'::jsonb,3,NULL,'よそに=ignoring/regardless of (～をよそに=disregarding ~)'),
('n1','grammar','multiple_choice','私の父は、（　）もしないで漫画を批判するから、本当に嫌になる。','["読まない","読み","読もう","読んで"]'::jsonb,1,NULL,'読みもしない=not even reading (V-stem＋もしない=not even doing ~)'),
('n1','grammar','multiple_choice','「チームワークの大切さを痛感しました。（　）、それは去年企画チームのリーダーになって初めて気づいたことですが。」','["要するに","あるいは","もっとも","ついては"]'::jsonb,2,NULL,'もっとも=that said/although (adds a qualification or exception to previous statement)'),
('n1','grammar','multiple_choice','村に初めて汽車が走ったときのことを鮮明に覚えて（　）、その記憶力に驚いた。','["おいでになり","差し上げ","まいり","申し上げ"]'::jsonb,0,NULL,'おいでになる=respectful form of いる (used for another person''s state)'),
('n1','grammar','multiple_choice','知識はある（　）が、それよりも人柄や仕事に取り組む姿勢を重視しています。','["にすぎません","ことは否めません","に越したことはありません","といっても過言ではありません"]'::jsonb,2,NULL,'に越したことはない=there is nothing better than ~ (knowledge is preferable, but not required)'),
('n1','grammar','multiple_choice','復旧状況（　）、営業再開が遅れる可能性がありますので、ご了承ください。','["次第には","次第に","次第では","次第"]'::jsonb,2,NULL,'次第では=depending on ~ (状況次第では=depending on the situation)'),
('n1','grammar','multiple_choice','クレジットカードの番号等、他人に（　）困る情報は、電子メールには書かないほうがいいそうだ。','["知っていても","知っていなくても","知らなくては","知られては"]'::jsonb,3,NULL,'知られては困る=troublesome if known by others (passive ～ては困る)'),
('n1','grammar','multiple_choice','仕事は、決められた時間内に、いかに成果を上げるかが大切であり、単に時間をかけて（　）と私は思う。','["がんばることだといってもおかしくない","がんばればいいというものではない","がんばることでしかない","がんばりようがない"]'::jsonb,1,NULL,'～というものではない=just doing ~ is not enough (negates simplistic thinking)'),
('n1','grammar','multiple_choice','いずれ近いうちに海底のより詳細な地質構造が明らかに（　）。','["なるものと思われる","するという思いがある","なったかに思える","するだろうと思う"]'::jsonb,0,NULL,'なるものと思われる=is believed that it will become (formal/scientific writing)'),
('n1','grammar','multiple_choice','山下「あのう、西村先輩。私、今日でこのサークルを（　）。」西村「ええ？辞める？急にどうして？」','["辞めてしまわれたのでしょうか","辞めてしまったのかと思って","辞めさせたらどうでしょうか","辞めさせてもらおうかと思って"]'::jsonb,3,NULL,'辞めさせてもらおうかと思って=humbly requesting to resign (させてもらう=humble permission)'),

-- ============================================================
-- N1 GRAMMAR (問題6 — word ordering)
-- ============================================================
('n1','grammar','reorder','「アセビ」という白い花を咲かせる樹木を漢字で「馬酔木」と書くのは、アセビには ___★___ そうです。','[]'::jsonb,NULL,'["有毒成分があり","馬が食べると酔ったような","状態になることに","由来する"]'::jsonb,'Correct: アセビには有毒成分があり馬が食べると酔ったような状態になることに由来するそうです'),
('n1','grammar','reorder','家族の時間を大切にする夫は、つい ___★___ ありがたい存在です。','[]'::jsonb,NULL,'["仕事に夢中になりすぎる","私に","本当に大切なものは何なのか","気づかせてくれる"]'::jsonb,'Correct: 仕事に夢中になりすぎる私に本当に大切なものは何なのか気づかせてくれる'),
('n1','grammar','reorder','Z県知事の林和夫氏は、週刊誌で、脱税を行った ___★___ 異なり、名誉を傷つけられたとして訴訟を起こした。','[]'::jsonb,NULL,'["疑いがあるなどと","報じられた","ことに対し","事実とは全く"]'::jsonb,'Correct: 脱税を行った疑いがあるなどと報じられたことに対し事実とは全く異なり'),
('n1','grammar','reorder','Q鉄道が10年ぶりに運賃値上げに踏み切った。安全対策や原油の高騰で支出が増え、経営努力だけでは対応しきれないと判断 ___★___。','[]'::jsonb,NULL,'["して","の","ことだ","という"]'::jsonb,'Correct: 対応しきれないと判断してのことだという'),
('n1','grammar','reorder','世の中にはさまざまな資格があふれているが、資格を取った ___★___ 世間は甘くないらしい。','[]'::jsonb,NULL,'["だけ","で","希望の職につける","ほど"]'::jsonb,'Correct: 資格を取っただけで希望の職につけるほど世間は甘くない'),

-- ============================================================
-- N1 GRAMMAR (問題7 — passage fill-in: 十人十色 cat essay)
-- ============================================================
('n1','grammar','multiple_choice','（エッセイ：マニュアルは機械に使うもの、生き物には通じない）「あちらに通用したことが、（　）。」','["こちらにはいえないこともない","こちらにいえるとは限らない","こちらにもいえるとは思わなかった","こちらにはいえないと思うのか"]'::jsonb,1,NULL,'こちらにいえるとは限らない=doesn''t necessarily apply here (what works for one doesn''t for another)'),
('n1','grammar','multiple_choice','（エッセイ：ねこを飼い始めた話）「さて、（　）時に、当然のことながら『ねこの飼い方』の本も読んだ。」','["そういう","する","あの","やろうという"]'::jsonb,0,NULL,'そういう時=at such a time (referring back to the described situation of getting a cat)'),
('n1','grammar','multiple_choice','（エッセイ：ねこの飼い方マニュアルを読んだ）「中でも納得したのが、（　）。」','["トイレのことだ","トイレのことであるに違いない","トイレだからである","トイレだと聞いている"]'::jsonb,0,NULL,'トイレのことだ=it was about the toilet (direct assertion identifying the most convincing passage)'),
('n1','grammar','multiple_choice','（エッセイ：マニュアルに従いゆずのトイレ時は遠慮していた、ところが…）「（　）。朝、ねこトイレの砂をかきまわし始めると、ゆずがやって来る。」','["もっともである","当然である","ところがである","例えばである"]'::jsonb,2,NULL,'ところがである=however (signals contrast — despite following the manual, the cat behaved differently)'),
('n1','grammar','multiple_choice','（エッセイ：ゆずはトイレ中でも平気で入ってきた）「なるほど、生きている物には個性があると、あらためて（　）。」','["認識させられたことがある","認識させられたおかげだ","認識させられる話があった","認識させられる出来事だった"]'::jsonb,3,NULL,'認識させられる出来事だった=it was an event that made me realize (past tense conclusion of the essay)')

COMMIT;
