class CreateOffices < ActiveRecord::Migration
  def up
    create_table :offices do |t|
      t.string :name
      t.timestamps
    end

    main_office = Office.new(name: 'Criminal Trials New York County')
    main_office.id = 1
    main_office.save!
  end

  def down
    drop_table :offices
  end
end
