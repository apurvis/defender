class AddStateToCounties < ActiveRecord::Migration
  def change
    add_column :counties, :state, :string
  end
end
