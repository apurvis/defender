class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type
      t.string :title
      t.string :hearing_type
      t.integer :case_id
      t.text :comment
      t.datetime :happened_at
      t.timestamps null: false
    end

    add_index :events, :case_id
  end
end
