require "rails_helper"

describe "Viewing the list of artists" do
  let!(:artist1) {create :artist}
  let!(:artist2) {create :artist}

  it "Shows a list of artist names" do
    visit artists_url
    expect(page).to have_text(artist1.name)
    expect(page).to have_text(artist2.name)
  end
end
