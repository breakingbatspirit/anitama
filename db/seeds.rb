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

10.times do |no|
Label.create!(label_name: "レーベル#{no}")

end



10.times do |no|
# Anime.create!(anime_title:"コナン#{no}")
# Label.create!(label_name: "レーベル#{no}")

Cd.create!(album:"コナンコレクション#{no}", anime_id: 1,
    price: 1000,
    inventory: 40,
    label_id: 1,
    genre_id: 1,
)

# 5.times do |no|
#   Title.create(:name => "タイトル #{no}")
end

# 5.times do |no|

User.create!(
   email: "#{no}@test.com",
   password: '123456',
   name: " テスト太郎#{no}",
   namekana: "aaaa",
   nickname: "djeie",
   address: "deijeff",
   phone: "080763223",
   postal: "神奈川県"
)
Address.create!(
   address_name: " テスト太郎#{no}",
   address_namekana: "Taroooo#{no}",
   address_address: "deijeff#{no}",
   address_phone: "080763223",
   address_postal: "神奈川県"
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


