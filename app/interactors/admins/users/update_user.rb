class Admins::Users::UpdateUser
  include Interactor

  def call
    if context.params[:password].blank?
      context.user.update_without_password(context.params)
    else
      context.user.update(context.params)
    end

    context.fail!(errors: context.user.errors) if context.user.errors.any?
  end
end