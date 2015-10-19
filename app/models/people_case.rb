class PeopleCase < ActiveRecord::Base
  belongs_to :person
  belongs_to :case

  validates :person, presence: true
  validates :case, presence: true
end
