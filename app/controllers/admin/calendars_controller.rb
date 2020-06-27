class Admin::CalendarsController < Admin::BaseController
  before_action :set_menus, only: [:day ,:month]
  before_action :set_orders, only: [:day ,:month]

  # GET /admin/calendars/day
  def day
    @date = params[:start_date]
  end

  # GET /admin/calendars/month
  def month
  end

  private

  def set_menus
    @menus = Food::Menu.created_within(time_point, params[:action])
  end

  def set_orders
    @orders = Order.created_within(time_point, params[:action]).includes(:food_items)
  end

  def time_point
    return Time.zone.parse(params[:start_date]) if params[:start_date].present?
    Time.current
  end
end