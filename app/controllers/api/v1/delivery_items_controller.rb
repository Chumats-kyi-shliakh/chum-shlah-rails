module Api
  module V1
    class DeliveryItemsController < ApplicationController
      def index
        render json: DeliveryItemBlueprint.render(delivery_items)
      end

      def create
        create_delivery_item
        render json: DeliveryItemBlueprint.render(delivery_item), status: :created
      end

      def update
        update_delivery_item
        render json: DeliveryItemBlueprint.render(delivery_item)
      end

      def destroy
        destroy_delivery_item
        head :no_content
      end

      private

      def delivery_items
        delivery.delivery_items
      end

      def delivery_item
        @delivery_item ||= delivery_items.find(params[:id])
      end

      def create_delivery_item
        delivery_items.create!(create_delivery_item_params)
      end

      def update_delivery_item
        delivery_item.update!(update_delivery_item_params)
      end

      def destroy_delivery_item
        delivery_item.destroy!
      end

      def delivery
        @delivery ||= Delivery.find(params[:delivery_id])
      end

      def create_delivery_item_params
        params.permit(:cart_item_id, :product_availability_id, :quantity)
      end

      def update_delivery_item_params
        params.permit(:quantity)
      end
    end
  end
end
