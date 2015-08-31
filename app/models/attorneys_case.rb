class AttorneysCase < ActiveRecord::Base
  belongs_to :attorney
  belongs_to :case
end
