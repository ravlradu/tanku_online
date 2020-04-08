class AdminController < ApplicationController

  before_action :get_user
  before_action :check_authentication, only: %w(private orders)
  before_action :check_admin, only: %w(private orders)

  layout 'admin'

  def index
  end

  def private
  end

  def orders
    @orders = Order.order(created_at: :desc).all
  end
end
