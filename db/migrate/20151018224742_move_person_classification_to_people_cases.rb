class MovePersonClassificationToPeopleCases < ActiveRecord::Migration
  def up
    drop_table :defendants_cases

    add_column :people_cases, :type, :string
    remove_column :people, :type
    remove_column :people_cases, :role

    remove_column :cases, :initial_top_charge_id, :integer
    remove_column :cases, :current_top_charge_id, :integer
    remove_column :cases, :disposition_top_charge_id, :integer
  end

  def down
    add_column :cases, :initial_top_charge_id, :integer
    add_column :cases, :current_top_charge_id, :integer
    add_column :cases, :disposition_top_charge_id, :integer

    add_column :people_cases, :role, :string
    add_column :people, :type, :string
    remove_column :people_cases, :type, :string

    create_table "defendants_cases", force: :cascade do |t|
      t.integer  "defendant_id"
      t.integer  "case_id"
      t.datetime "deleted_at"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "defendants_cases", ["case_id"], name: "index_defendants_cases_on_case_id", using: :btree
    add_index "defendants_cases", ["defendant_id"], name: "index_defendants_cases_on_defendant_id", using: :btree
  end
end
