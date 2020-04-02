module Basket
  def self.total_price(basket)
    sum = 0
    basket.each do |_prod_id, details|
      #prod = Product.where(id: prod_id).first
      sum += (details['price'] * details['qty'])
    end
    sum
  end
end
