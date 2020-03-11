module TheatersHelper
  def datetime_to_hours day
    DateTime.parse(day).strftime("%H:%M")
  end
end
