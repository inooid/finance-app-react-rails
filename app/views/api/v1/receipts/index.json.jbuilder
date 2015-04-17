json.array!(@receipts) do |receipt|
  json.id receipt.id
  json.amount receipt.amount
  json.euros receipt.euros
  json.cents receipt.cents
  json.date receipt.date
end
