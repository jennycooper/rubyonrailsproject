class CreateMealplans < ActiveRecord::Migration
  def change
    create_table :mealplans do |t|
      t.date :start
      t.date :end
      t.references :user

      t.timestamps
    end
    add_index :mealplans, :user_id
  end
end
