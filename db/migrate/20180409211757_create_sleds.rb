class CreateSleds < ActiveRecord::Migration[5.1]
  def change
    create_table :sleds do |t|
      t.string :name
      t.string :imageUrl
    end
  end
end
