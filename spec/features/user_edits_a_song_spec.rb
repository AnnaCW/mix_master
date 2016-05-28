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
  expect(page).to have_link artist_path(artist)

  end
end

# As a user
# Given that a song exists in the database
# When I visit that song's show page
# And I click on "Edit"
# And I fill in a new title
# And I click on "Update Song"
# Then I should see the song's updated name
# Then I should see a link to the song artist's individual page
