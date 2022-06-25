module Api
  module V1
    class StoragesController < ApplicationController
      def index
        render json: StorageBlueprint.render(storages, view: :normal)
      end

      private

      def storages
        @storages ||= Storage.all
      end
    end
  end
end
