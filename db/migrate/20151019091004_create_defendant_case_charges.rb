class CreateDefendantCaseCharges < ActiveRecord::Migration
  def up
    drop_table :cases_charges
    remove_column :cases, :attorney_id

    create_table :defendant_charges do |t|
      t.integer :defendant_id
      t.integer :charge_id
      t.timestamps null: false
    end
  end

  def down
    drop_table :defendant_charges
    add_column :cases, :attorney_id, :integer

    create_table "cases_charges", force: :cascade do |t|
      t.integer  "case_id"
      t.integer  "charge_id"
      t.text     "comment"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    add_index "cases_charges", ["case_id"], name: "index_cases_charges_on_case_id", using: :btree
    add_index "cases_charges", ["charge_id"], name: "index_cases_charges_on_charge_id", using: :btree
  end
end
