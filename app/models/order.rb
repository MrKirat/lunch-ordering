class Order < ApplicationRecord
  include DateSearchable

  belongs_to :customer, class_name: 'User', foreign_key: :user_id

  has_many :order_items
  has_many :food_items, through: :order_items

  validates_presence_of :customer, :food_items

  def total_cost
    self.food_items.reduce(Money.new(0)) { |sum, item| sum + item.price }
  end
end
