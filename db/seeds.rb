# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'faker'

# 10.times do |n|
#   name = Faker::Name.name
#   description = "test_description"
#   condition = "非常に良い"
#   shipping_method = "ゆうパック"
#   shipping_charge = "送料込み"
#   ship_from_region = "大阪府"
#   shipping_date = "4〜7日以内に発送"
#   price = Faker::Number.number(4)

#   Item.create!(
#     name: name,
#     description: description,
#     condition: condition,
#     shipping_method: shipping_method,
#     shipping_charge: shipping_charge,
#     ship_from_region: ship_from_region,
#     shipping_date: shipping_date,
#     price: price
#     )
# end


# cateforyの投入
require 'csv'

CSV.foreach("db/category.csv") do |row|
  name = row[0]
  parent_id = row[1]

  Category.create(name:name, parent_id:parent_id)
end
