module Api
  module V1
    class FundsController < ApplicationController
      def index
        render json: FundBlueprint.render(funds, view: :normal)
      end

      def show
        render json: FundBlueprint.render(fund, view: :normal)
      end

      def create
        create_fund
        render json: FundBlueprint.render(fund, view: :normal)
      end

      def update
        update_fund
        render json: FundBlueprint.render(fund, view: :normal)
      end

      def destroy
        destroy_fund
        head :no_content
      end

      private

      def create_fund
        @fund = funds.create!(create_fund_params)
      end

      def update_fund
        @fund = fund.update!(update_fund_params)
      end

      def destroy_fund
        fund.destroy!
      end

      def funds
        @funds ||= Fund.all
      end

      def fund
        @fund ||= Fund.find(params[:id])
      end

      def create_fund_params
        params.permit(:name, :tg_bot_key)
      end

      def update_fund_params
        params.permit(:name, :tg_bot_key)
      end
    end
  end
end
