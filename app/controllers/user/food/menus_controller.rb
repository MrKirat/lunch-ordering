class User::Food::MenusController < User::BaseController

  # GET /food/menus/1
  def show
    @menu = Food::Menu.includes(:categories, categories: [:items]).find(params[:id])
  end
end
