class CreateOffices < ActiveRecord::Migration
  def up
    create_table :offices do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :offices
  end
end
