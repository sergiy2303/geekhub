# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
dan = User.create!(
  email: 'dan@mailinator.com',
  password: 'p@ssw0rd',
  password_confirmation: 'p@ssw0rd'
)
victor = User.create!(
  email: 'victor@mailinator.com',
  password: 'p@ssw0rd',
  password_confirmation: 'p@ssw0rd'
)
tom = User.create!(
  email: 'tom@mailinator.com',
  password: 'p@ssw0rd',
  password_confirmation: 'p@ssw0rd'
)
