class Admin::CalendarsController < Admin::BaseController
  include Calendarable
  prepare_time_point actions: [:day, :month], param_name: :start_date, fallback_location: :admin_calendars_month_path
  before_action :set_menus, only: [:day, :month]
  before_action :set_orders, only: [:day, :month]

  # GET /admin/calendars/day
  def day
    @date = params[:start_date]
  end

  # GET /admin/calendars/month
  def month
  end

  private

  def set_menus
    @menus = Food::Menu.created_within(@time_point, params[:action])
  end

  def set_orders
    @orders = Order.created_within(@time_point, params[:action]).includes(:food_items)
  end
end
