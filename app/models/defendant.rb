class Defendant < ActiveRecord::Base
  attr_accessible :name, :immigration_status
  has_many :cases
end
