class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @menus = Food::Menu.first_per_day_within(Time.current.to_s, :week)
  end
end
