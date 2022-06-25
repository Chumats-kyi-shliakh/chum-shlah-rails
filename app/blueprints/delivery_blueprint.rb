class DeliveryBlueprint < Blueprinter::Base
  identifier :id

  fields :status, :route

  view :normal do
    association :delivery_items, blueprint: DeliveryItemBlueprint
  end
end
