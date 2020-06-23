class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout 'admin'

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

    respond_to do |format|
      if @user.save
        format.html { redirect_to admins_user_path(@user), notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admins/users/1
  def update
    respond_to do |format|
      if user_params[:password].blank?
        @user.update_without_password(user_params)
      else
        @user.update(user_params)
      end

      if @user.errors.blank?
        format.html { redirect_to admins_user_path(@user), notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admins/users/1
  # DELETE /admins/users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admins_users_url, notice: 'User was successfully destroyed.' }
    end
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
