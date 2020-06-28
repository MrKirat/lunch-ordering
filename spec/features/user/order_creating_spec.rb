require 'rails_helper'

feature 'Order creating' do
  context 'when user signed in' do
    given(:user) { FactoryBot.create(:user) }
    given!(:orders) { FactoryBot.create_list(:order, 3, customer: user) }

    background do
      sign_in path: new_user_session_path, email: user.email, password: user.password
      visit orders_path
    end

    scenario 'when menu is empty should fail' do
      click_link 'New Order'
      expect(page).to have_current_path(orders_path)
      expect(page).to have_content("Today's menu is not found.")
    end

    context "when menu is presented" do
      given!(:menu) { FactoryBot.create(:food_menu) }

      scenario 'when nothing was chosen should fail' do
        click_link 'New Order'
        current_order_path = page.current_path
        click_button 'Submit'
        expect(page).to have_current_path(current_order_path)
        expect(page).to have_content("Food items can't be blank")
      end

      scenario 'when was chosen one item should be successful' do
        chosen_item_name = menu.items[0].name

        click_link 'New Order'
        choose chosen_item_name
        click_button 'Submit'

        created_order_id = page.current_path.split('/').last.to_i

        expect(page).to have_content(Order.find(created_order_id).total_cost.format)
        expect(page).to have_content(chosen_item_name)
        expect(page).to have_content("Order was successfully created.")
      end
    end
  end
end