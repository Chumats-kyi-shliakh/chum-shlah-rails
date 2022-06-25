class CustomerOrderBlueprint < Blueprinter::Base
  identifier :id

  fields :status, :geom, :country, :city, :postal_code, :street, :house_number

  view :normal do
    association :customer, blueprint: CustomerBlueprint
    association :cart, blueprint: CartBlueprint
  end
end
