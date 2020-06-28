require 'rails_helper'

RSpec.describe Food::Menu, type: :model do
  describe 'associations' do
    it { should have_many(:items).class_name('Food::Item').through(:categories) }
    it { should have_many(:categories).class_name('Food::Category').with_foreign_key(:food_menu_id).dependent(:nullify) }
    it { should accept_nested_attributes_for(:categories) }
  end

  describe 'validations' do
    it { should validate_presence_of(:categories) }
  end
end
