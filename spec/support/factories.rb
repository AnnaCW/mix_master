FactoryGirl.define do
  # factory :song do
  #   title "No Woman, No Cry"
  #   artist
  # end

  factory :artist do
    name "Bob Marley"
    image_path "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
  end

  # factory :artist_with_songs do
  #   transient do
  #     songs_count 5
  #   end
  # end
  #
  # after(:create) do |artist, evaluator|
  #   create_list(:song, evaluator.songs_count, artist: artist)
  # end
  #

end
