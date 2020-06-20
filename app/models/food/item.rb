class Food::Item < ApplicationRecord
  belongs_to :category, foreign_key: :food_category_id, optional: true
  has_many :menus, through: :category

  has_many :order_items
  has_many :orders, through: :order_items

  monetize :price_cents
end
