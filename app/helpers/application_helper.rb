module ApplicationHelper
  include Pagy::Frontend

  def price pret_in_bani
    "#{(pret_in_bani.to_i/100.0).round(2)} lei"
  end

end
