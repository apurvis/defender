class RemoveNextCourtDateFromCases < ActiveRecord::Migration
  def change
    remove_column :cases, :next_court_date, :date
    remove_column :cases, :new_york_state_id, :string
    remove_column :cases, :start_workflow, :string
    remove_column :cases, :case, :string
    remove_column :cases, :cab_number, :string
    remove_column :cases, :docket_plus, :string
    remove_column :cases, :itype, :string, limit: 1
    remove_column :cases, :dtype, :string, limit: 1
    remove_column :cases, :status_flag, :string
    remove_column :cases, :lm_number, :string

    remove_column :cases, :aid, :boolean
    remove_column :cases, :dsp, :boolean
    remove_column :cases, :mica, :boolean
    remove_column :cases, :k_calendar, :boolean
    remove_column :cases, :contested, :boolean
    remove_column :cases, :board_case, :boolean
    remove_column :cases, :ati, :boolean
  end
end
