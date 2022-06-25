class CategoryBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :image_url

  view :normal do
    fields :name, :image_url
    association :products, blueprint: ProductBlueprint
  end
end
