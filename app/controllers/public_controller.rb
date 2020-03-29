class PublicController < ApplicationController
  def index
  end

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
    set_basket_data
    logger.info "\n\n basket data #{@basket_data.inspect}"
    respond_to do |format|
      format.js
    end
  end

  def send_order
    BasketMailer.with(basket: session[:basket]).order_email.deliver_now

    flash[:notice] = 'Comanda trimisă!'
    redirect_to public_index_path
  end
end
