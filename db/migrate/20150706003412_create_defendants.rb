class CreateDefendants < ActiveRecord::Migration
  def change
    create_table :defendants do |t|
      t.string :name
      t.string :immigration_status
      t.timestamps
    end
  end
end
