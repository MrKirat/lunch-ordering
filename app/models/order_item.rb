class OrderItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :food_item, class_name: 'Food::Item', optional: true

  validates_presence_of :food_item
  validates_presence_of :order
end
