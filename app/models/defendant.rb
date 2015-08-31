class Defendant < ActiveRecord::Base
  has_many :defendants_cases
  has_many :cases, through: :defendants_cases
  has_many :defendants_mailing_addresses
  has_many :mailing_addresses, through: :defendants_mailing_addresses
  has_many :phone_numbers, as: :phoneable

  def last_mailing_address
    mailing_addresses.last
  end

  def to_s
    name
  end
end
