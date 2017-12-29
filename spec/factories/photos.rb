FactoryBot.define do
  factory :photo do
    artist {build :artist}
    image remote_image_url("http://res.cloudinary.com/duplhjlsw/image/upload/v1513276776/uuimkavta7dqzn3njh5f.jpg")
  end
end
