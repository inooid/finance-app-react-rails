module Api
  module V1
    # Shows and creates receipts
    class ReceiptsController < ApplicationController
      def index
        @receipts = Receipt.select(:id, :euros, :cents, :date)
      end

      def by_month
        render json: Receipt.by_month(date_param)
      end

      private

      def date_param
        Date.parse(params.permit(:date)[:date] || Date.today.to_s)
      rescue ArgumentError
        Date.today
      end
    end
  end
end
