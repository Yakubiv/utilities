class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.integer :house_id, index: true
      t.integer :service_type_id, index: true
      t.integer :status
      t.date :active_from
      t.date :inactive_from
      t.decimal :price, precision: 10, scale: 2, default: 0
      t.boolean :use_price_as_default_fee, default: false
      t.boolean :relevant, default: true

      t.timestamps
    end
  end
end
