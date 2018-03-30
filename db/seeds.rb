# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'securerandom'

500.times do |n|
  client_id = SecureRandom.hex(4) + '-' + SecureRandom.hex(2) + '-' + SecureRandom.hex(2)
  token_type = rand(0..2)
  message = Faker::Lorem.sentence
  Token.create(client_id: client_id,
               token_type: token_type,
               message: message)
end
