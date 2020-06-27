module CapybaraHelper
  def sign_in(path:, email:, password:)
    visit path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end

  def sign_up(path:, name:, email:, password:)
    visit path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end
end

RSpec.configure do |config|
  config.include CapybaraHelper, type: :feature
end