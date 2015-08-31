class Attorney < ActiveRecord::Base
  has_many :attorneys_cases
  has_many :cases, through: :attorneys_cases
  validates_presence_of :name
end
