require 'rails_helper'

feature "Homepage" do
  scenario "should have welcome text" do
    visit "/"
    expect(page).to have_content("Welcome to lunch ordering app!")
  end

  scenario "should have sign in button" do
    visit "/"
    expect(page).to have_link("Sign in")
  end

  scenario "should have sign up button" do
    visit "/"
    expect(page).to have_link("Sign up")
  end
end