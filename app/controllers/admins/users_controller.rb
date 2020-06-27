class Admins::UsersController < Admins::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /admins/users
  def index
    @users = User.all.order(created_at: :desc)
  end

  # GET /admins/users/1
  def show
  end

  # GET /admins/users/new
  def new
    @user = User.new
  end

  # GET /admins/users/1/edit
  def edit
  end

  # POST /admins/users
  def create
    @user = User.new(user_params)

    redirect_to admins_user_path(@user), notice: 'User was successfully created.' and return if @user.save
    redirect_to new_admins_user_path, flash: {alert: @user.errors.full_messages.join(' ')}
  end

  # PATCH/PUT /admins/users/1
  def update
    result = Admins::Users::UpdateUser.call(user: @user, params: user_params)

    redirect_to admins_user_path(result.user), notice: 'User was successfully updated.' and return if result.errors.blank?
    redirect_to edit_admins_user_path(result.user), flash: {alert: result.errors.full_messages.join(' ')}
  end

  # DELETE /admins/users/1
  def destroy
    @user.destroy
    redirect_to admins_users_url, notice: 'User was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
