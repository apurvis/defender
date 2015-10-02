class CourtAppearance < Event
  def formatted_name
    "#{hearing_type} #{happened_at.strftime('%Y-%m-%d')}"
  end
end
