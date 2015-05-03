# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# DateTime.new(YYYY, MM, DD, HH, MM)
Receipt.create([
  {
    amount: 10.10,
    date: DateTime.new(2015, 2, 4, 19, 27)
  }, {
    amount: 12.79,
    date: DateTime.new(2015, 2, 9, 18, 57)
  }, {
    amount: 1.24,
    date: DateTime.new(2015, 2, 16, 18, 5)
  }, {
    amount: 6.62,
    date: DateTime.new(2015, 2, 18, 18, 36)
  }, {
    amount: 13.26,
    date: DateTime.new(2015, 2, 27, 18, 54)
  }, {
    amount: 1.59,
    date: DateTime.new(2015, 3, 4, 18, 9)
  }, {
    amount: 4.77,
    date: DateTime.new(2015, 3, 16, 15, 12)
  }, {
    amount: 6.37,
    date: DateTime.new(2015, 3, 17, 14, 8)
  }, {
    amount: 7.92,
    date: DateTime.new(2015, 2, 7, 15, 3)
  }, {
    amount: 5.18,
    date: DateTime.new(2015, 3, 24, 19, 35)
  }, {
    amount: 1.73,
    date: DateTime.new(2015, 3, 17, 14, 58)
  }, {
    amount: 19.39,
    date: DateTime.new(2015, 4, 1, 17, 36)
  }, {
    amount: 8.89,
    date: DateTime.new(2015, 4, 3, 11, 50)
  }, {
    amount: 10.6,
    date: DateTime.new(2015, 3, 10, 19, 3)
  }, {
    amount: 15.43,
    date: DateTime.new(2015, 2, 24, 19, 2)
  }, {
    amount: 9.69,
    date: DateTime.new(2015, 2, 2, 18, 49)
  }, {
    amount: 11.14,
    date: DateTime.new(2015, 3, 3, 19, 10)
  }, {
    amount: 1.29,
    date: DateTime.new(2015, 4, 8, 16, 40)
  }, {
    amount: 4.91,
    date: DateTime.new(2015, 3, 13, 18, 40)
  }, {
    amount: 1.35,
    date: DateTime.new(2015, 4, 10, 18, 07)
  }
])
