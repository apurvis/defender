class Case < ActiveRecord::Base
  belongs_to :user
  belongs_to :attorney

  has_many :defendants_cases
  has_many :defendants, through: :defendants_cases
  has_many :attorneys_cases
  has_many :attorneys, through: :attorneys_cases

  belongs_to :office
  belongs_to :county
  belongs_to :case_type
  belongs_to :practice

  belongs_to :initial_top_charge, foreign_key: 'initial_top_charge_id', class_name: 'Charge'
  belongs_to :current_top_charge, foreign_key: 'current_top_charge_id', class_name: 'Charge'
  belongs_to :disposition_top_charge, foreign_key: 'disposition_top_charge_id', class_name: 'Charge'

  def number_of_defendants
    defendants.size
  end
end
