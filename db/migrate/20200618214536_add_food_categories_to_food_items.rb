class AddFoodCategoriesToFoodItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :food_items, :food_category, foreign_key: true, null: false
  end
end
