class DeliveryBlueprint < Blueprinter::Base
  identifier :id

  fields :status, :route

  view :normmal do
    association :delivery_items, blueprint: DeliveryItemBlueprint
  end
end
