class Artist < ApplicationRecord
  belongs_to :user

  validates :name, :active_place, :introduction, :image, presence: true

  mount_uploader :image, ImageUploader
end
