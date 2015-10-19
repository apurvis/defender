class Person < ActiveRecord::Base
  has_many :people_cases
  has_many :cases, through: :people_cases
  has_many :phone_numbers, as: :phoneable
  has_many :people_mailing_addresses
  has_many :mailing_addresses, through: :people_mailing_addresses

  validates_presence_of :name

  def last_mailing_address
    mailing_addresses.last
  end

  def most_recent_role
    role = people_cases.order('created_at DESC').first
    role ? role.type : 'Unknown'
  end

  def to_s
    name
  end
end
