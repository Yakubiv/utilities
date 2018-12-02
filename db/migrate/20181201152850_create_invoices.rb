class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :house_id, index: true
      t.integer :month
      t.integer :year
      t.integer :status
      t.decimal :total, precision: 10, scale: 2, default: 0

      t.timestamps
    end
  end
end
