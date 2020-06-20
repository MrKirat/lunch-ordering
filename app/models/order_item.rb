class OrderItem < ApplicationRecord
  belongs_to :order, foreign_key: :order_id
  belongs_to :food_item, :class_name => 'Food::Item', foreign_key: :food_item_id
end
