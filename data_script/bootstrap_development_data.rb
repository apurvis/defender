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

def create_people
  Person.create(name: 'Learned Hand')
  Person.create(name: 'Benjamin West')
  Person.create(name: 'John Q. Public')
  Person.create(name: "James O\'Fender")
  Person.create(name: 'Stabby McStabberson')
  Person.create(name: 'Eesaw Sumthin')
  Person.create(name: 'Pug I. Listic')
  Person.create(name: 'Bramford L. Chadley, III')
end

def create_charges
  Charge.create(name: 'Speeding', offense_type: 'Violation')
  Charge.create(name: 'Shoplifting', offense_type: 'Misdemeanor')
  Charge.create(name: 'Robbery', offense_type: 'Felony')
end

def create_cases
  c = Case.create(docket_number: 'DOCKET01')
  Judge.create(case_id: c.id, person: Person.find_by_name('Learned Hand'))
  Witness.create(case_id: c.id, person: Person.find_by_name('Eesaw Sumthin'))
  Complainant.create(case_id: c.id, person: Person.find_by_name('John Q. Public'))
  Defendant.create(case_id: c.id, person: Person.find_by_name("James O\'Fender"))
  Defendant.create(case_id: c.id, person: Person.find_by_name("Pug I. Listic"))
  ProsecutingAttorney.create(case_id: c.id, person: Person.find_by_name("Bramford L. Chadley, III"))
  DefenseAttorney.create(case_id: c.id, person: Person.find_by_name("Benjamin West"))
end

create_counties
create_offices
create_people
create_charges
create_cases