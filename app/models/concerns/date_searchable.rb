module DateSearchable
  extend ActiveSupport::Concern

  SINGLE_DAY_FORMAT = "%Y-%m-%d"
  ALLOWED_TIME_FRAMES = [:minute, :day, :week, :month, :quarter, :year]
  private_constant :SINGLE_DAY_FORMAT

  class_methods do
    def first_per_day_within(time_point, time_frame)
      return self.none unless ALLOWED_TIME_FRAMES.include? time_frame.to_sym
      created_within(time_point, time_frame)
        .order(created_at: :desc)
        .group_by { |menu| menu.created_at.strftime(SINGLE_DAY_FORMAT) }
        .map { |creating_date, menus| [creating_date, menus.first] }
        .to_h
    end

    def created_within(time_point, time_frame)
      return self.none unless ALLOWED_TIME_FRAMES.include? time_frame.to_sym
      where(created_at: time_point.send("beginning_of_#{time_frame}")..time_point.send("end_of_#{time_frame}"))
    end
  end
end