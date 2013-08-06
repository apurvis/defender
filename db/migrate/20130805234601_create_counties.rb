class CreateCounties < ActiveRecord::Migration
  def up
    create_table :counties do |t|
      t.string :name
      t.timestamps
    end

    brooklyn = County.new(name: 'Brooklyn')
    brooklyn.id = 1
    brooklyn.save!

    manhattan = County.new(name: 'Manhattan')
    manhattan.id = 2
    manhattan.save!

    staten_island = County.new(name: 'Staten Island')
    staten_island.id = 3
    staten_island.save!

    bronx = County.new(name: 'Bronx')
    bronx.id = 4
    bronx.save!

    queens = County.new(name: 'Queens')
    queens.id = 5
    queens.save!
  end

  def down
    drop_table :counties
  end
end
