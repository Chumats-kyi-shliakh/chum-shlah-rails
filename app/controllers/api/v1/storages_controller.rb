module Api
  module V1
    class StoragesController < ApplicationController
      def index
        render json: StorageBlueprint.render(storages, view: :normal)
      end

      def create
        create_storage
        render json: StorageBlueprint.render(storage, view: :normal)
      end

      private

      def create_storage
        @storage = Storage.create!(create_storage_params)
      end

      def storage
        @storage ||= Storage.find(params[:id])
      end

      def storages
        @storages ||= Storage.all
      end

      def create_storage_params
        params.permit(:fund_id, :name, :geom, :city, :street, :postal_code, :country, :house_number)
      end
    end
  end
end
