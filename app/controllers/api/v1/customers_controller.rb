module Api
  module V1
    class CustomersController < ApplicationController
      def index
        render json: CustomerBlueprint.render(customers, view: :normal)
      end

      def create
        create_customer
        render json: CustomerBlueprint.render(customer, view: :normal)
      end

      private

      def create_customer
        @customer = customers.create!(create_customer_params)
      end

      def customers
        @customers ||= Customer.all
      end

      def customer
        @customer ||= Customer.find(params[:id])
      end

      def create_customer_params
        params.permit(:name)
      end
    end
  end
end
