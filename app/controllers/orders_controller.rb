class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]

  # GET /orders
  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    return redirect_to orders_path, notice: 'Today\'s menu is not found.' unless (@menu = Food::Menu.current)
    @order = Order.new
  end

  # POST /orders
  def create
    @order = current_user.orders.new(order_params.merge(customer: current_user))

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
      else
        p @order.errors.messages
        p @order.order_items.first.errors.messages
        format.html { render :new }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = current_user.orders.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params[:order][:food_item_ids] = params[:order][:food_item_ids].values
    params.require(:order).permit(food_item_ids: [])
  end
end
