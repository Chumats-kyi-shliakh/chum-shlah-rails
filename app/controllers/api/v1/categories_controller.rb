module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        render json: CategoryBlueprint.render(categories)
      end

      def show
        render json: CategoryBlueprint.render(category)
      end

      private

      def categories
        @categories ||= Category.all
      end

      def category
        @category ||= categories.find(params[:id])
      end
    end
  end
end
