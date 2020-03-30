class BasketMailer < ApplicationMailer

  include ApplicationHelper
  helper :application

  def order_email
    @basket = params[:basket]
    @method, @name, @phone, @address = params[:method], params[:name], params[:phone], params[:address]
    mail(to: 'jag@alxx.se', subject: 'O comandă nouă!')
  end

end
