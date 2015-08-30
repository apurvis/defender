def create_counties
  brooklyn = County.new(name: 'Brooklyn', state: 'NY')
  brooklyn.id = 1
  brooklyn.save!

  manhattan = County.new(name: 'Manhattan', state: 'NY')
  manhattan.id = 2
  manhattan.save!

  staten_island = County.new(name: 'Staten Island', state: 'NY')
  staten_island.id = 3
  staten_island.save!

  bronx = County.new(name: 'Bronx', state: 'NY')
  bronx.id = 4
  bronx.save!

  queens = County.new(name: 'Queens', state: 'NY')
  queens.id = 5
  queens.save!
end

def create_offices
  main_office = Office.new(name: 'Criminal Trials New York County')
  main_office.id = 1
  main_office.save!
end

create_counties
create_offices