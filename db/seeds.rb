# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Anime.create!(anime_title:"名探偵コナン")
Anime.create!(anime_title:"ドラゴンボール")
Anime.create!(anime_title:"スラムダンク")
Anime.create!(anime_title:"ドラえもん")
Anime.create!(anime_title:"烈火の炎")
Anime.create!(anime_title:"けものフレンズ")
Anime.create!(anime_title:"宇宙よりも遠い場所")
Anime.create!(anime_title:"攻殻機動隊 STAND ALONE COMPLEX")
Anime.create!(anime_title:"この素晴らしい世界に祝福を！2")
Anime.create!(anime_title:"新世紀エヴァンゲリオン")

Label.create!(label_name:"ノーザンミュージック")
10.times do |no|
Label.create!(label_name: "レーベル#{no}")

end

Artist.create!(
    artist_name: "倉木麻衣",
    song_id: 1
)

Cd.create!(
  album:"倉木麻衣×名探偵コナン COLLABORATION BEST 21 -真実はいつも歌にある!- (通常盤)",
  anime_id: 1,
  price: 2445,
  inventory: 20,
  label_id: 1,
  genre_id: 5
)
Disc.create!(
    disc_number: 1,
    cd_id: 1
)
Disc.create!(
    disc_number: 2,
    cd_id: 1
)
Song.create!(
    disc_id: 1,
    order: 1,
    title: 'Ｓｅｃｒｅｔ　ｏｆ　ｍｙ　ｈｅａｒｔ',
    artist_id: 1
)
Song.create!(
    disc_id: 1,
    order: 2,
    title: 'Ｓｔａｒｔ　ｉｎ　ｍｙ　ｌｉｆｅ',
    artist_id: 1
)
Song.create!(
    disc_id: 1,
    order: 3,
    title: 'ａｌｗａｙｓ',
    artist_id: 1
)
Song.create!(
    disc_id: 2,
    order: 1,
    title: '渡月橋　～君　想ふ～',
    artist_id: 1
)
Song.create!(
    disc_id: 2,
    order: 1,
    title: 'ＹＥＳＴＥＲＤＡＹ　ＬＯＶＥ',
    artist_id: 1
)



10.times do |no|
# Anime.create!(anime_title:"コナン#{no}")
# Label.create!(label_name: "レーベル#{no}")

Cd.create!(
    album:"コナンコレクション#{no+1}", anime_id: 1,
    price: 1000,
    inventory: 40,
    label_id: 1,
    genre_id: 1
)
Disc.create!(
    disc_number: 1,
    cd_id: 1
)
Song.create!(
    disc_id: 3,
    order: "#{no+1}",
    title: "コナンソングス#{no+1}",
    artist_id: 2
)

# 5.times do |no|
#   Title.create(:name => "タイトル #{no}")
end

# 5.times do |no|

User.create!(
   email: "1@1",
   password: '111111',
   name: "管理者",
   namekana: "カンリシャ",
   nickname: "アドミン★魂",
   address: "東京都渋谷区管理者1-19-11 PSビル24階",
   phone: "09087654321",
   postal: "0123456"
)
Address.create!(
   address_name: "管理者",
   address_namekana: "カンリシャ",
   address_address: "東京都渋谷区管理者1-19-11 PSビル24階",
   address_phone: "09087654321",
   address_postal: "0123456",
   user_id: 1
)

User.create!(
   email: "2@2",
   password: '222222',
   name: "田中マルクス闘莉王",
   namekana: "タナカマルクストゥーリオ",
   nickname: "トゥーリオゥ",
   address: "東京都渋谷区田中2-5-9 ザ・プラウド田中2405号室",
   phone: "08012345678",
   postal: "1234567"
)
Address.create!(
   address_name: "田中マルクス闘莉王",
   address_namekana: "タナカマルクストゥーリオ",
   address_address: "東京都渋谷区田中2-5-9 ザ・プラウド田中2405号室",
   address_phone: "08012345678",
   address_postal: "1234567",
   user_id: 2
)

User.create!(
   email: "3@3",
   password: '333333',
   name: "田中マルクス闘莉王",
   namekana: "タナカマルクストゥーリオ",
   nickname: "トゥーリオゥ",
   address: "東京都渋谷区田中2-5-9 ザ・プラウド田中2405号室",
   phone: "08012345678",
   postal: "1234567"
)
Address.create!(
   address_name: "田中マルクス闘莉王",
   address_namekana: "タナカマルクストゥーリオ",
   address_address: "東京都渋谷区田中2-5-9 ザ・プラウド田中2405号室",
   address_phone: "08012345678",
   address_postal: "1234567",
   user_id: 3
)



# end





# Artist.create(artist_name:"倉木麻衣")
# Artist.create(artist_name:"愛内里菜")
# Anime.create(anime_title:"コナン")
# Anime.create(anime_title:"コナン")
# Label.create(company:"田中")
# Label.create(company:"田中")
# Genre.create(generation:"アニメ")
# Genre.create(generation:"アニメ")
# Disc.create()
# Song.create(title:"Secret of my heart", disc_id:1)
# Song.create(title:"Time after time", disc_id:2)
# Song.create(title:"恋はスリル、ショック、サスペンス", disc_id:2)


