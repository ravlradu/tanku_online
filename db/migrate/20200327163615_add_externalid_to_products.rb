class AddExternalidToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :externalid, :string
  end
end
