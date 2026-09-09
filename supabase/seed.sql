-- ═══════════════════════════════════════════════════════════════════
-- KAME DOJO — Full Question Seed
-- Paste into Supabase → SQL Editor → Run
-- Safe to re-run: ON CONFLICT (id) DO NOTHING
-- ═══════════════════════════════════════════════════════════════════


-- ───────────────────────────────────────────────────────────────────
-- N5 KANJI (35 questions)
-- ───────────────────────────────────────────────────────────────────
INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n5-k-001','n5','kanji','日','["にち / ひ","つき / がつ","やま / さん","かわ / かせん"]',0,'日 means day or sun. Read as にち (nichi) or ひ (hi).'),
('n5-k-002','n5','kanji','月','["にち / ひ","つき / がつ","やま / さん","かわ / かせん"]',1,'月 means moon or month. Read as つき (tsuki) or がつ (gatsu).'),
('n5-k-003','n5','kanji','山','["にち / ひ","つき / がつ","やま / さん","かわ / かせん"]',2,'山 means mountain. Read as やま (yama) or さん (san).'),
('n5-k-004','n5','kanji','川','["にち / ひ","やま / さん","かわ / かせん","き / もく"]',2,'川 means river. Read as かわ (kawa) or かせん (kasen).'),
('n5-k-005','n5','kanji','木','["み / じつ","き / もく","はな / か","さかな / ぎょ"]',1,'木 means tree or wood. Read as き (ki) or もく (moku).'),
('n5-k-006','n5','kanji','火','["き / もく","ひ / か","みず / すい","つち / ど"]',1,'火 means fire. Read as ひ (hi) or か (ka).'),
('n5-k-007','n5','kanji','水','["ひ / か","みず / すい","つち / ど","かね / きん"]',1,'水 means water. Read as みず (mizu) or すい (sui).'),
('n5-k-008','n5','kanji','土','["みず / すい","かね / きん","つち / ど","ひ / か"]',2,'土 means earth or soil. Read as つち (tsuchi) or ど (do).'),
('n5-k-009','n5','kanji','金','["つち / ど","かね / きん","はな / か","め / もく"]',1,'金 means gold or money. Read as かね (kane) or きん (kin).'),
('n5-k-010','n5','kanji','人','["ひと / じん","め / もく","みち / どう","て / しゅ"]',0,'人 means person. Read as ひと (hito) or じん (jin).'),
('n5-k-011','n5','kanji','口','["て / しゅ","め / もく","くち / こう","みみ / じ"]',2,'口 means mouth. Read as くち (kuchi) or こう (kou).'),
('n5-k-012','n5','kanji','目','["くち / こう","め / もく","みみ / じ","て / しゅ"]',1,'目 means eye. Read as め (me) or もく (moku).'),
('n5-k-013','n5','kanji','耳','["め / もく","て / しゅ","みみ / じ","くち / こう"]',2,'耳 means ear. Read as みみ (mimi) or じ (ji).'),
('n5-k-014','n5','kanji','手','["みみ / じ","て / しゅ","あし / そく","き / もく"]',1,'手 means hand. Read as て (te) or しゅ (shu).'),
('n5-k-015','n5','kanji','足','["て / しゅ","あし / そく","くち / こう","め / もく"]',1,'足 means foot or leg. Read as あし (ashi) or そく (soku).'),
('n5-k-016','n5','kanji','大','["ちいさい / しょう","おおきい / だい","たかい / こう","ながい / ちょう"]',1,'大 means big. Read as おおきい (ookii) or だい (dai).'),
('n5-k-017','n5','kanji','小','["ちいさい / しょう","おおきい / だい","たかい / こう","ながい / ちょう"]',0,'小 means small. Read as ちいさい (chiisai) or しょう (shou).'),
('n5-k-018','n5','kanji','上','["した / か","うえ / じょう","なか / ちゅう","そと / がい"]',1,'上 means above or up. Read as うえ (ue) or じょう (jou).'),
('n5-k-019','n5','kanji','下','["うえ / じょう","した / か","なか / ちゅう","みぎ / う"]',1,'下 means below or down. Read as した (shita) or か (ka).'),
('n5-k-020','n5','kanji','中','["した / か","なか / ちゅう","うえ / じょう","そと / がい"]',1,'中 means middle or inside. Read as なか (naka) or ちゅう (chuu).'),
('n5-k-021','n5','kanji','一','["に / じ","いち / いつ","さん / みつ","よん / し"]',1,'一 means one. Read as いち (ichi) or いつ (itsu).'),
('n5-k-022','n5','kanji','二','["いち / いつ","に / じ","さん / みつ","よん / し"]',1,'二 means two. Read as に (ni) or じ (ji).'),
('n5-k-023','n5','kanji','三','["に / じ","さん / みつ","よん / し","ご / いつ"]',1,'三 means three. Read as さん (san) or みつ (mitsu).'),
('n5-k-024','n5','kanji','四','["さん / みつ","よん / し","ご / いつ","ろく / りく"]',1,'四 means four. Read as よん (yon) or し (shi).'),
('n5-k-025','n5','kanji','五','["よん / し","ご / いつ","ろく / りく","なな / しち"]',1,'五 means five. Read as ご (go) or いつ (itsu).'),
('n5-k-026','n5','kanji','年','["はる / しゅん","ねん / とし","なつ / か","ふゆ / とう"]',1,'年 means year. Read as ねん (nen) or とし (toshi).'),
('n5-k-027','n5','kanji','今','["あした / みょう","いま / こん","きのう / さく","らい / くる"]',1,'今 means now or current. Read as いま (ima) or こん (kon).'),
('n5-k-028','n5','kanji','何','["いつ / か","どこ / か","なに / なん","だれ / しゃ"]',2,'何 means what. Read as なに (nani) or なん (nan).'),
('n5-k-029','n5','kanji','時','["ぷん / ふん","まい / ぐ","とき / じ","はん"]',2,'時 means time or hour. Read as とき (toki) or じ (ji).'),
('n5-k-030','n5','kanji','分','["じ","はん","ど","ふん / ぶん"]',3,'分 means minute or part. Read as ふん (fun) or ぶん (bun).'),
('n5-k-031','n5','kanji','百','["じゅう","せん / ち","ひゃく / もも","まん / ばん"]',2,'百 means one hundred. Read as ひゃく (hyaku).'),
('n5-k-032','n5','kanji','千','["ひゃく","まん / ばん","せん / ち","おく"]',2,'千 means one thousand. Read as せん (sen) or ち (chi).'),
('n5-k-033','n5','kanji','円','["かい / うみ","にほん / わ","ふる / こ","えん / まる"]',3,'円 means yen or circle. Read as えん (en) or まる (maru).'),
('n5-k-034','n5','kanji','右','["うえ / じょう","した / か","ひだり / さ","みぎ / う"]',3,'右 means right direction. Read as みぎ (migi) or う (u).'),
('n5-k-035','n5','kanji','左','["ひだり / さ","みぎ / う","うえ / じょう","した / か"]',0,'左 means left direction. Read as ひだり (hidari) or さ (sa).')
ON CONFLICT (id) DO NOTHING;


-- ───────────────────────────────────────────────────────────────────
-- N5 GRAMMAR — Multiple Choice (15 questions)
-- ───────────────────────────────────────────────────────────────────
INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n5-g-001','n5','grammar','私___学生です。(I am a student.)','["が","は","を","に"]',1,'は (wa) is the topic marker particle.'),
('n5-g-002','n5','grammar','本___読みます。(I read a book.)','["は","が","を","で"]',2,'を (wo) marks the direct object.'),
('n5-g-003','n5','grammar','学校___行きます。(I go to school.)','["を","は","に","が"]',2,'に (ni) marks direction or destination.'),
('n5-g-004','n5','grammar','図書館___勉強します。(I study at the library.)','["に","で","を","が"]',1,'で (de) marks the location where an action takes place.'),
('n5-g-005','n5','grammar','これ___私のかばんです。(This is my bag.)','["は","が","を","で"]',0,'は (wa) is the topic marker.'),
('n5-g-006','n5','grammar','毎日、朝ごはん___食べます。(I eat breakfast every day.)','["に","で","を","は"]',2,'を marks the direct object of a verb.'),
('n5-g-007','n5','grammar','友達___手紙を書きます。(I write a letter to a friend.)','["で","に","を","が"]',1,'に marks the recipient or indirect object.'),
('n5-g-008','n5','grammar','電車___来ます。(I come by train.)','["に","で","を","は"]',1,'で marks the means of transportation or tool.'),
('n5-g-009','n5','grammar','猫___います。(There is a cat.)','["は","を","が","に"]',2,'が marks the subject with existence verbs like います and あります.'),
('n5-g-010','n5','grammar','コーヒー___紅茶___、どちらが好きですか。(Coffee or tea, which do you like?)','["と / も","や / も","か / か","は / が"]',2,'か...か connects alternatives in a question: A か B か (A or B?).'),
('n5-g-011','n5','grammar','私___日本語___英語も話せます。(I can speak Japanese and English too.)','["は / と","が / や","も / も","は / が"]',2,'も...も means both A and B or also.'),
('n5-g-012','n5','grammar','雨___降っています___、出かけません。(Because it is raining, I will not go out.)','["が / が","が / から","は / ので","で / でも"]',1,'から after a plain form means because. 降っている + から = because it is raining.'),
('n5-g-013','n5','grammar','今___テレビを見___います。(I am watching TV now.)','["は / て","が / で","は / て","に / に"]',2,'ている (te-form + いる) expresses an ongoing action or current state.'),
('n5-g-014','n5','grammar','日本に___たいです。(I want to go to Japan.)','["行き","行く","行って","行か"]',0,'たい attaches to the verb stem (masu-stem) to express desire. 行き + たい.'),
('n5-g-015','n5','grammar','一緒に食べ___か。(Shall we eat together?)','["ましょう","ません","ました","ますか"]',0,'ましょう expresses a suggestion or invitation: Let''s do something.')
ON CONFLICT (id) DO NOTHING;


-- ───────────────────────────────────────────────────────────────────
-- N5 GRAMMAR — Reorder (5 questions)
-- words[] must be in the CORRECT sentence order
-- ───────────────────────────────────────────────────────────────────
INSERT INTO questions (id, level, category, question, options, answer, explanation, type, words) VALUES
('n5-g-016','n5','grammar','Arrange: (Tomorrow I will not go to school.)','[]',0,'Correct: 明日は学校に行きません。Time expressions come first in Japanese.','reorder','["明日は","学校に","行きません"]'),
('n5-g-017','n5','grammar','Arrange: (Every morning I drink coffee.)','[]',0,'Correct: 毎朝コーヒーを飲みます。Frequency word → object → verb.','reorder','["毎朝","コーヒーを","飲みます"]'),
('n5-g-018','n5','grammar','Arrange: (I studied at the library yesterday.)','[]',0,'Correct: 昨日図書館で勉強しました。Time → place → verb.','reorder','["昨日","図書館で","勉強しました"]'),
('n5-g-019','n5','grammar','Arrange: (I will go to see a movie with a friend.)','[]',0,'Correct: 友達と映画を見に行きます。With whom → object → purpose verb.','reorder','["友達と","映画を","見に行きます"]'),
('n5-g-020','n5','grammar','Arrange: (Please come to Tokyo tomorrow.)','[]',0,'Correct: 明日東京に来てください。Time → destination → polite request.','reorder','["明日","東京に","来てください"]')
ON CONFLICT (id) DO NOTHING;


-- ───────────────────────────────────────────────────────────────────
-- N5 VOCABULARY (25 questions)
-- ───────────────────────────────────────────────────────────────────
INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n5-v-001','n5','vocabulary','What does ありがとう mean?','["Goodbye","Thank you","Good morning","Sorry"]',1,'ありがとう (arigatou) means Thank you.'),
('n5-v-002','n5','vocabulary','What does おはようございます mean?','["Good evening","Good night","Good morning","Goodbye"]',2,'おはようございます means Good morning (formal).'),
('n5-v-003','n5','vocabulary','What does すみません mean?','["Thank you","Excuse me / Sorry","You''re welcome","Please"]',1,'すみません means Excuse me or I''m sorry.'),
('n5-v-004','n5','vocabulary','What does 食べる mean?','["to drink","to sleep","to eat","to walk"]',2,'食べる (taberu) means to eat.'),
('n5-v-005','n5','vocabulary','What does 飲む mean?','["to eat","to drink","to read","to write"]',1,'飲む (nomu) means to drink.'),
('n5-v-006','n5','vocabulary','What does 見る mean?','["to hear","to speak","to see / watch","to think"]',2,'見る (miru) means to see or to watch.'),
('n5-v-007','n5','vocabulary','What does 聞く mean?','["to see","to listen / ask","to speak","to read"]',1,'聞く (kiku) means to listen or to ask.'),
('n5-v-008','n5','vocabulary','What does 話す mean?','["to write","to read","to speak","to walk"]',2,'話す (hanasu) means to speak.'),
('n5-v-009','n5','vocabulary','What does 読む mean?','["to write","to read","to speak","to think"]',1,'読む (yomu) means to read.'),
('n5-v-010','n5','vocabulary','What does 書く mean?','["to read","to speak","to write","to draw"]',2,'書く (kaku) means to write.'),
('n5-v-011','n5','vocabulary','What does かわいい mean?','["scary","cute","beautiful","interesting"]',1,'かわいい (kawaii) means cute.'),
('n5-v-012','n5','vocabulary','What does おいしい mean?','["delicious","hot","cold","sweet"]',0,'おいしい (oishii) means delicious.'),
('n5-v-013','n5','vocabulary','What does 学校 mean?','["hospital","station","school","library"]',2,'学校 (gakkou) means school.'),
('n5-v-014','n5','vocabulary','What does 先生 mean?','["student","teacher","friend","family"]',1,'先生 (sensei) means teacher.'),
('n5-v-015','n5','vocabulary','What does 家族 mean?','["friend","teacher","family","colleague"]',2,'家族 (kazoku) means family.'),
('n5-v-016','n5','vocabulary','What does 今日 mean?','["yesterday","tomorrow","today","this week"]',2,'今日 (kyou) means today.'),
('n5-v-017','n5','vocabulary','What does 明日 mean?','["yesterday","today","tomorrow","next week"]',2,'明日 (ashita) means tomorrow.'),
('n5-v-018','n5','vocabulary','What does 昨日 mean?','["yesterday","today","tomorrow","last week"]',0,'昨日 (kinou) means yesterday.'),
('n5-v-019','n5','vocabulary','What does 大きい mean?','["small","tall","big","long"]',2,'大きい (ookii) means big or large.'),
('n5-v-020','n5','vocabulary','What does 小さい mean?','["big","small","short","wide"]',1,'小さい (chiisai) means small or little.'),
('n5-v-021','n5','vocabulary','What does 暑い mean?','["cold","hot (weather)","warm","cool"]',1,'暑い (atsui) means hot, used for weather or temperature of surroundings.'),
('n5-v-022','n5','vocabulary','What does 寒い mean?','["hot","warm","cold","cool"]',2,'寒い (samui) means cold, used for weather or ambient temperature.'),
('n5-v-023','n5','vocabulary','What does 高い mean?','["cheap / low","expensive / tall","wide","narrow"]',1,'高い (takai) means expensive or tall / high.'),
('n5-v-024','n5','vocabulary','What does 電車 mean?','["bus","airplane","train","car"]',2,'電車 (densha) means electric train.'),
('n5-v-025','n5','vocabulary','What does 駅 mean?','["airport","station","bus stop","port"]',1,'駅 (eki) means (train) station.')
ON CONFLICT (id) DO NOTHING;


-- ═══════════════════════════════════════════════════════════════════
-- N4 KANJI (20 questions)
-- ═══════════════════════════════════════════════════════════════════
INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n4-k-001','n4','kanji','映','["えい / うつる","おと / おん","おおきい / だい","あう / かい"]',0,'映 means to reflect or project. Used in 映画 (eiga, movie). Read as えい or うつる.'),
('n4-k-002','n4','kanji','帰','["くる / らい","かえる / き","いく / こう","おきる / き"]',1,'帰 means to return home. Read as かえる (kaeru) or き (ki). Used in 帰る (go home).'),
('n4-k-003','n4','kanji','起','["ねる / すい","かえる / き","おきる / き","はじめる / し"]',2,'起 means to wake up or rise. Read as おきる (okiru) or き (ki).'),
('n4-k-004','n4','kanji','強','["つよい / きょう","よわい / じゃく","はやい / そく","おそい / ち"]',0,'強 means strong. Read as つよい (tsuyoi) or きょう (kyou).'),
('n4-k-005','n4','kanji','弱','["つよい / きょう","よわい / じゃく","かるい / けい","おもい / じゅう"]',1,'弱 means weak. Read as よわい (yowai) or じゃく (jaku).'),
('n4-k-006','n4','kanji','近','["とおい / えん","ちかい / きん","ひろい / こう","せまい / きょう"]',1,'近 means near or close. Read as ちかい (chikai) or きん (kin).'),
('n4-k-007','n4','kanji','遠','["ちかい / きん","とおい / えん","ながい / ちょう","みじかい / たん"]',1,'遠 means far or distant. Read as とおい (tooi) or えん (en).'),
('n4-k-008','n4','kanji','急','["ゆっくり / ち","いそぐ / きゅう","おそい / ち","はやい / そく"]',1,'急 means hurry or sudden. Read as いそぐ (isogu) or きゅう (kyuu).'),
('n4-k-009','n4','kanji','静','["うるさい / そう","しずか / せい","たのしい / らく","さびしい / こ"]',1,'静 means quiet or calm. Read as しずか (shizuka) or せい (sei).'),
('n4-k-010','n4','kanji','走','["あるく / ほ","とぶ / ひ","はしる / そう","およぐ / すい"]',2,'走 means to run. Read as はしる (hashiru) or そう (sou).'),
('n4-k-011','n4','kanji','待','["でかける / しゅつ","まつ / たい","あう / かい","おくる / そう"]',1,'待 means to wait. Read as まつ (matsu) or たい (tai).'),
('n4-k-012','n4','kanji','送','["もらう / じゅ","かりる / しゃく","おくる / そう","かえす / へん"]',2,'送 means to send or see off. Read as おくる (okuru) or そう (sou).'),
('n4-k-013','n4','kanji','習','["おしえる / きょう","ならう / しゅう","まなぶ / がく","よむ / どく"]',1,'習 means to learn or practice. Read as ならう (narau) or しゅう (shuu).'),
('n4-k-014','n4','kanji','働','["やすむ / きゅう","あそぶ / ゆう","はたらく / どう","ねる / すい"]',2,'働 means to work. Read as はたらく (hataraku) or どう (dou).'),
('n4-k-015','n4','kanji','泳','["あるく / ほ","とぶ / ひ","はしる / そう","およぐ / えい"]',3,'泳 means to swim. Read as およぐ (oyogu) or えい (ei).'),
('n4-k-016','n4','kanji','歌','["うた / か","え / が","おと / おん","こえ / せい"]',0,'歌 means song or to sing. Read as うた (uta) or か (ka).'),
('n4-k-017','n4','kanji','春','["なつ / か","あき / しゅう","ふゆ / とう","はる / しゅん"]',3,'春 means spring (season). Read as はる (haru) or しゅん (shun).'),
('n4-k-018','n4','kanji','夏','["はる / しゅん","なつ / か","あき / しゅう","ふゆ / とう"]',1,'夏 means summer. Read as なつ (natsu) or か (ka).'),
('n4-k-019','n4','kanji','秋','["はる / しゅん","なつ / か","あき / しゅう","ふゆ / とう"]',2,'秋 means autumn or fall. Read as あき (aki) or しゅう (shuu).'),
('n4-k-020','n4','kanji','冬','["はる / しゅん","なつ / か","あき / しゅう","ふゆ / とう"]',3,'冬 means winter. Read as ふゆ (fuyu) or とう (tou).')
ON CONFLICT (id) DO NOTHING;


-- ───────────────────────────────────────────────────────────────────
-- N4 GRAMMAR — Multiple Choice (8 questions)
-- ───────────────────────────────────────────────────────────────────
INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n4-g-001','n4','grammar','日本料理を食べ___みたいです。(I want to try eating Japanese food.)','["て","が","を","に"]',0,'てみる (te + miru) means to try doing something. Attach て-form + みる.'),
('n4-g-002','n4','grammar','宿題を忘れ___しまいました。(I ended up forgetting my homework.)','["て","が","を","に"]',0,'てしまう expresses an action done completely, often with regret. Use て-form + しまう.'),
('n4-g-003','n4','grammar','音楽を聞き___、ジョギングします。(I jog while listening to music.)','["ながら","ので","から","けど"]',0,'ながら means while doing two things at once. Attach to the verb stem (masu-stem).'),
('n4-g-004','n4','grammar','家に帰っ___、手を洗います。(When I get home, I wash my hands.)','["たら","ても","てから","ながら"]',0,'たら is a conditional meaning when or if. 帰ったら = when I return.'),
('n4-g-005','n4','grammar','薬を飲ま___なりません。(I must take my medicine.)','["なければ","ないで","なくて","なしで"]',0,'なければならない means must or have to. 飲まなければ + ならない.'),
('n4-g-006','n4','grammar','ここで写真を撮っ___いいですか。(May I take a photo here?)','["ても","てで","てが","てに"]',0,'てもいい means it is okay to or may I. Te-form + もいい.'),
('n4-g-007','n4','grammar','彼は今日来る___です。(He is expected to come today.)','["はず","そう","よう","らしい"]',0,'はずだ means expected or should be the case based on logical reasoning.'),
('n4-g-008','n4','grammar','雨が降り___です。(It looks like it is going to rain.)','["そう","よう","らしい","はず"]',0,'そうだ (appearance) attaches to the verb stem and means it looks like or seems like.')
ON CONFLICT (id) DO NOTHING;


-- ───────────────────────────────────────────────────────────────────
-- N4 GRAMMAR — Reorder (5 questions)
-- ───────────────────────────────────────────────────────────────────
INSERT INTO questions (id, level, category, question, options, answer, explanation, type, words) VALUES
('n4-g-009','n4','grammar','Arrange: (When work is done, let''s go eat.)','[]',0,'Correct: 仕事が終わったら食事に行きましょう。Conditional たら clause → result clause.','reorder','["仕事が","終わったら","食事に","行きましょう"]'),
('n4-g-010','n4','grammar','Arrange: (I want to become good at Japanese.)','[]',0,'Correct: 日本語が上手になりたいです。Subject → result state → たい (want to).','reorder','["日本語が","上手に","なりたいです"]'),
('n4-g-011','n4','grammar','Arrange: (I must wake up earlier.)','[]',0,'Correct: もっと早く起きなければなりません。Adverb → adverb → verb stem + なければなりません.','reorder','["もっと","早く","起きなければ","なりません"]'),
('n4-g-012','n4','grammar','Arrange: (I ate popcorn while watching a movie.)','[]',0,'Correct: 映画を見ながらポップコーンを食べました。Verb stem + ながら expresses simultaneous actions.','reorder','["映画を","見ながら","ポップコーンを","食べました"]'),
('n4-g-013','n4','grammar','Arrange: (Is it okay if I walk to the station?)','[]',0,'Correct: 駅まで歩いて行ってもいいですか。Destination + te-form movement + permission expression.','reorder','["駅まで","歩いて","行っても","いいですか"]')
ON CONFLICT (id) DO NOTHING;


-- ───────────────────────────────────────────────────────────────────
-- N4 VOCABULARY (15 questions)
-- ───────────────────────────────────────────────────────────────────
INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n4-v-001','n4','vocabulary','What does 運動 mean?','["rest","exercise","study","work"]',1,'運動 (undou) means exercise or physical activity.'),
('n4-v-002','n4','vocabulary','What does 意見 mean?','["question","answer","opinion","report"]',2,'意見 (iken) means opinion or view.'),
('n4-v-003','n4','vocabulary','What does 経験 mean?','["knowledge","experience","memory","skill"]',1,'経験 (keiken) means experience.'),
('n4-v-004','n4','vocabulary','What does 計画 mean?','["result","problem","plan","meeting"]',2,'計画 (keikaku) means plan or project.'),
('n4-v-005','n4','vocabulary','What does 場所 mean?','["time","reason","place / location","person"]',2,'場所 (basho) means place or location.'),
('n4-v-006','n4','vocabulary','What does 準備 mean?','["conclusion","preparation","presentation","discussion"]',1,'準備 (junbi) means preparation or getting ready.'),
('n4-v-007','n4','vocabulary','What does 紹介 mean?','["explanation","introduction","instruction","interview"]',1,'紹介 (shoukai) means introduction (of a person or thing).'),
('n4-v-008','n4','vocabulary','What does 予定 mean?','["result","schedule / plan","history","custom"]',1,'予定 (yotei) means schedule or plan.'),
('n4-v-009','n4','vocabulary','What does 文化 mean?','["science","nature","culture","language"]',2,'文化 (bunka) means culture.'),
('n4-v-010','n4','vocabulary','What does 社会 mean?','["company","school","society","country"]',2,'社会 (shakai) means society.'),
('n4-v-011','n4','vocabulary','What does 最初 mean?','["last","middle","first / beginning","recently"]',2,'最初 (saisho) means first or the beginning.'),
('n4-v-012','n4','vocabulary','What does 最後 mean?','["first","middle","recently","last / end"]',3,'最後 (saigo) means last or the end.'),
('n4-v-013','n4','vocabulary','What does 仕事 mean?','["hobby","study","work / job","travel"]',2,'仕事 (shigoto) means work or job.'),
('n4-v-014','n4','vocabulary','What does 連絡 mean?','["meeting","contact / communication","report","request"]',1,'連絡 (renraku) means contact or communication.'),
('n4-v-015','n4','vocabulary','What does 習慣 mean?','["knowledge","tradition","habit / custom","regulation"]',2,'習慣 (shuukan) means habit or custom.')
ON CONFLICT (id) DO NOTHING;


-- ═══════════════════════════════════════════════════════════════════
-- N3 KANJI (20 questions)
-- ═══════════════════════════════════════════════════════════════════
INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n3-k-001','n3','kanji','愛','["にくむ / ぞう","あいする / あい","こわい / きょう","きらう / けん"]',1,'愛 means love or affection. Read as あいする (aisuru) or あい (ai).'),
('n3-k-002','n3','kanji','悪','["よい / ぜん","わるい / あく","しずか / せい","やさしい / じゅう"]',1,'悪 means bad or evil. Read as わるい (warui) or あく (aku).'),
('n3-k-003','n3','kanji','案','["けっか / か","もんだい / だい","あん / かんがえ","ほうほう / ほう"]',2,'案 means plan or idea. Read as あん (an). Used in 案内 (annnai, guidance).'),
('n3-k-004','n3','kanji','運','["しっぱい / はい","うん / はこぶ","くるしい / く","やすむ / きゅう"]',1,'運 means luck or to carry. Read as うん (un) or はこぶ (hakobu).'),
('n3-k-005','n3','kanji','改','["やぶる / は","あらためる / かい","まもる / しゅ","こわす / かい"]',1,'改 means to reform or renew. Read as あらためる (aratameru) or かい (kai).'),
('n3-k-006','n3','kanji','感','["かんじる / かん","みる / し","きく / ちょう","かんがえる / こう"]',0,'感 means feeling or sense. Read as かんじる (kanjiru) or かん (kan). Used in 感謝 (kansha, gratitude).'),
('n3-k-007','n3','kanji','関','["はなれる / り","かん / せき","つなぐ / けつ","そとれる / ぶん"]',1,'関 means related to or barrier. Read as かん (kan) or せき (seki). Used in 関係 (kankei, relationship).'),
('n3-k-008','n3','kanji','機','["やすみ / きゅう","き / おりめ","もの / ぶつ","どうぐ / き"]',1,'機 means machine or opportunity. Read as き (ki). Used in 機会 (kikai, opportunity) and 機械 (kikai, machine).'),
('n3-k-009','n3','kanji','技','["ちから / りょく","わざ / ぎ","のうりょく / のう","さいのう / のう"]',1,'技 means skill or technique. Read as わざ (waza) or ぎ (gi). Used in 技術 (gijutsu, technology).'),
('n3-k-010','n3','kanji','際','["まえ / ぜん","あいだ / かん","きわ / さい","うしろ / こう"]',2,'際 means occasion, edge, or between. Read as きわ (kiwa) or さい (sai). Used in 国際 (kokusai, international).'),
('n3-k-011','n3','kanji','識','["しきべつ / べつ","しる / しき","おぼえる / き","まなぶ / がく"]',1,'識 means knowledge or discernment. Read as しる (shiru) or しき (shiki). Used in 知識 (chishiki, knowledge).'),
('n3-k-012','n3','kanji','責','["ほめる / しょう","せめる / せき","たすける / えん","ゆるす / きょ"]',1,'責 means responsibility or to blame. Read as せめる (semeru) or せき (seki). Used in 責任 (sekinin, responsibility).'),
('n3-k-013','n3','kanji','則','["じゆう / じ","きそく / そく","むせんにゅう / む","ばらばら / さん"]',1,'則 means rule or law. Read as そく (soku). Used in 規則 (kisoku, rules) and 原則 (gensoku, principle).'),
('n3-k-014','n3','kanji','態','["きもち / きん","ようす / たい","かたち / けい","ところ / しょ"]',1,'態 means appearance or state. Read as ようす or たい (tai). Used in 状態 (joutai, condition) and 態度 (taido, attitude).'),
('n3-k-015','n3','kanji','断','["つづける / ぞく","ことわる / だん","ゆるす / きょ","たのむ / い"]',1,'断 means to refuse or cut off. Read as ことわる (kotowaru) or だん (dan).'),
('n3-k-016','n3','kanji','比','["おなじ / どう","ちがう / い","くらべる / ひ","にている / るい"]',2,'比 means to compare. Read as くらべる (kuraberu) or ひ (hi). Used in 比較 (hikaku, comparison).'),
('n3-k-017','n3','kanji','批','["ほめる / しょう","ひはん / ひ","みとめる / にん","えらぶ / せん"]',1,'批 means criticism. Read as ひ (hi). Used in 批判 (hihan, criticism) and 批評 (hihyou, review).'),
('n3-k-018','n3','kanji','暖','["さむい / かん","あたたかい / だん","すずしい / せい","あつい / ねつ"]',1,'暖 means warm (weather). Read as あたたかい (atatakai) or だん (dan). Used in 暖房 (danbou, heating).'),
('n3-k-019','n3','kanji','若','["ふるい / こ","わかい / じゃく","としより / ろう","おとな / じん"]',1,'若 means young. Read as わかい (wakai) or じゃく (jaku). Used in 若者 (wakamono, young people).'),
('n3-k-020','n3','kanji','論','["しつもん / もん","ろん / かんがえ","こたえ / かい","はなし / わ"]',1,'論 means argument or discussion. Read as ろん (ron). Used in 議論 (giron, debate) and 理論 (riron, theory).')
ON CONFLICT (id) DO NOTHING;


-- ───────────────────────────────────────────────────────────────────
-- N3 GRAMMAR — Multiple Choice (8 questions)
-- ───────────────────────────────────────────────────────────────────
INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n3-g-001','n3','grammar','健康___、毎日運動します。(For the sake of health, I exercise every day.)','["のために","のため","のせいで","のおかげで"]',0,'ために after a noun means for the sake of or in order to achieve a purpose.'),
('n3-g-002','n3','grammar','天気___、気分が変わります。(Depending on the weather, my mood changes.)','["によって","にとって","に対して","において"]',0,'によって means depending on or by means of. It expresses variation based on a factor.'),
('n3-g-003','n3','grammar','彼の意見___、私は賛成できません。(I cannot agree with his opinion.)','["に対して","によって","にとって","において"]',0,'に対して means toward or in response to. It marks the target of an attitude or action.'),
('n3-g-004','n3','grammar','医者___、患者を助けることが使命です。(As a doctor, it is my mission to help patients.)','["として","にとって","のために","によって"]',0,'として means as or in the capacity of. It describes a role or function.'),
('n3-g-005','n3','grammar','子供___、遊ぶことが一番大切です。(For children, playing is most important.)','["にとって","に対して","によって","として"]',0,'にとって means for or from the perspective of someone. It expresses personal relevance.'),
('n3-g-006','n3','grammar','勉強が嫌いな___ではありません。(It is not that I hate studying.)','["わけ","こと","もの","はず"]',0,'わけではない means it is not the case that. It softens or corrects a potential misunderstanding.'),
('n3-g-007','n3','grammar','来月、東京に転勤する___になりました。(It has been decided that I will transfer to Tokyo next month.)','["こと","もの","わけ","はず"]',0,'ことになる expresses that something has been decided or arranged, often by external circumstances.'),
('n3-g-008','n3','grammar','練習して、ピアノが弾ける___なりました。(Through practice, I came to be able to play the piano.)','["ように","ことに","わけに","ためで"]',0,'ようになる means to come to be able to or to reach a state where something is possible, indicating a gradual change.')
ON CONFLICT (id) DO NOTHING;


-- ───────────────────────────────────────────────────────────────────
-- N3 GRAMMAR — Reorder (5 questions)
-- ───────────────────────────────────────────────────────────────────
INSERT INTO questions (id, level, category, question, options, answer, explanation, type, words) VALUES
('n3-g-009','n3','grammar','Arrange: (In order to pass the exam, I study every day.)','[]',0,'Correct: 試験に合格するために毎日勉強しています。Purpose clause with ために comes before the main action.','reorder','["試験に","合格するために","毎日","勉強しています"]'),
('n3-g-010','n3','grammar','Arrange: (She decided to become a doctor.)','[]',0,'Correct: 彼女は医者になることを決めました。Topic → goal + ことを + decision verb.','reorder','["彼女は","医者に","なることを","決めました"]'),
('n3-g-011','n3','grammar','Arrange: (This movie is popular not only with children but also adults.)','[]',0,'Correct: この映画は子供だけでなく大人にも人気があります。だけでなく～にも means not only A but also B.','reorder','["この映画は","子供だけでなく","大人にも","人気があります"]'),
('n3-g-012','n3','grammar','Arrange: (Through experience, people become wiser.)','[]',0,'Correct: 経験によって人はより賢くなります。によって expresses the means or cause of change.','reorder','["経験によって","人は","より","賢くなります"]'),
('n3-g-013','n3','grammar','Arrange: (If only he comes, the party will be a success.)','[]',0,'Correct: 彼が来さえすればパーティーは成功します。さえ～ば means if only or as long as, expressing a single sufficient condition.','reorder','["彼が","来さえすれば","パーティーは","成功します"]')
ON CONFLICT (id) DO NOTHING;


-- ───────────────────────────────────────────────────────────────────
-- N3 VOCABULARY (15 questions)
-- ───────────────────────────────────────────────────────────────────
INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n3-v-001','n3','vocabulary','What does 影響 mean?','["result","influence / effect","reason","method"]',1,'影響 (eikyou) means influence or effect.'),
('n3-v-002','n3','vocabulary','What does 環境 mean?','["society","technology","environment","economy"]',2,'環境 (kankyou) means environment or surroundings.'),
('n3-v-003','n3','vocabulary','What does 議論 mean?','["agreement","report","debate / discussion","rule"]',2,'議論 (giron) means debate or discussion.'),
('n3-v-004','n3','vocabulary','What does 経済 mean?','["politics","culture","history","economy"]',3,'経済 (keizai) means economy or economics.'),
('n3-v-005','n3','vocabulary','What does 原因 mean?','["result","effect","cause / reason","solution"]',2,'原因 (genin) means cause or reason behind something.'),
('n3-v-006','n3','vocabulary','What does 現在 mean?','["past","future","present / now","recent"]',2,'現在 (genzai) means present time or currently.'),
('n3-v-007','n3','vocabulary','What does 効果 mean?','["method","purpose","effect / result","problem"]',2,'効果 (kouka) means effect or result of an action.'),
('n3-v-008','n3','vocabulary','What does 国際 mean?','["domestic","national","local","international"]',3,'国際 (kokusai) means international.'),
('n3-v-009','n3','vocabulary','What does 責任 mean?','["authority","freedom","responsibility","reward"]',2,'責任 (sekinin) means responsibility.'),
('n3-v-010','n3','vocabulary','What does 状況 mean?','["opinion","regulation","situation / circumstances","system"]',2,'状況 (joukyou) means situation or circumstances.'),
('n3-v-011','n3','vocabulary','What does 目的 mean?','["method","result","schedule","purpose / goal"]',3,'目的 (mokuteki) means purpose or goal.'),
('n3-v-012','n3','vocabulary','What does 資料 mean?','["equipment","data / materials","knowledge","experience"]',1,'資料 (shiryou) means materials, data, or documents.'),
('n3-v-013','n3','vocabulary','What does 競争 mean?','["cooperation","negotiation","competition","conflict"]',2,'競争 (kyousou) means competition.'),
('n3-v-014','n3','vocabulary','What does 批判 mean?','["praise","support","criticism","suggestion"]',2,'批判 (hihan) means criticism or critique.'),
('n3-v-015','n3','vocabulary','What does 可能性 mean?','["difficulty","certainty","possibility","necessity"]',2,'可能性 (kanousei) means possibility or potential.')
ON CONFLICT (id) DO NOTHING;
