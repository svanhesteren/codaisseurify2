# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
NYAR = "http://res.cloudinary.com/duplhjlsw/image/upload/v1514580558/Nyarlathotep_the_Crawling_Chaos_faa3nm.jpg"
YOG = "http://res.cloudinary.com/duplhjlsw/image/upload/v1514580558/yog-sothoth_xrphjo.jpg"
CTHUL = "http://res.cloudinary.com/duplhjlsw/image/upload/v1514580557/Cthulhu_ocxtzm.jpg"
AZA = "http://res.cloudinary.com/duplhjlsw/image/upload/v1514580557/azathoth_by_atomicgenjin-db1m0d4_ixcqw8.jpg"
TSAT = "http://res.cloudinary.com/duplhjlsw/image/upload/v1514652943/Tsathoggua_yjn3hb.jpg"

def getLovecraftPic(name)
  return NYAR if name.include?("Nyarlathotep")
  return AZA if name.include?("Azathoth")
  return YOG if name.include?("Yog-Sothoth")
  return CTHUL if name.include?("Cthulhu")
  return TSAT if name.include?("Tsathoggua")
  return "http://res.cloudinary.com/duplhjlsw/image/upload/v1513276776/uuimkavta7dqzn3njh5f.jpg"
end


Photo.destroy_all
Song.destroy_all
Artist.destroy_all
User.destroy_all

# mainUser = User.create!(email:"test@test.com", password:"123456");
#
# user =  User.create!(email:Faker::Internet.email,
#                     password:Faker::Internet.password);

artists = []

4.times do
  artists << Artist.create!(
  name: Faker::Lovecraft.deity,
  birthday: Faker::Date.birthday(18, 4000),
  fav_food: Faker::Food.dish
  )
end

for artist in artists
  templatePhoto = Photo.create!(artist: artist, remote_image_url: getLovecraftPic(artist.name))
end




5.times do
  Song.create!(
    name: Faker::TwinPeaks.quote,
    album: Faker::RickAndMorty.location,
    duration: Time.at(Random.rand(1000..3600)),#.utc.strftime("%H:%M:%S"),
    rating: Random.rand(1..5),
    artist: artists[0]
  );
end

5.times do
  Song.create!(
    name: Faker::TwinPeaks.quote,
    album: Faker::RickAndMorty.location,
    duration: Time.at(Random.rand(1000..3600)),#.utc.strftime("%H:%M:%S"),
    rating: Random.rand(1..5),
    artist: artists[1]
  );
end

5.times do
  Song.create!(
    name: Faker::TwinPeaks.quote,
    album: Faker::RickAndMorty.location,
    duration: Time.at(Random.rand(1000..3600)),#.utc.strftime("%H:%M:%S"),
    rating: Random.rand(1..5),
    artist: artists[2]
  );
end

5.times do
  Song.create!(
    name: Faker::TwinPeaks.quote,
    album: Faker::RickAndMorty.location,
    duration: Time.at(Random.rand(1000..3600)),#.utc.strftime("%H:%M:%S"),
    rating: Random.rand(1..5),
    artist: artists[3]
  );
end
