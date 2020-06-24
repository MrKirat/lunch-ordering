class Api::V1::Admin::OrdersController < Api::V1::ApplicationController

  # GET /api/v1/admin/orders
  def index
    @orders = Order.all.includes(:customer).includes(food_items: :category)
    render json: OrderBlueprint.render(@orders, {view: :extended})
  end
end
