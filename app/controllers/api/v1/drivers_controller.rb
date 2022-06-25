module Api
  module V1
    class DriversController < ApplicationController
      def index
        render json: DriverBlueprint.render(drivers)
      end

      def show
        render json: DriverBlueprint.render(driver)
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
