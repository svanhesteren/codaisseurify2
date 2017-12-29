require 'rails_helper'

RSpec.describe Song, type: :model do


  it "Creates a new song" do
    artist = Artist.create;
    song = Song.create(artist: artist);
    expect(Song.all).to include(song);
  end

  it "cannot be made without an artist" do
    song = Song.create;
    song.valid?
    expect(song.errors).to have_key(:artist);
  end
end
