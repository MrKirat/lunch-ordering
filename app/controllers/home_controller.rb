class HomeController < ApplicationController
  def index
    redirect_to dashboard_path, notice: 'You redirected to dashboard because you signed already in.' if user_signed_in?
  end
end
