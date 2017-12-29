require "rails_helper"

describe "Shows a list of songs" do
  let!(:artist) {create :artist}
  let!(:song1) {create :song, artist: artist}
  let!(:song2) {create :song, artist: artist}
  let!(:song3) {create :song, artist: artist}

  it "Shows all the song names in general" do
    visit songs_url
    expect(page).to have_text(song1.name)
    expect(page).to have_text(song2.name)
    expect(page).to have_text(song3.name)
  end

end
