class AdminsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def dashboard
    @menus = Food::Menu.per_current(:week)
  end
end
