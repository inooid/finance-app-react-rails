module Api
  module V1
    # Shows and creates receipts
    class ReceiptsController < ApplicationController
      has_scope :month
      has_scope :year

      def index
        @receipts = apply_scopes(Receipt).select(:id, :amount, :date)
      end
    end
  end
end
