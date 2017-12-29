FactoryBot.define do
  factory :artist do
    name Faker::Lovecraft.deity
    picture "MyString"
    birthday Faker::Date.birthday(18, 80)
    fav_food Faker::Food.dish
  end
end
