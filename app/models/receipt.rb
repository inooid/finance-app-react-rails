class Receipt < ActiveRecord::Base
  before_save :default_values

  validates :amount, presence: true

  def self.month(month_number)
    date = Date.today.change(month: month_number.to_i)
    where('date >= ? AND date <= ?', date.beginning_of_month, date.end_of_month)
  rescue ArgumentError
    return
  end

  def self.year(year_number)
    date = Date.today.change(year: year_number.to_i)
    where('date >= ? AND date <= ?', date.beginning_of_year, date.end_of_year)
  rescue ArgumentError
    return
  end

  private

  def default_values
    self.date ||= DateTime.now
  end
end
