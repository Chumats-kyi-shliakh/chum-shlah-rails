class DriverBlueprint < Blueprinter::Base
  identifier :id

  fields :login, :online, :last_online

  view :normal do
    association :deliveries, blueprint: DeliveryBlueprint
  end
end
