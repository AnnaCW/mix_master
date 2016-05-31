require 'rails_helper'

RSpec.feature "User Edits a Song" do
  scenario "user sees song's updated name and link to artist page" do

  artist = create(:artist)
  song = artist.songs.new(title: "It's A Beautiful Day")
  song.save

  visit song_path(song)

  click_on "Edit"
  fill_in "song_title", with: "New Day for this Song"
  click_on "Update Song"

  expect(page).to have_content "New Day for this Song"
  expect(page).to have_link artist.name, href: artist_path(artist)

  end
end
