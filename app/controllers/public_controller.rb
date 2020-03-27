class PublicController < ApplicationController
  def index
  end

  def add_to_basket
    basket = session[:basket].to_h
    basket.merge!({params[:id].to_s => basket[params[:id].to_s].to_i + params[:qty].to_i})
    session[:basket] = basket

    flash[:notice] = "Adăugat în coș"
    redirect_to public_index_path
  end

  def send_order
    BasketMailer.with(basket: session[:basket]).order_email.deliver_now

    flash[:notice] = 'Comanda trimisă!'
    redirect_to public_index_path
  end
end
