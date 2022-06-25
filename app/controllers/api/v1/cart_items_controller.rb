module Api
  module V1
    class CartItemsController < ApplicationController
      def index
        render json: CartItemBlueprint.render(cart_items, view: :normal)
      end

      def create
        create_cart_item
        render json: CartItemBlueprint.render(cart_item, view: :normal), status: :created
      end

      def update
        update_cart_item
        render json: CartItemBlueprint.render(cart_item, view: :normal)
      end

      def destroy
        destroy_cart_item
        head :no_content
      end

      private

      def create_cart_item
        cart_items.create!(create_cart_item_params)
      end

      def update_cart_item
        cart_item.update!(update_cart_item_params)
      end

      def destroy_cart_item
        cart_item.destroy!
      end

      def cart_item
        @cart_item ||= cart_items.find(params[:id])
      end

      def cart_items
        @cart_items ||= cart.cart_items
      end

      def cart
        @cart ||= customer.cart
      end

      def customer
        @customer ||= Customer.find(params[:customer_id])
      end

      def create_cart_item_params
        params.permit(:product_id, :quantity)
      end

      def update_cart_item_params
        params.permit(:quantity)
      end
    end
  end
end
