class Orders::CreateOrder
  include Interactor

  def call
    context.order = context.user.orders.create(context.params)
    context.fail!(errors: context.order.errors) if context.order.errors.any?
  end
end