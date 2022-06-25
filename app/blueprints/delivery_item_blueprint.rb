class DeliveryItemBlueprint < Blueprinter::Base
  identifier :id

  fields :quantity, :status

  view :normal do
    association :cart_item, blueprint: CartItemBlueprint
    association :product_availability, blueprint: ProductAvailabilityBlueprint
    association :delivery, blueprint: DeliveryBlueprint
  end
end
