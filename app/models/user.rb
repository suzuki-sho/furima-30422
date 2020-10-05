class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  
  validates :password, confirmation: true
  has_many :prototypes
  has_many :comments
end