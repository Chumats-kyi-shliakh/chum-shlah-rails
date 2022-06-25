module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        render json: CategoryBlueprint.render(categories, view: :normal)
      end

      def show
        render json: CategoryBlueprint.render(category, view: :normal)
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
