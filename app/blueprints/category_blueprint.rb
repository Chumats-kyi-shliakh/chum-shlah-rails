class CategoryBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :image_url

  view :normal do
    association :products, blueprint: ProductBlueprint
  end
end
