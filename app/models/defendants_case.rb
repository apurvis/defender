class DefendantsCase < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :defendant
  belongs_to :case

  validates :defendant, :presence => true
  validates :case, :presence => true
end
