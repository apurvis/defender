class Charge < ActiveRecord::Base
  def cases
    Case.where(['initial_top_charge_id = ? OR current_top_charge_id = ? OR disposition_top_charge_id = ?', self.id, self.id, self.id])
  end

  def to_s
    name
  end
end
