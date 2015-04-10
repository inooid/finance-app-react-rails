class Receipt < ActiveRecord::Base
  validates :euros, presence: true
  validates :cents, presence: true

  def self.by_month(date = Date.today)
    where('date >= ? AND date <= ?', date.beginning_of_month, date.end_of_month)
  end
end
