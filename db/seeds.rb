# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
  }
])
