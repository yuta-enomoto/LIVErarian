class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :artist
  belongs_to_active_hash :form
  belongs_to_active_hash :how_long

  validates :date_time, :how_long_id, :form_id, :station, presence: true
  
end
