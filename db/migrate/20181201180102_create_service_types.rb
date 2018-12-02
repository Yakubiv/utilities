class CreateServiceTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :service_types do |t|
      t.string :name_key

      t.timestamps
    end
  end
end
