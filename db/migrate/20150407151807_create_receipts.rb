class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer :euros
      t.integer :cents
      t.datetime :date

      t.timestamps null: false
    end
  end
end
