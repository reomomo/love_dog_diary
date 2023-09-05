module ApplicationHelper
  def format_date(date)
    date.strftime('%Y年%-m月%-d日')
  end
  
  def format_time(time)
    time.strftime('%H:%M')
  end
end
