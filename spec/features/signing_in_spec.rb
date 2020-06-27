require 'rails_helper'

feature 'Signing in' do
  {:user => :new_user_session_path, :admin => :new_admin_session_path}.each do |visitor_type, sign_in_path|
    context visitor_type do
      let(:visitor) { FactoryBot.create(visitor_type) }
      let(:invalid_password) { "#{visitor.password}_wrong" }
      let(:invalid_email) { "#{visitor.email}_wrong" }

      scenario 'with valid email and password' do
        sign_in path: send(sign_in_path),
                email: visitor.email,
                password: visitor.password

        expect(page).to have_content('Sign out')
      end

      scenario 'with valid email and invalid password' do
        sign_in path: send(sign_in_path),
                email: visitor.email,
                password: invalid_password

        expect(page).to have_content('Invalid Email or password.')
        expect(page).to have_content('Sign in')
      end

      scenario 'with valid password and invalid email' do
        sign_in path: send(sign_in_path),
                email: invalid_email,
                password: visitor.password

        expect(page).to have_content('Invalid Email or password.')
        expect(page).to have_content('Sign in')
      end
    end
  end
end