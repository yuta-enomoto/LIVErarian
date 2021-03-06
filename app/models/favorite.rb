class Favorite < ApplicationRecord

  belongs_to :artist, counter_cache: :fav_count
  belongs_to :user
  validates_uniqueness_of :artist_id, scope: :user_id

end
