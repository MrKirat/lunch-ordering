class AdminsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def dashboard
    @per_week_menus = Food::Menu.first_per_day_within(Time.current.to_s, :week)
    @last_created_menus = Food::Menu.order(created_at: :asc).last(3)
    @orders = Order.order(created_at: :asc).last(3)
    @users = User.order(created_at: :asc).last(3)
  end
end
