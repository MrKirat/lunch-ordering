require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).scoped_to(:provider).ignoring_case_sensitivity }
    it { should allow_value("test@test.test").for(:email) }
    it { should_not allow_value("invalid_email").for(:email) }
  end
end
