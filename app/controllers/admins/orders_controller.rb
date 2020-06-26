class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  # GET /admins/orders
  def index
    @orders = Order.all.order(created_at: :desc).includes(:food_items)
  end

  # GET /admins/orders/1
  def show
    @order = Order.find(params[:id]).includes(:food_items)
  end
end
