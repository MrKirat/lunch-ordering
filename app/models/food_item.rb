class FoodItem < ApplicationRecord
  belongs_to :food_category
  monetize :price_cents
end
