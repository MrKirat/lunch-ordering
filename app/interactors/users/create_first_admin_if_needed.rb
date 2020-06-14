class Users::CreateFirstAdminIfNeeded
  include Interactor

  def call
    return unless first_saved_user?(context.user)

    context.admin = Admin.create(
      password: context.params[:password],
      password_confirmation: context.params[:password_confirmation],
      email: context.params[:email]
    )

    context.fail!(message: context.admin.errors.messages) if context.admin.errors.any?
  end

  def rollback
    context.admin.destroy
  end

  protected

  def first_saved_user?(user)
    user.persisted? && User.count == 1
  end
end