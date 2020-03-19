class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  geocoded_by :station
  after_validation :geocode

  belongs_to :user
  belongs_to :artist
  belongs_to_active_hash :form
  belongs_to_active_hash :how_long

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  validates :date_time, :how_long_id, :form_id, :venue, :station, presence: true
  # validate :date_before_start


  # def date_before_start
  #   errors.add(:date_time, "は現在時刻以降のものを選択してください。") if
  #   date_time < Time.now
  # end

end
