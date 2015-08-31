class CreatePeople < ActiveRecord::Migration
  def change
    rename_column :defendants_mailing_addresses, :defendant_id, :person_id
    rename_column :attorneys_cases, :attorney_id, :person_id

    create_table :people do |t|
      t.string :type
      t.string :name
      t.string :immigration_status
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps null: false
    end

    rename_table :defendants_mailing_addresses, :people_mailing_addresses
    rename_table :attorneys_cases, :people_cases

    drop_table :defendants
    drop_table :attorneys
  end
end
