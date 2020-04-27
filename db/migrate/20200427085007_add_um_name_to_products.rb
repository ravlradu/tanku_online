class AddUmNameToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :um_content, :string
  end
end
