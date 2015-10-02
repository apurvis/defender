class Case < ActiveRecord::Base
  belongs_to :user
  belongs_to :attorney

  has_many :court_appearances, -> { order(:happened_at) }
  has_many :events, -> { order(:happened_at) }
  has_many :people_cases
  has_many :people, through: :people_cases

  belongs_to :office
  belongs_to :county
  belongs_to :case_type
  belongs_to :practice

  belongs_to :initial_top_charge, foreign_key: 'initial_top_charge_id', class_name: 'Charge'
  belongs_to :current_top_charge, foreign_key: 'current_top_charge_id', class_name: 'Charge'
  belongs_to :disposition_top_charge, foreign_key: 'disposition_top_charge_id', class_name: 'Charge'

  validates_presence_of :docket_number

  def attorneys
    people.where(type: 'Attorney')
  end

  def attorneys_cases
    people_cases.joins("INNER JOIN people ON people.id=people_cases.person_id AND people.type='Attorney'")
  end

  def defendants
    people.where(type: 'Defendant')
  end

  def defendants_cases
    people_cases.joins("INNER JOIN people ON people.id=people_cases.person_id AND people.type='Defendant'")
  end

  def judges
    people.where(type: 'Judge')
  end

  def judges_cases
    people_cases.joins("INNER JOIN people ON people.id=people_cases.person_id AND people.type='Judge'")
  end

  def witnesses
    people.where(type: 'Witness')
  end

  def witnesses_cases
    people_cases.joins("INNER JOIN people ON people.id=people_cases.person_id AND people.type='Witness'")
  end

  def formatted_name
    "People v. #{defendants.join(', ')}"
  end

  def next_court_date
    court_appearances.find { |ca| ca.happened_at >= Date.today }.try(:happened_at).try(:strftime, '%Y-%m_%d')
  end
end
