class HomeController < ApplicationController
  before_action :set_data

  def index
    @page = params[:page].to_i
    if params[:c]
      category  = Category.where(id: params[:c]).first
      ids       = [category.id] + category.subcategories.pluck(:id)
      @products = Product.where(category_id: ids).where('available_count > 0')
    else
      @products = Product.where('available_count > 0')
    end
  end

  def cart
    # Cheating to add some stuff into the cart.
    # session[:basket]['16'] = 4
    # session[:basket]['1']  = 10
  end

  def ajax_update_cart
    @product, @qty = Product.where(id: params[:product_id]).first, params[:qty].to_i

    session[:basket][@product.id.to_s] = @qty if @product
  end

  private

  def set_data
    set_basket_data

    @main_categories = Category.where(parent_id: nil)
  end
end
