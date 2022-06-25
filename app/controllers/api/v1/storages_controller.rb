module Api
  module V1
    class StoragesController < ApplicationController
      def index
        render json: StorageBlueprint.render(storages)
      end

      private

      def storages
        @storages ||= Storage.all
      end
    end
  end
end
