class Attorney < ActiveRecord::Base
  has_many :cases, through: :attorneys_cases
  validates_presence_of :name
end
