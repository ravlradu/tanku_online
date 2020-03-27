class BasketMailer < ApplicationMailer

  def order_email
    @basket = params[:basket]
    mail(to: 'jag@alxx.se', subject: 'O comandă nouă!')
  end

end
