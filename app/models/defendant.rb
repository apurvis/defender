class Defendant < ActiveRecord::Base
  has_many :defendants_cases
  has_many :cases, through: :defendants_cases
  has_many :mailing_addresses, through: :defendants_mailing_addresses

  def to_s
    name
  end
end
