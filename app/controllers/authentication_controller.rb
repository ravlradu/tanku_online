class AuthenticationController < ApplicationController

  before_action :get_user
  before_action :check_authentication, only: %w(logout)
  before_action :check_admin, only: %w(logout)

  def login
    u = User.where(email: params[:email]).first.try(:authenticate, params[:password])

    if u.nil?
      logger.error "Login failed"
      flash[:notice] = 'Autentificare nereușită'
      redirect_to admin_index_path
    else
      logger.info "Login succeeded"
      session[:user_id] = u.id
      redirect_to controller: 'admin', action: 'private'
    end
  end

  def logout
    logger.info "Logging out"
    session[:user_id] = nil
    flash[:notice] = 'Logout.'
    redirect_to admin_index_path
  end
end
