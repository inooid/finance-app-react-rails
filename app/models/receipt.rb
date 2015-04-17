class Receipt < ActiveRecord::Base
  before_save :default_values

  validates :euros, presence: true
  validates :cents, presence: true

  def self.by_month(date = Date.today)
    where('date >= ? AND date <= ?', date.beginning_of_month, date.end_of_month)
  end

  def amount
    euros.to_s + '.' + cents.to_s
  end

  def default_values
    self.date ||= DateTime.now
  end
end
