class Attorney < ActiveRecord::Base
  has_many :attorneys_cases
  has_many :cases, through: :attorneys_cases
  has_many :phone_numbers, as: :phoneable

  validates_presence_of :name
end
