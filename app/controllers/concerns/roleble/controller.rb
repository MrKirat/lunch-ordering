module Roleble::Controller
  extend ActiveSupport::Concern

  def check_role(model, role)
    raise ActionController::MethodNotAllowed unless model&.has_role? role
  end
end