require 'rails_helper'
  RSpec.describe Artist, type: :model do

    let!(:artist) {create :artist}

    it "creates an artist" do
      expect(Artist.all).to include(artist);
    end

    it "is allowed to have no songs" do
      expect(artist.songs.length).to eq(0);
    end

    it "can destroy an artist" do
      expect {artist.destroy}.to change(Artist, :count).by(-1)
    end

    it "cannot be without a name" do
      artist = Artist.new()
      artist.valid?
      expect(artist.errors).to have_key(:name)
    end
end

describe "Artist Relations" do
  let!(:artist1) {create :artist}
  let!(:artist2) {create :artist}
  let!(:song1) {create :song, artist: artist1}
  let!(:song2) {create :song, artist: artist1}
  let!(:song3) {create :song, artist: artist2}
  let!(:song4) {create :song, artist: artist2}
  let!(:photo1) {create :photo, artist: artist1}

  it "Artist.songs shows the songs belonging to him" do
    expect(artist1.songs).to include(song2, song1)
  end

  it "Artist cannot have other songs that do not belong to him" do
    expect(artist1.songs).to_not include(song3, song4)
  end

  it "When artist is destroyed, all songs from him are also detroyed" do

    expect {artist1.destroy}.to change(Song, :count).by(-2)
    expect(Song.all).to_not include(song1, song2)
  end

  it "when artist is destroyed, the photo is also destroyed" do
    expect {artist1.destroy}.to change(Photo, :count).by(-1)
    expect(Photo.all).to_not include(photo1)
  end

end
