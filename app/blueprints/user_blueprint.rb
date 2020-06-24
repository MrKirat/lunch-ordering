class UserBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    field :name
    field :email
  end
end
