class Users::CreateFirstAdminIfNeeded
  include Interactor

  def call
    return unless first_saved_user?(context.user)

    context.admin = Admin.create(
      password: context.params[:password],
      password_confirmation: context.params[:password_confirmation],
      email: context.params[:email]
    )

    context.fail!(error: context.admin.errors) if context.admin.errors.any?
    context.admin_success_message = I18n.t('interactors.first_admin_success') unless context.admin.errors.any?
  end

  def rollback
    context.admin.destroy
  end

  protected

  def first_saved_user?(user)
    user.persisted? && User.count == 1
  end
end