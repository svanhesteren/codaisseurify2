require 'rails_helper'
  RSpec.describe Artist, type: :model do

    it "creates an artist" do
      artist = Artist.create
      expect(Artist.all).to include(artist);
    end

    it "is allowed to have no songs" do
      artist = Artist.create
      expect(artist.songs.length).to eq(0);
    end

end

describe "Artist Relations" do
  let!(:artist1) {create :artist}
  let!(:artist2) {create :artist}
  let!(:song1) {create :song, artist: artist1}
  let!(:song2) {create :song, artist: artist1}
  let!(:song3) {create :song, artist: artist2}
  let!(:song4) {create :song, artist: artist2}

  it "Artist.songs shows the songs belonging to him" do
    expect(artist1.songs).to include(song2, song1)
  end

  it "Artist cannot have other songs that do not belong to him" do
    expect(artist1.songs).to_not include(song3, song4)
  end
end
