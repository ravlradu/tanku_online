module Basket
  def self.total_price(basket)
    sum = 0
    basket.each do |prod_id, qty|
      prod = Product.where(id: prod_id).first
      sum += (prod.price * qty)
    end
    sum
  end
end