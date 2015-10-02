class Event < ActiveRecord::Base
  belongs_to :case

  has_many :people_events
  has_many :people, through: :people_events

  validates :happened_at, presence: true
end
