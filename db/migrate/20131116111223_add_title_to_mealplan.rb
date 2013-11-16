class AddTitleToMealplan < ActiveRecord::Migration
  def up
    add_column :mealplans, :title, :string
  end

  def down
    remove_column :mealplans, :title, :string
  end
end
