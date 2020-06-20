class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @menus = Food::Menu.per_current(:week)
  end
end
