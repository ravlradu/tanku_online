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
    session[:basket].each do |prod_id, prod_qty|
      product = Product.where(id:prod_id).first
      next unless product
      @basket_data[:items] << { name: product.name,
                                quantity: prod_qty,
                                unit_price: product.price,
                                total_price: (product.price * prod_qty),
                                image_url: product.image_url([83,83]),
                                id: product.id
                              }
      @basket_data[:total] += product.price * prod_qty
    end
  end

end
