module Api
  module V1
    class ProductsController < ApplicationController
      def index
        render json: ProductBlueprint.render(products)
      end

      def show
        render json: ProductBlueprint.render(product)
      end

      def create
        create_product
        render json: ProductBlueprint.render(product)
      end

      def update
        update_product
        render json: ProductBlueprint.render(product)
      end

      def destroy
        destroy_product
        head :no_content
      end

      private

      def create_product
        products.create!(create_product_params)
      end

      def update_product
        product.update!(update_product_params)
      end

      def destroy_product
        product.destroy!
      end

      def products
        @products ||= category.products.all
      end

      def product
        @product ||= products.find(params[:id])
      end

      def category
        @category ||= Category.find(params[:category_id])
      end

      def create_product_params
        params.permit(:name, :weight, :height, :width, :length)
      end

      def update_product_params
        params.permit(:name, :weight, :height, :width, :length)
      end
    end
  end
end
