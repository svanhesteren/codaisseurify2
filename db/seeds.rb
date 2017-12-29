# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Song.destroy_all
Artist.destroy_all
User.destroy_all

mainUser = User.create!(email:"test@test.com", password:"123456");

user =  User.create!(email:Faker::Internet.email,
                    password:Faker::Internet.password);

artist = Artist.create!(
  name: Faker::Lovecraft.deity,
  picture: "",
  birthday: Faker::Date.birthday(18, 4000),
  fav_food: Faker::Food.dish
);

10.times do
  Song.create!(
    name: Faker::TwinPeaks.quote,
    album: Faker::RickAndMorty.location,
    length: Time.at(Random.rand(1000..3600)),#.utc.strftime("%H:%M:%S"),
    rating: Random.rand(1..5),
    artist: artist
  );

end
