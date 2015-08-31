class PeopleCase < ActiveRecord::Base
  belongs_to :person
  belongs_to :case

  validates :people, :presence => true
  validates :case, :presence => true
end
