module DataSearchable
  extend ActiveSupport::Concern

  class_methods do
    def first_per_day_within(date, time_frame)
      created_within(date, time_frame)
        .order(created_at: :desc)
        .group_by { |menu| menu.created_at.strftime("%Y-%m-%d") }
        .map { |creating_date, menus| [creating_date, menus.first] }
        .to_h
    end

    def created_within(date, time_frame)
      where(created_at: Time.zone.parse(date).send("all_#{time_frame}"))
    end
  end
end