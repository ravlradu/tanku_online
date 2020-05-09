class AdminController < ApplicationController

  before_action :get_user
  before_action :check_authentication, except: %w(index)
  before_action :check_admin, except: %w(index)

  layout 'admin'

  def index
  end

  def private
  end

  def orders
    @orders = Order.order(created_at: :desc).all
  end

  

end
