class AddUmToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :um, :string
  end
end
