require 'rails_helper'

RSpec.feature "User views all songs" do
  scenario "user sees all songs" do
    song_one, song_two, song_three = create_list(:song, 3)

    visit songs_path

    expect(page).to have_link song_one.title, href: song_path(song_one)

    expect(page).to have_link song_three.title, href: song_path(song_three)

  end
end
