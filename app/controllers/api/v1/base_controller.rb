class Api::V1::BaseController < ApplicationController
  include Roleble::Controller
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_admin!
  check_role :api, model: :current_admin
end