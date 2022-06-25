module Api
  module V1
    class DriversController < ApplicationController
      def index
        render json: DriverBlueprint.render(drivers, view: :normal)
      end

      def show
        render json: DriverBlueprint.render(driver, view: :normal)
      end

      private

      def drivers
        @drivers ||= Driver.all
      end

      def driver
        driver.find(params[:id])
      end
    end
  end
end
