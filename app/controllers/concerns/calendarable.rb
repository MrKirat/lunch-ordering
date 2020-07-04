module Calendarable
  extend ActiveSupport::Concern

  class_methods do
    def prepare_time_point(actions:, param_name:, fallback_location:)
      before_action(only: actions) { set_time_point(param_name, self.send(fallback_location)) }
    end
  end

  private

  def set_time_point(param_name, fallback_location)
    @time_point = (Time.zone.parse(params[param_name]) if params[param_name]) || Time.current
  rescue ArgumentError
    redirect_back fallback_location: fallback_location, flash: {alert: 'Wrong date format.'}
  end
end