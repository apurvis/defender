class CreateDefendantsCases < ActiveRecord::Migration
  def change
    create_table :defendants_cases do |t|
      t.integer :defendant_id
      t.integer :case_id
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :defendants_cases, :defendant_id
    add_index :defendants_cases, :case_id
  end
end
