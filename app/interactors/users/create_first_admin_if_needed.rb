class Users::CreateFirstAdminIfNeeded
  include Interactor

  def call
    return unless first_saved_user?(context.user)

    context.admin = Admin.new(
      password: context.params[:password],
      password_confirmation: context.params[:password_confirmation],
      email: context.params[:email]
    )

    # Let's assign all admin roles to first admin
    Admin.roles.each do |role|
      context.admin.add_role role
    end

    context.fail!(error: context.admin.errors) unless context.admin.save
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