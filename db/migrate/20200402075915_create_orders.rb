class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.text :payload
      t.string :delivery_type
      t.datetime :delivered_at
      t.integer :payload_price
      t.datetime :printed_at

      t.timestamps
    end
  end
end
