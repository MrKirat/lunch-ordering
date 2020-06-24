class Api::V1::Admin::OrdersController < Api::V1::ApplicationController

  # GET /api/v1/admin/orders
  def index
    @orders = Order.all.order(created_at: :desc)
    respond_to do |format|
      format.json { render :json => @orders }
    end
  end
end
