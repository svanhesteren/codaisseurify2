require 'rails_helper'

RSpec.describe Photo, type: :model do

  let!(:artist1) {create :artist}
  let!(:photo1) {create :photo, artist: artist1}

  it "can create a photo" do
    expect(artist1.photo).to eq(photo1)
  end


end
