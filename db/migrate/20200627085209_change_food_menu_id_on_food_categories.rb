class ChangeFoodMenuIdOnFoodCategories < ActiveRecord::Migration[5.2]
  def change
    change_column_null :food_categories, :food_menu_id, true
  end
end
