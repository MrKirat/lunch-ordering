class Admin::BaseController < ApplicationController
  include Roleble::Controller
  before_action :authenticate_admin!
  check_role :ui, model: :current_admin
  layout 'admin'
end
