class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.integer :region_id, index: true
      t.string :name

      t.timestamps
    end
  end
end
