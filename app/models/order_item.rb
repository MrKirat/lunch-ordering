class OrderItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :food_item, class_name: 'Food::Item', optional: true
end
