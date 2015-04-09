module Api
  module V1
    class ReceiptsController < ApplicationController
      def index
        render json: Receipt.select(:id, :euros, :cents, :date)
      end

      def by_month
        render json: Receipt.by_month(params[:date])
      end
    end
  end
end
