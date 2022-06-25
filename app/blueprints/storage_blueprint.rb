class StorageBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :geom, :city, :street, :postal_code, :country, :house_number
end
