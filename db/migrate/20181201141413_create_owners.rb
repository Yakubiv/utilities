class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.jsonb :preferences
      t.string :address
      t.integer :house_id, index: true

      t.timestamps
    end
  end
end
