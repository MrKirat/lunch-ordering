module Roleble::Controller
  extend ActiveSupport::Concern

  class_methods do
    def check_role(role, model:)
      before_action { verify_access send(model), role.to_sym }
    end
  end

  private

  def verify_access(model, role)
    raise ActionController::MethodNotAllowed unless model&.has_role? role
  end
end