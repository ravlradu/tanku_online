class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.boolean :is_visible
      t.integer :price
      t.integer :available_count

      t.timestamps
    end
  end
end
