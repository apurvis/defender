class CreateDefendantsMailingAddresses < ActiveRecord::Migration
  def change
    create_table :defendants_mailing_addresses do |t|
      t.integer :defendant_id
      t.integer :mailing_address_id
      t.datetime :last_verified
      t.timestamps null: false
    end
  end
end
