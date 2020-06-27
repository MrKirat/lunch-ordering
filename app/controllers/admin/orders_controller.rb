class Admin::OrdersController < Admin::BaseController

  # GET /admin/orders
  def index
    @orders = Order.includes(:food_items).all.order(created_at: :desc)
  end

  # GET /admin/orders/1
  def show
    @order = Order.includes(:food_items).find(params[:id])
  end
end
