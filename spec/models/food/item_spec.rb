require 'rails_helper'

RSpec.describe Food::Item, type: :model do
  describe 'associations' do
    it { should have_many(:menus).class_name('Food::Menu').through(:category) }
    it { should belong_to(:category).class_name('Food::Category').with_foreign_key(:food_category_id).optional }
    it { should have_many(:orders).class_name('Order').through(:order_items) }
    it { should have_many(:order_items).class_name('OrderItem').with_foreign_key(:food_item_id) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0.01).is_less_than_or_equal_to(99999999) }
  end
end
