class Admin::Admins::UpdateAdmin
  include Interactor

  def call
    ActiveRecord::Base.transaction do
      context.admin.reset_roles context.params[:roles]
      if context.params[:password].blank?
        context.admin.update_without_password(context.params.except(:roles))
      else
        context.admin.update(context.params.except(:roles))
      end
    rescue
      context.fail!(errors: context.admin.errors) if context.admin.errors.any?
    end
  end
end