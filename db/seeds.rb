# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create 3 sleds

# create 15 dogs (5 per sled)


require 'net/http'
require 'json'

def coin_toss
  rand > 0.5
end

def createDogs(sled)
  breed = Faker::Dog.unique.breed
  url = "http://api.giphy.com/v1/gifs/search?q=#{breed}&api_key=tS0j6iOtV0gPmxS7vI3cBYWzPrJK3ozs&limit=1"
  resp = Net::HTTP.get_response(URI.parse(url))
  buffer = resp.body
  result = JSON.parse(buffer)
  if result["data"].length > 0
    Dog.create(name: Faker::Dog.unique.name, breed: breed, isGoodDog: coin_toss, imageUrl: result["data"][0]["images"]["original"]["url"], sled: sled)
  else
    createDogs(sled)
  end
end

sleds = []
sleds << Sled.create(name: "Otter Pro", imageUrl: "https://cdn.shopify.com/s/files/1/1365/4699/products/200820_Pro_Sled_Magnum.jpg?v=1513699351")
sleds << Sled.create(name: "Old Faithful", imageUrl: "http://cdn.shopify.com/s/files/1/1274/1911/products/JH_00351_1_2048x1366_grande.jpg?v=1510137575")
sleds << Sled.create(name: "Lil Scooter", imageUrl: "https://images.homedepot-static.com/productImages/0d0cbbc1-085e-45b7-9605-b3f93bb32453/svn/browns-tans-flexible-flyer-sleds-snow-tubes-toboggans-cl6-64_1000.jpg")
sleds << Sled.create(name: "Hammerhead Pro", imageUrl: "https://www.airhead.com/media/extendware/ewimageopt/media/inline/100/e/yukon-charlies-hammerhead-pro-xld-sled-93e.jpg")
sleds << Sled.create(name: "The Kringle 3500", imageUrl: "https://www.frostchristmasprops.com/uploads/5/0/6/3/5063721/5490310_orig.jpg")


sleds.each do |sled|
  5.times do
    createDogs(sled)
  end
end
