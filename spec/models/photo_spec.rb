require 'rails_helper'

RSpec.describe Photo, type: :model do

  let!(:artist1) {create :artist}
  let!(:photo1) {create :photo, artist: artist1}

  it "can create a photo" do
    expect(artist1.photo).to eq(photo1)
  end

  it "can destroy a photo from an artist" do
    expect { artist1.photo.destroy }.to change(Photo, :count).by(-1)
  end

  it "cannot be without an image" do
    photo = Photo.new()
    photo.valid?
    expect(photo.errors).to have_key(:image)
  end

end
