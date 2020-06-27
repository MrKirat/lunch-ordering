class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  # GET /admins/orders
  def index
    @orders = Order.includes(:food_items).all.order(created_at: :desc)
  end

  # GET /admins/orders/1
  def show
    @order = Order.includes(:food_items).find(params[:id])
  end
end
