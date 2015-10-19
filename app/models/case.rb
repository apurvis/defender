class Case < ActiveRecord::Base
  belongs_to :user
  belongs_to :attorney

  has_many :court_appearances, -> { order(:happened_at) }
  has_many :events, -> { order(:happened_at) }

  has_many :people_cases
  has_many :people, through: :people_cases
  has_many :complainants
  has_many :defendants
  has_many :defense_attorneys
  has_many :judges
  has_many :prosecuting_attorneys
  has_many :witnesses

  has_many :cases_charges
  has_many :charges, through: :cases_charges

  belongs_to :office
  belongs_to :county
  belongs_to :case_type
  belongs_to :practice

  validates_presence_of :docket_number

  def formatted_name
    "People v. #{defendants.map { |d| d.person}.join(', ')}"
  end

  def next_court_date
    court_appearances.find { |ca| ca.happened_at >= Date.today }.try(:happened_at).try(:strftime, '%Y-%m_%d')
  end
end
