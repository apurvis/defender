class County < ActiveRecord::Base
  def to_s
    "#{name}, #{state}"
  end
end
