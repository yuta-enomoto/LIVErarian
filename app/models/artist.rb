class Artist < ApplicationRecord
  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :fav_users, through: :likes, source: :user
  belongs_to :user

  validates :active_place, :image, presence: true
  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true, length: { maximum: 200 }
  mount_uploader :image, ImageUploader

  def fav_user(user_id, artist_id)
    Like.find_by(user_id: user_id, artist_id: artist_id)
  end

end
