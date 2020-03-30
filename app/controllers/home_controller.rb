class HomeController < ApplicationController
  before_action :set_data

  def index
    @page = params[:page].to_i
    if params[:c]
      category = Category.where(id:params[:c]).first
      ids = [category.id] + category.subcategories.pluck(:id)
      @products = Product.where(category_id:ids).where('available_count > 0')
    else
      @products = Product.where('available_count > 0')
    end
  end

  private

  def set_data
    set_basket_data

    @main_categories = Category.where(parent_id:nil)
  end
end
