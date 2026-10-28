-- ── Kame Dojo — N5 Mock Exam Content ────────────────────────────────────────
-- Run AFTER mock_tables.sql
-- Covers: vocabulary 問題1-4, grammar 問題1-3, reading 問題4-5, listening 問題1-3

BEGIN;

-- ── Passages ─────────────────────────────────────────────────────────────────

INSERT INTO mock_passages (id, level, section, mondai, title, content, pre_question) VALUES

-- Grammar 問題3 — passage with 5 fill-in blanks
('n5-gp-001', 'n5', 'grammar', 3,
 NULL,
 '先週の日曜日に、わたしは家族とデパートへ行きました。デパートにはいろいろなものが（１）ありました。お昼ご飯はレストランで食べました。ラーメンはとても（２）、大満足でした。3時間（３）デパートにいました。かえりは（４）でかえりました。また家族と（５）したいです。',
 NULL),

-- Reading 問題4 — short personal letter
('n5-rp-001', 'n5', 'reading', 1,
 NULL,
 'たなかさんへ

わたしは先月、かぞくとおきなわへいきました。おきなわははじめてでした。うみがとてもきれいで、さかながたくさんいました。ホテルのごはんもおいしかったです。こどもたちも「たのしかった」といいました。またいきたいです。

すずきより',
 NULL),

-- Reading 問題5 — notice
('n5-rp-002', 'n5', 'reading', 2,
 'プールからのお知らせ',
 '●つかえる日：月曜日〜土曜日
●時間：9時〜20時
●日曜日はお休みです。
●子どもだけでははいれません。おとなといっしょにはいってください。
●食べ物・飲み物はもちこめません。',
 NULL),

-- Listening 問題1 — task comprehension (3 scripts, one per question)
('n5-lp-001', 'n5', 'listening', 1,
 NULL,
 '男：山田さん、明日の会議なんですが、資料を持ってきてもらえますか。
女：はい。えんぴつも持ってきますか。
男：えんぴつはあります。でも、ノートは持ってきてください。
女：わかりました。',
 '男の人と女の人が話しています。女の人は明日、何を持ってきますか。'),

('n5-lp-002', 'n5', 'listening', 1,
 NULL,
 '母：今日の午後、どうするの？
子：友だちとサッカーをするよ。
母：宿題は終わった？
子：まだだよ。
母：じゃあ、宿題が終わってからにしてね。
子：わかった。',
 'お母さんと子どもが話しています。子どもは今日の午後、最初に何をしますか。'),

('n5-lp-003', 'n5', 'listening', 1,
 NULL,
 '男：明日、駅で会いましょうか。
女：いいですね。何時にしますか。
男：10時はどうですか。
女：10時はちょっと。もう少し早い方がいいです。
男：じゃあ、9時はどうですか。
女：いいですね。9時に駅で。
男：わかりました。',
 '男の人と女の人が話しています。二人は明日の何時に会いますか。'),

-- Listening 問題2 — point comprehension (3 scripts)
('n5-lp-004', 'n5', 'listening', 2,
 NULL,
 '男：田中さんはどこに住んでいますか。
女：今は渋谷に住んでいます。
男：渋谷は便利ですね。
女：ええ、でも少し前まで新宿に住んでいました。',
 '男の人と女の人が話しています。女の人はどこに住んでいますか。'),

('n5-lp-005', 'n5', 'listening', 2,
 NULL,
 '男：コーヒーはいかがですか。
女：ありがとうございます。
男：砂糖とミルクは？
女：砂糖だけ入れてください。ミルクはいりません。',
 '男の人と女の人が話しています。女の人はコーヒーに何を入れますか。'),

('n5-lp-006', 'n5', 'listening', 2,
 NULL,
 '先生：来週のテストですが、木曜日に変わりました。
学生：えっ、水曜日ではないんですか。
先生：はい、木曜日の2時間目です。
学生：わかりました。',
 '先生と学生が話しています。テストはいつですか。'),

-- Listening 問題3 — quick response (5 short scripts, no pre_question)
('n5-lp-007', 'n5', 'listening', 3,
 NULL,
 '女：すみません、このバスは駅に止まりますか。',
 NULL),

('n5-lp-008', 'n5', 'listening', 3,
 NULL,
 '男：田中さん、今日の会議に出ますか。',
 NULL),

('n5-lp-009', 'n5', 'listening', 3,
 NULL,
 '女：明日、雨が降るそうですよ。',
 NULL),

('n5-lp-010', 'n5', 'listening', 3,
 NULL,
 '男：すみません、ペンを貸してもらえますか。',
 NULL),

('n5-lp-011', 'n5', 'listening', 3,
 NULL,
 '女：このりんご、おいしいですよ。',
 NULL)

ON CONFLICT (id) DO NOTHING;


-- ── Questions ─────────────────────────────────────────────────────────────────

INSERT INTO mock_questions
  (id, level, section, mondai, q_number, passage_id, type, question, options, answer, words, explanation)
VALUES

-- ─────────────────────────────────────────────────────────────────────────────
-- VOCABULARY 問題１ — Kanji reading (12 questions)
-- The underlined word is shown in 【】
-- ─────────────────────────────────────────────────────────────────────────────

('n5-v1-01', 'n5', 'vocabulary', 1, 1, NULL, 'multiple_choice',
 '毎日【学校】へ行きます。',
 '["がっこう","かっこう","がこう","かこう"]', 0, NULL,
 '学校(がっこう) = school. The reading uses voiced consonant: が+っこう.'),

('n5-v1-02', 'n5', 'vocabulary', 1, 2, NULL, 'multiple_choice',
 '【電話】をかけてもいいですか。',
 '["でんわ","てんわ","でんば","てんば"]', 0, NULL,
 '電話(でんわ) = telephone. 電=でん, 話=わ.'),

('n5-v1-03', 'n5', 'vocabulary', 1, 3, NULL, 'multiple_choice',
 '今日は【水曜日】です。',
 '["もくようび","きんようび","すいようび","どようび"]', 2, NULL,
 '水曜日(すいようび) = Wednesday. 水(みず/すい)=water, 曜日=day of week.'),

('n5-v1-04', 'n5', 'vocabulary', 1, 4, NULL, 'multiple_choice',
 '友達と【映画】を見ました。',
 '["えいが","えいご","えが","えご"]', 0, NULL,
 '映画(えいが) = movie. Do not confuse with 英語(えいご)=English.'),

('n5-v1-05', 'n5', 'vocabulary', 1, 5, NULL, 'multiple_choice',
 '【今年】は雪がたくさん降りました。',
 '["ことし","きょねん","らいねん","こんねん"]', 0, NULL,
 '今年(ことし) = this year. 今(いま/こん)=now, 年(とし/ねん)=year.'),

('n5-v1-06', 'n5', 'vocabulary', 1, 6, NULL, 'multiple_choice',
 'あの【白い】建物は図書館です。',
 '["くろい","あおい","あかい","しろい"]', 3, NULL,
 '白い(しろい) = white. 白=しろ. The other options are black, blue, red.'),

('n5-v1-07', 'n5', 'vocabulary', 1, 7, NULL, 'multiple_choice',
 '角を【左】に曲がってください。',
 '["ひだり","みぎ","まえ","うしろ"]', 0, NULL,
 '左(ひだり) = left. 右(みぎ)=right, 前(まえ)=front, 後ろ(うしろ)=back.'),

('n5-v1-08', 'n5', 'vocabulary', 1, 8, NULL, 'multiple_choice',
 '【毎朝】ご飯を食べます。',
 '["まいばん","まいにち","まいあさ","まいしゅう"]', 2, NULL,
 '毎朝(まいあさ) = every morning. 毎=every, 朝(あさ)=morning.'),

('n5-v1-09', 'n5', 'vocabulary', 1, 9, NULL, 'multiple_choice',
 'テーブルの【上】に本があります。',
 '["した","うえ","よこ","なか"]', 1, NULL,
 '上(うえ) = above/on top. 下(した)=below, 横(よこ)=side, 中(なか)=inside.'),

('n5-v1-10', 'n5', 'vocabulary', 1, 10, NULL, 'multiple_choice',
 '【父】は会社員です。',
 '["はは","あに","ちち","あね"]', 2, NULL,
 '父(ちち) = (my) father. 母(はは)=mother, 兄(あに)=older brother, 姉(あね)=older sister.'),

('n5-v1-11', 'n5', 'vocabulary', 1, 11, NULL, 'multiple_choice',
 'もう少し【早く】来てください。',
 '["はやく","おそく","よく","ながく"]', 0, NULL,
 '早く(はやく) = early/quickly. 遅く(おそく)=late/slowly.'),

('n5-v1-12', 'n5', 'vocabulary', 1, 12, NULL, 'multiple_choice',
 '外は【寒い】ですね。コートを着てください。',
 '["あつい","さむい","すずしい","あたたかい"]', 1, NULL,
 '寒い(さむい) = cold. Context: コートを着てください (please wear a coat) → cold weather.'),

-- ─────────────────────────────────────────────────────────────────────────────
-- VOCABULARY 問題２ — Orthography / writing the kanji (8 questions)
-- Hiragana word in 【】; choose the correct kanji
-- ─────────────────────────────────────────────────────────────────────────────

('n5-v2-01', 'n5', 'vocabulary', 2, 1, NULL, 'multiple_choice',
 'きのう【あめ】がふりました。',
 '["雪","雨","風","雲"]', 1, NULL,
 'あめ = 雨 (rain). 雪=snow, 風=wind, 雲=cloud.'),

('n5-v2-02', 'n5', 'vocabulary', 2, 2, NULL, 'multiple_choice',
 '【まいにち】さんぽをします。',
 '["毎日","毎週","毎月","毎年"]', 0, NULL,
 'まいにち = 毎日 (every day). 日=day/にち.'),

('n5-v2-03', 'n5', 'vocabulary', 2, 3, NULL, 'multiple_choice',
 'この【やま】はとてもたかいです。',
 '["池","山","橋","川"]', 1, NULL,
 'やま = 山 (mountain). 池=pond, 橋=bridge, 川=river.'),

('n5-v2-04', 'n5', 'vocabulary', 2, 4, NULL, 'multiple_choice',
 '【じかん】がありません。',
 '["時間","時計","時期","時代"]', 0, NULL,
 'じかん = 時間 (time). 時計=clock, 時期=period, 時代=era.'),

('n5-v2-05', 'n5', 'vocabulary', 2, 5, NULL, 'multiple_choice',
 '【えき】はどこですか。',
 '["校","駅","橋","停"]', 1, NULL,
 'えき = 駅 (station). 校=school building, 橋=bridge, 停=stop.'),

('n5-v2-06', 'n5', 'vocabulary', 2, 6, NULL, 'multiple_choice',
 '【ちかく】にスーパーがあります。',
 '["遠く","近く","速く","古く"]', 1, NULL,
 'ちかく = 近く (nearby). 遠く=far, 速く=quickly, 古く=long ago.'),

('n5-v2-07', 'n5', 'vocabulary', 2, 7, NULL, 'multiple_choice',
 'あそこに【くるま】がとまっています。',
 '["車","自転車","電車","汽車"]', 0, NULL,
 'くるま = 車 (car). Note: 自転車=bicycle, 電車=train, 汽車=steam train.'),

('n5-v2-08', 'n5', 'vocabulary', 2, 8, NULL, 'multiple_choice',
 '【にほんご】をべんきょうしています。',
 '["日本人","日本語","日本文","日本国"]', 1, NULL,
 'にほんご = 日本語 (Japanese language). 語=language.'),

-- ─────────────────────────────────────────────────────────────────────────────
-- VOCABULARY 問題３ — Contextual fill-in (10 questions)
-- ─────────────────────────────────────────────────────────────────────────────

('n5-v3-01', 'n5', 'vocabulary', 3, 1, NULL, 'multiple_choice',
 'そとは（　）ですから、コートを着てください。',
 '["すずしい","あたたかい","さむい","あつい"]', 2, NULL,
 'さむい (cold) → wear a coat. さむい=cold fits the reason for wearing a coat.'),

('n5-v3-02', 'n5', 'vocabulary', 3, 2, NULL, 'multiple_choice',
 'きのう（　）でおいしいすしをたべました。',
 '["びょういん","えき","レストラン","きょうしつ"]', 2, NULL,
 'レストラン (restaurant) = the place where you eat delicious sushi.'),

('n5-v3-03', 'n5', 'vocabulary', 3, 3, NULL, 'multiple_choice',
 'こどもたちがこうえんで（　）をしています。',
 '["さんぽ","にっき","はくぶつかん","おふろ"]', 0, NULL,
 'さんぽ (walk) = children are taking a walk in the park.'),

('n5-v3-04', 'n5', 'vocabulary', 3, 4, NULL, 'multiple_choice',
 '手を（　）から、ご飯を食べましょう。',
 '["あらって","みがいて","ふいて","あけて"]', 0, NULL,
 'あらって (washing) = wash your hands before eating.'),

('n5-v3-05', 'n5', 'vocabulary', 3, 5, NULL, 'multiple_choice',
 '学校まで（　）で行きます。30分かかります。',
 '["じてんしゃ","ひこうき","ふね","しんかんせん"]', 0, NULL,
 'じてんしゃ (bicycle) = 30 minutes is a reasonable bicycle commute.'),

('n5-v3-06', 'n5', 'vocabulary', 3, 6, NULL, 'multiple_choice',
 'この漢字の（　）を教えてください。',
 '["いみ","いろ","かたち","おと"]', 0, NULL,
 'いみ (meaning) = asking for the meaning of this kanji.'),

('n5-v3-07', 'n5', 'vocabulary', 3, 7, NULL, 'multiple_choice',
 '田中さんは（　）が上手です。ピアノをよくひいています。',
 '["えいご","おんがく","すいえい","りょうり"]', 1, NULL,
 'おんがく (music) = playing piano well → good at music.'),

('n5-v3-08', 'n5', 'vocabulary', 3, 8, NULL, 'multiple_choice',
 'ここは（　）ですから、しずかにしてください。',
 '["えいがかん","こうえん","としょかん","デパート"]', 2, NULL,
 'としょかん (library) = the place where you must be quiet.'),

('n5-v3-09', 'n5', 'vocabulary', 3, 9, NULL, 'multiple_choice',
 'あしたは（　）がありますから、今日たくさんべんきょうします。',
 '["しけん","えいが","パーティー","さんぽ"]', 0, NULL,
 'しけん (exam/test) = studying hard because there is an exam tomorrow.'),

('n5-v3-10', 'n5', 'vocabulary', 3, 10, NULL, 'multiple_choice',
 'このかばんはとても（　）ですね。どこで買いましたか。',
 '["かるい","ふかい","かたい","ながい"]', 0, NULL,
 'かるい (light/lightweight) = a bag being light in weight is notable/complimentary.'),

-- ─────────────────────────────────────────────────────────────────────────────
-- VOCABULARY 問題４ — Paraphrase (5 questions)
-- ─────────────────────────────────────────────────────────────────────────────

('n5-v4-01', 'n5', 'vocabulary', 4, 1, NULL, 'multiple_choice',
 'この本はつまらないです。',
 '["おもしろくないです","かんたんです","むずかしいです","ながいです"]', 0, NULL,
 'つまらない = not interesting = おもしろくない. These are synonyms.'),

('n5-v4-02', 'n5', 'vocabulary', 4, 2, NULL, 'multiple_choice',
 '田中さんはスポーツがとくいです。',
 '["スポーツがすきです","スポーツがにがてです","スポーツがじょうずです","スポーツがたのしいです"]', 2, NULL,
 'とくい (good at / skilled) ≈ じょうず (skillful). とくい≠すき (like).'),

('n5-v4-03', 'n5', 'vocabulary', 4, 3, NULL, 'multiple_choice',
 'このみちはひろいですね。',
 '["せまくないですね","ながいですね","きれいですね","まっすぐですね"]', 0, NULL,
 'ひろい (wide) = せまくない (not narrow). ひろい is the opposite of せまい.'),

('n5-v4-04', 'n5', 'vocabulary', 4, 4, NULL, 'multiple_choice',
 '田中さんはひとりで山に登りました。',
 '["だれかといっしょに登りました","じぶんだけで登りました","ともだちと登りました","かぞくと登りました"]', 1, NULL,
 'ひとりで (alone/by oneself) = じぶんだけで (only by themselves).'),

('n5-v4-05', 'n5', 'vocabulary', 4, 5, NULL, 'multiple_choice',
 'この仕事はかんたんです。',
 '["むずかしいです","はやいです","むずかしくないです","おそいです"]', 2, NULL,
 'かんたん (easy) = むずかしくない (not difficult). Opposite of むずかしい.'),

-- ─────────────────────────────────────────────────────────────────────────────
-- GRAMMAR 問題１ — Particle / grammar fill-in (16 questions)
-- ─────────────────────────────────────────────────────────────────────────────

('n5-g1-01', 'n5', 'grammar', 1, 1, NULL, 'multiple_choice',
 '田中さん（　）本を貸してあげました。',
 '["に","で","が","を"]', 0, NULL,
 'に marks the recipient of giving/lending: 田中さんに = to Tanaka-san.'),

('n5-g1-02', 'n5', 'grammar', 1, 2, NULL, 'multiple_choice',
 '毎日バス（　）学校に行きます。',
 '["は","を","で","に"]', 2, NULL,
 'で marks means of transport: バスで = by bus.'),

('n5-g1-03', 'n5', 'grammar', 1, 3, NULL, 'multiple_choice',
 '山田さんは毎朝6時（　）起きます。',
 '["で","に","から","まで"]', 1, NULL,
 'に marks a specific point in time: 6時に = at 6 o''clock.'),

('n5-g1-04', 'n5', 'grammar', 1, 4, NULL, 'multiple_choice',
 'A「もう宿題は終わりましたか。」B「いいえ、（　）です。」',
 '["まだ","もう","あまり","ずっと"]', 0, NULL,
 'まだ = not yet. In response to もう (already), まだ expresses the action has not happened yet.'),

('n5-g1-05', 'n5', 'grammar', 1, 5, NULL, 'multiple_choice',
 '来週の月曜日（　）テストがあります。',
 '["を","に","が","は"]', 1, NULL,
 'に marks a specific time: 月曜日に = on Monday.'),

('n5-g1-06', 'n5', 'grammar', 1, 6, NULL, 'multiple_choice',
 'このバッグは10,000円（　）買いました。',
 '["に","を","で","と"]', 2, NULL,
 'で marks the price paid: 10,000円で = for 10,000 yen.'),

('n5-g1-07', 'n5', 'grammar', 1, 7, NULL, 'multiple_choice',
 'あ、雨が降って（　）よ。傘を持って行ってください。',
 '["います","みます","おきます","しまいます"]', 0, NULL,
 'ています expresses an ongoing action/state: 降っています = it is raining (right now).'),

('n5-g1-08', 'n5', 'grammar', 1, 8, NULL, 'multiple_choice',
 '「この漢字の読み方を（　）ください。」',
 '["教えて","教えても","教えては","教えてから"]', 0, NULL,
 'てください = please do ~. 教えてください = please teach me.'),

('n5-g1-09', 'n5', 'grammar', 1, 9, NULL, 'multiple_choice',
 'A「田中さんはもう来ましたか。」B「いいえ、（　）来ていません。」',
 '["まだ","もう","ずっと","さっき"]', 0, NULL,
 'まだ...ていません = have not ... yet. Negative counterpart of もう...ました.'),

('n5-g1-10', 'n5', 'grammar', 1, 10, NULL, 'multiple_choice',
 '昨日は疲れて、夜9時（　）寝てしまいました。',
 '["から","に","まで","で"]', 1, NULL,
 'に marks a specific time: 9時に = at 9 o''clock.'),

('n5-g1-11', 'n5', 'grammar', 1, 11, NULL, 'multiple_choice',
 'このじしょはとても役に立ちます（　）、いつも使っています。',
 '["と","から","でも","しか"]', 1, NULL,
 'から expresses reason/cause: 役に立ちますから = because it is useful.'),

('n5-g1-12', 'n5', 'grammar', 1, 12, NULL, 'multiple_choice',
 '子どもたちが公園（　）遊んでいます。',
 '["で","に","を","は"]', 0, NULL,
 'で marks the place where an action occurs: 公園で = at/in the park.'),

('n5-g1-13', 'n5', 'grammar', 1, 13, NULL, 'multiple_choice',
 '「ちょっと待って（　）。今行きます。」',
 '["ください","あげます","もらいます","います"]', 0, NULL,
 'てください = please ~. 待ってください = please wait.'),

('n5-g1-14', 'n5', 'grammar', 1, 14, NULL, 'multiple_choice',
 'わたしは日本語（　）英語（　）べんきょうしています。',
 '["も/も","は/は","と/と","や/や"]', 0, NULL,
 'も...も = both ~ and ~. 日本語も英語も = both Japanese and English.'),

('n5-g1-15', 'n5', 'grammar', 1, 15, NULL, 'multiple_choice',
 'きのうは（　）バスに乗れませんでした。',
 '["ながくて","おそくて","はやくて","おおくて"]', 1, NULL,
 'おそくて (because it was late) → missed the bus. 遅くてバスに乗れなかった.'),

('n5-g1-16', 'n5', 'grammar', 1, 16, NULL, 'multiple_choice',
 'わたし（　）かいた手紙を読んでください。',
 '["が","の","を","に"]', 0, NULL,
 'が marks the subject within a relative clause: わたしが書いた = (the letter) that I wrote.'),

-- ─────────────────────────────────────────────────────────────────────────────
-- GRAMMAR 問題２ — Word ordering / reorder (5 questions)
-- ─────────────────────────────────────────────────────────────────────────────

('n5-g2-01', 'n5', 'grammar', 2, 1, NULL, 'reorder',
 '次のことばを正しいじゅんばんにならべてください。',
 '[]', 0,
 '["わたしは","まいにち","にほんごを","べんきょうします"]',
 'わたしはまいにちにほんごをべんきょうします (I study Japanese every day). Subject → time → object → verb.'),

('n5-g2-02', 'n5', 'grammar', 2, 2, NULL, 'reorder',
 '次のことばを正しいじゅんばんにならべてください。',
 '[]', 0,
 '["きのう","ともだちに","でんわを","しました"]',
 'きのうともだちにでんわをしました (I called a friend yesterday). Time → recipient → object → verb.'),

('n5-g2-03', 'n5', 'grammar', 2, 3, NULL, 'reorder',
 '次のことばを正しいじゅんばんにならべてください。',
 '[]', 0,
 '["としょかんで","ほんを","さんさつ","かりました"]',
 'としょかんでほんをさんさつかりました (I borrowed three books from the library). Place → object → counter → verb.'),

('n5-g2-04', 'n5', 'grammar', 2, 4, NULL, 'reorder',
 '次のことばを正しいじゅんばんにならべてください。',
 '[]', 0,
 '["やましたさんは","にほんごの","せんせいに","なりたいです"]',
 'やましたさんはにほんごのせんせいになりたいです (Yamashita-san wants to become a Japanese teacher).'),

('n5-g2-05', 'n5', 'grammar', 2, 5, NULL, 'reorder',
 '次のことばを正しいじゅんばんにならべてください。',
 '[]', 0,
 '["あした","てんきが","よければ","うみへいきます"]',
 'あしたてんきがよければうみへいきます (If the weather is good tomorrow, I''ll go to the sea). Conditional: ～ければ.'),

-- ─────────────────────────────────────────────────────────────────────────────
-- GRAMMAR 問題３ — Passage fill-in (5 questions, 1 passage)
-- passage_id = 'n5-gp-001'
-- ─────────────────────────────────────────────────────────────────────────────

('n5-g3-01', 'n5', 'grammar', 3, 1, 'n5-gp-001', 'multiple_choice',
 'blank (１) — デパートにはいろいろなものが（１）ありました。',
 '["たくさん","すこし","あまり","ほとんど"]', 0, NULL,
 'たくさん (a lot/many) fits best: a department store has lots of things.'),

('n5-g3-02', 'n5', 'grammar', 3, 2, 'n5-gp-001', 'multiple_choice',
 'blank (２) — ラーメンはとても（２）、大満足でした。',
 '["おいしくて","からくて","まずくて","にがくて"]', 0, NULL,
 'おいしくて (delicious, and…) → 大満足 (very satisfied). Cause-and-effect with て-form.'),

('n5-g3-03', 'n5', 'grammar', 3, 3, 'n5-gp-001', 'multiple_choice',
 'blank (３) — 3時間（３）デパートにいました。',
 '["ぐらい","ごろ","まで","から"]', 0, NULL,
 'ぐらい (approximately) = about 3 hours. ごろ=around (a point in time), not duration.'),

('n5-g3-04', 'n5', 'grammar', 3, 4, 'n5-gp-001', 'multiple_choice',
 'blank (４) — かえりは（４）でかえりました。',
 '["バス","かばん","かさ","くつ"]', 0, NULL,
 'バス (bus) = took the bus home. Only バス is a means of transport.'),

('n5-g3-05', 'n5', 'grammar', 3, 5, 'n5-gp-001', 'multiple_choice',
 'blank (５) — また家族と（５）したいです。',
 '["かいもの","べんきょう","うんどう","りょうり"]', 0, NULL,
 'かいもの (shopping) = want to go shopping with family again at a department store.'),

-- ─────────────────────────────────────────────────────────────────────────────
-- READING 問題４ — Short passage comprehension (3 questions)
-- passage_id = 'n5-rp-001'
-- ─────────────────────────────────────────────────────────────────────────────

('n5-r1-01', 'n5', 'reading', 1, 1, 'n5-rp-001', 'multiple_choice',
 'すずきさんは先月どこへ行きましたか。',
 '["とうきょう","おきなわ","おおさか","きょうと"]', 1, NULL,
 'The letter says: わたしは先月かぞくとおきなわへいきました → Okinawa.'),

('n5-r1-02', 'n5', 'reading', 1, 2, 'n5-rp-001', 'multiple_choice',
 'すずきさんにとって、おきなわはどんなところでしたか。',
 '["さむいところ","はじめてのところ","よくいくところ","あまりよくないところ"]', 1, NULL,
 'The letter says: おきなわははじめてでした → it was her first time there.'),

('n5-r1-03', 'n5', 'reading', 1, 3, 'n5-rp-001', 'multiple_choice',
 'すずきさんのこどもたちはどうでしたか。',
 '["つかれました","たのしくなかったです","たのしかったといいました","こわかったといいました"]', 2, NULL,
 'こどもたちも「たのしかった」といいました → children said it was fun.'),

-- ─────────────────────────────────────────────────────────────────────────────
-- READING 問題５ — Notice comprehension (3 questions)
-- passage_id = 'n5-rp-002'
-- ─────────────────────────────────────────────────────────────────────────────

('n5-r2-01', 'n5', 'reading', 2, 1, 'n5-rp-002', 'multiple_choice',
 'プールは何曜日がお休みですか。',
 '["月曜日","水曜日","土曜日","日曜日"]', 3, NULL,
 'The notice says: 日曜日はお休みです → closed on Sundays.'),

('n5-r2-02', 'n5', 'reading', 2, 2, 'n5-rp-002', 'multiple_choice',
 'プールにはいれる時間は何時から何時までですか。',
 '["8時から18時","9時から20時","10時から21時","7時から22時"]', 1, NULL,
 'The notice says: 時間：9時〜20時 → 9am to 8pm.'),

('n5-r2-03', 'n5', 'reading', 2, 3, 'n5-rp-002', 'multiple_choice',
 'こどもはどうしなければなりませんか。',
 '["ひとりではいれます","おとなといっしょにはいります","20さい以上です","スイミングがじょうずです"]', 1, NULL,
 'The notice says: 子どもだけでははいれません。おとなといっしょに → must enter with an adult.'),

-- ─────────────────────────────────────────────────────────────────────────────
-- LISTENING 問題１ — Task comprehension (3 questions, each with own passage)
-- ─────────────────────────────────────────────────────────────────────────────

('n5-l1-01', 'n5', 'listening', 1, 1, 'n5-lp-001', 'multiple_choice',
 '女の人は明日、何を持ってきますか。',
 '["えんぴつだけ","資料とノート","えんぴつとノート","資料だけ"]', 1, NULL,
 'Man: bring 資料 (documents) and ノート (notebook). えんぴつ is not needed (already have it).'),

('n5-l1-02', 'n5', 'listening', 1, 2, 'n5-lp-002', 'multiple_choice',
 '子どもは今日の午後、最初に何をしますか。',
 '["サッカーをします","宿題をします","友だちに会います","べんきょうします"]', 1, NULL,
 'Mother says: finish homework FIRST, then play soccer. 宿題が終わってから → homework first.'),

('n5-l1-03', 'n5', 'listening', 1, 3, 'n5-lp-003', 'multiple_choice',
 '二人は明日の何時に会いますか。',
 '["8時","9時","10時","11時"]', 1, NULL,
 'They agree on 9時 (9 o''clock). 10時 was rejected as too late.'),

-- ─────────────────────────────────────────────────────────────────────────────
-- LISTENING 問題２ — Point comprehension (3 questions)
-- ─────────────────────────────────────────────────────────────────────────────

('n5-l2-01', 'n5', 'listening', 2, 1, 'n5-lp-004', 'multiple_choice',
 '女の人はどこに住んでいますか。',
 '["渋谷","新宿","池袋","銀座"]', 0, NULL,
 '女: 今は渋谷に住んでいます → currently lives in Shibuya. 新宿 was the previous place.'),

('n5-l2-02', 'n5', 'listening', 2, 2, 'n5-lp-005', 'multiple_choice',
 '女の人はコーヒーに何を入れますか。',
 '["砂糖だけ","ミルクだけ","砂糖とミルク","何も入れません"]', 0, NULL,
 '女: 砂糖だけ入れてください。ミルクはいりません → sugar only.'),

('n5-l2-03', 'n5', 'listening', 2, 3, 'n5-lp-006', 'multiple_choice',
 'テストはいつですか。',
 '["水曜日","木曜日","金曜日","来月"]', 1, NULL,
 '先生: 木曜日の2時間目です → Thursday, 2nd period. 水曜日 was the incorrect assumption.'),

-- ─────────────────────────────────────────────────────────────────────────────
-- LISTENING 問題３ — Quick response (5 questions, short single-line scripts)
-- ─────────────────────────────────────────────────────────────────────────────

('n5-l3-01', 'n5', 'listening', 3, 1, 'n5-lp-007', 'multiple_choice',
 '男の人は何と言いますか。',
 '["はい、次の停留所です","バスに乗ってください","電車の方が速いです","今どこですか"]', 0, NULL,
 'Asking if the bus stops at the station → natural reply: yes, it stops at the next stop.'),

('n5-l3-02', 'n5', 'listening', 3, 2, 'n5-lp-008', 'multiple_choice',
 '女の人は何と言いますか。',
 '["会議室は3階です","はい、午後2時からですね","昨日も出席しました","田中さんはどこですか"]', 1, NULL,
 'Answering whether she will attend the meeting → confirm details: yes, from 2pm.'),

('n5-l3-03', 'n5', 'listening', 3, 3, 'n5-lp-009', 'multiple_choice',
 '男の人は何と言いますか。',
 '["傘を持っていきます","雨が好きです","昨日は晴れでした","傘はどこですか"]', 0, NULL,
 'Told it will rain tomorrow → natural reaction: I''ll take an umbrella.'),

('n5-l3-04', 'n5', 'listening', 3, 4, 'n5-lp-010', 'multiple_choice',
 '女の人は何と言いますか。',
 '["ありがとうございます","はい、どうぞ","ペンはどこですか","ペンが好きです"]', 1, NULL,
 'Someone asks to borrow a pen → natural reply: yes, here you go.'),

('n5-l3-05', 'n5', 'listening', 3, 5, 'n5-lp-011', 'multiple_choice',
 '男の人は何と言いますか。',
 '["そうですか、高いですね","へえ、一ついただけますか","りんごが苦手です","おおきいりんごですね"]', 1, NULL,
 'Told the apple is delicious → natural response: oh, may I have one?')

ON CONFLICT (id) DO NOTHING;

COMMIT;
