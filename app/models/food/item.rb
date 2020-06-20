class Food::Item < ApplicationRecord
  belongs_to :category, :foreign_key => :food_category_id, optional: true
  has_many :menus, :through => :category
  monetize :price_cents
end
