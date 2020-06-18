class CreateFoodMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :food_menus do |t|

      t.timestamps
    end
  end
end
