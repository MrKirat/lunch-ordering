class AddFoodMenusToFoodCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :food_categories, :food_menu, foreign_key: true, null: false
  end
end
