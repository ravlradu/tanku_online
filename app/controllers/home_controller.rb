class HomeController < ApplicationController

  def index
    set_basket_data
    @page = params[:page].to_i
    @main_categories = Category.where(parent_id:nil)
    if params[:c]
      category = Category.where(id:params[:c]).first
      ids = [category.id] + category.subcategories.pluck(:id)
      @products = Product.where(category_id:ids).where('available_count > 0')
    else
      @products = Product.where('available_count > 0')
    end
  end
end
