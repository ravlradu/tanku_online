class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :available_count, :float
  end
end
