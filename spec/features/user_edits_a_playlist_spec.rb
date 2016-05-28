require 'rails_helper'

RSpec.feature "User edits a playlist" do
  scenario "user sees updated name" do
    playlist = create(:playlist)
    song_one, song_two, song_three = create_list(:song, 3)

    visit playlist_path(playlist)
    click_on "Edit"
    fill_in "playlist_name", with: "New Name"
    uncheck("song-#{song_one.id}")
    check("song-#{song_three.id}")
    click_on "Update Playlist"

    expect(page).to have_content "New Name"
    expect(page).to have_content song_three.title
    expect(page).to have_no_content playlist.name

  end
end

# As a user
# Given that a playlist and songs exist in the database
# When I visit that playlist's show page
# And I click on "Edit"
# And I enter a new playlist name
# And I select an additional song
# And I uncheck an existing song
# And I click on "Update Playlist"
# Then I should see the playlist's updated name
# And I should see the name of the newly added song
# And I should not see the name of the removed song
