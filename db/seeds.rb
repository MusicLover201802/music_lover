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

user = User.new(email:'1@gmail.com', password:'vvvvvv',sign_in_count:'0',last_name: 'ミュージック田', first_name: 'ラバー子', last_name_kana: 'ミュージックダ', first_name_kana: 'ラバーコ', postal_code: '0000000', prefecture: '01', city: '渋谷区１', building:'MYSQL摩天楼', phone_number: 'xxx-xxxx-xxxx', retire_flag:'false')
user.save!
user = User.new(email:'2@gmail.com', password:'vvvvvv',sign_in_count:'0',last_name: 'ミュージック崎	', first_name: 'ラバー郎', last_name_kana: 'ミュージックサキ', first_name_kana: 'ラバーロウ', postal_code: '0000000', prefecture: '01', city: '渋谷区２', building:'Railsビル', phone_number: 'xxx-xxxx-xxxx', retire_flag:'false')
user.save!
user = User.new(email:'3@gmail.com', password:'vvvvvv',sign_in_count:'0',last_name: 'ミュージック原	', first_name: 'ラバー美', last_name_kana: 'ミュージックハラ', first_name_kana: 'ラバーミ', postal_code: '0000000', prefecture: '01', city: '渋谷区３', building:'ruby荘', phone_number: 'xxx-xxxx-xxxx', retire_flag:'false')
user.save!
user = User.new(email:'4@gmail.com', password:'vvvvvv',sign_in_count:'0',last_name: 'ミュージック沼	', first_name: 'ラバー太', last_name_kana: 'ミュージックヌマ', first_name_kana: 'ラバータ', postal_code: '0000000', prefecture: '01', city: '渋谷区４', building:'cssコーポ', phone_number: 'xxx-xxxx-xxxx', retire_flag:'false')
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

Item.create(item_name: '藤岡弘、ザ・ベスト[2枚組]', artist_name: '藤岡弘、', artist_name_kana: 'フジオカヒロシ、', genre_id: '1', price: '3000', label_name: '昭和レコード', stock: '100', release_date: '20180331', purchase_flag: 'false', admin_id: '1')
Item.create(item_name: 'モーニング娘。ザ・ベスト', artist_name: 'モーニング娘。', artist_name_kana: 'モーニングムスメ。', genre_id: '2', price: '2500', label_name: 'ハロープロジェクト', stock: '100', release_date: '20180311', purchase_flag: 'true', admin_id: '1')
Item.create(item_name: 'はっぴぃえんど[Single]', artist_name: 'はっぴぃえんど', artist_name_kana: 'ハッピィエンド', genre_id: '3', price: '2000', label_name: 'Sony', stock: '100', release_date: '20180310', purchase_flag: 'true', admin_id: '1')
Item.create(item_name: 'To Pinp A Butterfly', artist_name: 'Kendrick Lamar', artist_name_kana: 'ケンドリックラマー', genre_id: '4', price: '3000', label_name: 'AfterMath', stock: '100', release_date: '20170531', purchase_flag: 'true', admin_id: '1')

Disc.create(disc_name: '藤岡弘、ザ・ベスト[Disc1]', disc_num: '1', item_id: '1')
Disc.create(disc_name: '藤岡弘、ザ・ベスト[Disc2]', disc_num: '2', item_id: '1')
Disc.create(disc_name: 'モーニング娘。ザ・ベスト', disc_num: '1', item_id: '2')
Disc.create(disc_name: '暗闇坂むささび変化[Single]', disc_num: '1', item_id: '3')
Disc.create(disc_name: 'To Pimp A Butterfly', disc_num: '1', item_id: '4')

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

<<<<<<< HEAD
Destination.create(last_name: 'ミュージック田', first_name: 'ラバー子', last_name_kana: 'ミュージックダ', first_name_kana: 'ラバーコ', postal_code: '0000000', prefecture: '北海道', city: '別の送り先その１', building:'MYSQL摩天楼', phone_number: 'xxx-xxxx-xxxx', user_id: '1')
Destination.create(last_name: 'ミュージック崎	', first_name: 'ラバー郎', last_name_kana: 'ミュージックサキ', first_name_kana: 'ラバーロウ', postal_code: '0000000', prefecture: '北海道', city: '別の送り先その２', building:'Railsビル', phone_number: 'xxx-xxxx-xxxx', user_id: '2')
Destination.create(last_name: 'ミュージック原	', first_name: 'ラバー美', last_name_kana: 'ミュージックハラ', first_name_kana: 'ラバーミ', postal_code: '0000000', prefecture: '北海道', city: '別の送り先その３', building:'ruby荘', phone_number: 'xxx-xxxx-xxxx', user_id: '3')
Destination.create(last_name: 'ミュージック沼	', first_name: 'ラバー太', last_name_kana: 'ミュージックヌマ', first_name_kana: 'ラバータ', postal_code: '0000000', prefecture: '北海道', city: '別の送り先その４', building:'cssコーポ', phone_number: 'xxx-xxxx-xxxx', user_id: '4')
=======
Destination.create(last_name: 'ミュージック田', first_name: 'ラバー子', last_name_kana: 'ミュージックダ', first_name_kana: 'ラバーコ', postal_code: '0000000', prefecture: '01', city: '別の送り先その１', building:'MYSQL摩天楼', phone_number: 'xxx-xxxx-xxxx', user_id: '1')
Destination.create(last_name: 'ミュージック崎	', first_name: 'ラバー郎', last_name_kana: 'ミュージックサキ', first_name_kana: 'ラバーロウ', postal_code: '0000000', prefecture: '01', city: '別の送り先その２', building:'Railsビル', phone_number: 'xxx-xxxx-xxxx', user_id: '2')
Destination.create(last_name: 'ミュージック原	', first_name: 'ラバー美', last_name_kana: 'ミュージックハラ', first_name_kana: 'ラバーミ', postal_code: '0000000', prefecture: '01', city: '別の送り先その３', building:'ruby荘', phone_number: 'xxx-xxxx-xxxx', user_id: '3')
Destination.create(last_name: 'ミュージック沼	', first_name: 'ラバー太', last_name_kana: 'ミュージックヌマ', first_name_kana: 'ラバータ', postal_code: '0000000', prefecture: '01', city: '別の送り先その４', building:'cssコーポ', phone_number: 'xxx-xxxx-xxxx', user_id: '4')
>>>>>>> f028c53b62550b814cd31e08bb5359120b2f7b2c

OrderItem.create(item_id:'1',quantity: '1', price:'3000', order_id:'1')
OrderItem.create(item_id:'2',quantity: '3', price:'2500', order_id:'1')
OrderItem.create(item_id:'4',quantity: '1', price:'3000', order_id:'2')

<<<<<<< HEAD
Order.create(user_id:'1',last_name: 'ミュージック田', first_name: 'ラバー子', last_name_kana: 'ミュージックダ', first_name_kana: 'ラバーコ', postal_code: '0000000', prefecture: '北海道', city: 'ML氏送り先1', building:'htmlハイツ', phone_number: 'xxx-xxxx-xxxx', payment:'銀行振込', status:'商品準備中')
Order.create(user_id:'1',last_name: 'ミュージック田', first_name: 'ラバー子', last_name_kana: 'ミュージックダ', first_name_kana: 'ラバーコ', postal_code: '0000000', prefecture: '北海道', city: 'ML氏送り先1', building:'htmlハイツ', phone_number: 'xxx-xxxx-xxxx', payment:'銀行振込', status:'商品準備中')
Order.create(user_id:'2',last_name: 'ミュージック崎', first_name: 'ラバー郎', last_name_kana: 'ミュージックサキ', first_name_kana: 'ラバーロウ', postal_code: '0000000', prefecture: '北海道', city: '渋谷区2', building:'railsビル', phone_number: 'xxx-xxxx-xxxx', payment:'クレジットカード', status:'発送済')
=======
Order.create(user_id:'1',last_name: 'ミュージック田', first_name: 'ラバー子', last_name_kana: 'ミュージックダ', first_name_kana: 'ラバーコ', postal_code: '0000000', prefecture: '01', city: 'ML氏送り先1', building:'htmlハイツ', phone_number: 'xxx-xxxx-xxxx', payment:'銀行振込', status:'商品準備中')
Order.create(user_id:'1',last_name: 'ミュージック田', first_name: 'ラバー子', last_name_kana: 'ミュージックダ', first_name_kana: 'ラバーコ', postal_code: '0000000', prefecture: '01', city: 'ML氏送り先1', building:'htmlハイツ', phone_number: 'xxx-xxxx-xxxx', payment:'銀行振込', status:'商品準備中')
Order.create(user_id:'2',last_name: 'ミュージック崎', first_name: 'ラバー郎', last_name_kana: 'ミュージックサキ', first_name_kana: 'ラバーロウ', postal_code: '0000000', prefecture: '01', city: '渋谷区2', building:'railsビル', phone_number: 'xxx-xxxx-xxxx', payment:'クレジットカード', status:'発送済')
>>>>>>> f028c53b62550b814cd31e08bb5359120b2f7b2c

UserItem.create(user_id: '1', item_id: '1', quantity: '1')
UserItem.create(user_id: '1', item_id: '2', quantity: '3')
UserItem.create(user_id: '1', item_id: '3', quantity: '1')
UserItem.create(user_id: '1', item_id: '4', quantity: '1')
<<<<<<< HEAD
UserItem.create(user_id: '2', item_id: '2', quantity: '3')
UserItem.create(user_id: '2', item_id: '4', quantity: '2')
=======
UserItem.create(user_id: '2', item_id: '2', quantity: '3')
>>>>>>> f028c53b62550b814cd31e08bb5359120b2f7b2c
