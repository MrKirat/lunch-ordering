class Admin::AdminsController < Admin::BaseController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  check_role :root, model: :current_admin
  before_action :redirect_if_current_admin, only: [:edit, :update, :destroy]

  # GET /admin/admins
  def index
    @admins = Admin.order(created_at: :desc)
  end

  # GET /admin/admins/1
  def show
  end

  # GET /admin/admins/new
  def new
    @admin = Admin.new
  end

  # GET /admin/admins/1/edit
  def edit
  end

  # POST /admin/admins
  def create
    result = Admin::Admins::CreateAdmin.call(params: admin_params)

    redirect_to admin_admin_path(result.admin), notice: 'Admin was successfully created.' and return unless result.errors
    redirect_to new_admin_admin_path, flash: {alert: helpers.format_errors_for(result)}
  end

  # PATCH/PUT /admin/admins/1
  def update
    result = Admin::Admins::UpdateAdmin.call(admin: @admin, params: admin_params)

    redirect_to admin_admin_path(result.admin), notice: 'Admin was successfully updated.' and return if result.errors.blank?
    redirect_to edit_admin_admin_path(result.admin), flash: {alert: helpers.format_errors_for(result)}
  end

  # DELETE /admin/admins/1
  def destroy
    @admin.destroy
    redirect_to admin_admins_url, notice: 'Admin was successfully destroyed.'
  end

  private

  def redirect_if_current_admin
    redirect_to admin_admins_path, alert: 'You can\'t call this action for your admin account.' and return if params[:id] == current_admin.id.to_s
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation, roles: [])
  end
end
