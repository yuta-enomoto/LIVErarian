class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :artist


  validates :nickname, :birthday, presence: true
  validates :email, presence: true,
  uniqueness: true,
  format: {
  with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
  message: "は正しく入力してください。"
  },
  on: :create

  
end
