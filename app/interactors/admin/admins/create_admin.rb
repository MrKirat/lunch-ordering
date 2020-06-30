class Admin::Admins::CreateAdmin
  include Interactor

  def call
    ActiveRecord::Base.transaction do
      context.admin = Admin.new(
        password: context.params[:password],
        password_confirmation: context.params[:password_confirmation],
        email: context.params[:email]
      )
      context.admin.add_roles context.params[:roles]
      context.fail!(error: context.admin.errors) unless context.admin.save
    end
  end
end