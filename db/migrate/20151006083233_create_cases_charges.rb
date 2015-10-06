class CreateCasesCharges < ActiveRecord::Migration
  def change
    create_table :cases_charges do |t|
      t.integer :case_id
      t.integer :charge_id
      t.text :comment
      t.timestamps null: false
    end

    add_index :cases_charges, :case_id
    add_index :cases_charges, :charge_id
  end
end
