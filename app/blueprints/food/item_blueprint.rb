class Food::ItemBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    field :name
    field :price do |item|
      item.price.format
    end
    field :category_name do |item|
      item.category.name
    end
  end
end
