class Admins::Food::MenusController < Admins::BaseController
  before_action :set_menu, only: [:show, :edit, :update]
  before_action :check_if_menu_editable, only: [:edit, :update]
  before_action :check_if_menu_creatable, only: [:new, :create]

  # GET /admins/food/menus
  def index
    @menus = Food::Menu.all.order(created_at: :desc)
  end

  # GET /admins/food/menus/1
  def show
  end

  # GET /admins/food/menus/new
  def new
    @menu = Food::Menu.new
  end

  # GET /admins/food/menus/1/edit
  def edit
  end

  # POST /admins/food/menus
  def create
    @menu = Food::Menu.new(menu_params)

    redirect_to admins_food_menu_path(@menu), notice: 'Menu was successfully created.' and return if @menu.save
    redirect_to new_admins_food_menu_path, flash: {alert: @menu.errors.full_messages.join(' ')}
  end

  # PATCH/PUT /admins/food/menus/1
  def update
    redirect_to admins_food_menu_path(@menu), notice: 'Menu was successfully updated.' and return if @menu.update(menu_params)
    redirect_to edit_admins_food_menu_path(@menu), flash: {alert: @menu.errors.full_messages.join(' ')}
  end

  private

  def set_menu
    @menu = Food::Menu.includes(:categories, categories: [:items]).find(params[:id])
  end

  def check_if_menu_creatable
    redirect_to admins_food_menus_path, alert: 'You can create only one menu per day.' if Food::Menu.current.present?
  end

  def check_if_menu_editable
    redirect_to admins_food_menus_path, alert: 'You can edit only today menu.' unless @menu.current?
  end

  def menu_params
    params.fetch(:food_menu, {}).permit(
      categories_attributes: [
        :name, :_destroy, :id,
        items_attributes: [
          :name, :price, :_destroy, :id, :image
        ]
      ]
    )
  end
end
