class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :shipping
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :title, :price, :description, :user, :category, :state, :shipping, :area, :day, :image, presence: true
  validates :category_id, :state_id, :shipping_id, :day_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than: 10000000 }
  with_options format: {with: /\A[0-9]+\z/} do
    validates :price
  end
end
