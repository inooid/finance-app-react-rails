# The representation of a receipt. A receipt is information about what you spend
# and when you spend it.
class Receipt < ActiveRecord::Base
  # - Before/after hooks ------------------------------------------------------#
  before_save :default_values

  # - Validations -------------------------------------------------------------#
  validates :amount, presence: true

  # - Scopes-------------------------------------------------------------------#
  scope :spend_total, -> { sum(:amount) }
  scope :spend_this_month, -> { month(Date.today.month).sum(:amount) }

  # Gets receipts for a specific month number (default scoped for Date.today)
  # @param month_number [String/Integer] the month number to be querying for
  # @return [ActiveRecord::Relation] collection of receipts matching the month
  #   number (of todays year)
  def self.month(month_number)
    unless month_number.is_a?(Fixnum)
      raise ArgumentError, 'Argument is not numeric'
    end
    date = DateTime.now.change(month: month_number.to_i)
    where('date >= ? AND date <= ?', date.beginning_of_month, date.end_of_month)
  end

  # Gets receipts for a specific year (default scoped by todays year)
  # @param year_number [String/Integer] the year number to be querying for
  # @return [ActiveRecord::Relation] collection of receipts matching the year
  def self.year(year_number)
    unless year_number.is_a?(Fixnum)
      raise ArgumentError, 'Argument is not numeric'
    end
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
