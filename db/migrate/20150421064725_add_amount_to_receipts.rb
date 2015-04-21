class AddAmountToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :amount, :decimal, precision: 15, scale: 4
  end
end
