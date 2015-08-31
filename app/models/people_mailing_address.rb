class PeopleMailingAddress < ActiveRecord::Base
  belongs_to :people
  belongs_to :mailing_address
end
