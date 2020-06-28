require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { should belong_to(:customer).class_name('User').with_foreign_key(:user_id) }
    it { should have_many(:order_items).class_name('OrderItem') }
    it { should have_many(:food_items).class_name('Food::Item').through(:order_items) }
  end

  describe 'validations' do
    it { should validate_presence_of(:customer) }
    it { should validate_presence_of(:food_items) }
  end
end
