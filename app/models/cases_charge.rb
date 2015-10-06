class CasesCharge < ActiveRecord::Base
  belongs_to :case
  belongs_to :charge

  validates :case, :presence => true
  validates :charge, :presence => true
end
