class Order < ApplicationRecord
  include DateSearchable

  belongs_to :customer, class_name: 'User', foreign_key: :user_id

  has_many :order_items
  has_many :food_items, through: :order_items

  validates_length_of :food_items, minimum: 1, message: 'should contain at least 1 record'
  validates_presence_of :customer

  def total_cost
    self.food_items.reduce(Money.new(0)) { |sum, item| sum + item.price }
  end
end
