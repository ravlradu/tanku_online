class ApplicationController < ActionController::Base

  def get_user
    @current_user = User.where(id: session[:user_id]).first
  end

  def check_authentication
    if @current_user.nil?
      logger.error "User not authenticated for this page"
      flash[:notice] = 'Pagină disponibilă doar după autentificarea ca administrator.'
      redirect_to admin_index_path
      false
    else
      true
    end
  end

  def check_admin
    unless @current_user.is_admin?
      logger.error "User not admin"
      flash[:notice] = 'Pagină disponibilă doar pentru administratori.'
      redirect_to admin_index_path
      false
    else
      true
    end
  end

  def set_basket_data
    @basket_data = {
      total: 0,
      items:[]
    }
    return unless session[:basket]
    session[:basket].each do |prod_id, prod_details|
      #product = Product.where(id:prod_id).first
      #next unless product
      Rails.logger.info "\n #{prod_id} -- #{prod_details}"
      @basket_data[:items] << { name: prod_details['name'],
                                quantity: prod_details['qty'],
                                unit_price: prod_details['price'],
                                total_price: (prod_details['price'] * prod_details['qty']),
                                image_url: prod_details['thumbnail_url'],
                                id: prod_id
                              }
      @basket_data[:total] += prod_details['price'] * prod_details['qty']
    end
  end

end
