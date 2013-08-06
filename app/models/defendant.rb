class Defendant < ActiveRecord::Base
  attr_accessible :name, :immigration_status

  has_many :defendants_cases
  has_many :cases, :through => :defendants_cases
end
