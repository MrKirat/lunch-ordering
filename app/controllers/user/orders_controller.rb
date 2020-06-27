class User::OrdersController < User::BaseController
  before_action :set_order, only: [:show]
  before_action :set_menu, only: [:new, :create]

  # GET /orders
  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
  def create
    result = Orders::CreateOrder.call(params: order_params, user: current_user)
    redirect_to result.order, notice: 'Order was successfully created.' and return if result.success?
    redirect_to new_order_path, flash: {error: result.errors.full_messages.join(' ')}
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def set_menu
    redirect_to orders_path, alert: 'Today\'s menu is not found.' unless (@menu = Food::Menu.current)
  end

  def order_params
    params[:order][:food_item_ids] = params[:order][:food_item_ids].values if params.dig(:order, :food_item_ids)
    params.fetch(:order, {}).permit(food_item_ids: [])
  end
end
