json.array!(@receipts) do |receipt|
  json.id receipt.id
  json.amount number_with_precision(receipt.amount, precision: 2)
  json.date receipt.date
end
