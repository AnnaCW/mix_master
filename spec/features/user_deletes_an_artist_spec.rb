require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "user sees artist index without deleted name" do

    artists = %w("Miles Davis", "Louis Armstrong", "Etta James").map do |artist_name|
      Artist.create(name: artist_name, image_path: "https://pixabay.com/en/piano-instrument-music-keys-notes-1396970/")
    end

    visit artist_path(artists.first)
    click_on "Delete Artist"

    expect(page).to have_no_content "Miles Davis"
    expect(page).to have_content "Louis Armstrong"

  end
end

# As a user
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Delete"
# Then I should be back on the artist index page
# Then I should not see the artist's name
