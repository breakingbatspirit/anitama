# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do |no|
Anime.create!(anime_title:"コナン#{no}")
Label.create!(label_name: "レーベル#{no}")
Genre.create!(generation: "ジャンル#{no}")

Cd.create!(album:"コナンコレクション#{no}", anime_id: 1,
    price: 1000,
    inventory: 40,
	label_id: 1,
    genre_id: 1,
)

# 5.times do |no|
#   Title.create(:name => "タイトル #{no}")
# end


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
end





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


