module Api
  module V1
    class CustomersController < ApplicationController
      def index
        render json: CustomerBlueprint.render(customers)
      end

      def create
        create_customer
        render json: CustomerBlueprint.render(customer)
      end

      private

      def create_customer
        customers.create!(create_customer_params)
      end

      def customers
        @customers ||= Customer.all
      end

      def create_customer_params
        params.permit(:name)
      end
    end
  end
end