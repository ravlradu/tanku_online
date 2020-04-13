class AddPromoToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :promo, :boolean, {default:false}
    add_column :products, :old_price, :integer
  end
end
