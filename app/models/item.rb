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

  validates :title, :price, :description, :user, :category, :state, :shipping, :area, :days, presence: true
  validates :category_id, :state_id, :shipping_id, :area_id, :days_id, numericality: { other_than: 1 }
end
