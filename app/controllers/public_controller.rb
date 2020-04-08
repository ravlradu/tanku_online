class PublicController < ApplicationController
  include Pagy::Backend
  before_action :set_data

  def add_to_basket
    basket = session[:basket].to_h
    product = Product.where(id: params[:id]).first

    existing_qty = basket[product.id.to_s].nil? ? 0 : basket[product.id.to_s]["qty"]

    basket.merge!({
                      product.id.to_s => {
                          'qty' => existing_qty + params["qty"].to_i,
                          'name' => product.name,
                          'thumbnail_url' => product.image_url([83,83])&.service_url,
                          'price' => product.price
                      }
                  })
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
    @product = Product.where( id: params[:id]).first
    set_basket_data
    logger.info "\n\n basket data #{@basket_data.inspect}"
    respond_to do |format|
      format.js
    end
  end

  def send_order
    session[:basket].to_h.each{|prod_id, details|
      product = Product.where(id: prod_id).first
      product.update_attributes available_count:product.available_count.to_i - details['qty'] if product
    }

    Order.create payload: session[:basket],
                 payload_price: Basket::total_price(session[:basket]),
                 delivery_type: params[:delivery_method]

    session[:basket] = {}
    BasketMailer.with(basket: session[:basket], method: params[:delivery_method], name: params[:name], phone: params[:phone], address: params[:address]).order_email.deliver_now

    flash[:notice] = 'Comanda trimisă!'
    redirect_to action: 'index'
  end


  def index
    session[:basket]={}
    if params[:search]
      search = ["LOWER(name) like ?", "%#{params[:search].to_s.downcase}%"]
    else
      search = "1=1"
    end
    if params[:c]
      category  = Category.where(id: params[:c]).first
      ids       = [category.id] + category.subcategories.pluck(:id)
      @pagy,@products = pagy(Product.where(search).where(is_visible:true,category_id: ids).where('available_count > 0'),size:[1,2,2,1])
    else
      @pagy,@products = pagy(Product.where(search).where(is_visible:true).where('available_count > 0'),size:[1,2,2,1])
    end
    Rails.logger.info "\n pagy #{@pagy.inspect}"
    respond_to do |format|
      format.js
      format.html
    end
  end

  def search
    if params[:c]
      category  = Category.where(id: params[:c]).first
      ids       = [category.id] + category.subcategories.pluck(:id)
      @pagy,@products = pagy(Product.where(is_visible:true,category_id: ids).where('available_count > 0'),size:[1,2,2,1])
    else
      @pagy,@products = pagy(Product.where(is_visible:true).where('available_count > 0'),size:[1,2,2,1])
    end
    Rails.logger.info "\n pagy #{@pagy.inspect}"
    respond_to do |format|
      format.js
      format.html
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
