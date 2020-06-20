class Food::MenusController < ApplicationController
  before_action :authenticate_user!

  def show
    @menu = Food::Menu.includes(:categories, categories: [:items]).find(params[:id])
  end
end
