require 'rails_helper'

feature 'Browsing menus' do
  context 'when user signed in' do
    given(:user) { FactoryBot.create(:user) }
    given!(:menus_per_week) do
      (0...7).reverse_each.map do |number|
        travel_to number.days.ago do
          FactoryBot.create(:food_menu, categories_count: 3, items_per_category: 3)
        end
      end
    end

    background do
      sign_in path: new_user_session_path, email: user.email, password: user.password
    end

    scenario 'dashboard should have calendar' do
      expect(User.count).to eq(1)
      expect(page).to have_current_path(dashboard_path)
      expect(page).to have_css('.simple-calendar table')
    end

    scenario 'calendar should contain 7 menus' do
      expect(User.count).to eq(1)
      expect(Food::Menu.count).to eq(7)
      within '.simple-calendar table' do
        expect(page).to have_css('tr a', :count => 7)
      end
    end

    scenario 'should open each menu' do
      expect(User.count).to eq(1)
      expect(Food::Menu.count).to eq(7)
      page.all('.simple-calendar table tr a').map { |menu_link| menu_link[:href] }.each do |menu_href|
        visit menu_href

        menu_id = menu_href.split('/').last.to_i
        menu = menus_per_week.find{ |menu| menu.id == menu_id }

        menu.categories.each do |category|
          expect(page).to have_content(category.name)
          category.items.each do |item|
            expect(page).to have_content(item.name)
          end
        end
      end
    end
  end
end