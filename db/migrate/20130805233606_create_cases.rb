class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :attorney_id
      t.string :docket_number
      t.string :indictment_number
      t.string :status
      t.string :stage
      t.date :next_court_date
      t.string :next_court_part
      t.string :release_status
      t.string :immigration_status
      t.string :new_york_state_id
      t.string :arrest_number
      t.integer :office_id
      t.date :opened_date
      t.date :closed_date
      t.date :disposition_date
      t.string :final_disposition
      t.string :city_disposition
      t.date :city_disposition_date
      t.integer :initial_top_charge_id
      t.integer :current_top_charge_id
      t.integer :disposition_top_charge_id
      t.string :itype, :limit => 1, :comment => 'a gender'
      t.string :dtype, :limit => 1, :comment => 'a gender'
      t.string :status_flag
      t.integer :county_id
      t.string :top_sentence
      t.boolean :pro_bono
      t.string :lm_number
      t.integer :case_type_id
      t.string :docket_plus
      t.integer :number_of_codefendants
      t.string :sentence
      t.string :cab_number
      t.string :law_firm_matter_number
      t.boolean :aid
      t.boolean :dsp
      t.boolean :mica
      t.boolean :k_calendar
      t.boolean :contested
      t.boolean :board_case
      t.boolean :school_related
      t.string :warrant_number
      t.string :court_index
      t.boolean :probation_issue
      t.boolean :probation_request
      t.boolean :ati
      t.boolean :evaluation
      t.boolean :conflict_check
      t.string :start_workflow
      t.string :court_forum
      t.integer :practice_id
      t.string :case
      t.integer :created_by_user_id
      t.integer :last_updated_by_user_id
      t.integer :owner_id

      t.timestamps
    end

    add_index :cases, :docket_number, :unique => true
    add_index :cases, :attorney_id
  end
end
