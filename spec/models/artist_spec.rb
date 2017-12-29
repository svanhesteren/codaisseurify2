require 'rails_helper'
  RSpec.describe Artist, type: :model do

    # let(:artist) {create :artist}

    it "creates an artist" do
      artist = Artist.create
      expect(Artist.all).to include(artist);
    end

    it "can have no songs" do
      artist = Artist.create
      expect(artist.songs.length).to eq(0);
    end
end
