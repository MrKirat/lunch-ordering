class OrderBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    field :created_at
    field :total_cost do |order|
      order.total_cost.format
    end
  end

  view :extended do
    include_view :normal
    association :customer, {blueprint: UserBlueprint, view: :normal}
    association :food_items, {blueprint: Food::ItemBlueprint, view: :normal}
  end
end
