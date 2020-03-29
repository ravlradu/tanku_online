class BasketMailer < ApplicationMailer

  include ApplicationHelper
  helper :application

  def order_email
    @basket = params[:basket]
    mail(to: 'jag@alxx.se', subject: 'O comandă nouă!')
  end

end
