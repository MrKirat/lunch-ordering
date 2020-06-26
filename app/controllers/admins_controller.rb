class AdminsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  RECORDS_TO_SHOW = 3
  CURRENT_DATE_POINT = Time.current

  def dashboard
    @menus_per_week = Food::Menu.created_within(CURRENT_DATE_POINT, :week)
    @orders_per_week = Order.created_within(CURRENT_DATE_POINT, :week).includes(:food_items)

    @last_users = User.order(created_at: :desc).limit(RECORDS_TO_SHOW)
    @last_menus = Food::Menu.order(created_at: :desc).limit(RECORDS_TO_SHOW)
    @last_orders = Order.order(created_at: :desc).limit(RECORDS_TO_SHOW).includes(:food_items).includes(:customer)
  end
end
