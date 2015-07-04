class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :name
      t.string :offense_type
      t.timestamps
    end
  end
end
