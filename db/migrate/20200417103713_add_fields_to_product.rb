class AddFieldsToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :cantaribil, :boolean
    add_column :products, :coeficient, :float
    add_column :products, :buying_step, :float
  end
end
