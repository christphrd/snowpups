class DogSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :isGoodDog, :imageUrl, :sled
end
