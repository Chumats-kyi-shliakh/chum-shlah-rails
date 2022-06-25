class CustomerBlueprint < Blueprinter::Base
  identifier :id

  fields :name

  view :normal do
    association :customer_orders, blueprint: CustomerOrderBlueprint
    association :carts, blueprint: CartBlueprint
  end
end
