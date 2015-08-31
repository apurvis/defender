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

def create_attorneys
  attorney = Attorney.new(name: 'John Q. Public')
  attorney.save
end

def create_defendants
  Defendant.create(name: "James O\'Fender")
  Defendant.create(name: "Pug I. Listic")
end

def create_charges
  Charge.create(name: 'Speeding', offense_type: 'Violation')
  Charge.create(name: 'Shoplifting', offense_type: 'Misdemeanor')
  Charge.create(name: 'Robbery', offense_type: 'Felony')
end

create_counties
create_offices
create_attorneys
create_defendants
create_charges