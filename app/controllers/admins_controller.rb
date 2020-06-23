class AdminsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def dashboard
    @menus_per_week = Food::Menu.created_within(Time.current.to_s, :week)
    @orders_per_week = Order.created_within(Time.current.to_s, :week)

    @last_users = User.order(created_at: :desc).limit(3)
    @last_menus = Food::Menu.order(created_at: :desc).limit(3)
    @last_orders = Order.order(created_at: :desc).limit(3).includes(:food_items).includes(:customer)
  end
end
