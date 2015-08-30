class CreateAttorneysCases < ActiveRecord::Migration
  def change
    create_table :attorneys_cases do |t|
      t.integer :attorney_id
      t.integer :case_id
      t.timestamps null: false
    end

    add_index :attorneys_cases, :attorney_id
    add_index :attorneys_cases, :case_id
  end
end
