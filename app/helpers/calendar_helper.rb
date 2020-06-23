module CalendarHelper
  def count_items_per_cell(items, date)
    items.select{ |r| date.all_day.cover? r.created_at}.count
  end
end