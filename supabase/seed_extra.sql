-- ═══════════════════════════════════════════════════════════════════
-- KAME DOJO — Extra Questions Seed (additions to seed.sql)
-- N5/N4/N3 additions  +  full N2  +  full N1
-- Safe to re-run: ON CONFLICT (id) DO NOTHING
-- Total: ~173 new questions
-- ═══════════════════════════════════════════════════════════════════

-- seed_extra_n345.sql
-- Additional questions for the Kame Dojo Japanese learning game.
-- N5: n5-g-021 to n5-g-030, n5-v-026 to n5-v-040
-- N4: n4-g-014 to n4-g-025, n4-v-016 to n4-v-027
-- N3: n3-g-014 to n3-g-025, n3-v-016 to n3-v-027

-- ============================================================
-- SECTION 1: N5 Additional Grammar (n5-g-021 to n5-g-030)
-- ============================================================
INSERT INTO questions (id, level, category, question, options, answer, explanation, type, words)
VALUES
  ('n5-g-021', 'N5', 'grammar',
   '「日本語___話せますか？」の空欄に入る助詞はどれですか？',
   '["は", "が", "を", "で"]',
   1,
   '可能動詞（話せる）には助詞「が」を使います。「日本語が話せますか？」が正しい表現です。可能形では対象に「が」を使うのが基本で、「は」「を」「で」は可能形の対象には使いません。',
   NULL, NULL),
  ('n5-g-022', 'N5', 'grammar',
   '「走ら___ください」の空欄に入るのはどれですか？（「走るな」という意味の丁寧な依頼）',
   '["ないで", "なくて", "ずに", "なしで"]',
   0,
   '「ないでください」は「〜しないでください」という否定の依頼を表します。「走らないでください」は"Please don''t run"という意味です。「なくて」は理由や並列を表し、「ずに」はやや書き言葉的な表現です。',
   NULL, NULL),
  ('n5-g-023', 'N5', 'grammar',
   '「雨が降っ___、傘を持ってください。」の空欄に入る接続表現はどれですか？',
   '["たら", "たので", "たから", "たけど"]',
   0,
   '「〜たら」は条件（もし〜なら）を表します。「雨が降ったら」は"If it rains"という意味です。「たので」「たから」は理由を表し、「たけど」は逆接なので、ここには合いません。',
   NULL, NULL),
  ('n5-g-024', 'N5', 'grammar',
   '「友達に本を___ました。」（私が友達に本を渡した）の空欄に入るのはどれですか？',
   '["あげ", "もらい", "くれ", "やり"]',
   0,
   '「あげる」は自分（または身内）から他者へ物を渡すときに使います。「もらう」は自分が受け取る場合、「くれる」は他者が自分に渡す動作を表します。「友達に本をあげました」は"I gave a book to my friend"という意味です。',
   NULL, NULL),
  ('n5-g-025', 'N5', 'grammar',
   '「先生に本を___ました。」（先生から私が本を受け取った）の空欄に入るのはどれですか？',
   '["もらい", "あげ", "くれ", "さしあげ"]',
   0,
   '「もらう」は自分が他者から物を受け取るときに使います。「あげる」は自分が渡す場合、「くれる」は他者が自分に渡す動作を表します。「先生に本をもらいました」は"I received a book from my teacher"という意味です。',
   NULL, NULL),
  ('n5-g-026', 'N5', 'grammar',
   '「りんご___バナナのほうが好きです。」の空欄に入る助詞はどれですか？',
   '["より", "から", "まで", "ほど"]',
   0,
   '「〜より〜のほうが」は比較を表し、「より」は"than"という意味です。「りんごよりバナナのほうが好きです」は"I like bananas more than apples"という意味です。「から」は起点、「まで」は終点、「ほど」は程度を表します。',
   NULL, NULL),
  ('n5-g-027', 'N5', 'grammar',
   '「ここでタバコを吸っ___ません。」（禁止の表現）の空欄に入るのはどれですか？',
   '["てはいけ", "てもいい", "てください", "てしまい"]',
   0,
   '「〜てはいけません」は禁止を表します。「ここでタバコを吸ってはいけません」は"You must not smoke here"という意味です。「てもいい」は許可、「てください」は依頼を表します。',
   NULL, NULL),
  ('n5-g-028', 'N5', 'grammar',
   '「頭が痛い。___、学校を休みます。」の空欄に入るのはどれですか？',
   '["だから", "でも", "そして", "それに"]',
   0,
   '「だから」は原因・理由を受けて結果・結論を述べる接続詞です。"I have a headache. So, I''ll be absent from school."という意味です。「でも」は逆接、「そして」は順接の付け足し、「それに」は追加を表します。',
   NULL, NULL),
  ('n5-g-029', 'N5', 'grammar',
   '「紙を3___ください。」の空欄に入る助数詞はどれですか？',
   '["枚", "本", "冊", "個"]',
   0,
   '「枚（まい）」は紙・皿・シャツなど薄くて平たいものを数えます。「本（ほん）」は細長いもの（ペン・ビンなど）、「冊（さつ）」は本・雑誌、「個（こ）」は小さい物に使います。',
   NULL, NULL),
  ('n5-g-030', 'N5', 'grammar',
   '「新しい自転車が___です。」（自転車が欲しい）の空欄に入るのはどれですか？',
   '["ほしい", "たい", "すき", "いい"]',
   0,
   '「ほしい」は物が欲しいときに名詞につけて使います。「〜たい」は動詞につけて「〜したい」（want to do）という意味になります。名詞（自転車）に直接つくのは「ほしい」で、「たい」は直接名詞にはつきません。',
   NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- SECTION 2: N5 Additional Vocabulary (n5-v-026 to n5-v-040)
-- ============================================================
INSERT INTO questions (id, level, category, question, options, answer, explanation, type, words)
VALUES
  ('n5-v-026', 'N5', 'vocabulary',
   '「電話」はどういう意味ですか？',
   '["telephone / phone call", "television", "radio", "computer"]',
   0,
   '電話（でんわ）は"telephone"または"phone call"という意味です。「電話をかける」（make a phone call）、「電話に出る」（answer the phone）のように使います。',
   NULL, NULL),
  ('n5-v-027', 'N5', 'vocabulary',
   '「会社」はどういう意味ですか？',
   '["company / office", "school", "hospital", "store"]',
   0,
   '会社（かいしゃ）は"company"または"office"という意味です。「会社に行く」（go to the office）、「会社員」（company employee）のように使います。',
   NULL, NULL),
  ('n5-v-028', 'N5', 'vocabulary',
   '「病院」はどういう意味ですか？',
   '["hospital", "bank", "post office", "library"]',
   0,
   '病院（びょういん）は"hospital"という意味です。「病院に行く」（go to the hospital）、「病院で働く」（work at a hospital）のように使います。',
   NULL, NULL),
  ('n5-v-029', 'N5', 'vocabulary',
   '「銀行」はどういう意味ですか？',
   '["bank", "hospital", "station", "department store"]',
   0,
   '銀行（ぎんこう）は"bank"（金融機関）という意味です。「銀行でお金をおろす」（withdraw money from the bank）、「銀行口座」（bank account）のように使います。',
   NULL, NULL),
  ('n5-v-030', 'N5', 'vocabulary',
   '「映画」はどういう意味ですか？',
   '["movie / film", "music", "play / theater", "book"]',
   0,
   '映画（えいが）は"movie"または"film"という意味です。「映画を見る」（watch a movie）、「映画館」（movie theater）のように使います。',
   NULL, NULL),
  ('n5-v-031', 'N5', 'vocabulary',
   '「音楽」はどういう意味ですか？',
   '["music", "art", "sport", "literature"]',
   0,
   '音楽（おんがく）は"music"という意味です。「音楽を聴く」（listen to music）、「音楽家」（musician）のように使います。',
   NULL, NULL),
  ('n5-v-032', 'N5', 'vocabulary',
   '「料理」はどういう意味ですか？',
   '["cooking / cuisine / dish", "travel", "shopping", "cleaning"]',
   0,
   '料理（りょうり）は"cooking"、"cuisine"、または"dish"という意味です。「料理を作る」（cook a meal）、「日本料理」（Japanese cuisine）のように使います。',
   NULL, NULL),
  ('n5-v-033', 'N5', 'vocabulary',
   '「旅行」はどういう意味ですか？',
   '["travel / trip", "cooking", "work", "study"]',
   0,
   '旅行（りょこう）は"travel"または"trip"という意味です。「旅行に行く」（go on a trip）、「海外旅行」（overseas travel）のように使います。',
   NULL, NULL),
  ('n5-v-034', 'N5', 'vocabulary',
   '「言葉」はどういう意味ですか？',
   '["word / language", "letter / character", "story", "voice"]',
   0,
   '言葉（ことば）は"word"または"language/expression"という意味です。「きれいな言葉」（beautiful words）、「言葉が通じない」（the language doesn''t get through）のように使います。',
   NULL, NULL),
  ('n5-v-035', 'N5', 'vocabulary',
   '「時間」はどういう意味ですか？',
   '["time / hour", "minute", "second", "day"]',
   0,
   '時間（じかん）は"time"または"hour"という意味です。「時間がある」（have time）、「1時間」（one hour）のように使います。「時刻」は特定の時点、「時間」は時間の量や流れを表します。',
   NULL, NULL),
  ('n5-v-036', 'N5', 'vocabulary',
   '「来年」はどういう意味ですか？',
   '["next year", "last year", "this year", "every year"]',
   0,
   '来年（らいねん）は"next year"という意味です。「来年の春」（next spring）のように使います。「去年」（last year）、「今年」（this year）と区別しましょう。',
   NULL, NULL),
  ('n5-v-037', 'N5', 'vocabulary',
   '「去年」はどういう意味ですか？',
   '["last year", "next year", "this year", "every year"]',
   0,
   '去年（きょねん）は"last year"という意味です。「去年の夏」（last summer）のように使います。「来年」（next year）、「今年」（this year）と区別しましょう。',
   NULL, NULL),
  ('n5-v-038', 'N5', 'vocabulary',
   '「友達」はどういう意味ですか？',
   '["friend", "family", "teacher", "colleague"]',
   0,
   '友達（ともだち）は"friend"という意味です。「友達と遊ぶ」（hang out with friends）のように使います。「友人」（ゆうじん）も同じ意味ですが、やや改まった表現です。',
   NULL, NULL),
  ('n5-v-039', 'N5', 'vocabulary',
   '「本当」はどういう意味ですか？',
   '["truth / real / true", "book", "origin", "answer"]',
   0,
   '本当（ほんとう）は"truth"、"real"、"true"という意味です。「本当のことを言う」（tell the truth）、「本当にありがとう」（Thank you so much / Really, thank you）のように使います。',
   NULL, NULL),
  ('n5-v-040', 'N5', 'vocabulary',
   '「一緒」はどういう意味ですか？',
   '["together", "alone", "separately", "sometimes"]',
   0,
   '一緒（いっしょ）は"together"という意味です。「一緒に行く」（go together）、「一緒に食べる」（eat together）のように「一緒に」の形でよく使われます。',
   NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- SECTION 3: N4 Additional Grammar (n4-g-014 to n4-g-025)
-- ============================================================
INSERT INTO questions (id, level, category, question, options, answer, explanation, type, words)
VALUES
  ('n4-g-014', 'N4', 'grammar',
   '「先生に___ました。」（先生が私を叱った）の受身形はどれですか？',
   '["叱られ", "叱らせ", "叱って", "叱り"]',
   0,
   '受身形（〜られる）は「〜された」という意味を表します。「先生に叱られました」は"I was scolded by the teacher"という意味です。「叱らせ」は使役形（させる）、「叱って」は中止形です。',
   NULL, NULL),
  ('n4-g-015', 'N4', 'grammar',
   '「子供に野菜を食べ___ます。」（子供に食べることをさせる）の空欄に入るのはどれですか？',
   '["させ", "られ", "させられ", "てい"]',
   0,
   '使役形（〜させる）は「〜させる」（make/let someone do）を表します。「子供に野菜を食べさせます」は"I make the child eat vegetables"という意味です。「〜させられ」は使役受身形（させられる）で、「させられる」（be made to do）という意味です。',
   NULL, NULL),
  ('n4-g-016', 'N4', 'grammar',
   '「窓が___あります。」（誰かが意図的に開けた結果の状態）の空欄に入るのはどれですか？',
   '["開けて", "開いて", "開けられて", "開けながら"]',
   0,
   '「〜てある」は誰かが意図的に行った行為の結果の状態を表します。「窓が開けてあります」は"The window has been opened (by someone)"という意味です。「〜ている」は状態や継続を広く表しますが、「〜てある」は意図的な準備や行為の結果を強調します。',
   NULL, NULL),
  ('n4-g-017', 'N4', 'grammar',
   '「出かける前に準備して___ます。」（後で役立てるため事前に行う）の空欄に入るのはどれですか？',
   '["おき", "あり", "いき", "しまい"]',
   0,
   '「〜ておく」は後で役立てるために事前に何かをすることを表します。「準備しておきます」は"I''ll prepare in advance"という意味です。「〜てある」は結果の状態、「〜てしまう」は完了や後悔を表します。',
   NULL, NULL),
  ('n4-g-018', 'N4', 'grammar',
   '「彼女は先生___です。」（情報や様子に基づく推測・伝聞）の空欄に入るのはどれですか？',
   '["らしい", "そう", "よう", "はず"]',
   0,
   '「らしい」は情報・証拠・見た目に基づく推測や伝聞を表します。「先生らしいです」は"She seems to be a teacher / I hear she is a teacher"という意味です。「そう」は直接的な様子、「よう」は自分の観察による推測です。',
   NULL, NULL),
  ('n4-g-019', 'N4', 'grammar',
   '「このケーキはおいしい___です。」（自分の観察・感覚による推測）の空欄に入るのはどれですか？',
   '["よう", "らしい", "はず", "べき"]',
   0,
   '「ようだ」は自分の直接の感覚・観察に基づく推測を表します。「おいしいようです」は"It looks/seems delicious"という意味です。「らしい」は伝聞や間接情報に基づき、「はずだ」は論理的根拠による推測です。',
   NULL, NULL),
  ('n4-g-020', 'N4', 'grammar',
   '「一生懸命勉強した___、試験に合格しませんでした。」の空欄に入るのはどれですか？',
   '["のに", "から", "ので", "けれど"]',
   0,
   '「のに」は期待に反する結果を表す逆接の接続助詞で、落胆・不満のニュアンスがあります。「勉強したのに合格しなかった」は"Even though I studied hard, I failed"という意味です。「から」「ので」は理由を表します。「けれど」は逆接ですが、「のに」ほど感情的なニュアンスはありません。',
   NULL, NULL),
  ('n4-g-021', 'N4', 'grammar',
   '「時間が___、映画を見ます。」（仮定条件）の空欄に入るのはどれですか？',
   '["あれば", "あったら", "あるなら", "あると"]',
   0,
   '「〜ば」は仮定条件を表します。「時間があれば」は"If I have time"という意味です。「〜たら」も条件を表しますが、「〜ば」は一般的・仮定的な条件に多く使われます。「〜と」は自然な結果や習慣的な事実を表します。',
   NULL, NULL),
  ('n4-g-022', 'N4', 'grammar',
   '次の語句を並べ替えて「弟に部屋を掃除させました」（弟に部屋を掃除させた）という文を作ってください。',
   '[]',
   0,
   '使役形「〜させる」を使った文です。「弟に部屋を掃除させました」は"I had my younger sibling clean the room"という意味です。【弟に】→【部屋を】→【掃除させました】の順が正しい語順です。',
   'reorder', '["弟に", "部屋を", "掃除させました"]'),
  ('n4-g-023', 'N4', 'grammar',
   '次の語句を並べ替えて「電車の中で財布を盗まれました」（電車でスリに遭った）という文を作ってください。',
   '[]',
   0,
   '受身形「〜られる」を使った文です。「電車の中で財布を盗まれました」は"My wallet was stolen on the train"という意味です。【電車の中で】→【財布を】→【盗まれました】の順が正しい語順です。',
   'reorder', '["電車の中で", "財布を", "盗まれました"]'),
  ('n4-g-024', 'N4', 'grammar',
   '次の語句を並べ替えて「母が帰る前に夕食を作っておきました」という文を作ってください。',
   '[]',
   0,
   '「〜ておく」（事前にする）を使った文です。「母が帰る前に夕食を作っておきました」は"I prepared dinner in advance before my mother came home"という意味です。【母が帰る前に】→【夕食を】→【作っておきました】の順が正しい語順です。',
   'reorder', '["母が帰る前に", "夕食を", "作っておきました"]'),
  ('n4-g-025', 'N4', 'grammar',
   '次の語句を並べ替えて「高かったのに買ってしまいました」という文を作ってください。',
   '[]',
   0,
   '「〜のに」（逆接・予想外）と「〜てしまう」（完了・後悔）を使った文です。「高かったのに買ってしまいました」は"Even though it was expensive, I ended up buying it"という意味です。【高かったのに】→【買って】→【しまいました】の順が正しい語順です。',
   'reorder', '["高かったのに", "買って", "しまいました"]')
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- SECTION 4: N4 Additional Vocabulary (n4-v-016 to n4-v-027)
-- ============================================================
INSERT INTO questions (id, level, category, question, options, answer, explanation, type, words)
VALUES
  ('n4-v-016', 'N4', 'vocabulary',
   '「自由」はどういう意味ですか？',
   '["freedom / liberty", "safety", "nature", "relationship"]',
   0,
   '自由（じゆう）は"freedom"または"liberty"という意味です。「自由に話す」（speak freely）、「自由な時間」（free time）のように使います。反対語は「不自由（ふじゆう）」です。',
   NULL, NULL),
  ('n4-v-017', 'N4', 'vocabulary',
   '「安全」はどういう意味ですか？',
   '["safety / safe", "freedom", "danger", "responsibility"]',
   0,
   '安全（あんぜん）は"safety"または"safe"という意味です。「安全を確認する」（confirm safety）、「安全な場所」（safe place）のように使います。反対語は「危険（きけん）」です。',
   NULL, NULL),
  ('n4-v-018', 'N4', 'vocabulary',
   '「自然」はどういう意味ですか？',
   '["nature / natural", "city", "technology", "society"]',
   0,
   '自然（しぜん）は"nature"または"natural"という意味です。「自然を守る」（protect nature）、「自然な笑顔」（natural smile）のように名詞・形容動詞として使います。',
   NULL, NULL),
  ('n4-v-019', 'N4', 'vocabulary',
   '「関係」はどういう意味ですか？',
   '["relationship / connection", "reason", "method", "opportunity"]',
   0,
   '関係（かんけい）は"relationship"または"connection"という意味です。「人間関係」（human relationships）、「関係がある」（be related to）のように使います。',
   NULL, NULL),
  ('n4-v-020', 'N4', 'vocabulary',
   '「理由」はどういう意味ですか？',
   '["reason / cause", "result", "method", "purpose"]',
   0,
   '理由（りゆう）は"reason"または"cause"という意味です。「理由を説明する」（explain the reason）、「何か理由がある」（there must be some reason）のように使います。',
   NULL, NULL),
  ('n4-v-021', 'N4', 'vocabulary',
   '「方法」はどういう意味ですか？',
   '["method / way", "direction", "result", "reason"]',
   0,
   '方法（ほうほう）は"method"または"way"という意味です。「解決方法」（method of resolution）、「別の方法で試す」（try a different way）のように使います。',
   NULL, NULL),
  ('n4-v-022', 'N4', 'vocabulary',
   '「機会」はどういう意味ですか？',
   '["opportunity / chance", "machine", "period", "plan"]',
   0,
   '機会（きかい）は"opportunity"または"chance"という意味です。「機会があれば」（if I have the opportunity）のように使います。同音異義語の「機械（きかい）」（machine）と混同しないよう注意しましょう。',
   NULL, NULL),
  ('n4-v-023', 'N4', 'vocabulary',
   '「必要」はどういう意味ですか？',
   '["necessary / needed", "possible", "important", "useful"]',
   0,
   '必要（ひつよう）は"necessary"または"needed"という意味です。「必要な書類」（necessary documents）、「練習が必要だ」（practice is necessary）のように使います。',
   NULL, NULL),
  ('n4-v-024', 'N4', 'vocabulary',
   '「重要」はどういう意味ですか？',
   '["important / significant", "necessary", "difficult", "possible"]',
   0,
   '重要（じゅうよう）は"important"または"significant"という意味です。「重要な問題」（important issue）、「重要な役割を果たす」（play an important role）のように使います。',
   NULL, NULL),
  ('n4-v-025', 'N4', 'vocabulary',
   '「可能」はどういう意味ですか？',
   '["possible / potential", "impossible", "necessary", "important"]',
   0,
   '可能（かのう）は"possible"または"potential"という意味です。「可能な限り」（as much as possible）、「実現可能だ」（it is achievable）のように使います。反対語は「不可能（ふかのう）」です。',
   NULL, NULL),
  ('n4-v-026', 'N4', 'vocabulary',
   '「利用」はどういう意味ですか？',
   '["use / utilization", "profit", "convenience", "benefit"]',
   0,
   '利用（りよう）は"use"または"utilization"という意味です。「サービスを利用する」（use a service）、「公共交通を利用する」（use public transport）のように使います。',
   NULL, NULL),
  ('n4-v-027', 'N4', 'vocabulary',
   '「技術」はどういう意味ですか？',
   '["technology / skill / technique", "knowledge", "experience", "ability"]',
   0,
   '技術（ぎじゅつ）は"technology"、"skill"、または"technique"という意味です。「技術を磨く」（hone one''s skills）、「最新技術」（latest technology）のように使います。',
   NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- SECTION 5: N3 Additional Grammar (n3-g-014 to n3-g-025)
-- ============================================================
INSERT INTO questions (id, level, category, question, options, answer, explanation, type, words)
VALUES
  ('n3-g-014', 'N3', 'grammar',
   '「毎日運動する___しています。」（意識的な努力・習慣化）の空欄に入るのはどれですか？',
   '["ように", "ために", "ことに", "ものに"]',
   0,
   '「〜ようにする」は意識的に何かをしようとする努力・習慣を表します。「毎日運動するようにしています」は"I try to/make an effort to exercise every day"という意味です。「〜ようになる」は意図のない自然な変化を表します。',
   NULL, NULL),
  ('n3-g-015', 'N3', 'grammar',
   '「遅刻し___ようにしています。」（〜しないよう意識的に努力する）の空欄に入るのはどれですか？',
   '["ない", "なく", "ず", "なかった"]',
   0,
   '「〜ないようにする」は「〜しないよう努力する」という意味です。動詞の否定形（ない形）＋ようにする、という構造です。「遅刻しないようにしています」は"I try not to be late"という意味です。',
   NULL, NULL),
  ('n3-g-016', 'N3', 'grammar',
   '「彼は来月結婚する___です。」（他の情報源からの伝聞・報告）の空欄に入るのはどれですか？',
   '["ということ", "らしい", "そう", "はず"]',
   0,
   '「〜ということだ」は他の情報源からの伝聞を明示的に表します。「来月結婚するということです」は"I hear/It is said that he will get married next month"という意味です。「らしい」は様子や推測、「そうだ」は直接見聞きした情報に基づきます。',
   NULL, NULL),
  ('n3-g-017', 'N3', 'grammar',
   '「この部屋では靴を脱ぐ___。」（規則・社会的な取り決め）の空欄に入るのはどれですか？',
   '["ことになっています", "ようになっています", "ことにしています", "つもりです"]',
   0,
   '「〜ことになっている」は規則・社会的な取り決め・習慣として決まっていることを表します。「靴を脱ぐことになっています」は"It is the rule/custom to take off shoes"という意味です。「〜ことにしている」は自分個人で決めた習慣を表します。',
   NULL, NULL),
  ('n3-g-018', 'N3', 'grammar',
   '「あの音は地震___。」（強い確信・断定的な推測）の空欄に入るのはどれですか？',
   '["に違いない", "はずだ", "かもしれない", "だろう"]',
   0,
   '「〜に違いない」は強い確信・推断を表します。「地震に違いない」は"It must certainly be an earthquake"という意味です。「はずだ」は論理的根拠、「かもしれない」は不確かな推測、「だろう」は軽い推量を表します。',
   NULL, NULL),
  ('n3-g-019', 'N3', 'grammar',
   '「彼がそんなことをする___。」（〜のはずがない・あり得ない）の空欄に入るのはどれですか？',
   '["はずがない", "はずだ", "に違いない", "かもしれない"]',
   0,
   '「〜はずがない」は「〜のはずがない・あり得ない」という強い否定の推測を表します。「彼がそんなことをするはずがない」は"There is no way he would do such a thing"という意味です。「はずだ」は「当然〜のはずだ」と肯定の論理的推測を表します。',
   NULL, NULL),
  ('n3-g-020', 'N3', 'grammar',
   '「子供は元気な___。」（一般的な真理・常識・自然の摂理）の空欄に入るのはどれですか？',
   '["ものです", "ことです", "はずです", "わけです"]',
   0,
   '「〜ものだ」は一般的な真理・常識・自然の摂理を表します。「子供は元気なものです」は"Children are naturally/generally energetic"という意味です。感嘆や感慨を込める場合にも使われます。「こと」「はず」「わけ」ではこのニュアンスは出ません。',
   NULL, NULL),
  ('n3-g-021', 'N3', 'grammar',
   '「彼は知ってい___、教えてくれませんでした。」（〜にもかかわらず・逆接）の空欄に入るのはどれですか？',
   '["ながら", "のに", "けれど", "から"]',
   0,
   '「〜ながら」には同時進行と逆接の二つの用法があります。この文では「知っていながら教えなかった」と逆接（〜にもかかわらず）の意味で使われています。「彼は知っていながら、教えてくれませんでした」は"Even though he knew, he didn''t tell me"という意味です。',
   NULL, NULL),
  ('n3-g-022', 'N3', 'grammar',
   '次の語句を並べ替えて「砂糖を取りすぎないようにしています」（糖分を取りすぎないよう気をつけている）という文を作ってください。',
   '[]',
   0,
   '「〜ないようにする」（〜しないよう努力する）を使った文です。「砂糖を取りすぎないようにしています」は"I try not to eat too much sugar"という意味です。【砂糖を】→【取りすぎないように】→【しています】の順が正しい語順です。',
   'reorder', '["砂糖を", "取りすぎないように", "しています"]'),
  ('n3-g-023', 'N3', 'grammar',
   '次の語句を並べ替えて「来月新製品が発売されることになっています」（新製品発売の予定・決定）という文を作ってください。',
   '[]',
   0,
   '「〜ことになっている」（規則・取り決め・予定）を使った文です。「来月新製品が発売されることになっています」は"It has been decided that the new product will be released next month"という意味です。【来月】→【新製品が】→【発売されることに】→【なっています】の順です。',
   'reorder', '["来月", "新製品が", "発売されることに", "なっています"]'),
  ('n3-g-024', 'N3', 'grammar',
   '次の語句を並べ替えて「一日中働いているから疲れているに違いない」（強い確信の推測）という文を作ってください。',
   '[]',
   0,
   '「〜に違いない」（強い確信・推断）を使った文です。「一日中働いているから疲れているに違いない」は"He must be tired since he has been working all day"という意味です。【一日中】→【働いているから】→【疲れているに】→【違いない】の順です。',
   'reorder', '["一日中", "働いているから", "疲れているに", "違いない"]'),
  ('n3-g-025', 'N3', 'grammar',
   '次の語句を並べ替えて「知っていながら知らないふりをしていました」（逆接のながら）という文を作ってください。',
   '[]',
   0,
   '逆接の「〜ながら」（〜にもかかわらず）を使った文です。「知っていながら知らないふりをしていました」は"Even though she knew, she pretended not to"という意味です。【知っていながら】→【知らないふりを】→【していました】の順です。',
   'reorder', '["知っていながら", "知らないふりを", "していました"]')
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- SECTION 6: N3 Additional Vocabulary (n3-v-016 to n3-v-027)
-- ============================================================
INSERT INTO questions (id, level, category, question, options, answer, explanation, type, words)
VALUES
  ('n3-v-016', 'N3', 'vocabulary',
   '「判断」はどういう意味ですか？',
   '["judgment / decision", "evaluation", "proposal", "information"]',
   0,
   '判断（はんだん）は"judgment"または"decision"という意味です。「判断を下す」（make a judgment）、「状況を判断する」（judge the situation）のように使います。',
   NULL, NULL),
  ('n3-v-017', 'N3', 'vocabulary',
   '「実現」はどういう意味ですか？',
   '["realization / achievement", "existence", "cooperation", "change"]',
   0,
   '実現（じつげん）は"realization"または"achievement"という意味です。「夢を実現する」（realize a dream）、「計画の実現」（realization of a plan）のように使います。',
   NULL, NULL),
  ('n3-v-018', 'N3', 'vocabulary',
   '「協力」はどういう意味ですか？',
   '["cooperation / collaboration", "competition", "conflict", "independence"]',
   0,
   '協力（きょうりょく）は"cooperation"または"collaboration"という意味です。「ご協力をお願いします」（I ask for your cooperation）、「協力して働く」（work collaboratively）のように使います。',
   NULL, NULL),
  ('n3-v-019', 'N3', 'vocabulary',
   '「変化」はどういう意味ですか？',
   '["change / transformation", "stability", "progress", "development"]',
   0,
   '変化（へんか）は"change"または"transformation"という意味です。「気候の変化」（climate change）、「大きな変化が起きた」（a big change occurred）のように使います。',
   NULL, NULL),
  ('n3-v-020', 'N3', 'vocabulary',
   '「評価」はどういう意味ですか？',
   '["evaluation / assessment", "judgment", "proposal", "result"]',
   0,
   '評価（ひょうか）は"evaluation"または"assessment"という意味です。「高く評価する」（highly evaluate/appreciate）、「評価が上がる」（one''s rating goes up）のように使います。',
   NULL, NULL),
  ('n3-v-021', 'N3', 'vocabulary',
   '「存在」はどういう意味ですか？',
   '["existence / presence", "absence", "movement", "appearance"]',
   0,
   '存在（そんざい）は"existence"または"presence"という意味です。「神の存在」（existence of God）、「大きな存在だ」（is a significant presence）のように使います。',
   NULL, NULL),
  ('n3-v-022', 'N3', 'vocabulary',
   '「対応」はどういう意味ですか？',
   '["response / correspondence", "opposition", "cooperation", "comparison"]',
   0,
   '対応（たいおう）は"response"または"correspondence/dealing with"という意味です。「問い合わせに対応する」（respond to an inquiry）、「緊急対応」（emergency response）のように使います。',
   NULL, NULL),
  ('n3-v-023', 'N3', 'vocabulary',
   '「普及」はどういう意味ですか？',
   '["spread / popularization", "limitation", "reduction", "concentration"]',
   0,
   '普及（ふきゅう）は"spread"、"diffusion"、または"popularization"という意味です。「インターネットの普及」（spread of the internet）、「普及率が上がる」（diffusion rate increases）のように使います。',
   NULL, NULL),
  ('n3-v-024', 'N3', 'vocabulary',
   '「提案」はどういう意味ですか？',
   '["proposal / suggestion", "decision", "judgment", "evaluation"]',
   0,
   '提案（ていあん）は"proposal"または"suggestion"という意味です。「提案を出す」（put forward a proposal）、「新しいアイデアを提案する」（suggest a new idea）のように使います。',
   NULL, NULL),
  ('n3-v-025', 'N3', 'vocabulary',
   '「解決」はどういう意味ですか？',
   '["solution / resolution", "problem", "conflict", "difficulty"]',
   0,
   '解決（かいけつ）は"solution"または"resolution"という意味です。「問題を解決する」（solve a problem）、「解決策を探す」（look for a solution）のように使います。',
   NULL, NULL),
  ('n3-v-026', 'N3', 'vocabulary',
   '「情報」はどういう意味ですか？',
   '["information", "report", "communication", "knowledge"]',
   0,
   '情報（じょうほう）は"information"という意味です。「情報を集める」（gather information）、「情報社会」（information society）、「情報技術（IT）」のように使います。',
   NULL, NULL),
  ('n3-v-027', 'N3', 'vocabulary',
   '「達成」はどういう意味ですか？',
   '["achievement / accomplishment", "failure", "attempt", "progress"]',
   0,
   '達成（たっせい）は"achievement"または"accomplishment"という意味です。「目標を達成する」（achieve one''s goal）、「夢の達成」（accomplishment of a dream）のように使います。',
   NULL, NULL)
ON CONFLICT (id) DO NOTHING;



-- seed_n2.sql
-- N2-level JLPT questions for kame-dojo
-- Section A: Kanji      n2-k-001 .. n2-k-020  (20 multiple_choice)
-- Section B: Grammar    n2-g-001 .. n2-g-020  (15 multiple_choice + 5 reorder)
-- Section C: Vocabulary n2-v-001 .. n2-v-015  (15 multiple_choice)

-- ============================================================
-- SECTION A: N2 KANJI
-- ============================================================

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-001','n2','kanji','複','["ふく / 複雑な (complex/compound)","たん / 単純な (simple/single)","ばい / 倍増 (double)","こう / 交差 (cross)"]',0,'複 means compound or plural. Read as ふく (fuku). Used in 複雑 (fukuzatsu, complex) and 複数 (fukusuu, plural).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-002','n2','kanji','雑','["ざつ / 雑誌 (magazine/miscellaneous)","せい / 整理 (organize)","じゅん / 純粋 (pure)","へい / 平凡 (ordinary)"]',0,'雑 means miscellaneous or rough. Read as ざつ (zatsu). Used in 複雑 (fukuzatsu, complex) and 雑誌 (zasshi, magazine).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-003','n2','kanji','録','["ろく / 記録 (record)","き / 記念 (commemoration)","おく / 億 (hundred million)","ちょ / 著書 (written work)"]',0,'録 means record. Read as ろく (roku). Used in 記録 (kiroku, record) and 録音 (rokuon, sound recording).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-004','n2','kanji','欠','["けつ / 欠席 (absence)","ほ / 補充 (supplement)","そく / 足りる (sufficient)","まん / 満足 (satisfaction)"]',0,'欠 means lack or be absent. Read as けつ (ketsu) or か (ka). Used in 欠席 (kesseki, absence) and 欠点 (ketten, fault/weak point).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-005','n2','kanji','察','["さつ / 警察 (police/inspect)","し / 視力 (eyesight)","み / 見方 (viewpoint)","さん / 参考 (reference)"]',0,'察 means inspect or guess. Read as さつ (satsu). Used in 警察 (keisatsu, police) and 観察 (kansatsu, observation).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-006','n2','kanji','誤','["ご / 誤解 (misunderstanding/mistake)","ちょく / 直接 (direct)","ただ / 正しい (correct)","せい / 正確 (accurate)"]',0,'誤 means mistake or error. Read as ご (go) or あやまる (ayamaru). Used in 誤解 (gokai, misunderstanding) and 誤る (ayamaru, to make a mistake).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-007','n2','kanji','換','["かん / 交換 (exchange/replace)","どう / 動かす (move)","い / 移す (transfer)","き / 切る (cut)"]',0,'換 means exchange or replace. Read as かん (kan) or かえる (kaeru). Used in 交換 (koukan, exchange) and 換気 (kanki, ventilation).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-008','n2','kanji','抱','["ほう / 抱負 (ambition/embrace)","お / 押す (push)","も / 持つ (hold)","つか / 掴む (grasp)"]',0,'抱 means embrace or hold. Read as ほう (hou) or だく (daku). Used in 抱く (daku, to hold/embrace) and 抱負 (houfu, ambition).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-009','n2','kanji','慣','["かん / 習慣 (habit/accustom)","れん / 練習 (practice)","がく / 学習 (learning)","きん / 勤勉 (diligence)"]',0,'慣 means accustom or get used to. Read as かん (kan) or な (na). Used in 慣れる (nareru, to get used to) and 習慣 (shuukan, habit/custom).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-010','n2','kanji','隠','["いん / 隠す (hide/conceal)","あら / 現れる (appear)","み / 見せる (show)","だ / 出す (put out)"]',0,'隠 means hide or conceal. Read as いん (in) or かくす (kakusu). Used in 隠す (kakusu, to hide) and 隠れる (kakureru, to be hidden).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-011','n2','kanji','拡','["かく / 拡大 (expand/enlarge)","しゅく / 縮小 (reduce)","へい / 閉じる (close)","さく / 削除 (delete)"]',0,'拡 means expand or enlarge. Read as かく (kaku). Used in 拡大 (kakudai, enlargement) and 拡張 (kakuchou, expansion).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-012','n2','kanji','測','["そく / 測定 (measure)","かん / 感覚 (sense)","さん / 算数 (arithmetic)","けい / 計画 (plan)"]',0,'測 means measure. Read as そく (soku) or はかる (hakaru). Used in 測る (hakaru, to measure) and 測定 (sokutei, measurement).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-013','n2','kanji','拒','["きょ / 拒否 (refuse/reject)","きん / 禁止 (prohibition)","ほ / 保留 (hold/reserve)","がん / 頑固 (stubborn)"]',0,'拒 means refuse or reject. Read as きょ (kyo) or こばむ (kobamu). Used in 拒否 (kyohi, refusal) and 拒む (kobamu, to refuse).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-014','n2','kanji','就','["しゅう / 就職 (employment/take position)","り / 離職 (resignation)","に / 入社 (join company)","てん / 転職 (job change)"]',0,'就 means take up a position. Read as しゅう (shuu) or つく (tsuku). Used in 就職 (shuushoku, finding employment) and 就く (tsuku, to take up a position).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-015','n2','kanji','述','["じゅつ / 述べる (state/describe)","けん / 研究 (research)","はつ / 発言 (remark)","もう / 申す (say humbly)"]',0,'述 means state or describe. Read as じゅつ (jutsu) or のべる (noberu). Used in 述べる (noberu, to state) and 記述 (kijutsu, description/notation).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-016','n2','kanji','超','["ちょう / 超える (exceed/super)","い / 以上 (above/or more)","かい / 過度 (excessive)","こう / 高度 (high degree)"]',0,'超 means exceed or super. Read as ちょう (chou) or こえる (koeru). Used in 超える (koeru, to exceed) and 超過 (chouka, excess).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-017','n2','kanji','略','["りゃく / 省略 (abbreviate/omit)","き / 記述 (describe)","ちょく / 直接 (direct)","ぜん / 全部 (all/everything)"]',0,'略 means abbreviate or omit. Read as りゃく (ryaku). Used in 省略 (shouryaku, omission) and 略す (ryakusu, to abbreviate).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-018','n2','kanji','優','["ゆう / 優れる (excel/gentle)","れっ / 劣る (inferior)","へい / 平均 (average)","びん / 敏感 (sensitive)"]',0,'優 means excel or be gentle. Read as ゆう (yuu) or すぐれる (sugureru). Used in 優れる (sugureru, to excel) and 優勝 (yuushou, victory/championship).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-019','n2','kanji','層','["そう / 階層 (layer/stratum)","かい / 階段 (stairs)","ち / 地面 (ground)","めん / 面積 (area)"]',0,'層 means layer or stratum. Read as そう (sou). Used in 階層 (kaisou, hierarchy/layer) and 地層 (chisou, geological stratum).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-k-020','n2','kanji','派','["は / 派手 (flashy/faction)","もん / 門派 (school/sect)","け / 系列 (affiliation)","しん / 新聞 (newspaper)"]',0,'派 means faction, style, or send. Read as は (ha). Used in 派手 (hade, flashy/showy) and 立派 (rippa, splendid/magnificent).')
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- SECTION B: N2 GRAMMAR — multiple choice (n2-g-001 to n2-g-015)
-- ============================================================

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-001','n2','grammar','雨が降っている___、彼女は試合を続けました。(Despite the rain, she continued the match.)','["にもかかわらず","にしたがって","に対して","によって"]',0,'にもかかわらず means "despite" or "in spite of." It attaches to nouns or plain verb forms. 雨が降っているにもかかわらず = despite the rain falling.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-002','n2','grammar','SNS___、多くの人に情報を発信できます。(Through SNS, you can share information with many people.)','["を通じて","に対して","によって","をもとに"]',0,'を通じて / を通して means "through" or "via." It indicates a medium or channel. SNSを通じて = through SNS / via SNS.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-003','n2','grammar','データ___、計画を立てました。(We made a plan based on the data.)','["に基づいて","に関して","にとって","によると"]',0,'に基づいて means "based on" or "grounded in." It follows a noun to indicate the foundation for an action or decision. データに基づいて = based on the data.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-004','n2','grammar','この問題___、専門家の意見が必要です。(Regarding this problem, expert opinion is needed.)','["に関して","に対して","にとって","において"]',0,'に関して means "regarding" or "concerning." It marks the topic under discussion. Similar to について but used in more formal contexts.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-005','n2','grammar','天気予報___、明日は大雪になるそうです。(According to the weather forecast, it will snow heavily tomorrow.)','["によると","によって","にしたがって","に基づいて"]',0,'によると means "according to." It introduces the source of second-hand information. Often paired with そうだ or らしい at the end of the sentence.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-006','n2','grammar','彼は謝る___、また同じ間違いをしました。(Far from apologizing, he made the same mistake again.)','["どころか","だけでなく","ばかりか","ほかに"]',0,'どころか means "far from" or "let alone." It emphasizes that reality is the opposite of, or far beyond, what was expected. 謝るどころか = far from apologizing.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-007','n2','grammar','彼女は美しい___、頭もいいです。(She is not only beautiful but also intelligent.)','["ばかりか","だけ","しか","まで"]',0,'ばかりか means "not only...but also." It adds emphasis by listing an additional quality or fact beyond what was already stated. 美しいばかりか = not only beautiful but also...')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-008','n2','grammar','努力___で、結果が変わります。(Results change depending on your effort.)','["次第","によって","に応じて","に基づいて"]',0,'次第で means "depending on." When a noun precedes 次第で, it indicates that outcomes vary based on that factor. 努力次第で = depending on your effort.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-009','n2','grammar','計画___、プロジェクトを進めます。(We will advance the project in accordance with the plan.)','["に沿って","に反して","を通じて","に対して"]',0,'に沿って means "along" or "in accordance with." It indicates following a path, plan, or set of guidelines closely. 計画に沿って = in accordance with the plan.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-010','n2','grammar','技術力___、コミュニケーション能力も必要です。(In addition to technical skills, communication ability is also needed.)','["に加えて","のほかに","だけでなく","ばかりか"]',0,'に加えて means "in addition to." It adds a further element on top of what has already been mentioned. 技術力に加えて = in addition to technical skills.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-011','n2','grammar','需要___価格が変化します。(Prices change according to demand.)','["に応じて","に関して","に対して","によると"]',0,'に応じて means "according to" or "in response to." It shows that something changes proportionally or in reaction to another factor. 需要に応じて = according to / in response to demand.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-012','n2','grammar','体調が悪くても、仕事を休む___。(Even if I''m feeling unwell, I cannot afford to take time off work.)','["わけにはいかない","はずがない","ことはない","ものではない"]',0,'わけにはいかない means "cannot afford to" or "must not." It expresses a strong social or moral constraint that prevents an action, even when one might want to take it.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-013','n2','grammar','あの映画を見て、泣か___。(I couldn''t help crying after watching that movie.)','["ずにはいられなかった","ないではいられなかった","てはいけなかった","なければならなかった"]',0,'ずにはいられない (negative verb stem + ずにはいられない) means "cannot help but." It expresses an irresistible urge or emotion. 泣かずにはいられない = cannot help but cry.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-014','n2','grammar','予想___、試験の結果は良くありませんでした。(Contrary to expectations, the exam results were not good.)','["に反して","に沿って","に基づいて","に応じて"]',0,'に反して means "contrary to" or "against." It expresses that reality went against or opposed what was expected or intended. 予想に反して = contrary to expectations.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-g-015','n2','grammar','日本語___、英語や中国語も話せます。(Starting with Japanese, I can also speak English and Chinese.)','["をはじめ","はもちろん","だけでなく","をとおして"]',0,'をはじめ means "starting with" or "including." It introduces a leading representative example from a larger group. 日本語をはじめ = starting with Japanese (and including others).')
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- SECTION B: N2 GRAMMAR — reorder (n2-g-016 to n2-g-020)
-- ============================================================

INSERT INTO questions (id, level, category, question, options, answer, type, words) VALUES
('n2-g-016','n2','grammar','Despite the heavy snow, the train arrived on time.','[]',0,'reorder','["大雪にも","かかわらず","電車は","定刻に到着しました"]')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, type, words) VALUES
('n2-g-017','n2','grammar','The plan was made based on the survey results.','[]',0,'reorder','["アンケートの結果に","基づいて","計画を","立てました"]')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, type, words) VALUES
('n2-g-018','n2','grammar','Not only did sales increase, but customer satisfaction also improved.','[]',0,'reorder','["売上が増えた","ばかりか","顧客満足度も","向上しました"]')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, type, words) VALUES
('n2-g-019','n2','grammar','I cannot afford to give up at this point.','[]',0,'reorder','["ここで","諦める","わけには","いきません"]')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, type, words) VALUES
('n2-g-020','n2','grammar','In addition to Japanese, he can speak three other languages.','[]',0,'reorder','["日本語に加えて","さらに","3つの言語が","話せます"]')
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- SECTION C: N2 VOCABULARY (n2-v-001 to n2-v-015)
-- ============================================================

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-001','n2','vocabulary','What does 懸念 (けねん) mean?','["solution","concern / worry","advantage","regulation"]',1,'懸念 (けねん, kenen) means concern or worry. Commonly used in formal and written contexts, e.g., 懸念を示す (to express concern) or 懸念が高まる (concern grows).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-002','n2','vocabulary','What does 姿勢 (しせい) mean?','["habit","method","posture / attitude","custom"]',2,'姿勢 (しせい, shisei) means posture, attitude, or stance. It refers to both physical posture and one''s mental or professional attitude, e.g., 仕事への姿勢 (attitude toward work).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-003','n2','vocabulary','What does 従来 (じゅうらい) mean?','["recent","conventional / traditional","international","advanced"]',1,'従来 (じゅうらい, juurai) means conventional, traditional, or up to now. It describes methods or conditions that have been the case until now, e.g., 従来の方法 (conventional method).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-004','n2','vocabulary','What does 動向 (どうこう) mean?','["problem","result","trend / tendency","rule"]',2,'動向 (どうこう, doukou) means trend, movement, or tendency. It often refers to the direction in which something is moving, e.g., 市場の動向 (market trends).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-005','n2','vocabulary','What does 要因 (よういん) mean?','["result","effect","factor / cause","solution"]',2,'要因 (よういん, youin) means factor or cause. It refers to a key element that contributes to a result, e.g., 成功の要因 (factors for success).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-006','n2','vocabulary','What does 課題 (かだい) mean?','["achievement","task / issue","method","schedule"]',1,'課題 (かだい, kadai) means task, issue, or assignment. It can refer to homework, a challenge to address, or a problem to solve, e.g., 社会の課題 (social issues).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-007','n2','vocabulary','What does 実態 (じったい) mean?','["hypothesis","actual state / reality","theory","possibility"]',1,'実態 (じったい, jittai) means actual state or reality. It refers to how things truly are as opposed to appearances, e.g., 実態を調査する (to investigate the actual situation).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-008','n2','vocabulary','What does 手段 (しゅだん) mean?','["purpose","result","means / method","reason"]',2,'手段 (しゅだん, shudan) means means or method. It refers to a way of achieving something, e.g., 連絡の手段 (means of contact). Often contrasted with 目的 (purpose/goal).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-009','n2','vocabulary','What does 背景 (はいけい) mean?','["foreground","background / backdrop","surface","future"]',1,'背景 (はいけい, haikei) means background or backdrop. It can refer to a physical background, historical context, or the circumstances behind an event, e.g., 事件の背景 (the background of the incident).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-010','n2','vocabulary','What does 成果 (せいか) mean?','["process","input","result / achievement","challenge"]',2,'成果 (せいか, seika) means result, achievement, or outcome. It refers to the positive fruits of effort or work, e.g., 研究の成果 (research outcomes / results of research).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-011','n2','vocabulary','What does 前提 (ぜんてい) mean?','["conclusion","example","premise / precondition","principle"]',2,'前提 (ぜんてい, zentei) means premise or precondition. It refers to a condition or assumption that must be true for something else to follow, e.g., それを前提として (on the premise of that).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-012','n2','vocabulary','What does 対策 (たいさく) mean?','["cause","countermeasure / measure","problem","research"]',1,'対策 (たいさく, taisaku) means countermeasure or measure. It refers to steps taken to deal with a problem or situation, e.g., 対策を講じる (to take countermeasures).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-013','n2','vocabulary','What does 発展 (はってん) mean?','["decline","development / growth","stability","competition"]',1,'発展 (はってん, hatten) means development or growth. It refers to progress or expansion in a positive direction, e.g., 経済の発展 (economic development).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-014','n2','vocabulary','What does 促進 (そくしん) mean?','["prevention","delay","promotion / facilitation","evaluation"]',2,'促進 (そくしん, sokushin) means promotion, acceleration, or facilitation. It refers to encouraging or speeding up a process, e.g., 経済成長を促進する (to promote economic growth).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation) VALUES
('n2-v-015','n2','vocabulary','What does 克服 (こくふく) mean?','["avoidance","submission","research","overcoming / conquest"]',3,'克服 (こくふく, kokufuku) means overcoming or conquest. It refers to successfully dealing with a difficulty or challenge, e.g., 困難を克服する (to overcome difficulties).')
ON CONFLICT (id) DO NOTHING;



-- =============================================================
-- seed_n1.sql
-- N1-level JLPT questions for kame-dojo
-- =============================================================

-- ============================================================
-- SECTION A: N1 KANJI — n1-k-001 to n1-k-020
-- ============================================================

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-001','n1','kanji','倣','["ならう / 模倣する (imitate/follow)","まなぶ / 学習する (learn)","きく / 聞く (listen)","あう / 会う (meet)"]',0,'倣 means to imitate or follow an example. Read as ならう (narau) or ほう (hou). Used in 模倣 (mohō, imitation) and 倣う (narau, to follow/emulate).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-002','n1','kanji','貢','["みつぐ / 貢献する (tribute/contribute)","もとめる / 求める (seek/demand)","はかる / 計る (measure/plan)","たてる / 立てる (stand/establish)"]',0,'貢 means tribute or contribution. Read as こう (kou) or みつぐ (mitsugu). Used in 貢献 (kōken, contribution) and 年貢 (nengu, annual tribute).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-003','n1','kanji','憶','["おく / 記憶する (remember/recollect)","おもう / 思う (think/feel)","かんがえる / 考える (consider/think)","しる / 知る (know)"]',0,'憶 means memory or recollection. Read as おく (oku). Used in 記憶 (kioku, memory) and 追憶 (tsuioku, reminiscence).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-004','n1','kanji','奮','["ふん / 奮起する (rouse/stir up)","いきどおる / 憤る (be indignant)","はげむ / 励む (endeavor)","さわぐ / 騒ぐ (make noise)"]',0,'奮 means to rouse or stir up. Read as ふん (fun). Used in 奮起 (funki, rousing oneself) and 奮闘 (funtō, striving hard).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-005','n1','kanji','懸','["けん / 懸念する (hang/be concerned)","たつ / 達する (reach/attain)","かぶる / 被る (wear/suffer)","のぞむ / 臨む (face/attend)"]',0,'懸 means to hang or to risk. Read as けん (ken) or か (ka). Used in 懸念 (kenen, concern/anxiety) and 懸命 (kenmei, with all one''s effort).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-006','n1','kanji','棄','["き / 廃棄する (abandon/discard)","もつ / 持つ (hold/have)","おさめる / 収める (put away/achieve)","あずける / 預ける (entrust)"]',0,'棄 means to abandon or discard. Read as き (ki). Used in 廃棄 (haiki, disposal) and 棄権 (kiken, abstention/forfeiture of rights).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-007','n1','kanji','遭','["そう / 遭遇する (encounter/meet with)","わたる / 渡る (cross/go over)","いく / 行く (go)","まわる / 回る (go around)"]',0,'遭 means to encounter or meet with (often something unpleasant). Read as そう (sō) or あう (au). Used in 遭遇 (sōgū, encounter) and 遭難 (sōnan, disaster/accident).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-008','n1','kanji','携','["けい / 携帯する (carry/be involved)","もつ / 持つ (hold/have)","はこぶ / 運ぶ (transport/carry)","つかう / 使う (use)"]',0,'携 means to carry or to be involved in. Read as けい (kei) or たずさえる (tazusaeru). Used in 携帯 (keitai, portable device) and 携わる (tazusawaru, to be engaged in).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-009','n1','kanji','滞','["たい / 滞在する (stagnate/stay)","ながれる / 流れる (flow)","すすむ / 進む (advance/progress)","あつまる / 集まる (gather)"]',0,'滞 means to stagnate or to stay. Read as たい (tai) or とどこおる (todokōru). Used in 滞在 (taizai, sojourn/stay) and 停滞 (teitai, stagnation).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-010','n1','kanji','縛','["ばく / 束縛する (bind/restrict)","つなぐ / 繋ぐ (connect/link)","ほどく / 解く (untie/release)","まく / 巻く (roll/wind)"]',0,'縛 means to bind or restrict. Read as ばく (baku) or しばる (shibaru). Used in 縛る (shibaru, to tie up) and 束縛 (sokubaku, restraint/restriction).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-011','n1','kanji','繁','["はん / 繁栄する (flourish/be busy)","かるい / 軽い (light/trivial)","へる / 減る (decrease/diminish)","しずかな / 静かな (quiet/calm)"]',0,'繁 means to flourish or be busy/thriving. Read as はん (han). Used in 繁栄 (han''ei, prosperity) and 繁盛 (hanjō, thriving business).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-012','n1','kanji','妨','["ぼう / 妨害する (obstruct/hinder)","たすける / 助ける (help/assist)","すすめる / 進める (promote/advance)","ゆるす / 許す (permit/forgive)"]',0,'妨 means to obstruct or hinder. Read as ぼう (bō) or さまたげる (samatageru). Used in 妨害 (bōgai, obstruction/interference) and 妨げる (samatageru, to hinder).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-013','n1','kanji','抑','["よく / 抑制する (suppress/restrain)","のばす / 伸ばす (stretch/extend)","あらわす / 表す (express/show)","まかせる / 任せる (leave to/entrust)"]',0,'抑 means to suppress or restrain. Read as よく (yoku) or おさえる (osaeru). Used in 抑制 (yokusei, suppression/control) and 抑える (osaeru, to hold down).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-014','n1','kanji','徹','["てつ / 徹底する (penetrate/be thorough)","ひかる / 光る (shine/glitter)","とおる / 通る (pass through)","みえる / 見える (be visible)"]',0,'徹 means to penetrate or be thorough. Read as てつ (tetsu). Used in 徹底 (tettei, thoroughness) and 徹夜 (tetsuya, staying up all night).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-015','n1','kanji','執','["しつ / 執着する (adhere/cling to)","すてる / 捨てる (abandon/throw away)","ゆずる / 譲る (yield/concede)","みとめる / 認める (acknowledge/admit)"]',0,'執 means to adhere to or seize. Read as しつ (shitsu) or と (to). Used in 執着 (shūchaku, attachment/obsession) and 執筆 (shippitsu, writing/authoring).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-016','n1','kanji','陥','["かん / 欠陥がある (fall into/have a defect)","のぼる / 登る (climb up)","たてる / 建てる (build/construct)","でる / 出る (exit/come out)"]',0,'陥 means to fall into or collapse. Read as かん (kan) or おちいる (ochiiru). Used in 陥る (ochiiru, to fall into) and 欠陥 (kekkan, defect/flaw).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-017','n1','kanji','緩','["かん / 緩和する (loosen/relax)","きびしい / 厳しい (strict/severe)","しめる / 締める (tighten/close)","つよい / 強い (strong/powerful)"]',0,'緩 means to loosen or relax. Read as かん (kan) or ゆるむ (yurumu). Used in 緩和 (kanwa, relaxation/easing) and 緩む (yurumu, to loosen/slacken).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-018','n1','kanji','賄','["わい / 賄賂を贈る (bribe/provide for)","かせぐ / 稼ぐ (earn/make money)","ためる / 貯める (save/accumulate)","おくる / 贈る (give/present)"]',0,'賄 means bribe or to provide for. Read as わい (wai) or まかなう (makanau). Used in 賄賂 (wairo, bribe) and 賄う (makanau, to supply/provide for).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-019','n1','kanji','峻','["しゅん / 峻厳な (steep/severe)","たかい / 高い (high/tall)","ひろい / 広い (wide/spacious)","ふかい / 深い (deep/profound)"]',0,'峻 means steep or severe/strict. Read as しゅん (shun). Used in 峻別 (shunbetsu, strict distinction) and 峻厳 (shungen, stern severity).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-k-020','n1','kanji','献','["けん / 献身する (offer/dedicate)","うける / 受ける (receive/accept)","もとめる / 求める (seek/request)","かたる / 語る (narrate/speak about)"]',0,'献 means to offer or dedicate. Read as けん (ken) or こん (kon). Used in 献身 (kenshin, devotion/self-sacrifice) and 貢献 (kōken, contribution).')
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- SECTION B: N1 GRAMMAR — n1-g-001 to n1-g-020
-- Multiple choice (n1-g-001 to n1-g-015)
-- ============================================================

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-001','n1','grammar','本日___、当店は閉店いたします。(With today, our store will close.)','["をもって","によって","として","にて"]',0,'～をもって is a formal expression meaning "by means of" or "with / as of." It is commonly used in formal announcements, e.g., 本日をもって (as of today). Compare: によって (due to/by), として (as), にて (at/by — also formal but less final).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-002','n1','grammar','実際の状況___、計画を修正しました。(We revised the plan in accordance with the actual situation.)','["に即して","に基づいて","に沿って","に応じて"]',0,'～に即して means "in accordance with" or "based on the reality of." It implies aligning actions with actual conditions. Compare: に基づいて (based on), に沿って (along/following), に応じて (in response to/depending on).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-003','n1','grammar','親の心配___、彼は危険な山に登った。(Disregarding his parents'' worries, he climbed the dangerous mountain.)','["をよそに","にかかわらず","をものともせず","をはじめ"]',0,'～をよそに means "disregarding" or "ignoring," often with a negative connotation of indifference to others'' concerns. Compare: にかかわらず (regardless of), をものともせず (undaunted by), をはじめ (starting with/including).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-004','n1','grammar','子供___、やってはいけないことがある。(Even for children, there are things they must not do.)','["といえども","であっても","にしても","としても"]',0,'～といえども is a formal/literary expression meaning "even though" or "even." It is stronger and more formal than であっても or としても, and is often found in written Japanese or formal speeches.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-005','n1','grammar','他の社員はともかく、彼___全く努力しない。(Setting other employees aside, when it comes to him, he makes no effort at all.)','["に至っては","においては","にとっては","については"]',0,'～に至っては means "when it comes to" or "going so far as." It highlights an extreme or the most notable case, often implying surprise or criticism. Compare: においては (in the context of), にとっては (for/from the perspective of), については (regarding).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-006','n1','grammar','デザイン___、機能性も優れています。(Not to mention the design, the functionality is also excellent.)','["もさることながら","はもちろん","だけでなく","ばかりか"]',0,'～もさることながら means "not to mention A, B is also notable." It acknowledges A as a given and emphasizes B as equally or more noteworthy. Compare: はもちろん (of course/naturally), だけでなく (not only), ばかりか (not only ... but also).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-007','n1','grammar','目標を達成する___、毎日努力しています。(In order to achieve my goal, I make efforts every day.)','["べく","ために","ように","として"]',0,'～べく is a formal and literary expression of purpose meaning "in order to." It attaches to the dictionary form of a verb and is equivalent to ために but more formal, e.g., 達成するべく (in order to achieve). Not used with stative verbs.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-008','n1','grammar','ご支援いただき、感謝___。(I am deeply grateful and cannot express it enough for your support.)','["にたえません","にはなりません","ではいられません","にすぎません"]',0,'～にたえない (polite: にたえません) means "cannot bear" or "deeply and endlessly moved/grateful." Used with emotional nouns such as 感謝 (gratitude) and 感動 (emotion), it expresses that one''s feeling is too profound to contain. Compare: にすぎません (nothing more than/merely).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-009','n1','grammar','この味はこの店___のものです。(This taste is unique to this restaurant.)','["ならでは","だからこそ","のみ","だけ"]',0,'～ならでは means "unique to" or "only possible with." It highlights something characteristic or exclusive to a specific person, place, or thing, e.g., この店ならでは (unique to this restaurant). Compare: だからこそ (precisely because), のみ/だけ (only).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-010','n1','grammar','彼女は主婦をする___、小説も書いています。(While being a housewife, she also writes novels.)','["かたわら","ながら","つつ","つつも"]',0,'～かたわら means "while also" or "alongside another activity." It indicates two activities happening simultaneously, typically a main occupation and a secondary one. Compare: ながら (while doing — simultaneous actions), つつ (while/as — more literary), つつも (while yet/although).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-011','n1','grammar','連休___、道路はどこも渋滞しています。(Because it is a long holiday, roads everywhere are congested.)','["とあって","なので","だから","ために"]',0,'～とあって means "because it is the special circumstance that." It indicates that given a notable situation, a natural or expected result follows. Compare: なので (because/so — casual), だから (so/therefore — casual), ために (because of/for the purpose of).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-012','n1','grammar','何が起き___、計画を変えません。(No matter what happens, I will not change the plan.)','["ようと","としても","ても","にしても"]',0,'～ようと (or ～ようが) is a strong concessive expression meaning "no matter how/what." It expresses that regardless of what occurs, the outcome remains unchanged, e.g., 何が起きようと (no matter what happens). Formed from volitional form + と/が.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-013','n1','grammar','彼の成功は努力の結果___。(His success is nothing but the result of effort.)','["にほかならない","にすぎない","にちがいない","にはならない"]',0,'～にほかならない means "is nothing but" or "is precisely." It is a strong assertion that X is definitively and exclusively Y. Compare: にすぎない (nothing more than/merely), にちがいない (must be/no doubt), にはならない (will not become).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-014','n1','grammar','東京公演___、全国ツアーが始まります。(Starting with the Tokyo performance, the national tour will begin.)','["を皮切りに","をはじめ","から始まり","を契機に"]',0,'～を皮切りに means "starting with" or "as the opening of a series." It marks the first event in a sequence of similar events, e.g., 東京公演を皮切りに (starting with the Tokyo performance). Compare: をはじめ (including/starting from — broader scope), を契機に (triggered by/taking as an opportunity).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-g-015','n1','grammar','彼女の回復を願っ___。(I sincerely and continuously wish for her recovery.)','["てやみません","ていられません","てはなりません","てはいけません"]',0,'～てやまない (polite: てやみません) means "never stop -ing" or "sincerely and continuously feel." It expresses deep, ongoing emotions or wishes, e.g., 願ってやみません (I sincerely and unceasingly wish). Compare: ていられません (cannot stand to stay/bear), てはなりません / てはいけません (must not).')
ON CONFLICT (id) DO NOTHING;

-- Reorder questions (n1-g-016 to n1-g-020)

INSERT INTO questions (id, level, category, question, options, answer, explanation, type, words)
VALUES ('n1-g-016','n1','grammar','Arrange into a correct Japanese sentence: "With the end of today, I hereby resign from this position."','[]',0,'本日をもちましてこの職を辞任いたします uses ～をもちまして (formal variant of をもって) to mark the point in time. 辞任いたします is the humble/formal form of 辞任する (to resign from a position).','reorder','["本日を","もちまして","この職を","辞任いたします"]')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation, type, words)
VALUES ('n1-g-017','n1','grammar','Arrange into a correct Japanese sentence: "Disregarding the objections of those around him, he pushed forward with the project."','[]',0,'周囲の反対をよそにプロジェクトを推し進めた uses ～をよそに (disregarding) with 周囲の反対 (the objections of those around) and 推し進める (to push forward/drive forward resolutely).','reorder','["周囲の反対を","よそに","プロジェクトを","推し進めた"]')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation, type, words)
VALUES ('n1-g-018','n1','grammar','Arrange into a correct Japanese sentence: "Not to mention its speed, this device also excels in accuracy."','[]',0,'速度もさることながらこの機器は精度も優れている uses ～もさることながら (not to mention) with 速度 (speed) as the acknowledged quality and 精度 (accuracy/precision) as the additionally emphasized one.','reorder','["速度も","さることながら","この機器は","精度も優れている"]')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation, type, words)
VALUES ('n1-g-019','n1','grammar','Arrange into a correct Japanese sentence: "This scenic view is something unique to this region."','[]',0,'この景色はこの地域ならではのものです uses ～ならでは (unique to) with この地域 (this region). ならではの modifies ものです (something/a thing) to express that the view is exclusively characteristic of this place.','reorder','["この景色は","この地域","ならではの","ものです"]')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation, type, words)
VALUES ('n1-g-020','n1','grammar','Arrange into a correct Japanese sentence: "Because it is the last performance, the venue is filled with excitement."','[]',0,'最後の公演とあって会場は興奮に包まれている uses ～とあって (because it is the special circumstance that) with 最後の公演 (last performance) and 興奮に包まれている (filled/wrapped in excitement).','reorder','["最後の公演と","あって","会場は","興奮に包まれている"]')
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- SECTION C: N1 VOCABULARY — n1-v-001 to n1-v-015
-- ============================================================

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-001','n1','vocabulary','What does 逸脱 (itsudatsu) mean?','["conformity","deviation / departure","improvement","standard"]',1,'逸脱 (itsudatsu) means deviation or departure from established norms or standards. Used in 規則から逸脱する (to deviate from the rules) and 常識を逸脱した行動 (behavior that departs from common sense).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-002','n1','vocabulary','What does 概念 (gainen) mean?','["concept / notion","example","exception","contradiction"]',0,'概念 (gainen) means concept, notion, or general idea. Used in 基本的な概念 (basic concepts) and 概念を理解する (to understand a concept). It refers to an abstract mental construct shared broadly.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-003','n1','vocabulary','What does 顕著 (kencho) mean?','["slight","gradual","remarkable / conspicuous","uncertain"]',2,'顕著 (kencho) means remarkable, conspicuous, or marked. Used in 顕著な違い (a remarkable difference) and 効果が顕著に現れる (the effect appears conspicuously). It describes something clearly and unmistakably noticeable.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-004','n1','vocabulary','What does 示唆 (shisa) mean?','["refusal","suggestion / implication","clarification","limitation"]',1,'示唆 (shisa) means suggestion, implication, or hint. Used in 問題を示唆する (to suggest/imply a problem) and 示唆に富む発言 (a remark rich in implications). It typically refers to indirect or subtle suggestion rather than a direct statement.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-005','n1','vocabulary','What does 是非 (zehi) mean?','["by chance","right and wrong / by all means","in due course","to some extent"]',1,'是非 (zehi) has two key meanings: (1) right and wrong, pros and cons — 是非を判断する (to judge right from wrong); (2) by all means, definitely — 是非参加してください (please join by all means). Context determines which meaning applies.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-006','n1','vocabulary','What does 妥当 (datou) mean?','["excessive","appropriate / reasonable","insufficient","unexpected"]',1,'妥当 (datou) means appropriate, reasonable, or valid. Used in 妥当な判断 (a reasonable judgment) and この決定は妥当だ (this decision is appropriate/sound). It implies something is fitting and well-justified given the circumstances.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-007','n1','vocabulary','What does 端緒 (tancho/tansho) mean?','["conclusion","result","beginning / starting point","obstacle"]',2,'端緒 (tancho or tansho) means beginning, starting point, or a first clue/lead. Used in 交渉の端緒を開く (to open the door to negotiations) and 事件解決の端緒 (the starting clue for solving the case). It implies the first step that opens the way to further developments.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-008','n1','vocabulary','What does 拍車 (hakusha) mean?','["obstruction","spur / acceleration","deceleration","confusion"]',1,'拍車 (hakusha) literally means a spur (as on riding boots used to urge horses). Figuratively used as 拍車をかける (to spur on/accelerate), e.g., 経済成長に拍車をかける (to spur economic growth). It implies adding impetus to something already in motion.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-009','n1','vocabulary','What does 弊害 (heigai) mean?','["benefit","harmful effect / evil","solution","reform"]',1,'弊害 (heigai) means harmful effect, evil, or negative consequence of something. Used in 過度な競争の弊害 (the harmful effects of excessive competition) and 制度の弊害を除く (to eliminate the ill effects of a system).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-010','n1','vocabulary','What does 矛盾 (mujun) mean?','["agreement","contradiction / inconsistency","cooperation","balance"]',1,'矛盾 (mujun) means contradiction or inconsistency. Used in 発言に矛盾がある (there is a contradiction in the statements) and 矛盾を指摘する (to point out a contradiction). The word originates from an ancient Chinese story about a spear (矛) and a shield (盾).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-011','n1','vocabulary','What does 裁量 (sairyou) mean?','["regulation","discretion / judgment","obligation","restriction"]',1,'裁量 (sairyou) means discretion or judgment — the authority to make decisions independently. Used in 裁量に任せる (to leave to one''s discretion) and 裁量権を持つ (to have discretionary authority).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-012','n1','vocabulary','What does 即興 (sokkyou) mean?','["preparation","practice","improvisation / impromptu","performance"]',2,'即興 (sokkyou) means improvisation or an impromptu performance. Used in 即興演奏 (improvised musical performance) and 即興でスピーチをする (to give an impromptu speech). It implies doing something spontaneously on the spot without prior preparation.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-013','n1','vocabulary','What does 由来 (yurai) mean?','["future","destination","origin / history","purpose"]',2,'由来 (yurai) means origin, history, or derivation. Used in 言葉の由来 (the origin of a word) and この祭りの由来 (the history/origin of this festival). It traces back to where or how something came to be.')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-014','n1','vocabulary','What does 醸成 (jousei) mean?','["destruction","fostering / cultivating","analysis","observation"]',1,'醸成 (jousei) means to foster, cultivate, or gradually create (an atmosphere, feeling, or situation). Used in 信頼関係を醸成する (to foster a relationship of trust) and 協力の雰囲気を醸成する (to cultivate an atmosphere of cooperation).')
ON CONFLICT (id) DO NOTHING;

INSERT INTO questions (id, level, category, question, options, answer, explanation)
VALUES ('n1-v-015','n1','vocabulary','What does 帰趨 (kisuu) mean?','["beginning","process","outcome / final result","method"]',2,'帰趨 (kisuu) means outcome, final result, or where things ultimately settle. Used in 事態の帰趨を見守る (to watch how the situation turns out) and 勝負の帰趨が決まる (the outcome of the contest is determined). It implies the ultimate direction in which things head.')
ON CONFLICT (id) DO NOTHING;
