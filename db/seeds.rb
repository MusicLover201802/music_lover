# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# メンバーへ：下記は削除しないでください（開発中にこれらのテストデータを復元・追加する場面が想定されるため）フカイ


# 下記Users, Adminテーブルはdeviseによって作成されているためこのような記述が必要です
# また下記と同じデータを持つレコードが存在する状態でrake db:seedを実行するとエラーになるため、
# コメントアウト化してあります（フカイ）


user = User.new(email:'01@gmail.com', password:'vvvvvv',sign_in_count:'0',last_name: 'ミュージック田', first_name: 'ラバー子', last_name_kana: 'ミュージックダ', first_name_kana: 'ラバーコ', postal_code: '0000000', prefecture: '北海道', city: '渋谷区１', building:'MYSQL摩天楼', phone_number: '11000000000', retire_flag:'false')
user.save!
user = User.new(email:'02@gmail.com', password:'vvvvvv',sign_in_count:'0',last_name: 'ミュージック崎	', first_name: 'ラバー郎', last_name_kana: 'ミュージックサキ', first_name_kana: 'ラバーロウ', postal_code: '0000000', prefecture: '北海道', city: '渋谷区２', building:'Railsビル', phone_number: '11111111112', retire_flag:'false')
user.save!
user = User.new(email:'03@gmail.com', password:'vvvvvv',sign_in_count:'0',last_name: 'ミュージック原	', first_name: 'ラバー美', last_name_kana: 'ミュージックハラ', first_name_kana: 'ラバーミ', postal_code: '0000000', prefecture: '北海道', city: '渋谷区３', building:'ruby荘', phone_number: '22334455332', retire_flag:'false')
user.save!
user = User.new(email:'04@gmail.com', password:'vvvvvv',sign_in_count:'0',last_name: 'ミュージック沼	', first_name: 'ラバー太', last_name_kana: 'ミュージックヌマ', first_name_kana: 'ラバータ', postal_code: '0000000', prefecture: '北海道', city: '渋谷区４', building:'cssコーポ', phone_number: '33667755332', retire_flag:'false')
user.save!

admin = Admin.new(email:'5@gmail.com', password:'vvvvvv',sign_in_count:'0', admin_name:'サノ')
admin.save!
admin = Admin.new(email:'6@gmail.com', password:'vvvvvv',sign_in_count:'0', admin_name:'ハタ')
admin.save!
admin = Admin.new(email:'7@gmail.com', password:'vvvvvv',sign_in_count:'0', admin_name:'ヒラバヤシ')
admin.save!
admin = Admin.new(email:'8@gmail.com', password:'vvvvvv',sign_in_count:'0', admin_name:'フカイ')
admin.save!


Genre.create(genre_name:'昭和歌謡')
Genre.create(genre_name:'Pops')
Genre.create(genre_name:'Rock')
Genre.create(genre_name:'Hiphop')


Item.create(item_name: '藤岡弘、ザ・ベスト[2枚組]', artist_name: '藤岡弘、', artist_name_kana: 'フジオカヒロシ、', genre_id: '1', price: '3000', label_name: '昭和レコード', stock: '0', release_date: '20180331', purchase_flag: 'false', admin_id: '1')
Item.create(item_name: 'モーニング娘。ザ・ベスト', artist_name: 'モーニング娘。', artist_name_kana: 'モーニングムスメ。', genre_id: '2', price: '2500', label_name: 'ハロープロジェクト', stock: '5', release_date: '20180311', purchase_flag: 'true', admin_id: '1')
Item.create(item_name: 'はっぴぃえんど[Single]', artist_name: 'はっぴぃえんど', artist_name_kana: 'ハッピィエンド', genre_id: '3', price: '2000', label_name: 'Sony', stock: '100', release_date: '20180310', purchase_flag: 'true', admin_id: '1')
Item.create(item_name: 'To Pinp A Butterfly', artist_name: 'Kendrick Lamar', artist_name_kana: 'ケンドリックラマー', genre_id: '4', price: '3000', label_name: 'AfterMath', stock: '100', release_date: '20170531', purchase_flag: 'true', admin_id: '1')
Item.create(item_name: '我時想う愛', artist_name: 'S.L.A.C.K.', artist_name_kana: 'スラック', genre_id: '4', price: '2484', label_name: '高田音楽制作事務所', stock: '100', release_date: '20110216', purchase_flag: 'true', admin_id: '1')
Item.create(item_name: 'Modern Times', artist_name: 'PUNPEE', artist_name_kana: 'パンピー', genre_id: '4', price: '2916', label_name: 'Summit', stock: '100', release_date: '20171004', purchase_flag: 'true', admin_id: '1')
Item.create(item_name: 'ECSTASY', artist_name: '一十三十一（ひとみとい）', artist_name_kana: 'ヒトミトイ', genre_id: '2', price: '2808', label_name: 'BILLBOARD RECORDS', stock: '100', release_date: '20170719', purchase_flag: 'true', admin_id: '1')
Item.create(item_name: '世界はここにしかないって上手に言って', artist_name: 'ものんくる', artist_name_kana: 'モノンクル', genre_id: '2', price: '3000', label_name: 'TABOO LABEL', stock: '100', release_date: '20170712', purchase_flag: 'true', admin_id: '1')
Item.create(item_name: 'ダンサブル＜通常盤＞', artist_name: 'RHYMESTER', artist_name_kana: 'ライムスター', genre_id: '4', price: '3240', label_name: 'STAR PLAYERS', stock: '100', release_date: '20170906', purchase_flag: 'true', admin_id: '1')
Item.create(item_name: 'すとーりーず', artist_name: 'ZAZEN BOYS', artist_name_kana: 'ザゼンボーイズ', genre_id: '2', price: '2571', label_name: 'MATSURI STUDIO', stock: '100', release_date: '201200721', purchase_flag: 'true', admin_id: '1')
Item.create(item_name: 'SOULIVE', artist_name: 'Soulive', artist_name_kana: 'ソウライブ', genre_id: '2', price: '2473', label_name: 'Blue Note Records', stock: '100', release_date: '20030424', purchase_flag: 'true', admin_id: '1')
Item.create(item_name: 'SECOND REPORT FROM IRON MOUNTAIN USA', artist_name: 'DCPRG (Date Course Pentagon Royal Garden', artist_name_kana: 'ディーシーピーアールジー（デートコースペンタゴンロイヤルガーデン）', genre_id: '2', price: '3146', label_name: 'Impulse!', stock: '100', release_date: '20030424', purchase_flag: 'true', admin_id: '1')
Item.create(item_name: 'Melodies', artist_name: '山下達郎', artist_name_kana: 'ヤマシタタツロウ', genre_id: '2', price: '2376', label_name: 'MOON', stock: '100', release_date: '20130828', purchase_flag: 'true', admin_id: '1')
Item.create(item_name: 'Magic Journey', artist_name: 'The Salsoul Orchestra', artist_name_kana: 'サルソウルオーケストラ', genre_id: '2', price: '2047', label_name: 'SALSOUN RECORDS', stock: '100', release_date: '19770101', purchase_flag: 'true', admin_id: '1')


Disc.create(disc_name: '藤岡弘、ザ・ベスト[Disc1]', disc_num: '1', item_id: '1')
Disc.create(disc_name: '藤岡弘、ザ・ベスト[Disc2]', disc_num: '2', item_id: '1')
Disc.create(disc_name: 'モーニング娘。ザ・ベスト', disc_num: '1', item_id: '2')
Disc.create(disc_name: '暗闇坂むささび変化[Single]', disc_num: '1', item_id: '3')
Disc.create(disc_name: 'To Pimp A Butterfly', disc_num: '1', item_id: '4')
Disc.create(disc_name: '我時想う愛', disc_num: '1', item_id: '5')
Disc.create(disc_name: 'Modern Times', disc_num: '1', item_id: '6')
Disc.create(disc_name: 'ECSTASY', disc_num: '1', item_id: '7')
Disc.create(disc_name: '世界はここにしかないって上手に言って', disc_num: '1', item_id: '8')
Disc.create(disc_name: 'ダンサブル＜通常盤＞(本編CD)', disc_num: '1', item_id: '9')
Disc.create(disc_name: 'すとーりーず(CD)', disc_num: '1', item_id: '10')
Disc.create(disc_name: 'SOULIVE', disc_num: '1', item_id: '11')
Disc.create(disc_name: 'SECOND REPORT FROM IRON MOUNTAIN USA', disc_num: '1', item_id: '12')
Disc.create(disc_name: 'Melodies', disc_num: '1', item_id: '13')
Disc.create(disc_name: 'Magic Journey', disc_num: '1', item_id: '14')



Track.create(disc_id: '1',track_name:'ライダーの誇り　〜近頃の奴らは車だのなんだのとしゃらくせえ〜',track_num: '1')
Track.create(disc_id: '1',track_name:'藤岡、怒りの百烈ライダーキック！！',track_num: '2')
Track.create(disc_id: '2',track_name:'コーヒー豆に向かって、ありがとう',track_num: '1')
Track.create(disc_id: '2',track_name:'美味しいコーヒーを入れたいんだ',track_num: '2')
Track.create(disc_id: '3',track_name:'ザ☆ピース',track_num: '1')
Track.create(disc_id: '3',track_name:'LOVEマシーン やぐっちゃん再婚おめでとうremix',track_num: '2')
Track.create(disc_id: '4',track_name:'風をあつめて',track_num: '1')
Track.create(disc_id: '4',track_name:'はいからはくち',track_num: '2')
Track.create(disc_id: '5',track_name:'Wesleys theory',track_num: '1')
Track.create(disc_id: '5',track_name:'For Free?(interlude)',track_num: '2')
Track.create(disc_id: '5',track_name:'King Kunta',track_num: '3')
Track.create(disc_id: '5',track_name:'Institutionalized',track_num: '4')
Track.create(disc_id: '5',track_name:'These Walls',track_num: '5')
Track.create(disc_id: '5',track_name:'u',track_num: '6')
Track.create(disc_id: '5',track_name:'Alright',track_num: '7')
Track.create(disc_id: '5',track_name:'For Sale?(interlude)',track_num: '8')
Track.create(disc_id: '5',track_name:'Momma',track_num: '9')
Track.create(disc_id: '5',track_name:'Hood Politics',track_num: '10')
Track.create(disc_id: '5',track_name:'How Much A Dollar Cost',track_num: '11')
Track.create(disc_id: '5',track_name:'Complexion(A Zulu Love)',track_num: '12')
Track.create(disc_id: '5',track_name:'The Blacker The Berry',track_num: '13')
Track.create(disc_id: '5',track_name:'You Aint Gotta Lie(Momma said)',track_num: '14')
Track.create(disc_id: '5',track_name:'i',track_num: '15')
Track.create(disc_id: '5',track_name:'Mortal Man',track_num: '16')

Track.create(disc_id: '6',track_name:'But Love',track_num: '1')
Track.create(disc_id: '6',track_name:'Noon Light feat.Gapper',track_num: '2')
Track.create(disc_id: '6',track_name:'東京23時 feat.SEEDA/KOJOE',track_num: '3')
Track.create(disc_id: '6',track_name:'いつも想う',track_num: '4')
Track.create(disc_id: '6',track_name:'Come Inside (Pro by Budamunk)',track_num: '5')
Track.create(disc_id: '6',track_name:'We Need Love feat.TAMU',track_num: '6')
Track.create(disc_id: '6',track_name:'タワ言',track_num: '7')
Track.create(disc_id: '6',track_name:'夕方の風 feat.YAHIKO',track_num: '8')
Track.create(disc_id: '6',track_name:'My Hood My Home(skit) feat.ISSUGI',track_num: '9')
Track.create(disc_id: '6',track_name:'I Can Take It(Bitchになった気分だぜ)',track_num: '10')
Track.create(disc_id: '6',track_name:'何もない日に feat.Squash Squad',track_num: '11')
Track.create(disc_id: '6',track_name:'Had Better Do',track_num: '12')

Track.create(disc_id: '7',track_name:'2057',track_num: '1')
Track.create(disc_id: '7',track_name:'Lovely Man',track_num: '2')
Track.create(disc_id: '7',track_name:'Happy Meal',track_num: '3')
Track.create(disc_id: '7',track_name:'宇宙に行く',track_num: '4')
Track.create(disc_id: '7',track_name:'Renaissance',track_num: '5')
Track.create(disc_id: '7',track_name:'Scenario(Film)',track_num: '6')
Track.create(disc_id: '7',track_name:'Interval',track_num: '7')
Track.create(disc_id: '7',track_name:'Pride',track_num: '8')
Track.create(disc_id: '7',track_name:'P.U.N.P. (Communication)',track_num: '9')
Track.create(disc_id: '7',track_name:'Stray Bullets',track_num: '10')
Track.create(disc_id: '7',track_name:'Rain (Freestyle)',track_num: '11')
Track.create(disc_id: '7',track_name:'夢のつづき',track_num: '12')
Track.create(disc_id: '7',track_name:'タイムマシーンにのって',track_num: '13')
Track.create(disc_id: '7',track_name:'Bitch Planet',track_num: '14')
Track.create(disc_id: '7',track_name:'Oldies',track_num: '15')
Track.create(disc_id: '7',track_name:'Hero',track_num: '16')

Track.create(disc_id: '8',track_name:'Ecstasy',track_num: '1')
Track.create(disc_id: '8',track_name:'Serpent Coaster',track_num: '2')
Track.create(disc_id: '8',track_name:'Flash of Light',track_num: '3')
Track.create(disc_id: '8',track_name:'Discotheque Sputnik',track_num: '4')
Track.create(disc_id: '8',track_name:'Let It Out',track_num: '5')
Track.create(disc_id: '8',track_name:'Moonlight',track_num: '6')
Track.create(disc_id: '8',track_name:'Blue, Midnight Blue',track_num: '7')
Track.create(disc_id: '8',track_name:'Galanterie',track_num: '8')
Track.create(disc_id: '8',track_name:'Swept Away',track_num: '9')
Track.create(disc_id: '8',track_name:'Varadero via L.A.',track_num: '10')

Track.create(disc_id: '9',track_name:'Driving Out Of Town',track_num: '1')
Track.create(disc_id: '9',track_name:'空想飛行',track_num: '2')
Track.create(disc_id: '9',track_name:'SUNNYSIDE',track_num: '3')
Track.create(disc_id: '9',track_name:'花火',track_num: '4')
Track.create(disc_id: '9',track_name:'Birthday Alone',track_num: '5')
Track.create(disc_id: '9',track_name:'ここにしかないって言って',track_num: '6')
Track.create(disc_id: '9',track_name:'時止まる街',track_num: '7')
Track.create(disc_id: '9',track_name:'二人',track_num: '8')
Track.create(disc_id: '9',track_name:'透明なセイウチ',track_num: '9')
Track.create(disc_id: '9',track_name:'最終列車　君を乗せて',track_num: '10')
Track.create(disc_id: '9',track_name:'the dawn will come',track_num: '11')

Track.create(disc_id: '10',track_name:'スタイル・ウォーズ',track_num: '1')
Track.create(disc_id: '10',track_name:'Future Is Born feat.Mabanua',track_num: '2')
Track.create(disc_id: '10',track_name:'Back & Forth',track_num: '3')
Track.create(disc_id: '10',track_name:'梯子酒',track_num: '4')
Track.create(disc_id: '10',track_name:'Dont Worry Be Happy',track_num: '5')
Track.create(disc_id: '10',track_name:'ゆれろ',track_num: '6')
Track.create(disc_id: '10',track_name:'爆発的 feat.サイプレス上野＆HUNGER(GAGLE)',track_num: '7')
Track.create(disc_id: '10',track_name:'Diamonds feat.KIRINJI',track_num: '8')
Track.create(disc_id: '10',track_name:'カミング・スーン',track_num: '9')
Track.create(disc_id: '10',track_name:'マイクの細道',track_num: '10')

Track.create(disc_id: '11',track_name:'サイボーグのオバケ',track_num: '1')
Track.create(disc_id: '11',track_name:'ポテトサラダ',track_num: '2')
Track.create(disc_id: '11',track_name:'はあとぶれいく',track_num: '3')
Track.create(disc_id: '11',track_name:'破裂音の朝',track_num: '4')
Track.create(disc_id: '11',track_name:'電球',track_num: '5')
Track.create(disc_id: '11',track_name:'気がつけばミッドナイト',track_num: '6')
Track.create(disc_id: '11',track_name:'暗黒屋',track_num: '7')
Track.create(disc_id: '11',track_name:'サンドペーパーざらざら',track_num: '8')
Track.create(disc_id: '11',track_name:'泥沼',track_num: '9')
Track.create(disc_id: '11',track_name:'すとーりーず',track_num: '10')
Track.create(disc_id: '11',track_name:'天狗',track_num: '11')

Track.create(disc_id: '12',track_name:'Alladin',track_num: '1')
Track.create(disc_id: '12',track_name:'El Ron',track_num: '2')
Track.create(disc_id: '12',track_name:'Solid',track_num: '3')
Track.create(disc_id: '12',track_name:'First Street',track_num: '4')
Track.create(disc_id: '12',track_name:'Shaheed',track_num: '5')
Track.create(disc_id: '12',track_name:'Dig It',track_num: '6')
Track.create(disc_id: '12',track_name:'One In Seven',track_num: '7')
Track.create(disc_id: '12',track_name:'Lenny',track_num: '8')
Track.create(disc_id: '12',track_name:'Turn It Out',track_num: '9')

Track.create(disc_id: '13',track_name:'Catch 22 feat.JAZZ DOMMUNISTERS & 兎眠りおん',track_num: '1')
Track.create(disc_id: '13',track_name:'Circle/Line',track_num: '2')
Track.create(disc_id: '13',track_name:'殺陣/TA-TE CONTACT & SOLO DANCERS',track_num: '3')
Track.create(disc_id: '13',track_name:'Microphone Tyson feat.SIMI LAB',track_num: '4')
Track.create(disc_id: '13',track_name:'Tokyo Girl',track_num: '5')
Track.create(disc_id: '13',track_name:'UNCOMMON UNREMIX feat.SIMI LAB',track_num: '6')
Track.create(disc_id: '13',track_name:'Duran feat."DOPE"(1978) by Amiri Baraka',track_num: '7')

Track.create(disc_id: '14',track_name:'悲しみのJODY(She Was Crying)',track_num: '1')
Track.create(disc_id: '14',track_name:'高気圧ガール',track_num: '2')
Track.create(disc_id: '14',track_name:'夜翔(Night-Fly)',track_num: '3')
Track.create(disc_id: '14',track_name:'GUESS IM DUMB',track_num: '4')
Track.create(disc_id: '14',track_name:'ひととき',track_num: '5')
Track.create(disc_id: '14',track_name:'メリー・ゴー・ラウンド',track_num: '6')
Track.create(disc_id: '14',track_name:'BLUE MIDNIGHT',track_num: '7')
Track.create(disc_id: '14',track_name:'あしおと',track_num: '8')
Track.create(disc_id: '14',track_name:'黙想',track_num: '9')
Track.create(disc_id: '14',track_name:'クリスマス・イブ',track_num: '10')
Track.create(disc_id: '14',track_name:'SOUNDS WITH COKE THEME("Jody" Inst. Version) (Bonus Tracks)',track_num: '11')
Track.create(disc_id: '14',track_name:'高気圧ガール(Long Version) (Bonus Tracks)',track_num: '12')
Track.create(disc_id: '14',track_name:'BLUE MIDNIGHT(1st MIX) (Bonus Tracks)',track_num: '13')
Track.create(disc_id: '14',track_name:'クリスマス・イブ(Key In D) (Bonus Tracks)',track_num: '14')
Track.create(disc_id: '14',track_name:'悲しみのJODY(Reprise) (Bonus Tracks)',track_num: '15')

Track.create(disc_id: '15',track_name:'Its A Ney Day',track_num: '1')
Track.create(disc_id: '15',track_name:'Short Shorts',track_num: '2')
Track.create(disc_id: '15',track_name:'Run Away',track_num: '3')
Track.create(disc_id: '15',track_name:'Guantanamera',track_num: '4')
Track.create(disc_id: '15',track_name:'Themes From Montreal Olympics, 1976: Farewell Song & Ballet Of The Closing Ceremony',track_num: '5')
Track.create(disc_id: '15',track_name:'Getaway',track_num: '6')
Track.create(disc_id: '15',track_name:'Magic Bird of Fire',track_num: '7')
Track.create(disc_id: '15',track_name:'Journey to Phoebus',track_num: '8')
Track.create(disc_id: '15',track_name:'Alpha Centuri',track_num: '9')
Track.create(disc_id: '15',track_name:'Magic Bird Of Fire (Original Walter Gibbons Disco Madness Album Version)',track_num: '10')
Track.create(disc_id: '15',track_name:'Magic Bird Of Fire (Original Single Version)',track_num: '11')
Track.create(disc_id: '15',track_name:'Getaway (Originarl Single Version)',track_num: '12')








































Destination.create(last_name: 'ミュージック田', first_name: 'ラバー子', last_name_kana: 'ミュージックダ', first_name_kana: 'ラバーコ', postal_code: '0000000', prefecture: '北海道', city: '別の送り先その１', building:'MYSQL摩天楼', phone_number: 'xxx-xxxx-xxxx', user_id: '1')
Destination.create(last_name: 'ミュージック崎	', first_name: 'ラバー郎', last_name_kana: 'ミュージックサキ', first_name_kana: 'ラバーロウ', postal_code: '0000000', prefecture: '北海道', city: '別の送り先その２', building:'Railsビル', phone_number: 'xxx-xxxx-xxxx', user_id: '2')
Destination.create(last_name: 'ミュージック原	', first_name: 'ラバー美', last_name_kana: 'ミュージックハラ', first_name_kana: 'ラバーミ', postal_code: '0000000', prefecture: '北海道', city: '別の送り先その３', building:'ruby荘', phone_number: 'xxx-xxxx-xxxx', user_id: '3')
Destination.create(last_name: 'ミュージック沼	', first_name: 'ラバー太', last_name_kana: 'ミュージックヌマ', first_name_kana: 'ラバータ', postal_code: '0000000', prefecture: '北海道', city: '別の送り先その４', building:'cssコーポ', phone_number: 'xxx-xxxx-xxxx', user_id: '4')

OrderItem.create(item_id:'1',quantity: '1', price:'3000', order_id:'1')
OrderItem.create(item_id:'2',quantity: '3', price:'2500', order_id:'1')
OrderItem.create(item_id:'4',quantity: '1', price:'3000', order_id:'2')


Order.create(user_id:'1',last_name: 'ミュージック田', first_name: 'ラバー子', last_name_kana: 'ミュージックダ', first_name_kana: 'ラバーコ', postal_code: '0000000', prefecture: '北海道', city: 'ML氏送り先1', building:'htmlハイツ', phone_number: 'xxx-xxxx-xxxx', payment:'銀行振込', status:'商品準備中')
Order.create(user_id:'1',last_name: 'ミュージック田', first_name: 'ラバー子', last_name_kana: 'ミュージックダ', first_name_kana: 'ラバーコ', postal_code: '0000000', prefecture: '北海道', city: 'ML氏送り先1', building:'htmlハイツ', phone_number: 'xxx-xxxx-xxxx', payment:'銀行振込', status:'商品準備中')
Order.create(user_id:'2',last_name: 'ミュージック崎', first_name: 'ラバー郎', last_name_kana: 'ミュージックサキ', first_name_kana: 'ラバーロウ', postal_code: '0000000', prefecture: '北海道', city: '渋谷区2', building:'railsビル', phone_number: 'xxx-xxxx-xxxx', payment:'クレジットカード', status:'発送済')

UserItem.create(user_id: '1', item_id: '1', quantity: '1')
UserItem.create(user_id: '1', item_id: '2', quantity: '3')
UserItem.create(user_id: '1', item_id: '3', quantity: '1')
UserItem.create(user_id: '1', item_id: '4', quantity: '1')
UserItem.create(user_id: '2', item_id: '2', quantity: '3')
UserItem.create(user_id: '2', item_id: '4', quantity: '2')
