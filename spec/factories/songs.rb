FactoryBot.define do
  factory :song do
    name Faker::TwinPeaks.quote
    album Faker::RickAndMorty.location
    duration Time.at(Random.rand(1000..3600))#.utc.strftime("%H:%M:%S")
    rating Random.rand(1..5)
    artist {build :artist}
  end
end
