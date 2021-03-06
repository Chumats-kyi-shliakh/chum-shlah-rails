module Api
  module V1
    class CartsController < ApplicationController
      def show
        render json: CartBlueprint.render(cart, view: :normal)
      end

      def index
        render json: CartBlueprint.render(cart, view: :normal)
      end

      def create
        create_cart
        render json: CartBlueprint.render(cart, view: :normal), status: :created
      end

      def destroy
        destroy_cart
        head :no_content
      end

      private

      def cart
        @cart ||= customer.carts.order(updated_at: :desc).first
      end

      def carts
        @carts = customer.carts
      end

      def create_cart
        @cart = customer.carts.create!
      end

      def destroy_cart
        cart.destroy!
      end

      def customer
        @customer ||= Customer.find(params[:customer_id])
      end
    end
  end
end
