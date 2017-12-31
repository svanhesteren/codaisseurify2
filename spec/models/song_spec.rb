require 'rails_helper'

RSpec.describe Song, type: :model do

  let!(:artist) {create:artist}
  let!(:song1) {create :song, artist: artist}
  let!(:song2) {create :song, artist: artist}
  let!(:song3) {create :song, artist: artist}
  let!(:song4) {create :song, artist: artist}

  it "Creates a new song" do
    expect(Song.all).to include(song1)
  end

  it "cannot be made without an artist" do
    song = Song.create;
    song.valid?
    expect(song.errors).to have_key(:artist);
  end

  it "can destroy a song from an artist" do
    expect { artist.songs.first.destroy }.to change(Song, :count).by(-1)
  end

  it "can destroy all songs from an artists" do
    expect {artist.songs.destroy_all}.to change(Song, :count).by(-4)
  end

  it "cannot be without a name" do
    song = Song.new()
    song.valid?
    expect(song.errors).to have_key(:name)
  end
end
