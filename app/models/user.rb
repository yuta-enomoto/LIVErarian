class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :artist
  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :fav_artists, through: :likes, source: :artist
  has_many :like_posts, through: :likes, source: :post


  validates :nickname, :birthday, presence: true
  validates :email, presence: true,
  uniqueness: true,
  format: {
  with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
  message: "は正しく入力してください。"
  },
  on: :create

  validates :password, presence: true,
  length: { minimum: 8 },
  format: {
    with: /\A(?=.*?[a-z])(?=.*?\d)[a-zA-Z\d]+\z/,
    message: "は英字と数字の両方を含めて下さい。"
  },
  on: :create

  
end
