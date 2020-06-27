class User::DashboardController < User::BaseController

  # GET /dashboard
  def show
    @menus = Food::Menu.first_per_day_within(Time.current, :week)
  end
end
