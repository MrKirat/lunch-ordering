class Food::Category < ApplicationRecord
  has_many :items, :foreign_key => :food_category_id
  belongs_to :menu, :foreign_key => :food_menu_id, optional: true

  accepts_nested_attributes_for :items, reject_if: :all_blank

  validates_presence_of :name
  validates_length_of :items, minimum: 1, message: 'should contain at least 1 record'
end
