class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  # GET /admins/orders
  def index
    @orders = Order.all
  end

  # GET /admins/orders/1
  def show
    @order = Order.find(params[:id])
  end
end
