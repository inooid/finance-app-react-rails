# Formats the data of a single receipt, before it renders to JSON.
class ReceiptSerializer < ActiveModel::Serializer
  include ActionView::Helpers::NumberHelper

  # - Attributes --------------------------------------------------------------#
  attributes :id, :date

  # Formats the amount decimal to two decimals
  # @return []
  def amount
    number_with_precision(object.amount, precision: 2)
  end
end
