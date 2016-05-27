require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "artists exist in the database" do

    artists = %w("Miles Davis", "Louis Armstrong").map do |artist_name|
      Artist.create(name: artist_name, image_path: "https://pixabay.com/en/piano-instrument-music-keys-notes-1396970/")
    end

    visit artists_path

    artists.each do |artist|
      within(".artists_listing li") do
        expect(page).to have_link artist.name, href: artist_path(artist)
      end
    end

   end
end


# As a user
# Given that artists exist in the database
# When I visit the artists index
# Then I should see each artist's name
# And each name should link to that artist's individual page
