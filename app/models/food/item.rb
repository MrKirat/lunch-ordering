class Food::Item < ApplicationRecord
  belongs_to :category, foreign_key: :food_category_id, optional: true
  has_many :menus, through: :category

  has_many :order_items, :foreign_key => :food_item_id
  has_many :orders, through: :order_items

  has_one_attached :image

  monetize :price_cents
end
