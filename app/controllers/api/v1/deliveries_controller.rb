module Api
  module V1
    class DeliveriesController < ApplicationController
      def index
        render json: DeliveryBlueprint.render(deliveries, view: :normal)
      end

      def create
        create_delivery
        render json DeliveryBlueprint.render(delivery, view: :normal)
      end

      def update
        update_delivery
        render json: DeliveryBlueprint.render(delivery, view: :normal)
      end

      private

      def create_delivery
        @delivery = driver.deliveries.create!(create_delivery_params)
      end

      def update_delivery
        @delivery = delivery.update!(update_delivery_params)
      end

      def delivery
        @delivery ||= driver.deliveries.find(params[:id])
      end

      def deliveries
        query = driver.deliveries
        query = query.where(status: params[:status]) if params.key?(:status)
        @deliveries ||= query
      end

      def driver
        @driver ||= Driver.find_by!(login: params[:login])
      end

      def create_delivery_params
        params.permit(:route)
      end

      def update_delivery_params
        params.permit(:status, :route)
      end
    end
  end
end
