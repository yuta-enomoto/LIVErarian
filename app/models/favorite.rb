class Favorite < ApplicationRecord

  belongs_to :artist, counter_cache: :fav_count
  belongs_to :user

end
