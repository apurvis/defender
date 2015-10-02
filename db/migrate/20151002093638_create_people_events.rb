class CreatePeopleEvents < ActiveRecord::Migration
  def change
    create_table :people_events do |t|
      t.integer :person_id
      t.integer :event_id
      t.text :comment
      t.timestamps null: false
    end

    add_index :people_events, :person_id
    add_index :people_events, :event_id
  end
end
