class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  
  validates :password, confirmation: true
  has_many :items
  has_many :purchases
end