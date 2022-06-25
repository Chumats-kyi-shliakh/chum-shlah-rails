class CartBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    association :customer, blueprint: CustomerBlueprint
  end
end
