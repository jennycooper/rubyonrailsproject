class AddColumnsToMealplantable < ActiveRecord::Migration
  def up
    add_column :meals, :breakfast, :string
    add_column :meals, :lunch, :string
    add_column :meals, :dinner, :string
    remove_column :meals, :mealtype
    remove_column :meals, :recipe
  end
  def down
    remove_column :meals, :breakfast, :string
    remove_column :meals, :lunch, :string
    remove_column :meals, :dinner, :string
    add_column :meals, :mealtype
    add_column :meals,:recipe
  end
end
