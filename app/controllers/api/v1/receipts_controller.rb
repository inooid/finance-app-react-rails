module API
  module V1
    # Shows and creates receipts
    class ReceiptsController < ApplicationController
      has_scope :month, :year

      def index
        @receipts = apply_scopes(Receipt).select(:id, :amount, :date)

        render json: {
          stats: {
            spendThisMonth: apply_scopes(Receipt).spend_this_month(month_param),
            totalSpend: apply_scopes(Receipt).spend_total,
            averageAmount: apply_scopes(Receipt).average(:amount)
          },
          receipts: @receipts
        }
      rescue NoMethodError
        rescue_output
      end

      private

      def month_param
        month_number = params[:month] ? params[:month] : Date.today.month
        Date.today.change(day: 1, month: month_number.to_i).month
      end

      def rescue_output
        render json: { status: 400, error: 'Bad request' },
               status: :bad_request
      end
    end
  end
end
