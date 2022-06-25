class StorageBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :geom, :city, :street, :postal_code, :country, :house_number

  view :normal do
    association :product_availabilities, blueprint: ProductAvailabilitiBlueprint
  end
end
