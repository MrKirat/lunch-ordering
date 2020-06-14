class UsersController < ApplicationController
  # include Accessible
  before_action :authenticate_user!

  def profile
    @user = current_user
  end
end
