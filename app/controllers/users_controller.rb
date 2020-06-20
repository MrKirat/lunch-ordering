class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @menus = Food::Menu.per_last(:week)
  end
end
