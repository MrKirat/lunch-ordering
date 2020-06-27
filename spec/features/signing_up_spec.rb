require 'rails_helper'

feature 'Signing up' do
  context 'user' do
    context 'with valid email and password' do
      scenario 'should be successful' do
        sign_up_user

        expect(page).to have_current_path(dashboard_path)
        expect(page).to have_content('Sign out')
      end

      scenario 'should create admin profile' do
        expect(User.count).to eq(0)
        expect(Admin.count).to eq(0)

        expect { sign_up_user }.to change { Admin.count }.by(1)

        expect(User.count).to eq(1)
      end

      scenario 'should create one admin profile only first time' do
        expect(User.count).to eq(0)
        expect(Admin.count).to eq(0)

        expect { sign_up_user }.to change { Admin.count }.by(1)
        click_link 'Sign out'
        expect { sign_up_user }.to change { Admin.count }.by(0)

        expect(Admin.count).to eq(1)
        expect(User.count).to eq(2)
      end
    end

    {email: {email: 'invalid_email'}, password: {password: '123'}}.each do |field, invalid_attribute|
      context "with invalid #{field}" do

        scenario 'should fail' do
          sign_up_user invalid_attribute

          expect(page).to have_current_path(root_path)
          expect(page).to have_content('Sign in')
        end

        scenario 'should not create admin profile' do
          expect(User.count).to eq(0)
          expect(Admin.count).to eq(0)

          expect { sign_up_user invalid_attribute }.to change { Admin.count }.by(0)

          expect(User.count).to eq(0)
        end
      end
    end

    def sign_up_user(additional_attr = {})
      sign_up path: new_user_registration_path, **FactoryBot.attributes_for(:user).merge(additional_attr)
    end
  end
end