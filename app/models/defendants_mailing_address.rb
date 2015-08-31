class DefendantsMailingAddress < ActiveRecord::Base
  belongs_to :defendant
  belongs_to :mailing_address
end
