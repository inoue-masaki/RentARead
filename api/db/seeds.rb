# User.create(name: "お試しユーザー",email: "example@gmail.com",password:"password")
# Book.create(title: "応仁の乱",publisher: "中央公論新社",author:"呉座 勇一",kind:"新書・文庫・ノベルス",desc:"説明",lender:"1",image:File.open("./public/images/John.jpg"))
# Book.create(title: "応仁の乱",publisher: "中央公論新社",author:"呉座 勇一",kind:"新書・文庫・ノベルス",desc:"説明",lender:"1",image:File.open("./public/images/John.jpg"))

books = [ {title: "collaboration―アート/建築/デザインのコラボレーションの場",author:"川向正人",publisher:"彰国社",kind:"アート・建築・デザイン",lender:"1",borrower:"2",desc:"「今いちばん関心のある空間を、ほかの表現者と一緒につくってください」という依頼のもとに実現した、建築家とコラボレーター7組による挑戦的な協働、そして現在の展開を対話によってひもとく。その後の建築の核心は、このコラボレーションの中にすべてある。和英併記。",image:File.open("./public/images/1.PNG")},
          {title: "こどもホスピスの奇跡",author:"石井 光太",publisher:"新潮文庫",kind:"ノンフィクション",desc:"子どもたちが残り少ない人生を「深く生きる」ための場所。
            新潮ドキュメント賞受賞作",image:File.open("./public/images/2.PNG"),lender:"1",favarite:true},
          {title: "プラットフォーム革命",author:"アレックス・モザド",publisher:"英治出版",kind:"ビジネス・経済",desc:"最強ビジネスモデルのすべてを解き明かす
            Facebook、アリババ、Airbnb・・・
            人をつなぎ、取引を仲介し、市場を創り出す
            プラットフォーム企業はなぜ爆発的に成長するのか。
            あらゆる業界に広がる新たな経済原理を解明し、
            成功への指針と次なる機会の探し方、
            デジタルエコノミーの未来を提示する。",image:File.open("./public/images/3.PNG")},
          {title: "JTBのカレンダー 美しき富士山 2022",author:"-",publisher:"ジェイティビィパブリッシング",kind:"カレンダー・手帳",lender:"1",desc:"表紙:冬に赤く染まる「紅富士」
            1月:富士のご来光
            2月:輝く本栖湖と富士
            3月:富士と満開の桜と忠霊塔
            4月:美しく広がるネモフィラと富士
            5月:青々としげる茶畑と富士
            6月:三窪高原より朝焼けの富士
            7月:天の川と富士
            8月:元気いっぱいなひまわりと富士
            9月:夕焼けと富士
            10月:ゆらりゆれるススキと富士
            11月:丸々としたかわいらしいコキアと富士
            12月:雪化粧で真っ白く染まる富士",image:File.open("./public/images/4.PNG")},
          {title: "かえるじゃん",author:"つるた あき",publisher:"KADOKAWA",kind:"絵本・児童書",desc:"すべて実在するカエルたちが登場。カエル好きはもちろん、カエルに興味がなくてもこの絵本を読めば、楽しくおどろいて何度も見返してしまうはずっ！",image:File.open("./public/images/5.PNG"),favarite:true},
          {title: "鬼滅の刃 1",author:"吾峠呼世晴",publisher:"集英社",kind:"コミック",desc:"時は大正時代。炭を売る心優しき少年・炭治郎の日常は、家族を鬼に皆殺しにされたことで一変する。唯一生き残ったものの、鬼に変貌した妹・禰豆子を元に戻すため、また家族を殺した鬼を討つため、炭治郎と禰豆子は旅立つ!!　血風剣戟冒険譚、開幕!!",image:File.open("./public/images/6.PNG")},
          {title: "2022年度 首都圏私立中学高校受験ガイド THE私立",author:"-",publisher:"東京学参株式会社",kind:"教育・学参・受験",desc:"スクール研Q所
            注目の学校を大クローズアップ
            受験に役立つデータ集",image:File.open("./public/images/7.PNG")},
          {title: "英語学習2.0",author:"岡田 祥吾",publisher:"角川書店",kind:"英語学習",desc:"マッキンゼーのコンサルタントとしてキャリアをスタートさせながら、英語ができず、数々のプロジェクトで悔しい思いをしてきた著者が、ある日思いつき、自身がクライアントにさんざん説いてきた「問題解決アプローチ」を英語学習に適用。するとそれが劇的な効果を生んだ！",image:File.open("./public/images/8.PNG")},
          {title: "ディズニーランド 世界最強のエンターテインメントが生まれるまで",author:"リチャード スノー",publisher:"ハーパーコリンズ・ジャパン",kind:"エンターテイメント",desc:"世界を変えたいなら、目の前の常識を覆せ――
          世間からの批判、嘲笑、度重なる挫折に底をつく資金。
          それでも諦めなかった者の熱狂ドラマがここにある!


          今こそ読みたい壮大ノンフィクション。
          夢の国をつくったのは、リアルで泥臭い、
          人間の挑戦のストーリーだった――",image:File.open("./public/images/9.PNG")},
        {title: "モンスターハンターライズ:サンブレイク 公式ガイドブック",author:"ファミ通書籍編集部",publisher:"KADOKAWA",kind:"ゲーム攻略本",desc:"モンハンライズ:サンブレイク』の情報が満載の攻略本

          『モンスターハンターライズ:サンブレイク』の攻略本。王域三公を始めとする数々のモンスターや、傀異クエストの進行で生産できる武器など、果てなきやり込みに欠かせない情報が満載の一冊です。",image:File.open("./public/images/10.PNG")},
        {title: "ビジュアルでわかる　江戸・東京の地理と歴史",author:"鈴木 理生",publisher:"日本実業出版社",kind:"歴史・地理",desc:"ロングセラーをカラーでリニューアル
          2006年に発売されたロングセラー『スーパービジュアル版　江戸・東京の地理と地名』をカラーにしてリニューアル!　よりコンパクトになって読みやすくなりました。",image:File.open("./public/images/11.PNG")},
        {title: "モーターサイクリストクラシック)No.8",author:"MC CLASSIC編集部",publisher:"八重洲出版",kind:"趣味・実用",desc:"MC CLASSIC
          モーターサイクリストクラシック
          No.8 2018 DECEMBER
          CONTENTS
          トピック 井上ボーリングの工場見学イベント",image:File.open("./public/images/12.PNG")},
        {title: "千夜千冊エディション 源氏と漱石",author:"松岡 正剛",publisher:"KADOKAWA",kind:"人文・思想",borrower:"1",desc:"「源氏」と「漱石」を結んで浮かび上がる、日本の近代化と伝統

          平安の『源氏物語』から明治の近代化を経て『夜明け前』に至るまで、日本文学はどのような伝統を引き継ぎ、いかに近代化してきたか。「源氏」という構想の妙を紐解き、古典と近代を繋ぐ、新しい日本文芸史。
          「源氏」と「漱石」をつないでみたいと思ってきた。「もののあはれ」と「可哀想だた惚れたってことよ」である。途中には右京大夫、西行、後鳥羽院、連歌、芭蕉、西鶴、井月たちがいて、主人公をあからさまにしないスタイルを試みてきた。しかし「漱石」以降、近代文学は主人公を用意して、その「創(きず)」を描くことにした。何かの「夜明け前」だったのか。",image:File.open("./public/images/13.PNG")},
        {title: "決算書×ビジネスモデル大全―会社の数字から儲かる仕組みまでいっきにわかる",author:"矢部 謙介",publisher:"東洋経済新報社",kind:"投資・金融・会社経営",desc:"「決算書×ビジネスモデル」の視点で、「無機質な数字」が「刺激的なドラマ」に変わる。
            堅苦しくて難しそう、という「会計本」のイメージを塗り替える１冊。",image:File.open("./public/images/14.PNG")},
        {title: "プロを目指す人のためのRuby入門",author:"伊藤 淳一",publisher:"技術評論社",kind:"コンピュータ・IT",desc:"プログラミング経験者のためのRuby入門書です。
         Rubyの特徴(他プログラミング言語との違い)、テスト駆動開発やデバッグのやり方など、開発現場で必要な知識を解説します。
         「Rubyがいかに自由で強力な言語か」「Rubyプログラミングはなぜ楽しいのか」がわかります。",image:File.open("./public/images/15.PNG")},
         {title: "発音記号キャラ辞典 ",author:" リチャード川口",publisher:"KADOKAWA",kind:"語学・辞典・年鑑",borrower:"2",desc:"全ての発音記号をまとめてキャラ化!!各キャラのストーリーマンガを読むだけで、綺麗な発音が身につく!",image:File.open("./public/images/16.PNG")},
         {title: "ママの心が楽になる子育て心理戦",author:"新井慎一",publisher:"イースト・プレス",kind:"暮らし・健康・子育て",desc:"共働き&5人のパパである著者が教える悩めるママのための「子育て心理戦」。単純じゃないからこそ子育ては面白い!子どもと親の心理をひもとき、自尊心を育てればママの悩みは解決する。子育てバイブルの決定版!!",image:File.open("./public/images/17.PNG")},
         {title: "キノの旅III the Beautiful World",author:"時雨沢 恵一",publisher:"KADOKAWA",kind:"ライトノベル",desc:"人間キノと言葉を話す二輪車エルメスの旅の話。短編連作の形で綴られる、大人気新感覚ノベル第３弾!!",image:File.open("./public/images/18.PNG")},
         {title: "批評の教室",author:"北村 紗衣",publisher:"筑摩書房",kind:"文学・評論",desc:"批評はなによりも、作品を楽しむためにあります。本書では、批評を「精読する」「分析する」「書く」の３つのステップに分けて、そのやり方を解説していきます。チョウのように軽いフットワークで作品を理解し、ハチのように鋭い視点で読み解く方法を身につけましょう。必要なのは、センスではなく調査力と注意深さ。そしていくつかのコツを飲み込めば、誰でも楽しく批評ができます。作品をより深く理解し、たくさんの人とシェアするための、批評の教室へようこそ。",image:File.open("./public/images/19.PNG")}
        ]
        # {title: "",author:"",publisher:"",kind:"雑誌",desc:"",image:File.open("./public/images/.PNG")},
        # {title: "",author:"",publisher:"",kind:"医学・薬学・看護学・歯科学",desc:"",image:File.open("./public/images/.PNG")},
        # {title: "",author:"",publisher:"",kind:"ノンフィクション",desc:"",image:File.open("./public/images/.PNG")},
        # {title: "",author:"",publisher:"",kind:"新書・文庫・ノベルズ",desc:"",image:File.open("./public/images/.PNG")},
        # {title: "",author:"",publisher:"",kind:"社会・政治・法律",desc:"",image:File.open("./public/images/.PNG")},
        # {title: "",author:"",publisher:"",kind:"楽譜・スコア・音楽書",desc:"",image:File.open("./public/images/.PNG")},
        # {title: "",author:"",publisher:"",kind:"古本",desc:"",image:File.open("./public/images/.PNG")},
        # {title: "",author:"",publisher:"",kind:"科学・テクノロジー",desc:"",image:File.open("./public/images/.PNG")},
        # {title: "",author:"",publisher:"",kind:"スポーツ・アウトドア",desc:"",image:File.open("./public/images/.PNG")},
        # {title: "",author:"",publisher:"",kind:"タレント写真集",desc:"",image:File.open("./public/images/.PNG")},
        # {title: "",author:"",publisher:"",kind:"旅行ガイド・マップ",desc:"",image:File.open("./public/images/.PNG")},
        # {title: "",author:"",publisher:"",kind:"資格・検定・就職",desc:"",image:File.open("./public/images/.PNG")},
        # {title: "",author:"",publisher:"",kind:"古書・稀少本",desc:"",image:File.open("./public/images/.PNG")},
        # {title: "",author:"",publisher:"",kind:"ポスター",desc:"",image:File.open("./public/images/.PNG")},

books.each do |book|
  Book.create(book)
end

users = [
  {name: "お試しユーザー",email: "example@gmail.com",password:"password"},
	{name: "まもる",email: "exampleA@gmail.com",password:"password"},
	{name: "鈴木",email: "exampleB@gmail.com",password:"password"},
	{name: "B太",email: "exampleC@gmail.com",password:"password"},
	{name: "よーすけ",email: "exampleD@gmail.com",password:"password"},
	{name: "カズ",email: "exampleE@gmail.com",password:"password"},
	{name: "kenta",email: "exampleF@gmail.com",password:"password"},
	{name: "mats",email: "exampleG@gmail.com",password:"password"},
	{name: "ヤマダハナコ",email: "exampleH@gmail.com",password:"password"},
	{name: "カズ",email: "exampleI@gmail.com",password:"password"},
	{name: "kenta",email: "exampleJ@gmail.com",password:"password"},
	{name: "mats",email: "exampleK@gmail.com",password:"password"},
	{name: "よかよか",email: "exampleL@gmail.com",password:"password"},
	{name: "鈴木哲平",email: "exampleM@gmail.com",password:"password"},
	{name: "シュウ",email: "exampleN@gmail.com",password:"password"},
	{name: "コマロ",email: "exampleO@gmail.com",password:"password"},
	{name: "メジロさん",email: "exampleP@gmail.com",password:"password"},
	{name: "Mike Deravine",email: "exampleQ@gmail.com",password:"password"},
	{name: "James",email:"exampleR@gmail.com",password:"password"},
	{name: "古田",email: "exampleS@gmail.com",password:"password"},
	{name: "洋平",email: "exampleT@gmail.com",password:"password"},
	{name: "ぷっちょ",email: "exampleU@gmail.com",password:"password"},
	]

users.each do |user|
  User.create(user)
end

reviews = [

	{book_id:1, title:"きちんとまとめられている", star:5, user_id:3,  desc:"非常にコンパクトでわかりやすい"},
	{book_id:1, title:"上級者向け", star:2, user_id:5,  desc:"基礎ができていないせいか余り参考にならなかった"},

	{book_id:2, title:"命について考えさせられた", star:5, user_id:7,  desc:"Twitterで色んな意見が出ていたので読みましたがとても感銘をうけました"},
	{book_id:2, title:"深い", star:4, user_id:1,  desc:"人間模様、貧困、少年犯罪と複雑な話だった。"},

	{book_id:3, title:"おすすめ", star:4, user_id:8,  desc:"何をどう工夫するとよくなるかの補足説明もある。
文字通り「パッと見」でよくわかる。良書。"},
	{book_id:3, title:"比較がいい", star:5, user_id:9,  desc:"分かり易い!残念な例と見やすい例を対比させて、よく分かりました。毎日の仕事にすぐ応用したいです。"},
	{book_id:3, title:"幅広い層におすすめ", star:4, user_id:10,  desc:"マーケティングの勉強。
なかなかいい本だと思う。
こういう本は経営者だけでなく、エンジニアも読むといいのになと思う。"},

	{book_id: 4, title:"富士山好きにおすすめ", star:5, user_id:8,  desc:"富士山が大好きな母親におくりました。
色々な季節の富士山が見えると喜んでいます。"},
	{book_id:4, title:"今年もやっぱりこれ", star:4, user_id:9,  desc:"お気に入り。もう一回り大きいと最高。"},
	{book_id:4, title:"きれい", star:5, user_id:1,  desc:"富士山が見たくて探しました。
景色がとても綺麗でした"},

	{book_id:5, title:"おすすめ", star:4, user_id:7,  desc:"2歳の子どものお気に入りになりました"},
	{book_id:5, title:"買ってよかった", star:5, user_id:13,  desc:"娘も気にいってくれて、毎日持ってきます。最後はびっくり&大笑い！！"},

	{book_id:6, title:"面白い", star:4, user_id:14,  desc:"到着しましたが、全く問題なく、非常に満足しております。配送の方をはじめ皆様いろいろとありがとうございました。"},
]

reviews.each do |review|
  Review.create(review)
end