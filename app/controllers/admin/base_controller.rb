class Admin::BaseController < ApplicationController
  include Roleble::Controller
  before_action :authenticate_admin!
  before_action { check_role current_admin, :ui }
  layout 'admin'
end
