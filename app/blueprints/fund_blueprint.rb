class FundBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :tg_bot_key

  view :normal do
    association :storage, blueprint: StorageBlueprint
  end
end
