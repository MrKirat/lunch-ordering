class Admins::CalendarsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_menus
  before_action :set_orders
  layout 'admin'

  # GET /admins/calendars/day
  def day
    @date = params[:start_date]
  end

  # GET /admins/calendars/month
  def month
  end

  private

  def set_menus
    @menus = Food::Menu.created_within(params[:start_date] || Time.current.to_s, params[:action])
  end

  def set_orders
    @orders = Order.created_within(params[:start_date] || Time.current.to_s, params[:action])
  end
end
