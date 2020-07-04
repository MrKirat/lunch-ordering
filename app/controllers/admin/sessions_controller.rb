# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  layout 'admin'

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super do |admin|
      if admin.persisted? && !admin.has_role?(:ui)
        sign_out admin
        flash.delete(:notice)
        redirect_to new_admin_session_path, alert: 'Only admins with a "ui" role have access to the dashboard.' and return
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # Let's redirect admins to dashboard
  def after_sign_in_path_for(resource)
    admin_dashboard_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
