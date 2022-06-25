module Api
  module V1
    class CustomerOrdersController < ApplicationController
      def index
        render json: CustomerOrderBlueprint.render(customer_orders, view: :normal)
      end

      def show
        render json: CustomerOrderBlueprint.render(customer_order, view: :normal)
      end

      def create
        create_customer_order
        render json: CustomerOrderBlueprint.render(customer_order, view: :normal), status: :created
      end

      def update
        update_customer_order
        render json: CustomerOrderBlueprint.render(customer_order, view: :normal)
      end

      private

      def create_customer_order
        customer_orders.create!(create_customer_order_params)
      end

      def update_customer_order
        customer_order.update!(update_customer_order_params)
      end

      def customer_order
        @customer_order ||= customer_orders.find(params[:id])
      end

      def customer_orders
        @customer_orders ||= customer.customer_orders
      end

      def customer
        @customer ||= Customer.find(params[:customer_id])
      end

      def create_customer_order_params
        params.permit(:cart_id, :route, :geom, :country, :city, :postal_code, :street, :house_number)
      end

      def update_customer_order_params
        params.permit(:status, :geom, :route, :geom, :country, :city, :postal_code, :street, :house_number)
      end
    end
  end
end
