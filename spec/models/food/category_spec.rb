require 'rails_helper'

RSpec.describe Food::Category, type: :model do
  describe 'associations' do
    it { should have_many(:items).class_name('Food::Item').with_foreign_key(:food_category_id) }
    it { should belong_to(:menu).class_name('Food::Menu').with_foreign_key(:food_menu_id).optional }
    it { should accept_nested_attributes_for(:items) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:items) }
  end
end
