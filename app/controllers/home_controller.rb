class HomeController < ApplicationController

  def index
    set_basket_data
    @main_categories = Category.where(parent_id:nil)
    if params[:categorie]
      @products = Product.where(category:params[:categorie]).where('available_count > 0')
    else
      @products = Product.where('available_count > 0')
    end
  end
end
