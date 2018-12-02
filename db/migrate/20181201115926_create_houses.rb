class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :address
      t.integer :user_id, index: true
      t.integer :city_id, index: true
      t.string :cover_image

      t.timestamps
    end
  end
end
