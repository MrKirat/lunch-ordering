class Admins::Food::MenusController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  # GET /admins/food/menus
  def index
    @menus = Food::Menu.all.order(created_at: :desc)
  end

  # GET /admins/food/menus/1
  def show
  end

  # GET /admins/food/menus/new
  def new
    return redirect_to admins_food/menus_path, notice: 'You create only one menu per day.' if Food::Menu.current.present?
    @menu = Food::Menu.new
  end

  # GET /admins/food/menus/1/edit
  def edit
    return redirect_to admins_food/menus_path, notice: 'You can edit only today menu.' unless @menu.current?
  end

  # POST /admins/food/menus
  def create
    return redirect_to admins_food/menus_path, notice: 'You create only one menu per day.' if Food::Menu.current.present?

    @menu = Food::Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to admins_food_menu_path(@menu), notice: 'Menu was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admins/food/menus/1
  def update
    return redirect_to admins_food/menus_path, notice: 'You can edit only today menu.' unless @menu.current?

    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to admins_food_menu_path(@menu), notice: 'Menu was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_menu
    @menu = Food::Menu.includes(:categories, categories: [:items]).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def menu_params
    params.require(:food_menu).permit(
      categories_attributes: [
        :name, :_destroy, :id,
        items_attributes: [
          :name, :price, :_destroy, :id, :image
        ]
      ]
    )
  end
end
