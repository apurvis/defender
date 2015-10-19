class DefendantCharge < ActiveRecord::Base
  belongs_to :defendant
  belongs_to :charge

  delegate :case, to: :defendant

  validates :defendant, presence: true
  validates :charge, presence: true
end
