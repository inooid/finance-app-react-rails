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
    euros: 10,
    cents: 10,
    date: DateTime.new(2015, 2, 4, 19, 27)
  }, {
    euros: 12,
    cents: 79,
    date: DateTime.new(2015, 2, 9, 18, 57)
  }, {
    euros: 1,
    cents: 24,
    date: DateTime.new(2015, 2, 16, 18, 5)
  }, {
    euros: 6,
    cents: 62,
    date: DateTime.new(2015, 2, 18, 18, 36)
  }, {
    euros: 13,
    cents: 26,
    date: DateTime.new(2015, 2, 27, 18, 54)
  }, {
    euros: 1,
    cents: 59,
    date: DateTime.new(2015, 3, 4, 18, 9)
  }, {
    euros: 4,
    cents: 77,
    date: DateTime.new(2015, 3, 16, 15, 12)
  }, {
    euros: 6,
    cents: 37,
    date: DateTime.new(2015, 3, 17, 14, 8)
  }, {
    euros: 7,
    cents: 92,
    date: DateTime.new(2015, 2, 7, 15, 3)
  }, {
    euros: 5,
    cents: 18,
    date: DateTime.new(2015, 3, 24, 19, 35)
  }, {
    euros: 1,
    cents: 73,
    date: DateTime.new(2015, 3, 17, 14, 58)
  }, {
    euros: 19,
    cents: 39,
    date: DateTime.new(2015, 4, 1, 17, 36)
  }, {
    euros: 8,
    cents: 89,
    date: DateTime.new(2015, 4, 3, 11, 50)
  }, {
    euros: 10,
    cents: 6,
    date: DateTime.new(2015, 3, 10, 19, 3)
  }, {
    euros: 15,
    cents: 43,
    date: DateTime.new(2015, 2, 24, 19, 2)
  }, {
    euros: 9,
    cents: 69,
    date: DateTime.new(2015, 2, 2, 18, 49)
  }, {
    euros: 11,
    cents: 14,
    date: DateTime.new(2015, 3, 3, 19, 10)
  }, {
    euros: 1,
    cents: 29,
    date: DateTime.new(2015, 4, 8, 16, 40)
  }, {
    euros: 4,
    cents: 91,
    date: DateTime.new(2015, 3, 13, 18, 40)
  }, {
    euros: 1,
    cents: 35,
    date: DateTime.new(2015, 4, 10, 18, 07)
  }
])
