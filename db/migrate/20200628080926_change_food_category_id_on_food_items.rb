class ChangeFoodCategoryIdOnFoodItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :food_items, :food_category_id, true
  end
end
