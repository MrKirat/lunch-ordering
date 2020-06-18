class Food::Menu < ApplicationRecord
  has_many :categories, :foreign_key => :food_menu_id
  has_many :items, :through => :categories
end
