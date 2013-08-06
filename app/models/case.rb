class Case < ActiveRecord::Base
  belongs_to :user
  belongs_to :attorney
  has_many :defendants_cases
  has_many :defendants, :through => :defendants_cases

  def number_of_defendants
    defendants.size
  end
end
