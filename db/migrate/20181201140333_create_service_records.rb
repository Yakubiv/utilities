class CreateServiceRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :service_records do |t|
      t.integer :invoice_id, index: true
      t.integer :service_id, index: true
      t.integer :house_id, index: true
      t.decimal :cached_price, precision: 10, scale: 2, default: 0
      t.decimal :total, precision: 10, scale: 2, default: 0
      t.decimal :value, precision: 10, scale: 2

      t.timestamps
    end
  end
end
