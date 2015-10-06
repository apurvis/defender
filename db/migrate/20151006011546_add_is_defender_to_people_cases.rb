class AddIsDefenderToPeopleCases < ActiveRecord::Migration
  def change
    add_column :people_cases, :role, :string
    add_column :people_cases, :comment, :text
  end
end
