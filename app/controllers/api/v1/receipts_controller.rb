module API
  module V1
    # Shows and creates receipts
    class ReceiptsController < API::APIController
      has_scope :month, :year

      def index
        @receipts = apply_scopes(Receipt).select(:id, :amount, :date)

        render json: {
          stats: {
            spendThisMonth: apply_scopes(Receipt).spend_this_month,
            totalSpend: apply_scopes(Receipt).spend_total,
            averageAmount: apply_scopes(Receipt).average(:amount)
          },
          receipts: @receipts
        }
      end
    end
  end
end
