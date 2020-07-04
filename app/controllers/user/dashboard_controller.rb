class User::DashboardController < User::BaseController
  include Calendarable
  prepare_time_point actions: [:show], param_name: :start_date, fallback_location: :dashboard_path

  # GET /dashboard
  def show
    @menus = Food::Menu.first_per_day_within(@time_point, :week)
  end
end
