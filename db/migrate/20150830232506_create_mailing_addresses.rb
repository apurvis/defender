class CreateMailingAddresses < ActiveRecord::Migration
  def change
    create_table :mailing_addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state, limit: 2
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
