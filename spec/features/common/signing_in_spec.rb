require 'rails_helper'

feature 'Signing in' do
  VISITORS_OPTIONS = [
    {type: :user, sign_in_path: :new_user_session_path, factory_bot_params: [:user]},
    {type: :admin, sign_in_path: :new_admin_session_path, factory_bot_params: [:admin, :with_ui_role]}
  ]

  VISITORS_OPTIONS.each do |visitor_options|
    context visitor_options[:type] do
      given(:visitor) { FactoryBot.create(*visitor_options[:factory_bot_params]) }
      given(:invalid_password) { "#{visitor.password}_wrong" }
      given(:invalid_email) { "#{visitor.email}_wrong" }

      scenario 'with valid email and password' do
        sign_in path: send(visitor_options[:sign_in_path]),
                email: visitor.email,
                password: visitor.password

        expect(page).to have_content('Sign out')
      end

      scenario 'with valid email and invalid password' do
        sign_in path: send(visitor_options[:sign_in_path]),
                email: visitor.email,
                password: invalid_password

        expect(page).to have_content('Invalid Email or password.')
        expect(page).to have_content('Sign in')
      end

      scenario 'with valid password and invalid email' do
        sign_in path: send(visitor_options[:sign_in_path]),
                email: invalid_email,
                password: visitor.password

        expect(page).to have_content('Invalid Email or password.')
        expect(page).to have_content('Sign in')
      end
    end
  end
end