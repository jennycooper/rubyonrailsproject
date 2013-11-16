class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.date :day
      t.string :mealtype
      t.string :recipe
      t.references :mealplan

      t.timestamps
    end
    add_index :meals, :mealplan_id
  end
end
