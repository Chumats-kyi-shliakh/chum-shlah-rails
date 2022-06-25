class CartItemBlueprint < Blueprinter::Base
  identifier :id

  fields :quantity
  view :normal do
    association :cart, blueprint: CartBlueprint
    association :product, blueprint: ProductBlueprint
  end
end
