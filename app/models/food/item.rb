class Food::Item < ApplicationRecord
  MIN_PRICE = 0.01
  MAX_PRICE = 99999999

  belongs_to :category, foreign_key: :food_category_id, optional: true
  has_many :menus, through: :category

  has_many :order_items, :foreign_key => :food_item_id
  has_many :orders, through: :order_items

  has_one_attached :image
  validates_presence_of :name

  monetize :price_cents, allow_nil: false, numericality: {
    greater_than_or_equal_to: MIN_PRICE,
    less_than_or_equal_to: MAX_PRICE
  }
end
