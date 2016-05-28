require 'rails_helper'

RSpec.feature "User submits a new song" do
  scenario "user sees song name and link to artist page" do

  artist = create(:artist)
  song_title = "It's A Beautiful Day"

  visit artist_path(artist)
  click_on "New Song"
  fill_in "song_title", with: song_title
  click_on "Create Song"

  expect(page).to have_content song_title
  expect(page).to have_link artist.name, href: artist_path(artist)
  end

  context "the submitted data is invalid" do
    scenario "user sees an error message" do
    artist = create(:artist)

    visit artist_path(artist)
    click_on "New Song"
    click_on "Create Song"

    expect(page).to have_content "Title can't be blank"
    end
  end


end
