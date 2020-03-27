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

end
