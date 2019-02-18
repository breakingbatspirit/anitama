# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cd.create(
	album:"名探偵コナン主題歌集",
	price:2097,
	inventory:10,
	anime_id:1,
	label_id:1,
	genre_id:1
	)

Anime.create(
	anime_title:"名探偵コナン"
	)

Label.create(
	label_name:"キティ"
	)

Genre.create(
	generation:1
	)

Disc.create(
	disc_number:1,
	cd_id:1
	)

Disc.create(
	disc_number:2,
	cd_id:1
	)

Song.create(
	disc_id:1,
	order:1,
	title:"胸がドキドキ"
	)
Song.create(
	disc_id:1,
	order:2,
	title:"そばにいるから"
	)
Song.create(
	disc_id:1,
	order:3,
	title:"STEP BY STEP"
	)
Song.create(
	disc_id:2,
	order:4,
	title:"HAPPY END"
	)
Song.create(
	disc_id:2,
	order:5,
	title:"Feel Your Heart(TV OPENING EDIT)"
	)
Song.create(
	disc_id:2,
	order:6,
	title:"迷宮のラバーズ"
	)

Artist.create(
	song_id:1,
	artist_name:"倉木麻衣"
	)
Artist.create(
	song_id:2,
	artist_name:"ZARD"
	)
Artist.create(
	song_id:3,
	artist_name:"倉木麻衣"
	)
Artist.create(
	song_id:4,
	artist_name:"ZARD"
	)
Artist.create(
	song_id:5,
	artist_name:"倉木麻衣"
	)
Artist.create(
	song_id:6,
	artist_name:"ZARD"
	)
