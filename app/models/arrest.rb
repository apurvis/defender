class Arrest < Event
  def formatted_name
    "Arrest #{happened_at.strftime('%Y-%m-%d')}"
  end
end
