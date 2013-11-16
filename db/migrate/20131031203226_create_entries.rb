class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :day
      t.text :comment
      t.references :diary

      t.timestamps
    end
    add_index :entries, :diary_id
  end
end
