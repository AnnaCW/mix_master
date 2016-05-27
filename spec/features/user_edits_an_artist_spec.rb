require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "user sees artist's updated name" do

    artist = Artist.create(name: "Miles Bavis", image_path: "https://pixabay.com/static/uploads/photo/2015/01/22/13/51/miles-davis-607733_960_720.jpg")

    visit artist_path(artist)
    click_on "Edit Artist"
    fill_in "artist_name", with: "Miles Davis"
    click_on "Update Artist"

    expect(page).to have_content "Miles Davis"
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")

  end
end


# As a user
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Edit"
# And I fill in a new name
# And I click on "Update Artist"
# Then I should see the artist's updated name
# Then I should see the existing image
