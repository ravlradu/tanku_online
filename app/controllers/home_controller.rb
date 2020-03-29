class HomeController < ApplicationController

  def index
    set_basket_data
    @main_categories = Category.where(parent_id:nil)
    @products = Product.where('available_count > 0')
  end
end
