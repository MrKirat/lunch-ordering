class Api::V1::BaseController < ApplicationController
  include Roleble::Controller
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_admin!
  before_action { check_role current_admin, :api }
end