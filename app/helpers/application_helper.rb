module ApplicationHelper

  def price pret_in_bani
    "#{(pret_in_bani/100.0).round(2)} lei"
  end

end
