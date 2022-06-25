class ProductAvailabilityBlueprint < Blueprinter::Base
  identifier :id

  fields :quantity

  view :normal do
    association :product, blueprint: ProductBlueprint
  end
end
