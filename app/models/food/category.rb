class Food::Category < ApplicationRecord
  has_many :items, :foreign_key => :food_category_id
  belongs_to :menu, :foreign_key => :food_menu_id, optional: true

  accepts_nested_attributes_for :items, allow_destroy: true, reject_if: :all_blank
end
