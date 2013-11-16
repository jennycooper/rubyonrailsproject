class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.string :title
      t.references :user

      t.timestamps
    end
    add_index :diaries, :user_id
  end
end
