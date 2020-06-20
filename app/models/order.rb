class Order < ApplicationRecord
  belongs_to :customer, class_name: 'User', foreign_key: :user_id

  has_many :order_items
  has_many :food_items, :class_name => 'Food::Item', through: :order_items
end
