class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.integer :area_id, index: true
      t.integer :region_id, index: true
      t.string :name

      t.timestamps
    end
  end
end
