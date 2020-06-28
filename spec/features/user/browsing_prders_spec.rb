require 'rails_helper'

feature 'Browsing orders' do
  context 'when user signed in' do
    given(:user) { FactoryBot.create(:user) }
    given!(:orders) { FactoryBot.create_list(:order, 3, customer: user) }

    background do
      sign_in path: new_user_session_path, email: user.email, password: user.password
      visit orders_path
    end

    scenario 'index should contain all orders' do
      expect(User.count).to eq(1)
      expect(page).to have_current_path(orders_path)
      orders.each do |order|
        expect(page).to have_content(order.created_at)
      end
    end

    scenario 'should open each order' do
      expect(User.count).to eq(1)
      expect(Order.count).to eq(3)
      page.all('table tbody tr td a').map { |order_link| order_link[:href] }.each do |order_href|
        visit order_href

        order_id = order_href.split('/').last.to_i
        order = orders.find { |order| order.id == order_id }

        order.food_items.each do |item|
          expect(page).to have_content(item.name)
          expect(page).to have_content(item.price)
        end
        expect(page).to have_content(order.total_cost.format)
      end
    end
  end
end