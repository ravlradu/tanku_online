class AdminController < ApplicationController

  before_action :get_user
  before_action :check_authentication, only: %w(private)
  before_action :check_admin, only: %w(private)

  layout 'admin'

  def index
  end

  def private
  end
end
