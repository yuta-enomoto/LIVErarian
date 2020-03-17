class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :artist
  belongs_to_active_hash :form
  belongs_to_active_hash :how_long

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  validates :date_time, :how_long_id, :form_id, :venue, :station, presence: true
  
end
