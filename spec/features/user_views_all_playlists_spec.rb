require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "user sees each playlist name linked to playlist page" do

    playlists = create_list(:playlist_with_songs, 2)

    visit playlists_path
  
    playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlist_path(playlist)
    end

  end
end

# As a user
# Given that playlists exist in the database
# When I visit the playlists index
# Then I should see each playlist's name
# And each name should link to that playlist's individual page
