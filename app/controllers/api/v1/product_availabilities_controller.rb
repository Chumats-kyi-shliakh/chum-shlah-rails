module Api
  module V1
    class ProductAvailabilitiesController < ApplicationController
      def index
        render json: ProductAvailabilityBlueprint.render(product_availabilities, view: :normal)
      end

      def show
        render json: ProductAvailabilityBlueprint.render(product_availability, view: :normal)
      end

      private

      def product_availability
        @product_availability ||= ProductAvailability.find(params[:id])
      end

      def product_availabilities
        @product_availabilities ||= storage.product_availabilities.includes(product: :category)
      end

      def storage
        @storage ||= Storage.find(params[:storage_id])
      end
    end
  end
end
