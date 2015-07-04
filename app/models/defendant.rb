class Defendant < ActiveRecord::Base
  has_many :defendants_cases
  has_many :cases, :through => :defendants_cases

  def to_s
    name
  end
end
