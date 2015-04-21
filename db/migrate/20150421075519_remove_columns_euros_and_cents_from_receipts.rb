class RemoveColumnsEurosAndCentsFromReceipts < ActiveRecord::Migration
  def change
    remove_column :receipts, :euros
    remove_column :receipts, :cents
  end
end
