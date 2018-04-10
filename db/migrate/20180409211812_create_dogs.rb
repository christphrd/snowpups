class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.string :isGoodDog
      t.string :imageUrl
      t.belongs_to :sled, foreign_key: true
    end
  end
end
