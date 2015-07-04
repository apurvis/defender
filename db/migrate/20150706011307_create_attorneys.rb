class CreateAttorneys < ActiveRecord::Migration
  def change
    create_table :attorneys do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
