class ProductBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :weight, :height, :width, :length

  view :normal do
    association :category, blueprint: CategoryBlueprint
  end
end
