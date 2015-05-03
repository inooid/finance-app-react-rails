# The representation of a receipt. A receipt is information about what you spend
# and when you spend it.
class Receipt < ActiveRecord::Base
  # - Before/after hooks ------------------------------------------------------#
  before_save :default_values

  # - Validations -------------------------------------------------------------#
  validates :amount, presence: true

  # - Scopes-------------------------------------------------------------------#
  scope :spend_total, -> { sum(:amount) }

  # Gets the total amount for the currently scoped month
  # @param month_number [Integer] The month number you want to scope it for
  #   default_value: month number of the current month
  # @return [Decimal] the total amount spend for the given month
  def self.spend_this_month(month_number = Date.today.month)
    month(month_number).sum(:amount)
  end

  # Gets receipts for a specific month number (default scoped for Date.today)
  # @param month_number [String/Integer] the month number to be querying for
  # @return [ActiveRecord::Relation] collection of receipts matching the month
  #   number (of todays year)
  def self.month(month_number)
    date = DateTime.now.change(day: 1, month: month_number.to_i)
    where('date >= ? AND date <= ?', date, date.end_of_month)
  rescue ArgumentError
    return
  end

  # Gets receipts for a specific year (default scoped by todays year)
  # @param year_number [String/Integer] the year number to be querying for
  # @return [ActiveRecord::Relation] collection of receipts matching the year
  def self.year(year_number)
    return if year_number.to_i == 0
    date = DateTime.now.change(year: year_number.to_i)
    where('date >= ? AND date <= ?', date.beginning_of_year, date.end_of_year)
  end

  private

  # Makes sure that the date is always set to DateTime.now or itself
  # @return [DateTime] the date of the receipt
  def default_values
    self.date ||= DateTime.now
  end
end
