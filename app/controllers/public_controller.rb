class PublicController < ApplicationController

  before_action :set_data

  def add_to_basket
    basket = session[:basket].to_h
    basket.merge!({params[:id].to_s => basket[params[:id].to_s].to_i + params[:qty].to_i})
    session[:basket] = basket
    set_basket_data
    logger.info "\n\n basket data #{@basket_data.inspect}"
    flash[:notice] = "Adăugat în coș"
    respond_to do |format|
      format.js
    end
  end

  def remove_from_basket
    basket = session[:basket].to_h
    session[:basket] = basket.except(params[:id])
    @product = Product.where(id: params[:id]).first
    set_basket_data
    logger.info "\n\n basket data #{@basket_data.inspect}"
    respond_to do |format|
      format.js
    end
  end

  def send_order
    session[:basket].to_h.each{|k,v|
      product = Product.where(id:k).first
      product.update_attributes available_count:product.available_count.to_i-v.to_i if product
    }
    session[:basket] = {}
    BasketMailer.with(basket: session[:basket], method: params[:delivery_method], name: params[:name], phone: params[:phone], address: params[:address]).order_email.deliver_now

    flash[:notice] = 'Comanda trimisă!'
    redirect_to public_index_path
  end


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
    set_basket_data
  end

  private

  def set_data
    set_basket_data
    @main_categories = Category.where(parent_id: nil)
  end
end
